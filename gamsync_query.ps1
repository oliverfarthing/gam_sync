# Creating an array to store combined data
$validatordatabase = @()

# Query for CSV files in the directory
$validatorquery = Get-ChildItem -Path "C:\gamsync\" -File -Filter "(domain)syncvalidation.csv"

# Loop through each CSV file and import its data
foreach ($validatorfile in $validatorquery) {
    $validatorfileData = Import-Csv -Path $validatorfile.FullName | 
                      Select-Object email
    $validatordatabase += $validatorfileData
}

# Creating an array to store combined data
$masterdatabase = @()

# Query for the master CSV file
$masterquery = Get-ChildItem -Path "C:\gamsync\mastergamsync.csv" -File

# Loop through each CSV file and import its data
foreach ($masterfile in $masterquery) {
    $masterfileData = Import-Csv -Path $masterfile.FullName | 
                      Select-Object primaryEmail, *aliases*
    $masterdatabase += $masterfileData
}

# Extract email addresses from validatordatabase
$validator = $validatordatabase | Select-Object -ExpandProperty email



# Addition filter for the masterdatabase records with the specific domains
$domainadditionfilter = $masterdatabase | Where-Object {
    $_.primaryEmail -notin $validator -and (

    $_.PSObject.Properties.Value | Where-Object { 
        $_ -like "*domain.co.uk"
        }
    )
}

    # Define the output file path for each domain
    $domainadditionoutputPath = "C:\gamsync\domain_additionsync.csv"
    Start-Sleep -Seconds 1

    # Export the filtered results to a CSV file
    $domainadditionfilter | Export-Csv -Path $domainadditionoutputPath -NoTypeInformation



# Subtraction filter for the masterdatabase records with the specific domains
$domainadditionfilter = $masterdatabase | Where-Object {
    $_.primaryEmail -in $validator -and (

    $_.PSObject.Properties.Value | Where-Object { 
        $_ -notlike "*domain.co.uk"
        }
    )
}

    # Define the output file path for subtractions
    $domainsubtractionoutputPath = "C:\gamsync\domain_subtractionsync.csv"
    Start-Sleep -Seconds 1

    # Export the filtered results to a CSV file
    $domainsubtractionfilter | Export-Csv -Path $domainsubtractionoutputPath -NoTypeInformation -Force

Exit
