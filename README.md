# Initial Setup & Program Installer script

This is a simple PowerShell script used for installation of various software during initial Windows setup or at a later stage if required.  
The script utilizes mostly WinGet but for some apps Chocolatey package manager is used.

## Menu Screenshot
<p align="center">
  <img src="https://cdn.discordapp.com/attachments/659853809165533186/969615512478818334/unknown.png" alt="Initial Menu Layout"/>
</p>

## Inspiration
This script was inspired by ![ChrisTitusTech's win10script](https://github.com/ChrisTitusTech/win10script), however it only incorporates software installation! No update policies or privacy settings are being changed or can be changed with it. The script's UI is also completely Terminal based.  
The basic menu structure was loosely based on Jon Dechiro's suggestion (over at Stackoverflow).

## Current Applications available

| Browsers | VoiP Software | Video Encoding | Essentials | Gaming Launchers 
| :--- | :--- | :--- | :--- | :--- |
| Mozilla Firefox | Discord | Handbrake | 7-Zip | Steam
| Google Chrome | TeamSpeak 3 | K-Lite Codec | Acrobat Reader DC | Battle.Net*
| | | OBS Studio | Libre Office Suite | Origin*
| | | `FFmpeg` | Oracle JDK 17 | Ubisoft connect
| | | | Logitech Gaming Software | PS Remote Play
| | | | Obsidian (Notes)
| | | | ShareX
| | | | qBittorrent
| | | | PowerToys

## Applications available cont'd.

| Light Gaming | Remote Access | Monitoring Software | Programming Essentials
| :--- | :--- | :--- | :--- |
| Minecraft | NordVPN | Argus Monitor* | SQLite
| DOSBox 0.74-3 | OpenVPN Connect | CPU-Z | MS Visual Studio 2019 Enterprise
| RetroArch* | Tabby Terminal | `FurMark` | Geany
| | TeamViewer | HWiNFO64 | Github Desktop
| | TortoiseSVN | `MSI Afterburner`
| | WinSCP | WinDirStat

### Note
- '\*' Behind the name of an application points to the fact that the installer file is downloaded from the publisher's official repository and not through MS Store. Those installers will automatically be downloaded inside ```~\Downloads\``` after which the installation process will start. The user is able to select installation destination of the application.
- `App` Application written in this style means that Chocolatey package manager is being utilized. User will be prompted for confirmation inside the terminal. Install location used is default.

Those adjustments were needed as not all used by me applications were available from the official MS Store and WinGet repos.

## How To Run

### Paste this command into Powershell (admin):

```ps
iex ((New-Object System.Net.WebClient).DownloadString('https://bit.ly/InstallerScriptMain'))
```

### Or use shorter command into Powershell (admin):

```ps
iwr -useb https://bit.ly/InstallerScriptMain | iex
```

### Or Manually:

Download the '.ps1' file from ![here.](https://github.com/KaiserDMC/InitialSetupProgramInstaller/releases/) Navigate to PowerShell application on your computer. **Dont forget to *Right-click* run as 'Administrator'.** Navigate to the downloaded file's folder, most likely ```~\Downloads\```.  
Run the following command:

```ps
.\InitialSetupProgramInstaller.ps1
```

#### Note
If you have NEVER run scripts before, you might need to enable that option by running the following command inside PowerShell:
```ps
set-executionpolicy remotesigned
```
PowerShell must once again be *Run as... 'Administrator'*

## Tested
This script was tested and ran without any issues on a brand new instance of Windows 10 Pro, build 21H2.

## Troubleshooting & Contributions
If you have any issues or encounter any bugs, [report them here.](https://github.com/KaiserDMC/InitialSetupProgramInstaller/issues) If you would like to add more apps to the script or think you can fix some issues, please feel free to create a pull request.

