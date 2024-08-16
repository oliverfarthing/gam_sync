Version 1 Author Oliver Farthing

Prerequisites
Root Folder: Ensure that the root folder is located at C:\gamsync\automate\servicerecruitment1. 
The system does not require "gamsync" funcation.
GAM Advanced: A functional version of "GAM Advanced" must be installed in the directory C:\gamadv-xtd3.

Components (Essential files for this service)
gamautomate_bootstrap.BAT: Initiates a new synchronization process.
function_filename.ps1: Consolidates the filequery.csv table to ensure it is in a format compatible with GAM, and generates updated values for renamed files.
function_filevalidator.ps1: Compares the filequery.csv table with the filevalidator.csv table to prevent the upload of unnecessary files to GAM.
function_foldervalidator.ps1: Consolidates the folderquery.csv table to ensure it is in a format compatible with GAM.

Changes
16/08/24 - Version 1
Retrieve the Access Control Lists (ACLs) for the selected group using GAM.
For each user within the selected group:
Search their Google Drive for a folder named "Meet Recording"
Identify and collect the file IDs from within these folders.
Compile the collected file IDs into an array.
Generate a new name for each file by combining its current name with the user's email address to ensure distinct naming and avoid conflicts.
Compare the files identified in the current folder with the array of file IDs to ensure that files already present are not duplicated during the upload process.
Modify the Access Control Lists (ACLs) in the target upload location to ensure that proper permissions are assigned to the uploaded files.
Upload the files identified during the scanning process to the designated location, using the new name strings created to avoid conflicts.


