#!/bin/bash -x

adb shell 'uname -a'                                     #| gsed "s/\r$//"
adb shell 'cat /proc/version'
adb shell "cat /proc/sys/kernel/ostype"
adb shell "cat /proc/sys/kernel/osrelease"
adb shell "cat /proc/sys/kernel/version"
adb shell 'id'                                           #| gsed "s/\r$//"
adb shell 'cat /system/build.prop | grep model'          #| gsed "s/\r$//"
adb shell 'cat /system/build.prop | grep arm'            #| gsed "s/\r$//"
adb shell 'cat /system/build.prop | grep version'        #| gsed "s/\r$//"
adb shell 'getprop ro.product.model'
adb shell 'getprop ro.product.cpu.abi'
adb shell 'getprop ro.build.version.release'

#
# show general info
#

# show sysrq supported
adb shell "ls -al /proc/sys/kernel/sysrq"
adb shell "cat /proc/sys/kernel/sysrq"

adb shell "ls -al /proc/sysrq-trigger"
adb shell "cat /proc/sysrq-trigger"


#
# find kernel modules following qce, qcedev, qcecrypto
#
adb shell "ls -al /dev/qce"
adb shell "lsmod"
adb shell "cat /proc/modules"
adb shell "cat /proc/kallsyms | grep qce"
adb shell "cat /proc/kallsyms | grep qcryopto"

