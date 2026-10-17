<#
    install.ps1 - pasang Starterpack Code ke device ini.

    Menyalin 51 skill ke  ~/.agents/skills/  dan rule bootstrap ke  ~/.agents/AGENTS.md
    sehingga berlaku GLOBAL di semua project untuk: Cline, Claude Code, Codex, Cursor,
    Gemini CLI, GitHub Copilot, OpenCode, Antigravity.

    Pakai:
        powershell -ExecutionPolicy Bypass -File .\install.ps1
        powershell -ExecutionPolicy Bypass -File .\install.ps1 -Force   # timpa yang sudah ada
#>
[CmdletBinding()]
param(
    [switch]$Force
)

$ErrorActionPreference = 'Stop'

$repoRoot  = Split-Path -Parent $MyInvocation.MyCommand.Path
$srcSkills = Join-Path $repoRoot '.agents\skills'
$srcRule   = Join-Path $repoRoot 'AGENTS.md'
$dstRoot   = Join-Path $HOME '.agents'
$dstSkills = Join-Path $dstRoot 'skills'
$dstRule   = Join-Path $dstRoot 'AGENTS.md'

if (-not (Test-Path $srcSkills)) { throw "Tidak menemukan $srcSkills - jalankan skrip ini dari dalam repo." }

New-Item -ItemType Directory -Force -Path $dstSkills | Out-Null

$installed = 0
$skipped   = 0

foreach ($skill in Get-ChildItem -Directory $srcSkills) {
    $target = Join-Path $dstSkills $skill.Name
    if ((Test-Path $target) -and -not $Force) {
        $skipped++
        continue
    }
    if (Test-Path $target) { Remove-Item -Recurse -Force $target }
    Copy-Item -Recurse -Force $skill.FullName $target
    $installed++
}

if (Test-Path $srcRule) {
    if ((Test-Path $dstRule) -and -not $Force) {
        Copy-Item -Force $srcRule "$dstRule.new"
        Write-Host "AGENTS.md sudah ada -> versi baru ditulis ke $dstRule.new (bandingkan lalu ganti manual)" -ForegroundColor Yellow
    }
    else {
        Copy-Item -Force $srcRule $dstRule
        Write-Host "Rule bootstrap dipasang: $dstRule"
    }
}

Write-Host ""
Write-Host "Selesai. Skill dipasang: $installed, dilewati (sudah ada): $skipped" -ForegroundColor Green
Write-Host "Lokasi: $dstSkills"
Write-Host ""
Write-Host "PENTING: mulai task/sesi BARU di agent supaya rule AGENTS.md terbaca." -ForegroundColor Yellow
Write-Host "Cek hasilnya dengan:  npx --yes skills@latest list -g"
