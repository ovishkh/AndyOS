# AndyOS Privacy Configuration
# This makefile defines privacy-focused defaults for all AndyOS builds

PRODUCT_NAME := AndyOS
PRODUCT_BRAND := AndyOS
PRODUCT_MANUFACTURER := AndyOS Project

# Version info
PRODUCT_VERSION_MAJOR := 1
PRODUCT_VERSION_MINOR := 0
PRODUCT_VERSION_CODENAME := Liberation

# Privacy-respecting DNS (Quad9)
PRODUCT_PROPERTY_OVERRIDES += \
    net.dns1=9.9.9.9 \
    net.dns2=149.112.112.112 \
    net.dns3=2620:fe::fe \
    net.dns4=2620:fe::9

# Replace Google connectivity checks
PRODUCT_PROPERTY_OVERRIDES += \
    captive_portal_https_url=https://captiveportal.andyos.org/generate_204 \
    captive_portal_http_url=http://captiveportal.andyos.org/generate_204 \
    captive_portal_fallback_url=http://captiveportal.andyos.org/fallback \
    captive_portal_other_fallback_urls=http://captiveportal.andyos.org/other_fallback

# Disable Google services
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase= \
    ro.com.google.clientidbase.ms= \
    ro.com.google.clientidbase.am= \
    ro.com.google.clientidbase.gmm= \
    ro.com.google.clientidbase.yt=

# Privacy defaults
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.mode=DISABLED \
    ro.setupwizard.enterprise_mode=1 \
    ro.opa.eligible_device=false \
    ro.com.android.dataroaming=false \
    ro.config.nocheckin=yes

# Disable telemetry and crash reporting
PRODUCT_PROPERTY_OVERRIDES += \
    ro.error.receiver.system.apps= \
    ro.atrace.core.services= \
    persist.traced.enable=0 \
    debug.atrace.tags.enableflags=0

# NTP servers (privacy-focused)
PRODUCT_PROPERTY_OVERRIDES += \
    persist.backup.ntpServer=time.cloudflare.com

# Remove Google packages
PRODUCT_PACKAGES_REMOVE += \
    GoogleContacts \
    GoogleDialer \
    GoogleCamera \
    Maps \
    YouTube \
    Gmail \
    Chrome \
    GoogleTTS \
    GoogleExtServices \
    GoogleServicesFramework \
    GmsCore \
    PrebuiltGmsCore

# AndyOS system apps
PRODUCT_PACKAGES += \
    AndyOSPrivacyGuard \
    AndyOSSetupWizard \
    AndyOSSettings \
    AndyOSUpdater

# F-Droid integration
PRODUCT_PACKAGES += \
    F-Droid \
    F-DroidPrivilegedExtension

# Essential AOSP apps (privacy-audited)
PRODUCT_PACKAGES += \
    Dialer \
    Contacts \
    Messaging \
    Camera2 \
    Gallery2 \
    Browser \
    Email \
    Calendar \
    Clock \
    Calculator \
    Files

# Privacy tools
PRODUCT_PACKAGES += \
    Orbot \
    Tor \
    PrivacyBrowser

# Security enhancements
PRODUCT_PROPERTY_OVERRIDES += \
    ro.adb.secure=1 \
    persist.sys.usb.config=none \
    ro.secure=1 \
    ro.debuggable=0

# SELinux enforcing
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Disable OTA to Google servers
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.ota.url=https://ota.andyos.org/api/v1/updates

# Branding
PRODUCT_PROPERTY_OVERRIDES += \
    ro.andyos.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.andyos.codename=$(PRODUCT_VERSION_CODENAME) \
    ro.andyos.build.date=$(shell date +%Y%m%d)

# Copy privacy configuration files
PRODUCT_COPY_FILES += \
    vendor/andyos/config/permissions/privapp-permissions-andyos.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-andyos.xml \
    vendor/andyos/config/sysconfig/andyos-sysconfig.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/andyos-sysconfig.xml
