#!/bin/bash -x

adb shell 'uname -a'                                     #| gsed "s/\r$//"
adb shell 'id'                                           #| gsed "s/\r$//"
adb shell 'cat /system/build.prop | grep model'          #| gsed "s/\r$//"
adb shell 'cat /system/build.prop | grep version'        #| gsed "s/\r$//"
adb shell 'cat /system/build.prop | grep arm'            #| gsed "s/\r$//"

adb shell 'ls -al /system/etc/permissions/'

adb shell 'find /system/etc/permissions/ | xargs grep gid=\"root\"'
adb shell 'find /system/etc/permissions/ | xargs grep gid=\"system\"'
adb shell 'find /system/etc/permissions/ | xargs grep gid=\"shell\"'

#adb shell 'find /system/etc/permissions/ | xargs grep -C 5 gid=\"system\"'  # error, not work

adb shell 'grep -C 5 gid=\"root\" /system/etc/permissions/*'
adb shell 'grep -C 5 gid=\"system\" /system/etc/permissions/*'
adb shell 'grep -C 5 gid=\"shell\" /system/etc/permissions/*'


adb shell 'dumpsys package'
adb shell 'dumpsys package | grep "userId=0$" | wc'
adb shell 'dumpsys package | grep "userId=1000$" | wc'
adb shell 'dumpsys package | grep "userId=2000$" | wc'

adb shell 'dumpsys package | grep -B 1 "userId=0$"'
adb shell 'dumpsys package | grep -B 1 "userId=1000$"'
adb shell 'dumpsys package | grep -B 1 "userId=2000$"'

adb shell 'dumpsys package | grep gids | grep -v null | grep 1000'
adb shell 'dumpsys package | grep gids | grep 2000'

