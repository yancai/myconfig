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


# 配置uv
(& uv generate-shell-completion powershell) | Out-String | Invoke-Expression
(& uvx --generate-shell-completion powershell) | Out-String | Invoke-Expression

# 以下配置配置系统环境变量
# uv配置
# $env:UV_CACHE_DIR = "D:\AppData\uv\cache"

# pipx配置
# $env:PIPX_HOME = "D:\opt\pipx"
# $env:PIPX_BIN_DIR = "D:\opt\pipx-bin"
# $env:PIPX_USE_UV = "1"

# tldr设置
# $env:TLDR_LANGUAGE = "zh"

# virtualenvwrapper配置
# $env:WORKON_HOME = "D:\AppData\venvs"
