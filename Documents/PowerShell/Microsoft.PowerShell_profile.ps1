# 设置oh-my-posh
$env:POSH_THEMES_PATH = "$HOME\.oh-my-posh-themes"

# Oh My Posh 主题
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\ys.omp.json" | Invoke-Expression


# 设置oh-my-posh主题函数
function Set-PoshTheme {
    param([string]$ThemeName)
    $themePath = "$env:POSH_THEMES_PATH\$ThemeName.omp.json"
    if (Test-Path $themePath) {
        oh-my-posh init pwsh --config $themePath | Invoke-Expression
        Write-Host "✅ 已切换到主题: $ThemeName" -ForegroundColor Green
    } else {
        Write-Host "❌ 主题 $ThemeName 不存在" -ForegroundColor Red
    }
}


# 设置VirtualEnvWrapper
$MyDocuments = [Environment]::GetFolderPath("mydocuments")
Import-Module $MyDocuments\PowerShell\Modules\VirtualEnvWrapper.psm1

# Import-Module PSReadLine
