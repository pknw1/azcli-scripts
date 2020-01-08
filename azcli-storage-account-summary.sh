#########################################
#########################################
# work in progress
# 
#

#!/bin/bash

used_space=$(az monitor metrics list --metric "UsedCapacity" --resource $id  --interval 1H --start-time ${today}T01:00:00Z --end-time ${today}T02:00:00Z) 

storage_account_name=$(az resource show --ids $id --query name -o tsv)
storage_account_access_tier=$()
storage_account_sku=$()
storage_account_sku_tier=$()

echo $used_space
