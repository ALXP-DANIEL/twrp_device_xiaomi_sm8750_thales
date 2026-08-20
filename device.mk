#
# Copyright (C) 2025 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Configure base.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Configure core_64_bit_only.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Configure virtual_ab_ota compression_with_xor.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression_with_xor.mk)

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Configure twrp config common.mk
$(call inherit-product, vendor/twrp/config/common.mk)

# API
BOARD_SHIPPING_API_LEVEL := 35
PRODUCT_SHIPPING_API_LEVEL := 35
PRODUCT_TARGET_VNDK_VERSION := 35

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Enable Fuse Passthrough
PRODUCT_PROPERTY_OVERRIDES += persist.sys.fuse.passthrough.enable=true

# Otacert
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(DEVICE_PATH)/security/releasekey

# Required modules
TWRP_REQUIRED_MODULES += \
    prebuilt

# Piano NT36532 touchscreen firmware and touch-report userspace stack.
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/odm/firmware/MP_Setting_Criteria_59B0.csv:$(TARGET_COPY_OUT_RECOVERY)/root/odm/firmware/MP_Setting_Criteria_59B0.csv \
    $(DEVICE_PATH)/recovery/root/odm/firmware/MP_Setting_Criteria_59BB.csv:$(TARGET_COPY_OUT_RECOVERY)/root/odm/firmware/MP_Setting_Criteria_59BB.csv \
    $(DEVICE_PATH)/recovery/root/odm/firmware/film_model.tflite:$(TARGET_COPY_OUT_RECOVERY)/root/odm/firmware/film_model.tflite \
    $(DEVICE_PATH)/recovery/root/odm/firmware/novatek_nt36532_piano_fw_boe.bin:$(TARGET_COPY_OUT_RECOVERY)/root/odm/firmware/novatek_nt36532_piano_fw_boe.bin \
    $(DEVICE_PATH)/recovery/root/odm/firmware/novatek_nt36532_piano_fw_csot.bin:$(TARGET_COPY_OUT_RECOVERY)/root/odm/firmware/novatek_nt36532_piano_fw_csot.bin \
    $(DEVICE_PATH)/recovery/root/odm/firmware/novatek_nt36532_piano_mp_boe.bin:$(TARGET_COPY_OUT_RECOVERY)/root/odm/firmware/novatek_nt36532_piano_mp_boe.bin \
    $(DEVICE_PATH)/recovery/root/odm/firmware/novatek_nt36532_piano_mp_csot.bin:$(TARGET_COPY_OUT_RECOVERY)/root/odm/firmware/novatek_nt36532_piano_mp_csot.bin \
    $(DEVICE_PATH)/recovery/root/odm/firmware/palm_check.tflite:$(TARGET_COPY_OUT_RECOVERY)/root/odm/firmware/palm_check.tflite \
    $(DEVICE_PATH)/recovery/root/odm/firmware/piano_nova_boe_thp_config.ini:$(TARGET_COPY_OUT_RECOVERY)/root/odm/firmware/piano_nova_boe_thp_config.ini \
    $(DEVICE_PATH)/recovery/root/odm/firmware/piano_nova_csot_thp_config.ini:$(TARGET_COPY_OUT_RECOVERY)/root/odm/firmware/piano_nova_csot_thp_config.ini \
    $(DEVICE_PATH)/recovery/root/odm/lib64/libtouchreport.so:$(TARGET_COPY_OUT_RECOVERY)/root/odm/lib64/libtouchreport.so \
    $(DEVICE_PATH)/recovery/root/odm/lib64/libtouchreport_alg.so:$(TARGET_COPY_OUT_RECOVERY)/root/odm/lib64/libtouchreport_alg.so \
    $(DEVICE_PATH)/recovery/root/odm/lib64/libtouchreport_hal.so:$(TARGET_COPY_OUT_RECOVERY)/root/odm/lib64/libtouchreport_hal.so \
    $(DEVICE_PATH)/recovery/root/odm/lib64/libtouchreport_sensor.so:$(TARGET_COPY_OUT_RECOVERY)/root/odm/lib64/libtouchreport_sensor.so \
    $(DEVICE_PATH)/recovery/root/odm/lib64/sensors.touch.detect.so:$(TARGET_COPY_OUT_RECOVERY)/root/odm/lib64/sensors.touch.detect.so

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)
