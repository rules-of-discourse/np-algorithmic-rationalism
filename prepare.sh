
# Before we do anything else, we must make sure
# that we are in the repo's main directory.
cd "$(dirname "${0}")" || exit
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
  #echo "text:Text/maintoc.xhtml"
  #echo "cont:2:*:Contents"
  echo "text:Text/copyright.xhtml"
  echo "cont:2:*:Copyright"
  echo "text:Text/mainsrc.xhtml"
  echo "cont:2:*:For the latest edition ..."
  echo "text:Text/historical-context.xhtml"
  echo "cont:2:*:Historical context of Algorithmic Rationalism"
  echo "text:Text/basic-principles.xhtml"
  echo "cont:2:*:Basic principles of Algorithmic Rationalism"
  echo "text:Text/expand-what-logic-means.xhtml"
  echo "cont:3:*:Use of algorithms to resolve matters of uncertainty"
  echo "text:Text/use-of-algorithms.xhtml"
  echo "cont:3:*:Expansion of what the term \"logic\" means"
  echo "cvimg:Images/CoverImage.jpg"
  echo "text:Text/training-against-biases.xhtml"
  echo "cont:3:*:Training to overcome irrational biases"
  echo "text:Text/a-new-etiquette.xhtml"
  echo "cont:3:*:A new standard of etiquette"
  echo "text:Text/devils-advocate.xhtml"
  echo "cont:3:*:Sacred Call of the Devil's Advocate"
  echo "text:Text/among-philosophy.xhtml"
  echo "cont:2:*:Algorithmic Rationalism in the broader world of philosophy"
  echo "text:Text/from-other-rationalisms.xhtml"
  echo "cont:3:*:Distinction between Algorithmic Rationalism and other schools of Rationalism"
  echo "text:Text/relation-to-religion.xhtml"
  echo "cont:3:*:Relation to religion"
) > recipe.txt
#  echo "text:Text/xxxxxxxxx"
#  echo "cont:3:*:xxxxxxxxxxx"


rm -rf *.epub
chobakepubtl build recipe.txt prep algorithmic-rationalism || exit 3
rm -rf *.mobi
echo
kindlegen algorithmic-rationalism.epub
ebook-convert algorithmic-rationalism.epub algorithmic-rationalism.pdf
echo
echo
epubcheck algorithmic-rationalism.epub
echo


