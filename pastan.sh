#!/bin/bash

# Derujun Passtan reformatting for Quizlet
# 2019/1/30
# Author : Masato
# Description: Format the txt file taken out from 
# Kindle version of Derujun Pastan for Quizlet.
# 1. Remove DRM of k:indle book with Calibre with DeDRM
#    and converto to epub.
# 2. Convert epub to txt file by web service.
# 3. Use this script to format.
# 4. In Quizlet, configure the delimiter to "|" and
#    new line to \n\n
# 5. Paste the formatted txt file to Quizlet.
#
# Usage ./pastan.sh file name
#######################################################

# Check if the target file is given properly.
if [ $# = 0 ]; then
	printf "%s\n", "Please give the file name after pastan.sh"
fi

PASTANFILE=$1
TARGETFILE=pastan-ql.txt
>pastan-ql.txt

# Extract the tango section and format by sed.
reformText=$(sed -n '417,36711p' $PASTANFILE | sed -e '/^$/d' \
	-e '/〈セ〉/d' -e 's/　 発音.*//g' -e 's/　 アクセント.*//g' \
	-e '/[0-9]\{4\}.\+/d' -e '/[0-9]\{3\}[^0-9]\+/d' \
	-e '/\* \* \*/d')
printf "%s\n" "$reformText" > $TARGETFILE
