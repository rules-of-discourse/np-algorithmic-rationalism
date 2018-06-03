
# Before we do anything else, we must make sure
# that we are in the repo's main directory.
cd "$(dirname "${0}")" || exit 3
repodir="$(pwd)"

rm -rf *.epub *.mobi *.pdf

sh prepare-image.sh || exit 2
abrstate='pub'
if [ -f 'abrstate.flag' ]; then
  abrstate="$(cat abrstate.flag)"
  rm -rf abrstate.flag
fi


rm -rf Images
mkdir Images
cp CoverImage.jpg Images/.
cp PrintImage.jpg Images/.

chobakepubtl covergen ../Images/CoverImage.jpg > Text/CoverPage.xhtml
chobakepubtl covergen ../Images/PrintImage.jpg > Text/PrintCover.xhtml



(
  echo "ftext:Text/CoverPage.xhtml"
  echo "cvimg:Images/CoverImage.jpg"
  sh cg-prepare.sh
) > recipe.txt
chobakepubtl build recipe.txt prep algorithmic-rationalism || exit 3

(
  echo "ftext:Text/PrintCover.xhtml"
  echo "cvimg:Images/PrintImage.jpg"
  sh cg-prepare.sh
) > recipe.txt
chobakepubtl build recipe.txt prep lpc01-algrat || exit 3


echo
kindlegen algorithmic-rationalism.epub




ebook-convert lpc01-algrat.epub algorithmic-rationalism.pdf \
  --embed-all-fonts \
  --margin-left 80 \
  --margin-right 80 \
  --margin-top 50 \
  --margin-bottom 50 \
--extra-css exstyles/niceshow.css
echo
echo
epubcheck algorithmic-rationalism.epub
echo
epubcheck lpc01-algrat.epub
echo


