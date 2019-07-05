#!/bin/bash
az extension list-available --query [].name -o tsv > /tmp/azcliexta
az extension list --query [].name -o tsv >> /tmp/azcliexta

for ext in $(cat /tmp/azcliexta | sort | uniq -u)
do
	az extension add -n $ext
done
