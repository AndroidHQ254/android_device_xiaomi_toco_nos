#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, device/xiaomi/toco/device.mk)

# Inherit some
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Nitrogen stuff.
$(call inherit-product, vendor/nitrogen/products/common.mk)

TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := nitrogen_toco
PRODUCT_DEVICE := toco
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi Note 10 Lite
PRODUCT_MANUFACTURER := Xiaomi

BUILD_FINGERPRINT := Xiaomi/toco_global/toco:10/QKQ1.190825.002/V12.0.2.0.QFNMIXM:user/release-keys

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
