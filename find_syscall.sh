#!/bin/bash -x

adb shell 'uname -a'                                     #| gsed "s/\r$//"
adb shell 'id'                                           #| gsed "s/\r$//"
adb shell 'cat /system/build.prop | grep model'          #| gsed "s/\r$//"
adb shell 'cat /system/build.prop | grep version'        #| gsed "s/\r$//"
adb shell 'cat /system/build.prop | grep arm'            #| gsed "s/\r$//"

#
# check whether the function, designated as keyword, is implemented or not
#
keyword="setxattr"

adb shell "cat /proc/kallsyms | grep $keyword"
adb shell "strings /system/lib/libc.so | grep $keyword"
adb shell "strings /system/lib64/libc.so | grep $keyword"

## if strings is not installed, try this
adb pull /system/lib/libc.so .
strings libc.so | grep setxattr


#
# check openssl version
#
adb shell "strings /system/lib/libssl.so | grep 'OpenSSL'"
adb shell "strings /system/lib64/libssl.so | grep 'OpenSSL'"

adb pull /system/lib/libssl.so .
strings libssl.so | grep 'OpenSSL'


