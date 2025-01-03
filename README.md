# automatic-os-setup
These are all my imperative configuration scripts for machines that I use that do not support Nix (see dotfiles-nix repository) and/or need extra system packages on top of Nix package management. This repository is intended to setup and configure everything else needed locally based off the OS.

## Supported OS
- Windows 10/11 (See separate [Windows installation instructions](#run-the-install-windows))
- Arch Linux
- Fedora
- Ubuntu (WSL2 and full OS)

Any other OS may have bits of code that may support it, but is not intended to be fully maintained and can diappear at any time.

## Requirements
- git >= 2.35 (Arch/Ubuntu/Fedora) - To pull this repo before running it. Usually 
- Python >= 3.11 (Arch/Ubuntu/Fedora) - To run Ansible which will do all of the setup.

## Installation
Ubuntu will need some bootstrapping commands run to `install.sh`.

### Ubuntu Bootstrapping
Install pre-requisites:
```sh
sudo apt install git -y
sudo apt install python -y
```


### Run the Install (Arch/Ubuntu/Fedora)
First, check out the automatic-os-setup repo in your $HOME directory using git.

1. Download
```sh
cd ~
git clone https://github.com/nightconcept/automatic-os-setup.git
cd ~/automatic-os-setup/install
```
2. Install Applications
```sh
chmod +x ./install.sh
./install.sh
```

### Run the Install (Windows)
Copy and paste the code below into your PowerShell terminal to get your Windows installed.

```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://raw.githubusercontent.com/nightconcept/automatic-os-setup/main/install/install-windows.ps1"
$file = "${HOME}\install-windows.ps1"
(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
$file
```

### Rebuild (Arch/Ubuntu/Fedora)
To save some time with some requirements checking, just run this script to re-run the Ansible playbook. This functions similar to `nixos-rebuild switch` where your system is rebuilt to the configuration.

```sh
cd ~/automatic-os-setup/install
chmod +x ./rebuild.sh
./rebuild.sh
```

## References
- [AlexNabokikh/windows-playbook](https://github.com/AlexNabokikh/windows-playbook) - For configuration on Windows.
- [phelipetls/dotfiles](https://github.com/phelipetls/dotfiles) - For multi-configuration setups and great documentation at [his blog](https://phelipetls.github.io/posts/introduction-to-ansible/).
- [pigmonkey/spark](https://github.com/pigmonkey/spark) - For references on some package installs for ArchLinux
- [ChrisTitusTech/winutil: Chris Titus Tech's Windows Utility - Install Programs, Tweaks, Fixes, and Updates](https://github.com/ChrisTitusTech/winutil) - For additional tools to debloat and configure Windows 11. This tool is called in the setup-windows.ps1 script.
- [craftzdog/dotfiles-public](https://github.com/craftzdog/dotfiles-public) - For nvim and tmux configuration.
- [atomantic/dotfiles](https://github.com/atomantic/dotfiles) - For install scripts.
- [xero/dotfiles](https://github.com/xero/dotfiles) - For just a lot of dotfile information in general.
- [phelipetls/dotfiles: My configuration files for Linux, macOS and WSL](https://github.com/phelipetls/dotfiles)
	- [Ansible for dotfiles: the introduction I wish I've had - Phelipe Teles](https://phelipetls.github.io/posts/introduction-to-ansible/#installing-ansible)
- [linuxmobile/kaku](https://github.com/linuxmobile/kaku)
- [dustinlyons/nixos-config](https://github.com/dustinlyons/nixos-config)