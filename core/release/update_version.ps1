# strings
$year_end = "2023"
$month_end = "5"
$version = "0"

$version = "$year_end.$month_end.$version"

# alternative strings
$version_number = $version.Replace(".", "")
$version_posix = $version -replace "\.\d+$", ("-" + ($version.SubString($version.LastIndexOf(".") + 1)))
$version_posix_long = $version_posix + "-1"
$version_windows = $version.Replace(".", ",")

# update source version header
(Get-Content ..\shared\version.in) | ForEach-Object { $_ -replace "@VERSION@", $version } | ForEach-Object { $_ -replace "@VERSION_NUMBER@", $version_number } | Set-Content ..\shared\version.h
(Get-Content code_doc64.in) | ForEach-Object { $_ -replace "@VERSION@", $version } | ForEach-Object { $_ -replace "@VERSION_WINDOWS@", $version_windows } | Set-Content code_doc64.cmd

# update window resource files
(Get-Content ..\compiler\vs\objeck.in) | ForEach-Object { $_ -replace "@VERSION@", $version } | ForEach-Object { $_ -replace "@YEAR_END@", $year_end } | ForEach-Object { $_ -replace "@VERSION_WINDOWS@", $version_windows } | Set-Content ..\compiler\vs\objeck.rc
(Get-Content ..\vm\vs\objeck.in) | ForEach-Object { $_ -replace "@VERSION@", $version } | ForEach-Object { $_ -replace "@YEAR_END@", $year_end } | ForEach-Object { $_ -replace "@VERSION_WINDOWS@", $version_windows } | Set-Content ..\vm\vs\objeck.rc
(Get-Content ..\debugger\vs\objeck.in) | ForEach-Object { $_ -replace "@VERSION@", $version } | ForEach-Object { $_ -replace "@YEAR_END@", $year_end } | ForEach-Object { $_ -replace "@VERSION_WINDOWS@", $version_windows } | Set-Content ..\debugger\vs\objeck.rc
(Get-Content ..\utils\launcher\vs\builder\objeck.in) | ForEach-Object { $_ -replace "@VERSION@", $version } | ForEach-Object { $_ -replace "@YEAR_END@", $year_end } | ForEach-Object { $_ -replace "@VERSION_WINDOWS@", $version_windows } | Set-Content ..\utils\launcher\vs\builder\objeck.rc
