# AndyOS Boot Animation Configuration

# Boot animation resolution (adjust based on device)
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Boot animation descriptor
# Format: WIDTH HEIGHT FPS
# part0 - intro loop count folder
# part1 - main loop count folder

PRODUCT_COPY_FILES += \
    vendor/andyos/bootanimation/desc.txt:system/media/bootanimation/desc.txt \
    vendor/andyos/bootanimation/part0/00001.png:system/media/bootanimation/part0/00001.png \
    vendor/andyos/bootanimation/part1/00001.png:system/media/bootanimation/part1/00001.png
