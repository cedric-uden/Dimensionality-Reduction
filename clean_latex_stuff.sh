#!/bin/bash

# CD into current dir and find all latex junk in folder and subfolders
# and then delete it

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

# put all extensions to delete in an array
extensions=(	
				"aux"
				"bbl"
				"blg"
				"fdb_latexmk"
				"fls"
				"log"
				"synctex.gz"
				"acn"
				"acr"
				"alg"
				"glg"
				"glo"
				"gls"
				"ist"
				"toc"
				"lof"
				"lol"
				"lot" 
				"run.xml"
				"bcf"
				"out"
			)


for ext in "${extensions[@]}"
do
	CMD="find . -type f -name *.${ext} -not -path '.git/*'"
	OUT=$($CMD)
	# only launch if output is found
	if [[ $OUT != "" ]]; then
		rm $OUT
	fi
done
