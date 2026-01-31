# AndyOS Vendor Configuration
# Copyright (C) 2026 AndyOS Project

PRODUCT_BRAND := AndyOS
PRODUCT_DEVICE := generic
PRODUCT_NAME := andyos
PRODUCT_MANUFACTURER := AndyOS

# Build fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="andyos-user 14 UP1A.231005.007 eng.andyos.20260131.120000 release-keys"

BUILD_FINGERPRINT := AndyOS/andyos/generic:14/UP1A.231005.007/eng.andyos.20260131.120000:user/release-keys

# AndyOS version
ANDYOS_VERSION := 1.0
ANDYOS_CODENAME := Liberation
ANDYOS_BUILD_DATE := $(shell date -u +%Y%m%d)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.andyos.version=$(ANDYOS_VERSION) \
    ro.andyos.codename=$(ANDYOS_CODENAME) \
    ro.andyos.build.date=$(ANDYOS_BUILD_DATE)

# Include privacy configuration
$(call inherit-product, vendor/andyos/config/privacy.mk)

# Include AndyOS apps
PRODUCT_PACKAGES += \
    AndyOSPrivacyGuard \
    AndyOSSetupWizard \
    AndyOSSettings \
    AndyOSUpdater \
    AndyOSBrowser

# Include prebuilt apps
PRODUCT_PACKAGES += \
    F-Droid \
    AuroraStore

# Remove Google apps
PRODUCT_PACKAGES_REMOVE += \
    Chrome \
    Gmail \
    Maps \
    YouTube \
    Photos \
    Drive \
    PlayStore

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/andyos/bootanimation/bootanimation.zip:system/media/bootanimation.zip

# Custom permissions
PRODUCT_COPY_FILES += \
    vendor/andyos/config/permissions/privapp-permissions-andyos.xml:system/etc/permissions/privapp-permissions-andyos.xml
