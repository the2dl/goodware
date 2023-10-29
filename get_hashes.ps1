# Create an array of the directories to scan
$directories = @(
    "C:\Windows\System32"
    "C:\Windows\SysWOW64"
    "C:\Program Files"
    "C:\Program Files (x86)"
)

# Get a list of all files in each directory that end with .exe
$files = @()
foreach ($directory in $directories) {
    $files += Get-ChildItem -Path $directory -Recurse -Filter *.exe
}

# Create a new text file to store the output
$outputFile = "C:\ProgramData\hashes.txt"
New-Item -Path $outputFile -ItemType File

# Iterate through each file in the list and calculate the MD5 and SHA256 hash
foreach ($file in $files) {
    $md5Hash = Get-FileHash -Path $file.FullName -Algorithm MD5
    $sha256Hash = Get-FileHash -Path $file.FullName -Algorithm SHA256

    # Append the file name, MD5 hash, and SHA256 hash to the text file
    Add-Content -Path $outputFile -Value "$($md5Hash.Hash),$($sha256Hash.Hash),$($file.Name)"
}

# Display a message to the user that the script has completed
Write-Host "The script has completed successfully. The file hashes have been exported to the following file: $outputFile" 
