
cd "$(dirname "${0}")" || exit 2

chobakepubtl bodymerge -css ../Styles/glossary.css -l \
glsr/head.xhtml glsr/begin.xhtml $(ls -1d glsr/from-*.xhtml | sort) \
> Text/glossary.xhtml

#chobakepubtl bodymerge -css ../Styles/glossary.css -l glsr/*.xhtml \
#> Text/glossary.xhtml



