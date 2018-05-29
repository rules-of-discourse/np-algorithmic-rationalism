
cd "$(dirname "${0}")" || exit
cd Text || exit

exec writeontask \
  -wcf '*.xhtml' \
  -rat 1 20 \
$@


