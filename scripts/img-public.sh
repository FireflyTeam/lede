#!/bin/bash
set -ex

old_img=$1
device_board=$2
openwrt=LEDE

out_dir=$(dirname $old_img)
old_img=$(basename $old_img)

new_img="$device_board"_"$openwrt"_GPT_RAW

if [[ $old_img =~ "ext4" ]]; then
	new_img="$new_img"_EXT4
elif [[ $old_img =~ "squashfs" ]];then
	new_img="$new_img"_SQUASHFS
fi

new_img="$new_img"_$(date +%Y%m%d).zip

cp $out_dir/$old_img $out_dir/$new_img
