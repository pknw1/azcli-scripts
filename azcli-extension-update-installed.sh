#!/bin/bash
for ext in $(az extension list --query [].name -o tsv)
do
	az extension update -n $ext
done
