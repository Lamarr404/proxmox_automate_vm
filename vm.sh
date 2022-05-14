#!/bin/bash

func_qm_win10(){

	qm create "$y" --name "$namedef" --sockets 2 --memory 4096 -cdrom local:iso/Win10_21H2_French_x64.iso --scsi0 local:"$y"/vm-"$y"-disk-0.qcow2,size=35 --net0 model=virtio,bridge=vmbr0 --onboot 1 --startup 'order=1,up=5,down=5' --acpi yes --ostype l26 --storage local-lvm
	qm set "$y" -scsi0 local:35,format=qcow2

}

func_qm_winserv16(){

	qm create "$y" --name "$namedef" --sockets 2 --memory 4096 -cdrom local:iso/14393.0.161119-1705.RS1_REFRESH_SERVER_EVAL_X64FRE_FR-FR.ISO  --scsi0 local:"$y"/vm-"$y"-disk-0.qcow2,size=50 --net0 model=virtio,bridge=vmbr0 --onboot 1 --startup 'order=1,up=5,down=5' --acpi yes --ostype l26 --storage local
	qm set "$y" -scsi0 local:50,format=qcow2

}

func_qm_winserv19(){ 

        qm create "$y" --name "$namedef" --sockets 2 --memory 4096 -cdrom local:iso/2k19.iso --scsi0 local:"$y"/vm-"$y"-disk-0.qcow2,size=50 --net0 model=virtio,bridge=vmbr0 --onboot 1 --startup 'order=1,up=5,down=5' --acpi yes --ostype l26 --storage local
	qm set "$y" -scsi0 local:30,format=qcow2
}

func_debian(){

	qm create "$y" --name "$namedef" --sockets 2 --memory 2048 -cdrom local:iso/debian-11.2.0-amd64-netinst.iso --scsi0 local:"$y"/vm-"$y"-disk-0.qcow2,size=30 --net0 model=virtio,bridge=vmbr0 --onboot 1 --startup 'order=1,up=5,down=5' --acpi yes --ostype l26 --storage local
	qm set "$y" -scsi0 local:30,format=qcow2

}

echo "1: Windows 10"
echo "2: Windows Server 2K16"
echo "3: Debian"
echo "4: Windows Server 2K19"

x=''
read -p "OS: " choose

if [[ $choose == 1 ]]; then

	read -p "Entrez le nombre de vm: " i 
	read -p "Entrez Id de la premiere VM: " y
	read -p "Nom des VM: " name

	while true; do

        	if [[ $i -gt 0 ]]; then
                	sleep 1
                	((i--))
                	((y++))
			namedef="$name""$y"
			func_qm_win10 
       	fi
	done
elif [[ $choose -eq 2 ]]; then

	read -p "Entrez le nombre de vm: " i 
	read -p "Entrez Id de la premiere VM: " y
        read -p "Nom des VM: " name

	while true; do

		if [[ $i -gt 0 ]]; then
			sleep 1
			((i--))
			((y++))
			namedef="$name""$y"
			func_qm_winserv16
		fi
	done
elif [[ $choose -eq 3 ]]; then

        read -p "Entrez le nombre de vm: " i 
        read -p "Entrez Id de la premiere VM: " y
        read -p "Nom des VM: " name

        while true; do

                if [[ $i -gt 0 ]]; then
                        sleep 1
                        ((i--))
                        ((y++))
			namedef="$name""$y"
			func_debian
        	fi
        done
elif [[ $choose -eq 4 ]]; then

        read -p "Entrez le nombre de vm: " i 
        read -p "Entrez Id de la premiere VM: " y
        read -p "Nom des VM: " name

        while true; do

                if [[ $i -gt 0 ]]; then
                        sleep 1
                        ((i--))
                        ((y++))
                        namedef="$name""$y"
			func_qm_winserv19
                fi
        done


fi

