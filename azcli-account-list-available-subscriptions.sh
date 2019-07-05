#!/bin/bash

az account list --query [].[name,id] -o table  
echo " "
echo "Current Subscription : $(az accountshow --query name -o tsv)
