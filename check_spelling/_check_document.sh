#!/bin/bash
# bourne again shell is very important to make
# the string comparison work

########################################
##### START WITH SETTING CONSTANTS #####
########################################

# get the current script and root dir location
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" && cd $script_dir
script_dir=$script_dir"/"
cd ..
root_dir=$(pwd)"/"

# set the root path of the spelling folder
aspell_meta_path=${script_dir}
# concatenate the dict path
dict_path=${aspell_meta_path}"dict.txt"
# concatenate the report source files path
report_path=${root_dir}"source/*"
# concatenate the resource source files path
resources_path=${root_dir}"reference/*"


########################################
####### NOW CHECKING THE REPORT ########
########################################


echo "---------- Checking report ----------"
for report_files in ${report_path}; do
    if [[ ${report_files} == *".tex" ]]; then
        echo "Going over: "${report_files}
        aspell --home-dir=${aspell_meta_path} --personal=${dict_path} -t -c ${report_files}
        echo "Done with:  "${report_files}
    else
        echo "skipping:   "${report_files}
    fi

done

echo "---------- Checking resources ----------"
for resource_files in ${resources_path}; do
    # ignore bib files
    if [[ ${resource_files} == *".tex" ]]; then
        
            echo "Going over: "${resource_files}
            aspell --home-dir=${aspell_meta_path} --personal=${dict_path} -t -c ${resource_files}
            echo "Done with:  "${resource_files}

    else
        echo "skipping:   "${resource_files}
    fi
done

echo "---------- Checking main file ----------"
echo "Going over: main.tex"
aspell --home-dir=${aspell_meta_path} --personal=${dict_path} -t -c ${root_dir}"main.tex"
echo "Done with:  main.tex"

# wait for user input so we can gnome-terminal it when there
# are no errors (gnome-terminal quits once no user input is awaited)
# read -p "Press enter key to finish"
