#!/usr/bin/env bash

# Reference: https://www.cups.org/doc/options.html

# lpr -P PRINTER_NAME -o sides=two-sided-long-edge -o media=Letter -o fit-to-page DOCUMENT.pdf
# media=Letter + fit-to-page -> allows us to override A4 PDF documents and resize to fit on 8.5x11 (Letter)

ARGS='-o sides=two-sided-long-edge -o media=Letter -o fit-to-page'

# Reference: https://stackoverflow.com/questions/59895/how-do-i-get-the-directory-where-a-bash-script-is-located-from-within-the-script
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR/printers

printers=$(find . -maxdepth 1 -type d -not -path . -printf "%P\n" | sort)

for printer in $printers; do
    find ./$printer/autoload -maxdepth 1 -type f -print -exec \
        bash -c "lpr -P $printer $ARGS \"{}\" && mv -v \"{}\" ./$printer/completed;" \;
done
