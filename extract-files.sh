#!/bin/bash
#
# SPDX-FileCopyrightText: 2016 The CyanogenMod Project
# SPDX-FileCopyrightText: 2017-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/lib64/hw/com.qti.chi.override.so)
            [ "$2" = "" ] && return 0
            xxd -p "${2}" | tr -d \\n > "${2}".hex
            # NOP CONNECT_RILD
            sed -i "s/a00640f96d66009480010034a2eaffd043ecff9065ebfff0e603002a/1f2003d51f2003d51f2003d51f2003d51f2003d51f2003d51f2003d5/g" "${2}".hex
            sed -i "s/42503d91633c1391a5743191e40e8052e0031f2a2100805265d8ff97a00640f9/1f2003d51f2003d51f2003d51f2003d51f2003d51f2003d51f2003d5a00640f9/g" "${2}".hex
            xxd -r -p "${2}".hex > "${2}"
            rm "${2}".hex
            ;;
        vendor/lib64/unihal_main@2.1.so|vendor/lib64/libscaler_hw.unifunc.so)
            [ "$2" = "" ] && return 0
            "${PATCHELF}" --add-needed "libui_shim.so" "${2}"
            ;;
        *)
            return 1
            ;;
    esac

    return 0
}

function blob_fixup_dry() {
    blob_fixup "$1" ""
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=r8q
export DEVICE_COMMON=sm8250-common
export VENDOR=samsung
export VENDOR_COMMON=${VENDOR}

"./../../${VENDOR_COMMON}/${DEVICE_COMMON}/extract-files.sh" "$@"
