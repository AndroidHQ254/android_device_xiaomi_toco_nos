#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/xiaomi/tucana/tucana-vendor.mk)

-include $(LOCAL_PATH)/system_prop.mk
-include $(LOCAL_PATH)/product_prop.mk

PRODUCT_SHIPPING_API_LEVEL := 28
PRODUCT_TARGET_VNDK_VERSION := 29
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# AAPT config
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_CHARACTERISTICS := nosdcard
TARGET_HAS_FOD := true

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# ANT+
PRODUCT_PACKAGES += \
    AntHalService

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libaacwrapper

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_engine_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio_policy_engine_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio_policy_configuration.xml

# Bluetooth
PRODUCT_PACKAGES += \
    BluetoothQti

# Camera
PRODUCT_PACKAGES += \
    Snap

# Device-specific settings
PRODUCT_PACKAGES += \
    XiaomiParts

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    lineage.biometrics.fingerprint.inscreen@1.0-service.tucana

PRODUCT_COPY_FILES += \
   vendor/lineage/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml:system/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml

# fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Init
PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.mi_thermald.rc

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl.tucana

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    com.gsma.services.nfc \
    NfcNci \
    SecureElement \
    Tag

# Notch style overlay
PRODUCT_PACKAGES += \
    NotchNoFillOverlay

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage \
    $(LOCAL_PATH)/overlay

# Overlays - override vendor ones
PRODUCT_PACKAGES += \
    FrameworksResCommon \
    FrameworksResTarget \
    DevicesOverlay \
    DevicesAndroidOverlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.wifi.rtt.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2-service.tucana

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext \

PRODUCT_BOOT_JARS += \
    telephony-ext

PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# Vendor overlay
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vendor-overlay/etc/dsi_xiaomi_f4_36_02_0b_fhd_cmd_display_mi.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/dsi_xiaomi_f4_36_02_0b_fhd_cmd_display_mi.xml \
    $(LOCAL_PATH)/vendor-overlay/etc/dsi_xiaomi_f4_41_06_0a_fhd_cmd_display_mi.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/dsi_xiaomi_f4_41_06_0a_fhd_cmd_display_mi.xml \
    $(LOCAL_PATH)/vendor-overlay/etc/dsi_xiaomi_f4_42_06_0c_fhd_cmd_display_mi.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/dsi_xiaomi_f4_42_06_0c_fhd_cmd_display_mi.xml \
