# AndyOS x86_64 Device Configuration
# For VirtualBox/VMware virtual machines

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_system.mk)
$(call inherit-product, vendor/andyos/config/privacy.mk)

# Device identifiers
PRODUCT_NAME := andyos_x86_64
PRODUCT_DEVICE := x86_64
PRODUCT_BRAND := AndyOS
PRODUCT_MODEL := AndyOS VM
PRODUCT_MANUFACTURER := AndyOS Project

# Architecture
TARGET_ARCH := x86_64
TARGET_ARCH_VARIANT := x86_64
TARGET_CPU_ABI := x86_64
TARGET_CPU_VARIANT := generic

# Kernel
TARGET_KERNEL_ARCH := x86_64
BOARD_KERNEL_IMAGE_NAME := bzImage

# Enable VirtIO drivers for VM optimization
BOARD_KERNEL_CMDLINE += \
    androidboot.hardware=x86_64 \
    androidboot.selinux=enforcing \
    quiet \
    console=ttyS0

# VirtualBox/VMware graphics
BOARD_GPU_DRIVERS := virgl vmwgfx

# Enable KVM acceleration
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.gralloc=minigbm \
    ro.hardware.hwcomposer=drm

# Boot animation (720p for VM)
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

PRODUCT_COPY_FILES += \
    vendor/andyos/bootanimation/720p/bootanimation.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip

# AndyOS system apps
PRODUCT_PACKAGES += \
    AndyOSPrivacyGuard \
    AndyOSSetupWizard \
    AndyOSSettings \
    AndyOSUpdater \
    F-Droid \
    F-DroidPrivilegedExtension

# VM-specific packages
PRODUCT_PACKAGES += \
    qemu-props \
    tablet-mode

# ISO generation
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.type=iso

# Disable unnecessary services for VM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.radio.noril=true \
    ro.carrier=wifi-only

# Inherit common AndyOS configuration
$(call inherit-product, vendor/andyos/config/common.mk)
