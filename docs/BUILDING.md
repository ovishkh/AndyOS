# Building AndyOS from Source

This guide explains how to build AndyOS for Pixel devices or x86_64 virtual machines.

## Prerequisites

### Hardware Requirements
- **CPU**: 8+ cores (16+ recommended)
- **RAM**: 16GB minimum (32GB+ recommended)
- **Storage**: 250GB+ free space (SSD strongly recommended)
- **OS**: Ubuntu 22.04 LTS or compatible Linux distribution

### Software Dependencies

```bash
# Install build tools
sudo apt-get update
sudo apt-get install -y \
    git-core gnupg flex bison build-essential zip curl zlib1g-dev \
    gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev \
    x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils \
    xsltproc unzip fontconfig python3 python3-pip rsync

# Install repo tool
mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
export PATH=~/bin:$PATH

# Install additional tools for ISO generation (x86_64 only)
sudo apt-get install -y xorriso grub-efi-amd64-bin mtools squashfs-tools
```

## Downloading Source Code

```bash
# Create working directory
mkdir -p ~/andyos
cd ~/andyos

# Initialize AOSP repository (Android 14)
repo init -u https://android.googlesource.com/platform/manifest -b android-14.0.0_r1

# Add AndyOS local manifest
mkdir -p .repo/local_manifests
cp build/manifests/local_manifest.xml .repo/local_manifests/

# Sync source (this will take 1-3 hours depending on connection)
repo sync -c -j$(nproc --all)
```

## Building for Pixel Devices

### Pixel 7 (Panther)

```bash
# Set up environment
source build/envsetup.sh

# Build AndyOS
./build/build-andyos.sh panther user

# Output location
ls -lh out/target/product/panther/andyos-panther-1.0-*.zip
```

### Pixel 7 Pro (Cheetah)

```bash
./build/build-andyos.sh cheetah user
```

## Building for Virtual Machines (x86_64)

```bash
# Build x86_64 ISO
./build/build-andyos.sh x86_64 user

# Output location
ls -lh out/target/product/x86_64/andyos-x86_64-1.0-*.iso
```

## Build Variants

- **`user`**: Production build (recommended for daily use)
  - Locked bootloader compatible
  - No root access
  - Optimized performance

- **`userdebug`**: Debug build with root
  - ADB root access enabled
  - Useful for development

- **`eng`**: Engineering build
  - Full debug symbols
  - All logging enabled
  - Slower performance

## Signing Keys

### Generate Custom AVB Keys

```bash
# Create keys directory
mkdir -p vendor/andyos/keys
cd vendor/andyos/keys

# Generate AVB signing key
openssl genrsa -out avb_key.pem 4096

# Extract public key
avbtool extract_public_key --key avb_key.pem --output avb_pubkey.bin

# IMPORTANT: Keep avb_key.pem secure and backed up!
```

## Clean Build

```bash
# Clean previous build artifacts
./build/build-andyos.sh [device] [variant] clean
```

## Troubleshooting

### Out of Memory

```bash
# Reduce parallel jobs
export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4g"
./prebuilts/sdk/tools/jack-admin kill-server
./prebuilts/sdk/tools/jack-admin start-server
```

### Repo Sync Failures

```bash
# Resume interrupted sync
repo sync -c -j$(nproc --all) --force-sync
```

### Build Errors

```bash
# Check build log
cat out/error.log

# Clean specific module
make clean-[module-name]
```

## Verification

### Check for Google Services

```bash
# Extract system image
unzip out/target/product/panther/andyos-panther-*.zip system.img

# Mount and search
mkdir /tmp/system
sudo mount -o loop system.img /tmp/system
find /tmp/system -name "*google*" -o -name "*gms*"
# Should return no results

sudo umount /tmp/system
```

### Verify Privacy Configuration

```bash
# Check DNS settings
grep -r "google.com" out/target/product/panther/system/
# Should return no results

# Check for telemetry
grep -r "analytics" out/target/product/panther/system/
# Should return no results
```

## Next Steps

- [Installation Guide](INSTALL.md) - Flash to device
- [Privacy Setup](PRIVACY_SETUP.md) - Post-installation hardening
- [Contributing](CONTRIBUTING.md) - Submit patches
