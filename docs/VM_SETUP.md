# AndyOS Virtual Machine Setup

This guide explains how to run AndyOS in VirtualBox or VMware for testing and development.

## Option 1: VirtualBox (Recommended)

### Prerequisites
- [VirtualBox 7.0+](https://www.virtualbox.org/wiki/Downloads)
- AndyOS x86_64 ISO (build from source or download release)

### Creating the VM

```bash
# Create VM
VBoxManage createvm --name "AndyOS" --ostype "Linux_64" --register

# Configure hardware
VBoxManage modifyvm "AndyOS" \
    --memory 4096 \
    --vram 128 \
    --cpus 2 \
    --acpi on \
    --ioapic on \
    --pae on \
    --hwvirtex on \
    --nestedpaging on \
    --largepages on \
    --firmware efi \
    --chipset ich9 \
    --mouse usbtablet \
    --keyboard usb \
    --audio coreaudio \
    --audiocontroller hda \
    --audioout on

# Create virtual disk (32GB)
VBoxManage createhd --filename ~/VirtualBox\ VMs/AndyOS/AndyOS.vdi --size 32768

# Add storage controller
VBoxManage storagectl "AndyOS" --name "SATA" --add sata --controller IntelAhci

# Attach disk
VBoxManage storageattach "AndyOS" \
    --storagectl "SATA" \
    --port 0 \
    --device 0 \
    --type hdd \
    --medium ~/VirtualBox\ VMs/AndyOS/AndyOS.vdi

# Attach ISO
VBoxManage storageattach "AndyOS" \
    --storagectl "SATA" \
    --port 1 \
    --device 0 \
    --type dvddrive \
    --medium /path/to/andyos-x86_64-1.0.iso

# Network (NAT for privacy)
VBoxManage modifyvm "AndyOS" --nic1 nat

# Graphics
VBoxManage modifyvm "AndyOS" --graphicscontroller vmsvga --accelerate3d on
```

### First Boot

```bash
# Start VM
VBoxManage startvm "AndyOS"
```

1. Boot from ISO (should happen automatically)
2. Select "AndyOS 1.0 Liberation" from boot menu
3. Wait for system to load (2-3 minutes first boot)
4. Complete Setup Wizard:
   - Accept privacy agreement
   - Configure WiFi (optional in VM)
   - Select DNS provider (Quad9 recommended)
   - Skip encryption (already enabled)
   - Initialize F-Droid

### Post-Installation

After first boot, you can remove the ISO:

```bash
VBoxManage storageattach "AndyOS" \
    --storagectl "SATA" \
    --port 1 \
    --device 0 \
    --type dvddrive \
    --medium none
```

## Option 2: VMware Workstation/Fusion

### Creating the VM

1. Open VMware
2. File → New Virtual Machine
3. Select "Custom (advanced)"
4. Choose "Linux" → "Other Linux 5.x kernel 64-bit"
5. Configure:
   - **Memory**: 4096 MB
   - **Processors**: 2 cores
   - **Hard Disk**: 32 GB (SCSI)
   - **Network**: NAT
6. Edit VM settings:
   - Display → Enable 3D acceleration
   - CD/DVD → Use ISO image → Select AndyOS ISO
   - Options → Advanced → Firmware type: UEFI

### First Boot

1. Power on VM
2. Follow same setup wizard steps as VirtualBox

## Option 3: Android Emulator (Development)

For development and testing without a full VM:

```bash
# Create AVD (Android Virtual Device)
avdmanager create avd \
    -n andyos-dev \
    -k "system-images;android-34;default;x86_64" \
    -d "pixel_7"

# Start emulator with AndyOS system image
emulator -avd andyos-dev \
    -system out/target/product/x86_64/system.img \
    -ramdisk out/target/product/x86_64/ramdisk.img \
    -kernel out/target/product/x86_64/kernel \
    -no-snapshot \
    -wipe-data
```

## Performance Optimization

### VirtualBox

```bash
# Enable nested virtualization (if host supports KVM)
VBoxManage modifyvm "AndyOS" --nested-hw-virt on

# Increase video memory
VBoxManage modifyvm "AndyOS" --vram 256

# Enable PAE/NX
VBoxManage modifyvm "AndyOS" --pae on
```

### VMware

- Enable "Virtualize Intel VT-x/EPT or AMD-V/RVI"
- Increase video memory to 256MB
- Enable "Accelerate 3D graphics"

## Privacy Configuration in VM

### Network Isolation

For maximum privacy testing:

```bash
# Disable network entirely
VBoxManage modifyvm "AndyOS" --nic1 none

# Or use host-only network (no internet)
VBoxManage modifyvm "AndyOS" --nic1 hostonly
```

### Shared Folders (Optional)

**Warning**: Shared folders reduce isolation. Only enable if needed.

```bash
VBoxManage sharedfolder add "AndyOS" \
    --name "shared" \
    --hostpath "/path/to/shared/folder" \
    --automount
```

## Troubleshooting

### Black Screen on Boot

- Ensure EFI firmware is enabled
- Try disabling 3D acceleration
- Increase video memory to 256MB

### Slow Performance

- Allocate more RAM (6-8GB if available)
- Enable nested virtualization
- Use SSD for virtual disk storage

### No Network

- Check NAT configuration
- Verify VM network adapter is enabled
- Try switching to bridged mode

### Audio Not Working

- VirtualBox: Select "Intel HD Audio" controller
- VMware: Ensure "Connect at power on" is checked

## Verification

### Check Privacy Settings

```bash
# Connect via ADB
adb connect localhost:5555

# Verify no Google connections
adb shell "tcpdump -i any host google.com"
# Should show no traffic

# Check DNS
adb shell getprop | grep dns
# Should show 9.9.9.9 (Quad9)
```

### Test F-Droid

1. Open F-Droid app
2. Update repositories
3. Install a test app (e.g., NewPipe)
4. Verify installation works

## Next Steps

- [Privacy Setup Guide](PRIVACY_SETUP.md)
- [Building from Source](BUILDING.md)
- [Contributing](CONTRIBUTING.md)
