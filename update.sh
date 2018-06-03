
cd "$(dirname "${0}")" || exit
sh prepare.sh
sourcediro="$(chobakwrap -sub realpath .)"

~/com/mounty/on

cd /mnt/metatemp/public_html/sites/virtualstoa-files || \
exit
vsfiled="$(chobakwrap -sub realpath .)"

cd np-algorithmic-rationalism || exit
outdiro="$(chobakwrap -sub realpath .)"
cd ebkx || exit
ebkdir="$(chobakwrap -sub realpath .)"

echo ": ${ebkdir} :"
#exit

#echo cp "${sourcediro}"/*.epub "${sourcediro}"/*.mobi "${ebkdir}/."
cp "${sourcediro}"/algorithmic-rationalism.epub "${ebkdir}/$(cat "${sourcediro}/tmpres/datetime-cyber.txt")--algorithmic-rationalism.epub"
cp "${sourcediro}"/algorithmic-rationalism.mobi "${ebkdir}/$(cat "${sourcediro}/tmpres/datetime-cyber.txt")--algorithmic-rationalism.mobi"
(
  cd "${ebkdir}" && (
    ls *.epub *.mobi | sort
  )
)

echo
echo ": ${ebkdir} :"
echo "$(cat "${sourcediro}/tmpres/smdate.txt") - $(cat "${sourcediro}/tmpres/justhour.txt")"
echo

wra "${ebkdir}/index.html"
#wra -f "${ebkdir}/downloadpage.css"

