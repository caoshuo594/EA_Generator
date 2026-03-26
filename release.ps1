param(
    [Parameter(Mandatory = $true)]
    [string]$Version,
    [string]$Repo = "caoshuo594/EA_Generator",
    [string]$Title = "",
    [string]$Notes = ""
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw "GitHub CLI (gh) 未安装，请先安装后重试。"
}

$tag = if ($Version.StartsWith("v")) { $Version } else { "v$Version" }
$releaseTitle = if ([string]::IsNullOrWhiteSpace($Title)) { "EA_Generator $tag" } else { $Title }
$releaseNotes = if ([string]::IsNullOrWhiteSpace($Notes)) { "Release $tag" } else { $Notes }

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$zipName = "EA_Generator_Client_${tag}_windows_x64.zip"
$zipPath = Join-Path $root $zipName

if (Test-Path $zipPath) {
    Remove-Item -Force $zipPath
}

Push-Location $root
try {
    & tar -a -c -f $zipName _internal config EA_Generator_Client.exe 启动客户端.bat README.md README.txt
    if ($LASTEXITCODE -ne 0) {
        throw "打包失败：tar 返回非 0。"
    }

    & gh release view $tag --repo $Repo *> $null
    if ($LASTEXITCODE -eq 0) {
        & gh release upload $tag $zipPath --repo $Repo --clobber
        if ($LASTEXITCODE -ne 0) {
            throw "上传 Release 资产失败。"
        }
    } else {
        & gh release create $tag $zipPath --repo $Repo --title $releaseTitle --notes $releaseNotes
        if ($LASTEXITCODE -ne 0) {
            throw "创建 Release 失败。"
        }
    }

    Write-Host "发布完成：$Repo / $tag"
    Write-Host "资产文件：$zipPath"
}
finally {
    Pop-Location
}
