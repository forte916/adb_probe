#!/bin/bash -x

MODEL=`adb shell "cat /system/build.prop | grep product\.model " | gsed 's/\r$//'`
MODEL=${MODEL##*=}

echo $MODEL

OUTPUT_FILE="console_find_syscall_${MODEL}.log"
./find_syscall.sh        > "$OUTPUT_FILE" 2>&1
gsed -i 's/\r$//g'             "$OUTPUT_FILE"
gsed -i 's/^+ adb/\n+ adb/g'   "$OUTPUT_FILE"

OUTPUT_FILE="console_debugfs_${MODEL}.log"
./show_debugfs.sh            > "$OUTPUT_FILE" 2>&1
gsed -i 's/\r$//g'             "$OUTPUT_FILE"
gsed -i 's/^+ adb/\n+ adb/g'   "$OUTPUT_FILE"


OUTPUT_FILE="console_permission_${MODEL}.log"
./show_permissions.sh        > "$OUTPUT_FILE" 2>&1
gsed -i 's/\r$//g'             "$OUTPUT_FILE"
gsed -i 's/^+ adb/\n+ adb/g'   "$OUTPUT_FILE"


