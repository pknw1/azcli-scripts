#!/bin/bash

CURRENT=$(date +%Y%m)
PREVIOUS=$(date -d '1 month ago' +%Y%m)
EARLIEST=$(date -d '2 months ago' +%Y%m)

echo Costs for resource ${1}
echo " "

for BILLING_PERIOD in $CURRENT $PREVIOUS $EARLIEST
do
i	COST=$(az consumption usage list -p ${BILLING_PERIOD} --query "[?instanceId=='${1}'].[pretaxCost]" -o tsv | awk '{n +=$1} END{print n}')
	
	echo $BILLING_PERIOD : $COST
done
