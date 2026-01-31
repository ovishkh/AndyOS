# AndyOS Vendor Directory

Vendor-specific files and configurations for AndyOS.

## Structure

```
vendor/andyos/
├── andyos.mk              # Main vendor configuration
├── bootanimation/         # Custom boot animation
│   ├── bootanimation.mk
│   └── desc.txt
├── overlay/               # Framework overlays
│   └── overlay.mk
├── keys/                  # Signing keys (gitignored)
│   ├── .gitignore
│   └── README.md
└── prebuilt/              # Prebuilt APKs
    ├── README.md
    └── prebuilt.mk
```

## Configuration Files

### andyos.mk
Main vendor configuration that defines:
- Product branding (AndyOS)
- Build fingerprint
- AndyOS version (1.0 "Liberation")
- Package inclusions
- Google app removals

### Boot Animation
Custom AndyOS boot animation with:
- Resolution: 1080x2400
- Frame rate: 30 FPS
- AndyOS branding

### Overlays
Framework resource overlays for:
- SystemUI customization
- Settings app branding
- Launcher modifications
- AndyOS theme

### Signing Keys
Cryptographic keys for:
- Platform signing
- Media signing
- Shared signing
- Release signing
- AVB (Android Verified Boot)
- OTA updates

**Note:** Keys are gitignored for security. See `keys/README.md` for generation instructions.

### Prebuilt Apps
Preinstalled applications:
- F-Droid (app store)
- Aurora Store (Play Store alternative)
- NewPipe (YouTube client)
- OsmAnd (maps)
- K-9 Mail (email)
- OpenBoard (keyboard)

## Usage

Include in device makefile:
```makefile
$(call inherit-product, vendor/andyos/andyos.mk)
```

## License

Apache 2.0 - See [LICENSE](../LICENSE)
