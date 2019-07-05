#!/bin/bash
selection=0

if [[ $# -eq 0 ]]; then echo run $0 '[Selection] to change subscription'; fi
exit 0

az account list --query [].[name,id] -o table | tail -n14| while read -r subs; 
do
	sub=$( echo ${subs} | awk '{print $NF}')
	name=$( echo ${subs} | sed "s/$sub//g")
	if [[ $# -eq 0 ]]; then echo  $selection '	'$name; fi
	if [[ $# -gt 0 ]]; then if [[ "$1" == "$selection" ]]; then export SUBSCRIPTION=$sub; az account set --subscription $sub; fi; fi 
	selection=$(( selection+1 ))
done
echo " "
echo selected subscription $(az account show --query name -o tsv) 
