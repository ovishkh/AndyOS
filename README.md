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
- **VM Support**: VirtualBox, VMware Workstation/Fusion

## Features

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

# AndyOS App Replacement Matrix

| Google App | AndyOS Replacement | F-Droid Package | Features | Privacy Notes |
|------------|--------------------|-----------------|----------|---------------|
| Chrome | Bromite / Vanadium | `org.bromite.bromite` | Ad/tracker blocking, hardened | No Google sync, privacy-first |
| Gmail | K-9 Mail / Proton Mail | `com.fsck.k9` | PGP support, E2E encryption | No tracking, zero-access encryption |
| Maps | OsmAnd | `net.osmand.plus` | Offline maps | No location tracking |
| Play Store | F-Droid | `org.fdroid.fdroid` | Open source apps | No account required |
| YouTube | NewPipe | `org.schabi.newpipe` | No ads, background play | No Google account |
| Photos | Simple Gallery Pro | `com.simplemobiletools.gallery.pro` | Local storage | No cloud sync |
| Drive | Nextcloud | `com.nextcloud.client` | Self-hosted sync | User-controlled data |
| Calendar | Simple Calendar | `com.simplemobiletools.calendar.pro` | CalDAV sync | No Google sync |
| Contacts | Simple Contacts | `com.simplemobiletools.contacts.pro` | CardDAV sync | Local backup only |
| Messages | QKSMS | `com.moez.QKSMS` | Material design | No data collection |
| Phone | Simple Dialer | `com.simplemobiletools.dialer` | Clean UI | No tracking |
| Camera | Open Camera | `net.sourceforge.opencamera` | Manual controls | No location tags default |
| Keyboard | OpenBoard | `org.dslul.openboard.inputmethod.latin` | Gesture typing | No internet permission |
| Assistant | Lumo by Proton | `proton.lumo.assistant` | Privacy-focused AI | On-device processing |
| Pay/Wallet | Proton Wallet | `proton.wallet` | Cryptocurrency wallet | Self-custodial, E2E encrypted |
| Password Manager | Proton Pass | `proton.pass` | Password manager | Zero-knowledge architecture |



---

## Documentation
- [Installation Guide](docs/INSTALL.md) - Flash to device
- [Build Instructions](docs/BUILDING.md) - Compile from source
- [VM Setup](docs/VM_SETUP.md) - VirtualBox & VMware
- [Privacy Setup](docs/PRIVACY_SETUP.md) - Post-installation hardening
- [Contributing](CONTRIBUTING.md) - Submit patches
- [License](LICENSE) - Apache 2.0

---

**Built with ❤️ by [Ovi Shekh](https://www.ovishekh.com/)**
