# Introduction
These are some scripts to help with the normalization of data sources for goodware.io.

## Powershell
Run the powershell script on various Windows operating systems, and include various directories in the array that are knwon goodware.

## Couple of things that can be moved into the python script some day
Bring the exported list of hashes and execute:

sort -u exportname.txt >> exportname_UNIQUE.txt
dd if=exportname_UNIQUE.txt of=exportname_final.txt conv=lcase

## Python
Modify the python script for the input/output directory and filename. Execute it and utilize the exported file to dump all data into the postgres database.
