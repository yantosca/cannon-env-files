#!/bin/bash

# Change config file settings to be a 20-minute run

# Get the current folder
cwd=$(pwd -P)

# Replace ending time in input.geos
sed -i -e "s/20190801 000000/20190701 002000/" input.geos

# Replace freq & duration in HISTORY.rc
sed -i -e "s/00000100 000000/00000000 002000/" HISTORY.rc

# Set diagnostic frequency to End in HEMCO_Config.rc
sed -i -e "s/DiagnFreq:                   Monthly/DiagnFreq:                   End/" HEMCO_Config.rc
