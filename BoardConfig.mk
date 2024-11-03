#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

include device/samsung/sm8250-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/r8q

# Kernel
TARGET_KERNEL_CONFIG += vendor/samsung/r8q.config

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
