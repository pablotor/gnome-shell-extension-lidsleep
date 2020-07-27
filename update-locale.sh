#!/usr/bin/env sh

cd lidsleep@pablotorrubiano.xyz

pot=gnome-shell-extension-lidsleep.pot

touch $pot
xgettext -j *.js -o $pot
xgettext -j schemas/*.xml -o $pot

for locale_lang in locale/*; do
    po=$locale_lang/LC_MESSAGES/gnome-shell-extension-lidsleep.po
    echo $po
    msgmerge --backup=off -U $po $pot
    msgfmt $po -o ${po%po}mo
done

rm $pot
