# myconfig
个人常用配置

整理收集个人的常用工具配置


## PowerShell

- [PowerShell](./Documents/PowerShell/Microsoft.PowerShell_profile.ps1)

**注意**：此配置适用于 PowerShell 7.0+，可在Microsoft Store中搜索`PowerShell`安装

## vim
 - [vim](./.vimrc)
 - [vim (Windows)](./_vimrc)

### vim-plug

- 官方网站：[https://junegunn.github.io/vim-plug/](https://junegunn.github.io/vim-plug/)  
- GitHub地址：[https://github.com/junegunn/vim-plug](https://github.com/junegunn/vim-plug)

<details>
<summary>点击查看安装方式</summary>

Unix
```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Windows(PowerShell)
```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```
</details>

## zsh
 - [zsh](./.zshrc)

## oh-my-posh

- 官方网站：[https://ohmyposh.dev/](https://ohmyposh.dev/)
- Github地址：[https://github.com/JanDeDobbeleer/oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh)

**安装方式**

- 方法一：在Microsoft Store中搜索`oh-my-posh`安装
- 方法二：手动安装，参考[https://ohmyposh.dev/docs/installation/windows](https://ohmyposh.dev/docs/installation/windows)

**配置方式**

在Powershell中配置方式参考[PowserShell](#powershell)配置

## Python

### pip
 - [pip](./.pip/pip.conf)

### virtualenvwrapper-powershell

- virtualenvwrapper官方网站：[https://virtualenvwrapper.readthedocs.io/en/latest/](https://virtualenvwrapper.readthedocs.io/en/latest/)
- VirtualEnvWrapper-PowerShell GitHub地址：[https://github.com/regisf/virtualenvwrapper-powershell](https://github.com/regisf/virtualenvwrapper-powershell)

**安装方式**

1. 克隆仓库
```sh
git clone https://github.com/regisf/virtualenvwrapper-powershell.git
```

2. 执行脚本安装
```powershell
./Install.ps1
```

3. 配置环境变量
   
   设置环境变量`WORKON_HOME`为指定的虚拟环境目录