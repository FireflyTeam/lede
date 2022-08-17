#!/bin/bash
set -ex

old_gimg=$1
device_board=$2

pushd $(dirname $old_gimg)

if [[ $old_gimg =~ "ext4" ]] && [[  $old_gimg =~ "img.gz" ]]; then
	old_gimg=$(basename $old_gimg)
	old_img=$(echo $old_gimg|cut -d . -f 1-2)
	new_zimg="$device_board"_LEDE_GPT_RAW_$(date +%Y%m%d).zip
	[ -e $new_zimg ] && rm $new_zimg

	# gzip -dkfq $old_gimg
	gzip -dkfc $old_gimg > $old_img
	zip -mq9 $new_zimg $old_img
fi

popd
