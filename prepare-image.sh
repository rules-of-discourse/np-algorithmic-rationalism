
# Copyright (c) 2018 - Sophia Elizabeth Shapira
# This script is licensed under the terms of the GNU General
# Public License version 2.0 or later.



# Before we do anything else, we must make sure
# that we are in the repo's main directory.
cd "$(dirname "${0}")" || exit
repodir="$(pwd)"

fulltimestrg="$(date '+%Y-%m-%d - %-I:%M%P::%Y-%m-%d-%H%M::%Y::%Y-%m-%d::%-I:%M%P')"

rm -rf tmpres
mkdir tmpres
chobakepubtl strsplit \
"$fulltimestrg" \
'::' \
tmpres/datetime-neat.txt tmpres/datetime-cyber.txt \
tmpres/year.txt tmpres/smdate.txt \
tmpres/justhour.txt

#echo ": $fulltimestrg :"



rm -rf *.jpg *.png
xcf2png CoverImage.xcf -o CoverImage.png

perl res/prep-image.pl || exit 2


