# SVG2PNG
# To use this you need to have librsvg installed.
# Converts all the svg images in the current directory to png.
# The width is hard coded (-w 600) but very easy to change.
for file in *.svg
do
	namebase=$(basename $file .svg)
	pngname="$namebase.png"
	rsvg-convert -w 600 "$file" -o "$pngname"
	echo "Converted $file to $pngname"
done
