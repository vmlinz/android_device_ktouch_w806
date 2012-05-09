$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/ktouch/whistler/whistler-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/ktouch/whistler/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/ktouch/whistler/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Board-specific init
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ueventd.rc:root/ueventd.rc \
	$(LOCAL_PATH)/ueventd.whistler.rc:root/ueventd.whistler.rc \
	$(LOCAL_PATH)/init.ifx.sh:root/init.ifx.sh

TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/init.rc

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_whistler
PRODUCT_DEVICE := whistler
PRODUCT_MODEL := W806
