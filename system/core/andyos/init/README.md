# AndyOS System Core - Init Scripts

This directory contains AndyOS-specific initialization scripts and configurations.

## Files

### init.andyos.rc
Main init script for AndyOS services:
- Privacy Guard service startup
- DNS configuration
- Network security setup
- System property configuration

### andyos.prop
System properties for AndyOS:
- Version information
- Build configuration
- Privacy settings
- Network defaults

## Usage

These files are automatically included during the Android build process and executed during system boot.

## Integration

Add to device init:
```
import /system/etc/init/init.andyos.rc
```
