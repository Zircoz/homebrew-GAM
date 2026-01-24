import json
import urllib.request
import hashlib
import re
import sys
import argparse

def get_release(version=None):
    if version:
        url = f"https://api.github.com/repos/gam-team/gam/releases/tags/{version}"
        print(f"Fetching release for tag: {version}")
    else:
        url = "https://api.github.com/repos/gam-team/gam/releases/latest"
        print("Fetching latest release")

    req = urllib.request.Request(url)
    try:
        with urllib.request.urlopen(req) as response:
            data = json.loads(response.read().decode())
        return data
    except Exception as e:
        print(f"Error fetching release: {e}")
        sys.exit(1)

def calculate_sha256(url):
    print(f"Downloading {url}...")
    try:
        with urllib.request.urlopen(url) as response:
            data = response.read()
            return hashlib.sha256(data).hexdigest()
    except Exception as e:
        print(f"Error downloading {url}: {e}")
        sys.exit(1)

def update_formula():
    parser = argparse.ArgumentParser(description='Update GAM formula.')
    parser.add_argument('--version', help='Specific version (tag) to update to (e.g., v7.0.0)')
    args = parser.parse_args()

    release = get_release(args.version)
    tag_name = release['tag_name']
    version = tag_name.lstrip('v')

    print(f"Target version found: {version}")

    formula_path = 'Formula/gam7.rb'
    with open(formula_path, 'r') as f:
        content = f.read()

    current_version_match = re.search(r'version "([\d\.]+)"', content)
    if current_version_match:
        current_version = current_version_match.group(1)
        print(f"Current version in formula: {current_version}")
        if current_version == version:
            print("Already at latest version.")
            return

    assets = release['assets']

    # Flexible regex patterns for asset matching
    # gam-{version}-macos.*-arm64.tar.xz
    # gam-{version}-macos.*-x86_64.tar.xz
    # gam-{version}-linux-arm64.*.tar.xz
    # gam-{version}-linux-x86_64.*.tar.xz

    # Using re.escape for version to handle dots safely
    ver_pattern = re.escape(version)

    # Patterns to match against asset filenames
    patterns = {
        ('macos', 'arm'): re.compile(rf'^gam-{ver_pattern}-macos.*-arm64\.tar\.xz$'),
        ('macos', 'intel'): re.compile(rf'^gam-{ver_pattern}-macos.*-x86_64\.tar\.xz$'),
        ('linux', 'arm'): re.compile(rf'^gam-{ver_pattern}-linux-arm64.*\.tar\.xz$'),
        ('linux', 'intel'): re.compile(rf'^gam-{ver_pattern}-linux-x86_64.*\.tar\.xz$'),
    }

    new_data = {}

    for asset in assets:
        name = asset['name']
        url = asset['browser_download_url']

        for key, pattern in patterns.items():
            if pattern.match(name):
                new_data[key] = {
                    'url': url,
                    'name': name
                }

    if len(new_data) != 4:
        print("Could not find all required assets. Found:")
        for k in new_data:
            print(f"  {k}: {new_data[k]['name']}")
        print("Required patterns:")
        for k in patterns:
            print(f"  {k}: {patterns[k].pattern}")
        sys.exit(1)

    # Calculate SHAs
    for key in new_data:
        new_data[key]['sha256'] = calculate_sha256(new_data[key]['url'])

    lines = content.splitlines()
    output_lines = []

    current_os = None
    current_arch = None

    updated_keys = set()

    for line in lines:
        stripped = line.strip()

        # Update version
        if stripped.startswith('version "'):
            line = re.sub(r'version ".*?"', f'version "{version}"', line)

        if stripped == 'on_macos do':
            current_os = 'macos'
        elif stripped == 'on_linux do':
            current_os = 'linux'
        elif stripped == 'on_arm do':
            current_arch = 'arm'
        elif stripped == 'on_intel do':
            current_arch = 'intel'

        if stripped == 'end':
            if current_arch:
                current_arch = None
            elif current_os:
                current_os = None

        if current_os and current_arch:
            key = (current_os, current_arch)
            if key in new_data:
                if 'url "' in line:
                    line = re.sub(r'url ".*?"', f'url "{new_data[key]["url"]}"', line)
                    updated_keys.add(f"{key}_url")
                if 'sha256 "' in line:
                    line = re.sub(r'sha256 ".*?"', f'sha256 "{new_data[key]["sha256"]}"', line)
                    updated_keys.add(f"{key}_sha")

        output_lines.append(line)

    # Validation
    expected_updates = 8 # 4 URLs + 4 SHAs
    if len(updated_keys) != expected_updates:
        print(f"Error: Did not update all fields. Updated {len(updated_keys)} fields.")
        print(f"Updated: {updated_keys}")
        sys.exit(1)

    with open(formula_path, 'w') as f:
        f.write('\n'.join(output_lines) + '\n')

    print(f"Updated Formula/gam7.rb to version {version}")

if __name__ == '__main__':
    update_formula()
