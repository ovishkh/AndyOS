LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := AndyOSPrivacyGuard
LOCAL_MODULE_TAGS := optional
LOCAL_PRIVILEGED_MODULE := true
LOCAL_CERTIFICATE := platform

LOCAL_SRC_FILES := $(call all-java-files-under, src)
LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res

LOCAL_PACKAGE_NAME := AndyOSPrivacyGuard
LOCAL_PRIVATE_PLATFORM_APIS := true

LOCAL_STATIC_ANDROID_LIBRARIES := \
    androidx.appcompat_appcompat \
    com.google.android.material_material \
    androidx.recyclerview_recyclerview

LOCAL_REQUIRED_MODULES := \
    privapp-permissions-andyos.xml

LOCAL_PROGUARD_ENABLED := disabled

include $(BUILD_PACKAGE)
