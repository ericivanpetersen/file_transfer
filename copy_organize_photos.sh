#!/bin/bash

# Bash script copies photos from input directory to
# 	output directory and organizes them by date
#	in the output directory.
#	E.G. Photo on Dec 23 2013 goes to:
#	$outputdir/2013/12_December/23/
#
# Usage: ./copy_organize_photos.sh {input directory} {output directory}

in_dir="$1"
out_dir="$2"

cd "$in_dir"
# Loop through files
for file in *
	do
	echo "$file"
	if [ -f "$file" ] # Test if it's a file
	then 
		date=$(date -r "$file" +%Y/%m_%B/%d) && # Extract date in directory format
		dpath="$out_dir/$date/"
		echo "Copying $file to $dpath"
		# Create path if it doesn't already exist:
		if [ -d "$dpath" ]
			then
 				echo "Path exists"
			else 
				echo "Making path"
				mkdir -p "$dpath"
	
		fi
		# Move file to that path:
		cp -- "$file" "$dpath"
	fi
done
