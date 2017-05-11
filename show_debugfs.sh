#!/bin/bash -x

adb shell 'uname -a'                                     #| gsed "s/\r$//"
adb shell "cat /proc/sys/kernel/ostype"
adb shell "cat /proc/sys/kernel/osrelease"
adb shell "cat /proc/sys/kernel/version"
adb shell 'id'                                           #| gsed "s/\r$//"
adb shell 'cat /system/build.prop | grep model'          #| gsed "s/\r$//"
adb shell 'cat /system/build.prop | grep version'        #| gsed "s/\r$//"
adb shell 'cat /system/build.prop | grep arm'            #| gsed "s/\r$//"

adb shell 'mount'                                        #| gsed 's/\r$//'
adb shell 'mount | grep sysfs'                           #| gsed 's/\r$//'
adb shell 'mount | grep debugfs'                         #| gsed 's/\r$//'

adb shell 'ls -al /sys/kernel/debug/'                    #| gsed 's/\r$//'
adb shell 'ls -al /sys/kernel/debug/tracing'             #| gsed 's/\r$//'
adb shell 'cat /sys/kernel/debug/tracing/tracing_on'     #| gsed 's/\r$//'
adb shell 'cat /sys/kernel/debug/tracing/printk_formats' #| gsed 's/\r$//'

