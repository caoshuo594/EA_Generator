param(
    [Parameter(Mandatory = $true)]
    [string]$Version,
    [string]$Repo = "caoshuo594/EA_Generator",
    [string]$Title = "",
    [string]$Notes = ""
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw "GitHub CLI (gh) is required."
}

$tag = if ($Version.StartsWith("v")) { $Version } else { "v$Version" }
$releaseTitle = if ([string]::IsNullOrWhiteSpace($Title)) { "EA_Generator $tag" } else { $Title }
$releaseNotes = if ([string]::IsNullOrWhiteSpace($Notes)) { "Release $tag" } else { $Notes }

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$zipName = "EA_Generator_Client_${tag}_windows_x64.zip"
$zipPath = Join-Path $root $zipName
$stageDir = Join-Path $root ".release-staging"
$packageItems = @(
    "_internal",
    "config",
    "EA_Generator_Client.exe",
    "start_client.bat",
    "README.md",
    "README.txt"
)

if (Test-Path $zipPath) {
    Remove-Item -Force $zipPath
}

if (Test-Path $stageDir) {
    Remove-Item -Recurse -Force $stageDir
}

Push-Location $root
try {
    New-Item -ItemType Directory -Path $stageDir | Out-Null

    foreach ($item in $packageItems) {
        if (-not (Test-Path $item)) {
            throw "Packaging failed: missing $item"
        }

        Copy-Item -Path $item -Destination $stageDir -Recurse -Force
    }

    Compress-Archive -Path (Join-Path $stageDir "*") -DestinationPath $zipPath -Force

    & gh release view $tag --repo $Repo *> $null
    if ($LASTEXITCODE -eq 0) {
        & gh release upload $tag $zipPath --repo $Repo --clobber
        if ($LASTEXITCODE -ne 0) {
            throw "Release upload failed."
        }
    } else {
        & gh release create $tag $zipPath --repo $Repo --title $releaseTitle --notes $releaseNotes
        if ($LASTEXITCODE -ne 0) {
            throw "Release creation failed."
        }
    }

    Write-Host "Release completed: $Repo / $tag"
    Write-Host "Asset file: $zipPath"
}
finally {
    Pop-Location
    if (Test-Path $stageDir) {
        Remove-Item -Recurse -Force $stageDir
    }
}
