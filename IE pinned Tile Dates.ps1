# Extract Dates from IE Pinned Tile ("Top sites")
# e.g., \Users\[user]\AppData\Local\Microsoft\Internet Explorer\Tiles\pin-12633731210\msapplication.xml
# 20210104:zG

param (
    [Parameter(Mandatory=$true)][string]$inFile
    )

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
