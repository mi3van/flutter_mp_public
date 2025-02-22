#!/bin/bash

BUILD_MODE=$1
nl='
'
folderName=''
if [ "$BUILD_MODE" = "GOOGLE" ]; then
    folderName='g_android'
elif [ "$BUILD_MODE" = "RUSTORE" ]; then
    folderName='g_rustore'
elif [ "$BUILD_MODE" = "Windows" ]; then
    folderName='g_windows'
elif [ "$BUILD_MODE" = "HUAWEI" ]; then
    folderName='huawei'
fi

sed '/#DYNAMIC_DEP_PART_START/,/#DYNAMIC_DEP_PART_END/c\
  #DYNAMIC_DEP_PART_START'"\\$nl"'  store_package:'"\\$nl"'    path: local_plugins/store/'"\\$folderName"'/pack'"\\$nl"'  #DYNAMIC_DEP_PART_END' pubspec.yaml > temp.yaml
mv temp.yaml pubspec.yaml