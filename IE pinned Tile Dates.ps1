# Extract Dates from IE Pinned Tile ("Top sites")
# e.g., \Users\[user]\AppData\Local\Microsoft\Internet Explorer\Tiles\pin[-][digits]\msapplication.xml
# 20210104:zG

param (
    [Parameter(Mandatory=$true)][string]$inFile
    )

if(![System.IO.File]::Exists($inFile)){
    # file with path $path doesn't exist
    write-host "`"$inFile`" doesn't appear to be a valid filename: quitting."
    exit 1
}
[xml]$mytile=get-content -path $inFile
    write-Output $mytile.browserconfig.msapplication.config.site
$mybytes=$mytile.browserconfig.msapplication.config.date.Split(',')
$mybytes = $mybytes -replace '0x',''
[array]::reverse($mybytes)
$mybytes=$mybytes -join ''
$asDecimal = [System.Convert]::ToInt64($mybytes, 16)
$date = [DateTime]::FromFileTime($asDecimal).ToUniversalTime().tostring("yyyy.MM.dd HH:mm:ss.fffffffZ")
    Write-Output "`tCreate date: $date"
$mybytes=$mytile.browserconfig.msapplication.config.accdate.Split(',')
$mybytes = $mybytes -replace '0x',''
[array]::reverse($mybytes)
$mybytes=$mybytes -join ''
$asDecimal = [System.Convert]::ToInt64($mybytes, 16)
$date = [DateTime]::FromFileTime($asDecimal).ToUniversalTime().tostring("yyyy.MM.dd HH:mm:ss.fffffffZ")
    Write-Output "`tAccess date: $date"
