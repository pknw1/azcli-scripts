#!/bin/bash
if [[ $# -ne 2 ]]
then 
	echo usage: ${0} YYYYMM instanceId
fi 
exit 0

cost=$(az consumption usage list -p ${BILLING_PERIOD} --query "[?instanceId=='${2}'].[pretaxCost]" -o tsv | awk '{n +=$1} END{print n}')
