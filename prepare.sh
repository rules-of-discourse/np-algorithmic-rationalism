
# Before we do anything else, we must make sure
# that we are in the repo's main directory.
cd "$(dirname "${0}")" || exit
repodir="$(pwd)"

sh prepare-image.sh || exit 2
abrstate='pub'
if [ -f 'abrstate.flag' ]; then
  abrstate="$(cat abrstate.flag)"
  rm -rf abrstate.flag
fi


rm -rf Images
mkdir Images
cp CoverImage.jpg Images/.

chobakepubtl covergen ../Images/CoverImage.jpg > Text/CoverPage.xhtml



(
  echo "title:Declaration of Nature and Purpose for Algorithmic Rationalism v. $(cat tmpres/version-stamp.txt)"
  echo "author:Sophia Elizabeth Shapira"
  echo "publisher:Sophia Elizabeth Shapira"
  echo "language:en"
  echo "year:$(cat tmpres/year.txt)"
  echo "date:$(cat tmpres/smdate.txt)"
  perl res/multishow.pl 'css:' Styles/*.css
  echo "ftext:Text/CoverPage.xhtml"
  echo "cont:1:*:Declaration of Nature and Purpose for Algorithmic Rationalism"
  echo "text:Text/maintoc.xhtml"
  echo "cont:2:*:Contents"
  #echo "text:Text/copyright.xhtml"
  #echo "cont:2:*:Copyright"
  echo "text:Text/basic-principles-of-algorithmic-rationalism.xhtml"
  echo "cont:2:*:Basic Principles of Algorithmic Rationalism"
  echo "cvimg:Images/CoverImage.jpg"
) > recipe.txt


rm -rf *.epub
chobakepubtl build recipe.txt prep algorithmic-rationalism || exit 3
rm -rf *.mobi
kindlegen algorithmic-rationalism.epub
epubcheck algorithmic-rationalism.epub


