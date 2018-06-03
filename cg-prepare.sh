
cd "$(dirname "${0}")"


echo "title:Declaration of Nature and Purpose for Algorithmic Rationalism v. $(cat tmpres/version-stamp.txt)"
echo "author:Sophia Elizabeth Shapira"
echo "publisher:Sophia Elizabeth Shapira"
echo "language:en"
echo "year:$(cat tmpres/year.txt)"
echo "date:$(cat tmpres/smdate.txt)"
perl res/multishow.pl 'css:' Styles/*.css
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


#echo "text:Text/xxxxxxxxx"
#echo "cont:3:*:xxxxxxxxxxx"


