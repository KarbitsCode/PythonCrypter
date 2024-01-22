param([string]$path)

if (-not $path) {
    Write-Host "[-] Error: Please provide the Python file path using the -path parameter."
    exit
}

$pyscr = Get-Content -Path $path -Raw
$encscr = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($pyscr))
$randchr = [char](Get-Random -Minimum 65 -Maximum 91)
$impr = "import base64;${randchr}='${encscr}';${randchr}=${randchr}.replace('*','${replace}');exec(base64.b64decode(${randchr}))"
Write-Output $impr
