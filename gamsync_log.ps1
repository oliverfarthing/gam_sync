# Define the directory containing the CSV files
$sourceDirectory = "C:\gamsync"
# Define the directory where the copies will be saved
$destinationDirectory = "C:\gamsync\logs"

# Get the current timestamp in the format you want
$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"

# Ensure the destination directory exists
if (-not (Test-Path $destinationDirectory)) {
    New-Item -Path $destinationDirectory -ItemType Directory
}

# Delete files older than 3 months in the destination directory
$threeMonthsAgo = (Get-Date).AddMonths(-3)
Get-ChildItem -Path $destinationDirectory | Where-Object { $_.LastWriteTime -lt $threeMonthsAgo } | Remove-Item -Force

# Get all CSV files in the source directory
$csvFiles = Get-ChildItem -Path $sourceDirectory -Filter *.csv

foreach ($file in $csvFiles) {
    # Create a new file name with the timestamp and change the extension to .txt
    $newFileName = "{0}_{1}{2}" -f [System.IO.Path]::GetFileNameWithoutExtension($file.Name), $timestamp, ".txt"
    $destinationPath = Join-Path -Path $destinationDirectory -ChildPath $newFileName

    # Copy the CSV file to the destination directory as a TXT file
    Copy-Item -Path $file.FullName -Destination $destinationPath
}

Write-Output "Files have been copied as TXT and old files have been cleaned up."

Exit