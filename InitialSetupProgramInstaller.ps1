# Initial promp to ensure user wants to continue as Administrator
Write-Host -ForegroundColor Yellow "This script is used to install various applications through the power of WinGet."
Write-Host -ForegroundColor Yellow "In order to do that Administrative privilege must be granted!"
$wishToContinue = Read-host "If you wish to continue at your own risk? `n [Y/y] Yes  [N/n] No  (default is 'Y')"

if(($wishToContinue -eq 'y') -or ($wishToContinue -eq 'Y') -or ($wishToContinue -eq '')){


If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
	Exit
}

# Confirm user has WinGet installed
Write-Host "Checking winget installation..."

if (Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe){
    'Winget Already Installed'
}  
else{
    # Installing winget from the Microsoft Store
	Write-Host "Winget not found, installing it now..."
	Start-Process "ms-appinstaller:?source=https://aka.ms/getwinget"
	$nid = (Get-Process AppInstaller).Id
	Wait-Process -Id $nid
	Write-Host Winget Installed
}

# Confirm user has Chocolatey installed
Write-Host "Checking chocolatey installation..."

if (Test-Path C:\ProgramData\chocolatey\choco.exe){
    'Chocolatey Already Installed'
}  
else{
    # Installing Chocolatey from the official source
	Write-Host "Chocolatey not found, installing it now..."
	Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
	#$nid = (Get-Process AppInstaller).Id
	#Wait-Process -Id $nid
	Write-Host Chocolatey Installed
}

$downloads =  $env:USERPROFILE + "\Downloads"

# Main category menu
function mainMenuCategory {
$mainMenu = 'X'
    while($mainMenu -ne ''){
        Clear-Host
        Write-Host "`n`t`t Main Program Category Menu`n"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -NoNewline "]"; `
            Write-Host " Browsers"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -NoNewline "]"; `
            Write-Host " VoIP Software"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "3"; Write-Host -NoNewline "]"; `
            Write-Host " Video Encoding"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "4"; Write-Host -NoNewline "]"; `
            Write-Host " Essentials"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "5"; Write-Host -NoNewline "]"; `
            Write-Host " Gaming Launchers"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "6"; Write-Host -NoNewline "]"; `
            Write-Host " Light Gaming"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "7"; Write-Host -NoNewline "]"; `
            Write-Host " Remote Access"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "8"; Write-Host -NoNewline "]"; `
            Write-Host " Monitoring Software"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "9"; Write-Host -NoNewline "]"; `
            Write-Host " Programming Essentials"
        $mainMenu = Read-Host "`nPlease select a sub-menu option (leave blank to exit)"

        # Launch submenu1
        if($mainMenu -eq 1){
            subMenu1
        }
        # Launch submenu2
        if($mainMenu -eq 2){
            subMenu2
        }
        # Launch submenu3
        if($mainMenu -eq 3){
            subMenu3
        }
        # Launch submenu4
        if($mainMenu -eq 4){
            subMenu4
        }
        # Launch submenu5
        if($mainMenu -eq 5){
            subMenu5
        }
        # Launch submenu6
        if($mainMenu -eq 6){
            subMenu6
        }
        # Launch submenu7
        if($mainMenu -eq 7){
            subMenu7
        }
        # Launch submenu8
        if($mainMenu -eq 8){
            subMenu8
        }
        # Launch submenu9
        if($mainMenu -eq 9){
            subMenu9
        }
    }
}


function subMenu1 {
 $subMenu1 = 'X'
    while($subMenu1 -ne ''){
        Clear-Host
        Write-Host "`n`t`t Browsers`n"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -NoNewline "]"; `
            Write-Host " Mozilla Firefox"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -NoNewline "]"; `
            Write-Host " Google Chrome"
        $subMenu1 = Read-Host "`nPlease select the desired application (leave blank to go back to main menu)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M

        # Option 1
        if($subMenu1 -eq 1){
            Write-Host 'Installing Mozilla Firefox'
            winget install -e Mozilla.Firefox | Out-Host
            if($?) { Write-Host "Successfully installed Mozilla Firefox" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if($subMenu1 -eq 2){
            Write-Host 'Installing Google Chrome'
            winget install -e Google.Chrome | Out-Host
            if($?) { Write-Host "Successfully installed Google Chrome" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
    }
}

function subMenu2 {
    $subMenu2 = 'X'
    while($subMenu2 -ne ''){
        Clear-Host
        Write-Host "`n`t`t VoIP Software`n"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -NoNewline "]"; `
            Write-Host " Discord"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -NoNewline "]"; `
            Write-Host " TeamSpeak 3"
        $subMenu2 = Read-Host "`nPlease select the desired application (leave blank to go back to main menu)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M

        # Option 1
        if($subMenu2 -eq 1){
            Write-Host 'Installing Discord'
            winget install -e Discord.Discord | Out-Host
            if($?) { Write-Host "Successfully installed Discord" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if($subMenu2 -eq 2){
            Write-Host 'Installing TeamSpeak 3'
            winget install -e TeamSpeakSystems.TeamSpeakClient | Out-Host
            if($?) { Write-Host "Successfully installed TeamSpeak 3" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
    }
}

function subMenu3 {
    $subMenu3 = 'X'
    while($subMenu3 -ne ''){
        Clear-Host
        Write-Host "`n`t`t Video Encoding`n"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -NoNewline "]"; `
            Write-Host " Handbrake"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -NoNewline "]"; `
            Write-Host " K-Lite Codec Pack"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "3"; Write-Host -NoNewline "]"; `
            Write-Host " OBS Studio"
        $subMenu3 = Read-Host "`nPlease select the desired application (leave blank to go back to main menu)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M

        # Option 1
        if($subMenu3 -eq 1){
            Write-Host 'Installing Handbrake'
            winget install -e HandBrake.HandBrake | Out-Host
            if($?) { Write-Host "Successfully installed Handbrake" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if($subMenu3 -eq 2){
            Write-Host 'Installing K-Lite Codec Pack (Full)'
            winget install -e CodecGuide.K-LiteCodecPack.Full | Out-Host
            if($?) { Write-Host "Successfully installed K-Lite Codec Pack (Full)" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 3
        if($subMenu3 -eq 3){
            Write-Host 'Installing OBS Studio'
            winget install -e OBSProject.OBSStudio | Out-Host
            if($?) { Write-Host "Successfully installed OBS Studio" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
    }
}

function subMenu4 {
    $subMenu4 = 'X'
    while($subMenu4 -ne ''){
        Clear-Host
        Write-Host "`n`t`t Essentials`n"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -NoNewline "]"; `
            Write-Host " 7-Zip"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -NoNewline "]"; `
            Write-Host " Acrobat Reader DC"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "3"; Write-Host -NoNewline "]"; `
            Write-Host " Libre Office Suite"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "4"; Write-Host -NoNewline "]"; `
            Write-Host " Oracle JDK 17"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "5"; Write-Host -NoNewline "]"; `
            Write-Host " Logitech Gaming Software"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "6"; Write-Host -NoNewline "]"; `
            Write-Host " Obsidian (Notes)"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "7"; Write-Host -NoNewline "]"; `
            Write-Host " ShareX"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "8"; Write-Host -NoNewline "]"; `
            Write-Host " qBittorrent"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "9"; Write-Host -NoNewline "]"; `
            Write-Host " PowerToys"
        $subMenu4 = Read-Host "`nPlease select the desired application (leave blank to go back to main menu)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M

        # Option 1
        if($subMenu4 -eq 1){
            Write-Host 'Installing 7-Zip'
            winget install -e 7zip.7zip | Out-Host
            if($?) { Write-Host "Successfully installed 7-Zip" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if($subMenu4 -eq 2){
            Write-Host 'Installing Acrobat Reader DC'
            winget install -e Adobe.Acrobat.Reader.32-bit | Out-Host
            if($?) { Write-Host "Successfully installed Acrobat Reader DC" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 3
        if($subMenu4 -eq 3){
            Write-Host 'Installing Libre Office Suite'
            winget install -e TheDocumentFoundation.LibreOffice | Out-Host
            if($?) { Write-Host "Successfully installed Libre Office Suite" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 4
        if($subMenu4 -eq 4){
            Write-Host 'Installing Oracle JDK 17'
            winget install -e Oracle.JDK.17 | Out-Host
            if($?) { Write-Host "Successfully installed Oracle JDK 17" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 5
        if($subMenu4 -eq 5){
            Write-Host 'Installing Logitech Gaming Software'
            winget install -e Logitech.LGS | Out-Host
            if($?) { Write-Host "Successfully installed Logitech Gaming Software" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 6
        if($subMenu4 -eq 6){
            Write-Host 'Installing Obsidian (Notes)'
            winget install -e Obsidian.Obsidian | Out-Host
            if($?) { Write-Host "Successfully installed Obsidian (Notes)" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 7
        if($subMenu4 -eq 7){
            Write-Host 'Installing ShareX'
            winget install -e ShareX.ShareX | Out-Host
            if($?) { Write-Host "Successfully installed ShareX" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }

        # Option 8
        if($subMenu4 -eq 8){
            Write-Host 'Installing qBittorrent'
            winget install -e qBittorrent.qBittorrent | Out-Host
            if($?) { Write-Host "Successfully installed qBittorrent" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 9
        if($subMenu4 -eq 9){
            Write-Host 'Installing PowerToys'
            winget install -e Microsoft.PowerToys | Out-Host
            if($?) { Write-Host "Successfully installed PowerToys" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
    }
}

function subMenu5 {
    $subMenu5 = 'X'
    while($subMenu5 -ne ''){
        Clear-Host
        Write-Host "`n`t`t Gaming Launchers`n"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -NoNewline "]"; `
            Write-Host " Steam"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -NoNewline "]"; `
            Write-Host " Battle.net (Installation locale by user)"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "3"; Write-Host -NoNewline "]"; `
            Write-Host " Origin (Installation locale by user)"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "4"; Write-Host -NoNewline "]"; `
            Write-Host " Ubisoft Connect"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "5"; Write-Host -NoNewline "]"; `
            Write-Host " PS Remote Play"
        $subMenu5 = Read-Host "`nPlease select the desired application (leave blank to go back to main menu)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M

        # Option 1
        if($subMenu5 -eq 1){
            Write-Host 'Installing Steam'
            winget install -e Valve.Steam | Out-Host
            if($?) { Write-Host "Successfully installed Steam" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if($subMenu5 -eq 2){
            Write-Host 'Installing Battle.Net'
            $progresspreference = 'silentlyContinue'
            $urlBattleNet = "https://www.battle.net/download/getInstallerForGame?os=win&gameProgram=BATTLENET_APP&version=Live"
            $destBattleNet = $downloads + "\BattleNet.exe"
            Invoke-WebRequest -Uri $urlBattleNet -OutFile $destBattleNet
            $progressPreference = 'Continue'
            Start-Process -FilePath $destBattleNet -ArgumentList '\silent', '\install'
            if($?) { Write-Host "Installer for Battle.Net initiated..." }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 3
        if($subMenu5 -eq 3){
            Write-Host 'Installing Origin'
            $progresspreference = 'silentlyContinue'
            $urlOrigin = "https://www.dm.origin.com/download"
            $destOrigin = $downloads + "\Origin.exe"
            Invoke-WebRequest -Uri $urlOrigin -OutFile $destOrigin
            $progressPreference = 'Continue'
            Start-Process -FilePath $destOrigin -ArgumentList '\silent', '\install'
            if($?) { Write-Host "Installer for Origin initiated..." }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 4
        if($subMenu5 -eq 4){
            Write-Host 'Installing Ubisoft Connect'
            winget install -e Ubisoft.Connect | Out-Host
            if($?) { Write-Host "Successfully installed Ubisoft Connect" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 5
        if($subMenu5 -eq 5){
            Write-Host 'Installing PS Remote Play'
            winget install -e PlayStation.PSRemotePlay | Out-Host
            if($?) { Write-Host "Successfully installed PS Remote Play" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
    }
}

function subMenu6 {
    $subMenu6 = 'X'
    while($subMenu6 -ne ''){
        Clear-Host
        Write-Host "`n`t`t Light Gaming`n"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -NoNewline "]"; `
            Write-Host " Minecraft"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -NoNewline "]"; `
            Write-Host " DOSBox 0.74-3"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "3"; Write-Host -NoNewline "]"; `
            Write-Host " RetroArch (Installation locale by user)"
        $subMenu6 = Read-Host "`nPlease select the desired application (leave blank to go back to main menu)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M

        # Option 1
        if($subMenu6 -eq 1){
            Write-Host 'Installing Minecraft'
            winget install -e Mojang.MinecraftLauncher | Out-Host
            if($?) { Write-Host "Successfully installed Minecraft" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if($subMenu6 -eq 2){
            Write-Host 'Installing DOSBox 0.74-3'
            winget install -e DOSBox.DOSBox | Out-Host
            if($?) { Write-Host "Successfully installed DOSBox 0.74-3" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        #Option 3
        if($subMenu6 -eq 3){
            Write-Host 'Installing RetroArch (Stable)'
            $progresspreference = 'silentlyContinue'
            $urlRetroArch = "https://buildbot.libretro.com/stable/1.10.3/windows/x86_64/RetroArch-Win64-setup.exe"
            $destRetroArch = $downloads + "\RetroArch.exe"
            Invoke-WebRequest -Uri $urlRetroArch -OutFile $destRetroArch
            $progressPreference = 'Continue'
            Start-Process -FilePath $destRetroArch -ArgumentList '\silent', '\install'
            if($?) { Write-Host "Installer for RetroArch (Stable) initiated..." }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
    }
}

function subMenu7 {
    $subMenu7 = 'X'
    while($subMenu7 -ne ''){
        Clear-Host
        Write-Host "`n`t`t Remote Access`n"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -NoNewline "]"; `
            Write-Host " NordVPN"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -NoNewline "]"; `
            Write-Host " OpenVNP Connect"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "3"; Write-Host -NoNewline "]"; `
            Write-Host " Tabby Terminal"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "4"; Write-Host -NoNewline "]"; `
            Write-Host " TeamViewer"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "5"; Write-Host -NoNewline "]"; `
            Write-Host " TortoiseSVN"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "6"; Write-Host -NoNewline "]"; `
            Write-Host " WinSCP"
        $subMenu7 = Read-Host "`nPlease select the desired application (leave blank to go back to main menu)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M

        # Option 1
        if($subMenu7 -eq 1){
            Write-Host 'Installing NordVPN'
            winget install -e NordVPN.NordVPN | Out-Host
            if($?) { Write-Host "Successfully installed NordVPN" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if($subMenu7 -eq 2){
            Write-Host 'Installing OpenVPN Connect'
            winget install -e OpenVPNTechnologies.OpenVPNConnect | Out-Host
            if($?) { Write-Host "Successfully installed OpenVPN Connect" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 3
        if($subMenu7 -eq 3){
            Write-Host 'Installing Tabby Terminal'
            winget install -e Eugeny.Tabby | Out-Host
            if($?) { Write-Host "Successfully installed Tabby Terminal" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 4
        if($subMenu7 -eq 4){
            Write-Host 'Installing TeamViewer'
            winget install -e TeamViewer.TeamViewer | Out-Host
            if($?) { Write-Host "Successfully installed TeamViewer" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 5
        if($subMenu7 -eq 5){
            Write-Host 'Installing TortoiseSVN'
            winget install -e TortoiseSVN.TortoiseSVN | Out-Host
            if($?) { Write-Host "Successfully installed TortoiseSVN" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 6
        if($subMenu7 -eq 6){
            Write-Host 'Installing WinSCP'
            winget install -e WinSCP.WinSCP | Out-Host
            if($?) { Write-Host "Successfully installed WinSCP" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
    }
}

function subMenu8 {
    $subMenu8 = 'X'
    while($subMenu8 -ne ''){
        Clear-Host
        Write-Host "`n`t`t Monitoring Software`n"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -NoNewline "]"; `
            Write-Host " Argus Monitor (Installation locale by user)"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -NoNewline "]"; `
            Write-Host " CPU-Z"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "3"; Write-Host -NoNewline "]"; `
            Write-Host " FurMark (Installed using Chocolatey)"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "4"; Write-Host -NoNewline "]"; `
            Write-Host " HWiNFO64"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "5"; Write-Host -NoNewline "]"; `
            Write-Host " MSI Afterburner (Installed using Chocolatey)"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "6"; Write-Host -NoNewline "]"; `
            Write-Host " WinDirStat"
        $subMenu8 = Read-Host "`nPlease select the desired application (leave blank to go back to main menu)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M

        # Option 1
        if($subMenu8 -eq 1){
            Write-Host 'Installing Argus Monitor'
            $progresspreference = 'silentlyContinue'
            $urlArgus = "https://www.argusmonitor.com/downloads/ArgusMonitor_Setup.exe"
            $destArgus = $downloads + "\ArgusMonitor.exe"
            Invoke-WebRequest -Uri $urlArgus -OutFile $destArgus
            $progressPreference = 'Continue'
            Start-Process -FilePath $destArgus -ArgumentList '\silent', '\install'
            if($?) { Write-Host "Installer for Argus Monitor initiated..." }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if($subMenu8 -eq 2){
            Write-Host 'Installing CPU-Z'
            winget install -e CPUID.CPU-Z | Out-Host
            if($?) { Write-Host "Successfully installed CPU-Z" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 3
        if($subMenu8 -eq 3){
            Write-Host 'Installing FurMark'
            $progresspreference = 'silentlyContinue'
            choco install furmark
            $progressPreference = 'Continue'
            if($?) { Write-Host "Successfully installed FurMark" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 4
        if($subMenu8 -eq 4){
            Write-Host 'Installing HWiNFO64'
            winget install -e REALiX.HWiNFO | Out-Host
            if($?) { Write-Host "Successfully installed HWiNFO64" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 5
        if($subMenu8 -eq 5){
            Write-Host 'Installing MSI Afterburner'
            $progresspreference = 'silentlyContinue'
            choco install msiafterburner
            $progressPreference = 'Continue'
            if($?) { Write-Host "Successfully installed MSI Afterburner" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        
        # Option 6
        if($subMenu8 -eq 6){
            Write-Host 'Installing WinDirStat'
            winget install -e WinDirStat.WinDirStat | Out-Host
            if($?) { Write-Host "Successfully installed WinDirStat" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
    }
}

function subMenu9 {
    $subMenu9 = 'X'
    while($subMenu9 -ne ''){
        Clear-Host
        Write-Host "`n`t`t Programming Essentials`n"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -NoNewline "]"; `
            Write-Host " SQLite"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -NoNewline "]"; `
            Write-Host " MS VisualStudio 2019 Enterprise"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "3"; Write-Host -NoNewline "]"; `
            Write-Host " Geany"
        Write-Host -NoNewline "`n["; Write-Host -NoNewline "4"; Write-Host -NoNewline "]"; `
            Write-Host " GitHub Desktop"
        $subMenu9 = Read-Host "`nPlease select the desired application (leave blank to go back to main menu)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M

        # Option 1
        if($subMenu9 -eq 1){
            Write-Host 'Installing SQLite'
            winget install -e DBBrowserForSQLite.DBBrowserForSQLite | Out-Host
            if($?) { Write-Host "Successfully installed SQLite" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if($subMenu9 -eq 2){
            Write-Host 'Installing MS VisualStudio 2019 Enterprise'
            winget install -e Microsoft.VisualStudio.2019.Enterprise | Out-Host
            if($?) { Write-Host "Successfully installed MS VisualStudio 2019 Enterprise" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 3
        if($subMenu9 -eq 3){
            Write-Host 'Installing Geany'
            winget install -e Geany.Geany | Out-Host
            if($?) { Write-Host "Successfully installed Geany" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 4
        if($subMenu9 -eq 4){
            Write-Host 'Installing GitHub Desktop'
            winget install -e GitHub.GitHubDesktop | Out-Host
            if($?) { Write-Host "Successfully installed GitHub Desktop" }
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
    }
}

mainMenuCategory

}
