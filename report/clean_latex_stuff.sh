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


ALL_OUTS=""
for ext in "${extensions[@]}"
do
	CMD="find . -type f -name \"*.${ext}\" -not -path '.git/*'"
	OUT=$(eval $CMD)
	ALL_OUTS=$ALL_OUTS$OUT
	# echo $CMD
	# only launch if output is found
	if [[ $OUT != "" ]]; then
		# echo $OUT
		for line in "$OUT"; do
			rm $line
		done
	fi
done

if [[ $ALL_OUTS == "" ]]; then
	echo "Nothing to delete"
fi
