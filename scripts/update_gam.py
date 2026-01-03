import json
import urllib.request
import hashlib
import re
import sys

def get_latest_release():
    url = "https://api.github.com/repos/gam-team/gam/releases/latest"
    req = urllib.request.Request(url)
    try:
        with urllib.request.urlopen(req) as response:
            data = json.loads(response.read().decode())
        return data
    except Exception as e:
        print(f"Error fetching releases: {e}")
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
    release = get_latest_release()
    tag_name = release['tag_name']
    version = tag_name.lstrip('v')

    print(f"Latest version found: {version}")

    formula_path = 'Formula/gam.rb'
    with open(formula_path, 'r') as f:
        content = f.read()

    current_version_match = re.search(r'version "([\d\.]+)"', content)
    if current_version_match:
        current_version = current_version_match.group(1)
        print(f"Current version in formula: {current_version}")
        if current_version == version:
            print("Already at latest version.")
            # Verify if force update is needed?
            # For now, we exit if version matches to save bandwidth.
            # But if SHA changed for same version (re-release), we might miss it.
            # Given GAM team practices, version usually bumps.
            return

    assets = release['assets']

    # Mapping for assets we care about
    # key: (os, arch), value: regex_pattern for filename
    # We use regex because version is in filename

    # Filename patterns based on current Formula/gam.rb
    # macos15.7-arm64
    # macos15.7-x86_64
    # linux-arm64-glibc2.35
    # linux-x86_64-glibc2.35

    targets = {
        ('macos', 'arm'): f'gam-{version}-macos15.7-arm64.tar.xz',
        ('macos', 'intel'): f'gam-{version}-macos15.7-x86_64.tar.xz',
        ('linux', 'arm'): f'gam-{version}-linux-arm64-glibc2.35.tar.xz',
        ('linux', 'intel'): f'gam-{version}-linux-x86_64-glibc2.35.tar.xz',
    }

    new_data = {}

    for asset in assets:
        name = asset['name']
        url = asset['browser_download_url']

        for key, expected_name in targets.items():
            if name == expected_name:
                new_data[key] = {
                    'url': url,
                    # Defer sha256 calculation until we find all needed assets
                }

    if len(new_data) != 4:
        print("Could not find all required assets. Found:")
        for k in new_data:
            print(f"  {k}: {new_data[k]['url']}")
        print("Required:")
        for k in targets:
            print(f"  {k}: {targets[k]}")
        sys.exit(1)

    # Calculate SHAs
    for key in new_data:
        new_data[key]['sha256'] = calculate_sha256(new_data[key]['url'])

    lines = content.splitlines()
    output_lines = []

    current_os = None
    current_arch = None

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
                if 'sha256 "' in line:
                    line = re.sub(r'sha256 ".*?"', f'sha256 "{new_data[key]["sha256"]}"', line)

        output_lines.append(line)

    with open(formula_path, 'w') as f:
        f.write('\n'.join(output_lines) + '\n')

    print(f"Updated Formula/gam.rb to version {version}")

if __name__ == '__main__':
    update_formula()
