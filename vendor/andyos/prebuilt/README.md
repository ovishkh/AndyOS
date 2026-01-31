# AndyOS Prebuilt Apps

This directory contains prebuilt APKs that are included in the AndyOS ROM.

## Apps Included

### F-Droid
- **Package**: `org.fdroid.fdroid`
- **Version**: Latest stable
- **Source**: https://f-droid.org/
- **Purpose**: Primary app store for AndyOS

### Aurora Store
- **Package**: `com.aurora.store`
- **Version**: Latest stable
- **Source**: https://gitlab.com/AuroraOSS/AuroraStore
- **Purpose**: Access to Play Store catalog without Google account

### NewPipe
- **Package**: `org.schabi.newpipe`
- **Version**: Latest stable
- **Source**: https://newpipe.net/
- **Purpose**: YouTube client without ads

### OsmAnd
- **Package**: `net.osmand.plus`
- **Version**: Latest stable
- **Source**: https://osmand.net/
- **Purpose**: Offline maps and navigation

## Adding Prebuilt Apps

1. Download APK from official source
2. Verify signature and checksum
3. Place in this directory
4. Add to `prebuilt.mk`
5. Update this README

## Build Integration

Apps are copied to system partition during build:
```makefile
PRODUCT_COPY_FILES += \
    vendor/andyos/prebuilt/FDroid.apk:system/app/FDroid/FDroid.apk
```
