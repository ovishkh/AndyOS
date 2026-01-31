# AndyOS Installation Guide

## Prerequisites
- Unlocked bootloader
- USB debugging enabled
- ADB/Fastboot installed
- 80%+ battery

## Installation Steps

### 1. Download Files
- AndyOS ZIP: `[device]-[version].zip`
- Recovery: `twrp-[device].img`

### 2. Boot to Recovery
`fastboot boot twrp-[device].img`

### 3. Wipe Data
- Wipe > Factory Reset
- Format Data (type "yes")

### 4. Install AndyOS
- Install > Select ZIP
- Swipe to confirm

### 5. Reboot
- Reboot > System
- First boot: 3-5 minutes

## Post-Installation
1. Complete setup wizard.
2. Enable encryption (Settings > Security).
3. Install apps from F-Droid.
4. Configure DNS (Settings > Network > Private DNS).
5. Enable firewall (AndyOS Privacy Guard).
