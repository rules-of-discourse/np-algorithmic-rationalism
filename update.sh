
cd "$(dirname "${0}")" || exit
sh prepare.sh || exit 2
sourcediro="$(chobakwrap -sub realpath .)"


echo
echo "Verifying location of ebook-convert"
which ebook-convert || exit 4
echo "Verifying location of kindlegen"
which kindlegen || exit 4
echo


~/com/mounty/on

cd /mnt/metatemp/public_html/sites/virtualstoa-files || \
exit
vsfiled="$(chobakwrap -sub realpath .)"

cd np-algorithmic-rationalism || exit 3
outdiro="$(chobakwrap -sub realpath .)"
cd ebkx || exit 3
ebkdir="$(chobakwrap -sub realpath .)"

echo ": ${ebkdir} :"
#exit

#echo cp "${sourcediro}"/*.epub "${sourcediro}"/*.mobi "${ebkdir}/."
cp "${sourcediro}"/algorithmic-rationalism.epub "${ebkdir}/$(cat "${sourcediro}/tmpres/datetime-cyber.txt")--algorithmic-rationalism.epub"
cp "${sourcediro}"/algorithmic-rationalism.mobi "${ebkdir}/$(cat "${sourcediro}/tmpres/datetime-cyber.txt")--algorithmic-rationalism.mobi"
cp "${sourcediro}"/algorithmic-rationalism.pdf "${ebkdir}/$(cat "${sourcediro}/tmpres/datetime-cyber.txt")--algorithmic-rationalism.pdf"
(
  cd "${ebkdir}" && (
    ls *.epub *.mobi *.pdf | sort
  )
)

echo
echo ": ${ebkdir} :"
echo "$(cat "${sourcediro}/tmpres/smdate.txt") - $(cat "${sourcediro}/tmpres/justhour.txt")"
echo

wra "${ebkdir}/index.html"
#wra -f "${ebkdir}/downloadpage.css"

