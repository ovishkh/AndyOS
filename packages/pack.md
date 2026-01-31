# AndyOS Packages

Comprehensive documentation for all AndyOS system packages and applications.

---

## System Apps

### AndyOSBrowser
**Location:** `packages/apps/AndyOSBrowser/`  
**Package Name:** `org.andyos.browser`  
**Type:** System App (Privileged)

**Description:**  
Privacy-hardened web browser based on Bromite/Vanadium with built-in ad and tracker blocking.

**Features:**
- Ad and tracker blocking (no extensions needed)
- DNS over HTTPS (DoH) support
- No Google services integration
- Enhanced privacy controls
- Hardened security settings
- Default search: DuckDuckGo
- No telemetry or crash reporting

**Build Configuration:**
```makefile
LOCAL_MODULE := AndyOSBrowser
LOCAL_PRIVILEGED_MODULE := true
LOCAL_CERTIFICATE := platform
```

---

### AndyOSPrivacyGuard
**Location:** `packages/apps/AndyOSPrivacyGuard/`  
**Package Name:** `org.andyos.privacyguard`  
**Type:** System App (Privileged)

**Description:**  
Per-app network firewall and tracker blocking system with real-time monitoring.

**Features:**
- Per-app network firewall
- Tracker blocking (1,247+ trackers blocked)
- Real-time network monitoring
- Packet filtering capabilities
- Statistics dashboard
- Network request logging
- App permission monitoring

**Permissions Required:**
- `INTERNET` (monitoring)
- `ACCESS_NETWORK_STATE`
- `CHANGE_NETWORK_STATE`
- Custom SELinux policies

---

### AndyOSSettings
**Location:** `packages/apps/AndyOSSettings/`  
**Package Name:** `org.andyos.settings`  
**Type:** System App (Privileged)

**Description:**  
Custom settings application with privacy-focused defaults and AndyOS-specific configurations.

**Features:**
- Privacy Guard integration
- DNS configuration (Quad9 default)
- VPN settings
- App permissions management
- About Phone (AndyOS version info)
- Network settings
- Security settings

**Customizations:**
- Removed Google account sync
- Privacy-first defaults
- Custom branding
- AndyOS version display

---

### AndyOSSetupWizard
**Location:** `packages/apps/AndyOSSetupWizard/`  
**Package Name:** `org.andyos.setupwizard`  
**Type:** System App (Privileged)

**Description:**  
Privacy-focused first-boot setup wizard that guides users through initial configuration.

**Features:**
- No Google account requirement
- Privacy-first setup flow
- Network configuration
- Privacy Guard setup
- F-Droid installation
- Offline setup support

**Setup Steps:**
1. Language selection
2. Wi-Fi configuration (optional)
3. Privacy Guard setup
4. App store selection (F-Droid/Aurora)
5. Completion

---

### AndyOSUpdater
**Location:** `packages/apps/AndyOSUpdater/`  
**Package Name:** `org.andyos.updater`  
**Type:** System App (Privileged)

**Description:**  
Secure OTA update system for AndyOS with cryptographic verification.

**Features:**
- Secure OTA updates
- Update verification (signed)
- Background download
- A/B seamless updates
- No tracking
- Update server: `ota.andyos.org`

**Update Process:**
1. Check for updates
2. Download update package
3. Verify signature
4. Install to inactive slot
5. Reboot to new version

---

## Proton Apps Integration

### ProtonMail
**Location:** `packages/apps/ProtonMail/`  
**Package Name:** `ch.protonmail.android`  
**Type:** User App

**Description:**  
End-to-end encrypted email client with zero-access encryption.

**Features:**
- E2E encryption
- Zero-access architecture
- PGP support
- No tracking
- Secure contacts
- Calendar integration

**Integration:**
- Preinstalled in AndyOS
- No Google Play Services required
- Direct APK integration

---

### ProtonWallet
**Location:** `packages/apps/ProtonWallet/`  
**Package Name:** `me.proton.android.wallet`  
**Type:** User App

**Description:**  
Self-custodial cryptocurrency wallet with end-to-end encryption.

**Features:**
- Bitcoin support
- Self-custodial (you own your keys)
- E2E encrypted
- No KYC required
- Privacy-focused
- Open source

**Supported Cryptocurrencies:**
- Bitcoin (BTC)
- More coming soon

---

### ProtonPass
**Location:** `packages/apps/ProtonPass/`  
**Package Name:** `proton.android.pass`  
**Type:** User App

**Description:**  
Zero-knowledge password manager with end-to-end encryption.

**Features:**
- Zero-knowledge architecture
- E2E encryption
- Password generator
- 2FA support
- Secure notes
- Credit card storage
- Autofill support

**Security:**
- Client-side encryption
- No server access to data
- Open source
- Regular security audits

---

### LumoAssistant
**Location:** `packages/apps/LumoAssistant/`  
**Package Name:** `proton.lumo.assistant`  
**Type:** User App

**Description:**  
Privacy-focused AI assistant by Proton with on-device processing.

**Features:**
- On-device AI processing
- No cloud data transmission
- Voice commands
- Text assistance
- Privacy-first design
- No tracking

**Capabilities:**
- Voice recognition
- Natural language processing
- Task automation
- Calendar integration
- Reminder system

---

## Prebuilt Apps

### F-Droid
**Package Name:** `org.fdroid.fdroid`  
**Location:** `vendor/andyos/prebuilt/FDroid.apk`

**Description:**  
Primary app store for AndyOS. Open-source app repository.

**Features:**
- 100% open source apps
- No account required
- No tracking
- Automatic updates
- App verification

---

### Aurora Store
**Package Name:** `com.aurora.store`  
**Location:** `vendor/andyos/prebuilt/AuroraStore.apk`

**Description:**  
Access Play Store catalog without Google account.

**Features:**
- Anonymous access
- No Google account needed
- Play Store compatibility
- App updates
- Privacy-focused

---

### NewPipe
**Package Name:** `org.schabi.newpipe`  
**Location:** `vendor/andyos/prebuilt/NewPipe.apk`

**Description:**  
YouTube client without ads or Google services.

**Features:**
- No ads
- Background playback
- Download videos
- No Google account
- Privacy-focused

---

### OsmAnd
**Package Name:** `net.osmand.plus`  
**Location:** `vendor/andyos/prebuilt/OsmAnd.apk`

**Description:**  
Offline maps and navigation.

**Features:**
- Offline maps
- Turn-by-turn navigation
- No location tracking
- OpenStreetMap data
- Privacy-focused

---

### K-9 Mail
**Package Name:** `com.fsck.k9`  
**Location:** `vendor/andyos/prebuilt/K9Mail.apk`

**Description:**  
Open-source email client with PGP support.

**Features:**
- PGP/GPG encryption
- Multiple accounts
- IMAP/POP3 support
- No tracking
- Open source

---

### OpenBoard
**Package Name:** `org.dslul.openboard.inputmethod.latin`  
**Location:** `vendor/andyos/prebuilt/OpenBoard.apk`

**Description:**  
Privacy-focused keyboard with no network permissions.

**Features:**
- No network access
- No telemetry
- Gesture typing
- Multiple languages
- Open source

---

## Build Integration

All packages are integrated into the AndyOS build system via:

**Main Configuration:**
```makefile
# vendor/andyos/andyos.mk
PRODUCT_PACKAGES += \
    AndyOSPrivacyGuard \
    AndyOSSetupWizard \
    AndyOSSettings \
    AndyOSUpdater \
    AndyOSBrowser
```

**Prebuilt Apps:**
```makefile
# vendor/andyos/prebuilt/prebuilt.mk
PRODUCT_COPY_FILES += \
    vendor/andyos/prebuilt/FDroid.apk:system/app/FDroid/FDroid.apk
```

---

## Development

### Building Individual Packages

```bash
# Build specific package
m AndyOSBrowser

# Build all AndyOS packages
m andyos-packages
```

### Testing

```bash
# Install to device
adb install -r out/target/product/panther/system/app/AndyOSBrowser/AndyOSBrowser.apk

# Check logs
adb logcat | grep AndyOS
```

---

## Contributing

See [CONTRIBUTING.md](../CONTRIBUTING.md) for guidelines on contributing to AndyOS packages.

---

**License:** Apache 2.0  
**Maintained by:** AndyOS Project
