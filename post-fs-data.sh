#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

mkdir -p $MODDIR/system/etc/security/cacerts
#rm $MODDIR/system/etc/security/cacerts/*
cp -f /data/misc/user/0/cacerts-added/* $MODDIR/system/etc/security/cacerts/
mv -f /data/misc/user/0/cacerts-added/* /storage/emulated/0/Download/certs/
set_perm_recursive $MODDIR/system/etc/security/cacerts/ root root 644
chcon u:object_r:system_file:s0 $MODDIR/system/etc/security/cacerts/*

# This script will be executed in post-fs-data mode
# More info in the main Magisk thread
