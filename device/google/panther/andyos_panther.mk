# AndyOS Device Configuration - Pixel 7 (Panther)
# Inherits from AOSP device tree with AndyOS modifications

$(call inherit-product, device/google/gs201/device-panther.mk)
$(call inherit-product, vendor/andyos/config/privacy.mk)

# Device identifiers
PRODUCT_NAME := andyos_panther
PRODUCT_DEVICE := panther
PRODUCT_BRAND := Google
PRODUCT_MODEL := Pixel 7
PRODUCT_MANUFACTURER := Google

# AndyOS version
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=andyos_panther \
    PRIVATE_BUILD_DESC="AndyOS 1.0 Liberation for Pixel 7"

# Kernel
PRODUCT_COPY_FILES += \
    device/google/panther/kernel:kernel

# Boot animation (1080p)
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# AndyOS boot animation
PRODUCT_COPY_FILES += \
    vendor/andyos/bootanimation/1080p/bootanimation.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip

# Remove Google apps
PRODUCT_PACKAGES_REMOVE += \
    Chrome \
    Gmail \
    Maps \
    YouTube \
    GoogleTTS

# AndyOS system apps
PRODUCT_PACKAGES += \
    AndyOSPrivacyGuard \
    AndyOSSetupWizard \
    AndyOSSettings \
    AndyOSUpdater

# F-Droid
PRODUCT_PACKAGES += \
    F-Droid \
    F-DroidPrivilegedExtension

# Privacy tools
PRODUCT_PACKAGES += \
    Orbot \
    PrivacyBrowser

# Verified boot with custom keys
BOARD_AVB_ENABLE := true
BOARD_AVB_KEY_PATH := vendor/andyos/keys/avb_key.pem
BOARD_AVB_ALGORITHM := SHA256_RSA4096

# SELinux enforcing
BOARD_KERNEL_CMDLINE += androidboot.selinux=enforcing

# Disable OTA to Google
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.ota.url=https://ota.andyos.org/api/v1/panther

# Device-specific overlays
DEVICE_PACKAGE_OVERLAYS += \
    vendor/andyos/overlay/panther

# Inherit common AndyOS configuration
$(call inherit-product, vendor/andyos/config/common.mk)
