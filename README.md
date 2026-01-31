# AndyOS - De-Googled Android Operating System

"Privacy First. Google Never."

AndyOS is a privacy-focused Android operating system built on AOSP (Android Open Source Project) with complete removal of Google services, tracking mechanisms, and proprietary components. 

## Core Philosophy
- **Complete Privacy**: No data collection, tracking, or telemetry.
- **Zero Google**: Entirely independent of Google services and framework.
- **User Control**: Full authority over data and device permissions.

## Key Features
- **Privacy Guard**: Per-app network firewall and tracker blocking.
- **Hardened Security**: Linux kernel 6.1+ with hardening patches.
- **Verified Boot**: AVB 2.0 with custom signing keys.
- **Secure Ecosystem**: F-Droid as the primary app store.

## Build Information
- **Version**: 1.0 "Liberation"
- **Base**: Android 14 (API 34)
- **Kernel**: Linux 6.1+

## Release Checklist

### Privacy
- [ ] Zero network connections to google.com domains (tcpdump verified)
- [ ] Exodus Privacy reports 0 trackers in all system apps
- [ ] No Google Play Services framework present
- [ ] DNS defaults to privacy-respecting providers
- [ ] All telemetry code removed from AOSP

### Functionality
- [ ] Phone calls work (VoLTE + VoWiFi if supported)
- [ ] SMS/MMS send and receive
- [ ] Camera captures photos/videos
- [ ] WiFi connects and maintains connection
- [ ] Bluetooth pairs with devices
- [ ] GPS locks and works with offline maps
- [ ] Audio playback/recording functional
- [ ] USB file transfer (MTP) works

### Security
- [ ] Verified boot enabled and passing
- [ ] SELinux in enforcing mode (getenforce)
- [ ] Full disk encryption active
- [ ] OTA updates signed and verified
- [ ] No root access by default (opt-in)

### Apps
- [ ] F-Droid preinstalled and functional
- [ ] All default apps launch without crashes
- [ ] Aurora Store accesses Play Store catalog
- [ ] MicroG optional install works (if needed)

### Documentation
- [ ] Installation guide complete and tested
- [ ] Privacy setup guide published
- [ ] Troubleshooting FAQ covers common issues
- [ ] Build instructions work from clean Ubuntu install


## Why Choose AndyOS?
- **True Digital Sovereignty**: Reclaim your mobile experience by breaking free from the Google ecosystem without sacrificing functionality.
- **Uncompromising Privacy**: Enjoy a device that never "phones home." With zero trackers and no background telemetry, your data and habits remain strictly yours.
- **Hardened Security**: Rest easy with a system built on a hardened Linux kernel, featuring verified boot and full-disk encryption to protect your digital life.
- **App Freedom**: Access a world of open-source software via F-Droid or securely download your essential apps through the Aurora Store.
- **Reliable Performance**: Experience a fast, clean, and stable OS where every core feature—from VoLTE calls to GPS—works seamlessly out of the box.



---
For installation instructions, see [INSTALL.md](docs/INSTALL.md).
For developer documentation, see [API.md](docs/API.md).
