#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in post-fs-data mode
# More info in the main Magisk thread

# Path to the original APK
ORIG_APK="/system/priv-app/TabUILenovoLauncher/TabUILenovoLauncher.apk"

# Path to your custom APK
NEW_APK="/data/adb/modules_update/tabui_launcher_replacement/system/priv-app/TabUILenovoLauncher/TabUILenovoLauncher12.apk"

# Check if the original APK exists
if [ -f "$ORIG_APK" ]; then
    # Bind mount the custom APK over the original APK
    mount --bind "$NEW_APK" "$ORIG_APK"
fi

# Ensure correct permissions for the new APK
chmod 644 "$NEW_APK"
chown root:root "$NEW_APK"
