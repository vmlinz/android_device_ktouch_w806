#!/system/bin/sh

# for SPI interface

insmod /system/lib/hw/spi_protocol.ko

chmod 666 /dev/ttyIPC0

chmod 777 /dev/socket/rild

# Nvidia - Automatically provision the device to allowing incoming calls
echo "insert into secure (name, value) values ('device_provisioned', 1);" | /system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db

