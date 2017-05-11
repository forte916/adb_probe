#!/bin/bash -x

adb shell 'uname -a'                                     #| gsed "s/\r$//"
adb shell "cat /proc/sys/kernel/ostype"
adb shell "cat /proc/sys/kernel/osrelease"
adb shell "cat /proc/sys/kernel/version"
adb shell 'id'                                           #| gsed "s/\r$//"
adb shell 'cat /system/build.prop | grep model'          #| gsed "s/\r$//"
adb shell 'cat /system/build.prop | grep version'        #| gsed "s/\r$//"
adb shell 'cat /system/build.prop | grep arm'            #| gsed "s/\r$//"

adb shell 'ls -al /system/etc/permissions/'

adb shell 'find /system/etc/permissions/ -type f | xargs grep gid=\"root\"'
adb shell 'find /system/etc/permissions/ -type f | xargs grep gid=\"system\"'
adb shell 'find /system/etc/permissions/ -type f | xargs grep gid=\"shell\"'

#adb shell 'find /system/etc/permissions/ | xargs grep -B 4 gid=\"system\"'  # error, not work

adb shell 'find /system/etc/permissions/ -type f | xargs /system/bin/grep -B 4 gid=\"root\"'
adb shell 'find /system/etc/permissions/ -type f | xargs /system/bin/grep -B 4 gid=\"system\"'
adb shell 'find /system/etc/permissions/ -type f | xargs /system/bin/grep -B 4 gid=\"shell\"'

#adb shell 'grep -B 4 gid=\"root\" /system/etc/permissions/*'
#adb shell 'grep -B 4 gid=\"system\" /system/etc/permissions/*'
#adb shell 'grep -B 4 gid=\"shell\" /system/etc/permissions/*'


adb shell 'dumpsys package'
adb shell 'dumpsys package | grep "userId=0$" | wc'
adb shell 'dumpsys package | grep "userId=1000$" | wc'
adb shell 'dumpsys package | grep "userId=2000$" | wc'

adb shell 'dumpsys package | grep -B 1 "userId=0$"'
adb shell 'dumpsys package | grep -B 1 "userId=1000$"'
adb shell 'dumpsys package | grep -B 1 "userId=2000$"'

adb shell 'dumpsys package | grep gids | grep -v null | grep 1000'
adb shell 'dumpsys package | grep gids | grep 2000'

