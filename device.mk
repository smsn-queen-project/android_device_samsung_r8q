#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# call the common setup
$(call inherit-product, device/samsung/sm8250-common/common.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_diff.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_diff.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Camera
PRODUCT_PACKAGES += \
    libui_shim.vendor

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service.samsung

# NFC configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init/android.hardware.nfc@1.2-service.samsung.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.nfc@1.2-service.samsung.rc \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp_RF.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp_RF.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nci-NXP_SN100U.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci-NXP_SN100U.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-sec-vendor.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nci-SLSI.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci-SLSI.conf

# Init files
PRODUCT_PACKAGES += \
    init.r8q.rc

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Sensors
PRODUCT_PACKAGES += \
    sensors.samsung

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Inherit r8q blobs
$(call inherit-product, vendor/samsung/r8q/r8q-vendor.mk)
