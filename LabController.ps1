Read-Host -Prompt "This script has been disabled and will exit"
exit 

$vmcount = 4
$numsamples = 1699

$GatewayVM = "LabGateway"
$FileShareVM = "LabFiles"
$ClientBaseVM = "LabClientBase"
$ClientBaseSnapshot = "cleanstate"

$VBoxLdrDir = "C:\VBoxLdr"
$PcapDir = "C:\LabPcaps"

$VBoxManage = "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"

##################################################

function Clean-Lab {
    # Kill and delete old VMs
    for($i = 0; $i -lt $vmcount; $i++){
        .$VBoxManage controlvm "LabClient$i" poweroff
        Start-Sleep -s 10
        .$VBoxManage unregistervm "LabClient$i" --delete
    }
}

function Await-Round {
    # Stick to the 15 minute analysis limit
    while(((Get-Date) - $countdown).TotalSeconds -lt 900) {
        Write-Host -NoNewline "`rRunning samples: $(900 - ((Get-Date) - $countdown).TotalSeconds) seconds          "
        Start-Sleep -Milliseconds 250
    }
    Write-Host ""

    Clean-Lab
}

##################################################

# Clean the lab, just to be sure
Clean-Lab

# Start infrastructure servers
.$VBoxManage startvm $GatewayVM --type headless
.$VBoxManage startvm $FileShareVM
$countdown = Get-Date
while(((Get-Date) - $countdown).TotalSeconds -lt 120) {
    Write-Host -NoNewline "`rInitializing gateway: $(120 - ((Get-Date) - $countdown).TotalSeconds) seconds          "
    Start-Sleep -Milliseconds 250
}
Write-Host ""

try {
    # Continuously run VMs
    while($numsamples -gt 0){
        # Clone and start fresh VMs
        $countdown = Get-Date
        for($i = 0; $i -lt $vmcount -and $numsamples -gt 0; $i++){
            # Create and start a clean VM
            .$VBoxManage clonevm $ClientBaseVM --snapshot $ClientBaseSnapshot --options link --name "LabClient$i" --register
            .$VBoxManage modifyvm "LabClient$i" --nictrace1 on --nictracefile1 "$PcapDir\Sample-$numsamples.pcap"
            .$VBoxManage startvm "LabClient$i" --type headless
            $numsamples--
            Start-Sleep -Seconds 10
        }

        Await-Round
    }
} finally {
    # Gracefully halt the lab after Ctrl+C
    Write-Host "`n`nHALTING AFTER ROUND...`n"
    Await-Round
    .$VBoxManage controlvm $FileShareVM acpipowerbutton
    .$VBoxManage controlvm $GatewayVM acpipowerbutton
}