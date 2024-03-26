param (
    [string]$path,
    [string]$output
)

if (-not $path) {
    Write-Host "[-] Error: Please provide the Python file path using the -path parameter." -ForegroundColor Red
    exit
}

$pyscr = Get-Content -Path $path -Raw
$encscr = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($pyscr))
$randchr = [char](Get-Random -Minimum 65 -Maximum 91)
$impr = "import base64;${randchr}='${encscr}';${randchr}=${randchr}.replace('*','${replace}');exec(base64.b64decode(${randchr}))"
if (-not $output) {
    Write-Output $impr
} else {
    Write-Output $impr | Out-File -FilePath $output -Encoding utf8
}
