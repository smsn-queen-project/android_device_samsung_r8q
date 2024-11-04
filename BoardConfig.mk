#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

include device/samsung/sm8250-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/r8q

# Camera
SOONG_CONFIG_samsungCameraVars += extra_ids
SOONG_CONFIG_samsungCameraVars_extra_ids := 52 # telephoto

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_samsung_r8q

# Kernel
TARGET_KERNEL_CONFIG += vendor/samsung/r8q.config
BOARD_NAME := SRPUB26A007

# OTA assert
TARGET_OTA_ASSERT_DEVICE := r8q

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# UDFPS
TARGET_USES_FOD_ZPOS := true
