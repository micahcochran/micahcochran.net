#!/usr/bin/env fish


# pdftothumb: 
#     fish shell script takes a PDF file and creates a WEBP thumbnail

# TODO:
# get an argument for the size to be resized to.
# $argv would be one way to do this.

# OR use argparse to get the s/size
# https://fishshell.com/docs/current/cmds/argparse.html
# argparse --name=size 's/size' --max-args=1 -- $argv

# is the argument not a file? 
if test ! -e $argv
    echo "pdftothumbnail: The file '$argv' does not exist. Exiting."
    exit 1
end

set PDFpageSize (pdfinfo $argv | grep "^Page size:" | string split -f 2 :)

set imgWidth (string split -f 1 x $PDFpageSize)
set imgHeight (string split -f 2 x $PDFpageSize | string split -f 2 ' ')

# figure out which is the bigger dimension
if test $imgWidth -gt $imgHeight
    echo "Landscape mode"
    set resizeCmd '800'
#	set resizeCmd '500'
else
    echo "Portrait mode"
    set resizeCmd 'x800'
#    set resizeCmd 'x500'
#    set resizeCmd 'x250'
end

set tempFile (mktemp --suffix .ppm)

set resizeName (mktemp --suffix .ppm)

# need a version that is newer than fish 3.3.1 to suport path change-extension
# fish 3.6.0 should work
# set outName (path change-extension .jpg $argv)
set outName (path change-extension .webp $argv)


# note pdftoppm has a hard time respecting a file name, so just pipe it to the filename.
pdftoppm $argv > $tempFile
convert $tempFile -resize $resizeCmd $resizeName
if test $status -eq 0
    echo "Resizing was successful. (on file: $outName)"
end
cwebp -jpeg_like $resizeName -o $outName

rm $tempFile
rm $resizeName

