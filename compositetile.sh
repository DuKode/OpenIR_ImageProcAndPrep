#!/bin/bash
#The DuKode Studio 2012
#author ilias koen
#desc: A fast draft and dirty script to compose landsat tiles together into the RGB color model. 
# arguments 1: the file for Red channel 2: Green channel 3: Bluechannel 4: outputFilename.tif ( the file will be a geotiff so try to add geo somewhere so you will know.) 
#ex .compositetile.sh fileRed.tif fileGreen.tif fileBlie.tif outputfile.tif

#print variable on a screen
echo $STRING
echo $1 $2 $3 ' -> CHANNELS: RED GREEN BLUE' 
echo $4 ' -> OUTPUT' 

args=("$@")
#echo arguments to the shell
echo ${args[0]} ${args[1]} ${args[2]} ${args[3]}' -> args=("$@"); echo ${args[0]} ${args[1]} ${args[2]} ${args[3]}'

for i in `echo ${args[0]} | sed "s/:/ /g"`
do
echo $i
done

#CONVERT TO RGB IMAGE FROM BANDS
echo ' '
echo '##################'
echo 'combining bands'
echo '##################'

#
#use for surface reflectance 
#convert ${args[0]} ${args[1]} ${args[2]} -combine -level 0.0%x8% ${args[3]}
#

#use for GLS2005
convert -monitor ${args[0]} ${args[1]} ${args[2]} -combine ${args[3]}

echo 'from 16 to 8bit'
convert -monitor ${args[3]} -depth 8 ${args[3]}

echo '#'

#convert -set colorspace sRGB ${args[0]} ${args[1]} ${args[2]} -combine -depth 8 -type TrueColor -colorspace RGB ${args[3]}
#convert ${args[3]} -channel R  -contrast-stretch 0.15x0.05%  -channel G  -contrast-stretch 0.15x0.05%  -channel B  -contrast-stretch 0.15x0.05%   ${args[3]}
echo '#'
#convert  -channel R ${args[0]} -auto-level  -channel G  ${args[1]} -auto-level  -channel B  ${args[2]} -auto-level  -combine -depth 8 -type TrueColor -colorspace RGB ${args[3]}
echo '##################'
echo 'combining bands finished'
echo '##################'
echo ''


echo '##################'
echo 'georeferencing image'
echo '##################'
##########################################
# // apply georeference to composites // #
##########################################
listgeo ${args[0]} > ${args[0]}'.txt' 

geotifcp -g ${args[0]}'.txt' ${args[3]} ${args[3]}'GEO.TIF'

#remove 0 0 0 rgb value and replace with transparency.
gdalwarp -dstalpha -srcnodata "0 0 0" -dstnodata "0 0 0" -co "TILED=YES" ${args[3]}'GEO.TIF' ${args[3]}'GEO_alpha.TIF'
#remove not georeferenced file
rm ${args[3]} 
rm ${args[0]}'.txt' 
