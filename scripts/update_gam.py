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
            return

    assets = release['assets']

    # Flexible regex patterns for asset matching
    # gam-{version}-macos.*-arm64.tar.xz
    # gam-{version}-macos.*-x86_64.tar.xz
    # gam-{version}-linux-arm64.*.tar.xz
    # gam-{version}-linux-x86_64.*.tar.xz

    # Using re.escape for version to handle dots safely, but version usually is simple
    ver_pattern = re.escape(version)

    # Patterns to match against asset filenames
    # We want to prefer glibc/macos versions that match but fallback to whatever is available if it looks right.
    # The current formula uses:
    # macos15.7-arm64
    # macos15.7-x86_64
    # linux-arm64-glibc2.35
    # linux-x86_64-glibc2.35

    # We'll use regex to find the best match.
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
                # If we have multiple matches (e.g. multiple glibc versions), we might need logic to pick one.
                # For now, we take the first one or we can try to be specific.
                # The current formula picks glibc2.35.
                # If we see multiple, we should probably prefer the one currently used if possible,
                # but for now let's just picking the one that matches our specific expectation if possible.

                # Let's try to match strict first, then loose?
                # Actually, simple improvement:
                # Just take the asset. If multiple match, we might have an issue.
                # But typically only one matches the broad architecture pattern for a version.
                # Exception: linux-arm64-glibc2.35 vs linux-arm64-glibc2.28

                # Logic: If we already found a match, check if this one is "better"?
                # Hard to define better without complex logic.
                # Let's stick to the ones that are likely to be built.
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

    print(f"Updated Formula/gam.rb to version {version}")

if __name__ == '__main__':
    update_formula()
