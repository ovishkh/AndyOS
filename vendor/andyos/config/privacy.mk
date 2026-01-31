# AndyOS Privacy Configuration

# Privacy-focused system properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=https://andyos.org/legal \
    ro.url.legal.android_privacy=https://andyos.org/privacy \
    ro.setupwizard.mode=OPTIONAL \
    setupwizard.feature.baseline_setupwizard_enabled=true

# Disable Google services
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent

# DNS Configuration
PRODUCT_PROPERTY_OVERRIDES += \
    net.dns1=9.9.9.9 \
    net.dns2=149.112.112.112 \
    net.rmnet0.dns1=9.9.9.9 \
    net.rmnet0.dns2=149.112.112.112

# Captive portal
PRODUCT_PROPERTY_OVERRIDES += \
    captive_portal_https_url=https://captiveportal.andyos.org/generate_204 \
    captive_portal_http_url=http://captiveportal.andyos.org/generate_204

# Disable telemetry
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.nocheckin=1 \
    ro.com.google.gmsversion=0

# AndyOS System Apps
PRODUCT_PACKAGES += \
    AndyOSPrivacyGuard \
    AndyOSSetupWizard \
    AndyOSSettings \
    AndyOSUpdater \
    AndyOSBrowser

# Remove Google connectivity check
PRODUCT_PACKAGES_REMOVE += \
    GoogleConnectivityCheck
