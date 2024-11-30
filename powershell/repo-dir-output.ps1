function Show-Tree {
    param (
        [string]$Path = ".",
        [int]$Indent = 0,
        [string]$Prefix = ""
    )
    Get-ChildItem -Path $Path | Sort-Object PSIsContainer -Descending | ForEach-Object {
        $line = "{0}{1}" -f ('│   ' * $Indent), $_.Name
        Write-Output $line
        if ($_.PSIsContainer) {
            Show-Tree -Path $_.FullName -Indent ($Indent + 1)
        }
    }
}

Show-Tree | Out-File -FilePath repo-structure.txt
