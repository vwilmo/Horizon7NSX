#Script
    param (
        ##Creating Horizon 7 Groupings
        
        #Security Groups
        $SGHZN7ConnServerName = "SG-Horizon7-ConnServer",
        $SGHZN7VDIName = "SG-Horizon7-VDI",
        $SGHZN7RDSHostName = "SG-Horizon7-RDSHost",
        $SGHZN7DomainCtrlName = "SG-Horizon7-DomainCtrl",
        $SGHZN7DNSName = "SG-Horizon7-DNS",
        $SGHZN7UEM_FSName = "SG-Horizon7-UEM_FS",
        $SGHZN7AppVolMgrName = "SG-Horizon7-AppVolMgr",
        $SGHZN7BlockAllName = "SG-Horizon7-BLOCK",
        $SGHZN7V4HName = "SG-Horizon7-V4H",
        
        #Security Tags
        $STHZN7ConnServerName = "ST-Horizon7-ConnServer",
        $STHZN7VDIName = "ST-Horizon7-VDI",
        $STHZN7RDSHostName = "ST-Horizon7-RDSHost",
        $STHZN7DomainCtrlName = "ST-Horizon7-DomainCtrl",
        $STHZN7DNSName = "ST-Horizon7-DNS",
        $STHZN7UEM_FSName = "ST-Horizon7-UEM_FS",
        $STHZN7AppVolMgrName = "ST-Horizon7-AppVolMgr",
        $STHZN7V4HName = "ST-Horizon7-V4H",
                
        #DFW Firewall Section Names
        $SNHZN7BlockAllName = "Horizon 7 Connectivity - Block All",
        $SNHZN7ConnInternalSectionName = "Horizon 7 Connectivity - Internal Connections",
        $SNHZN7DesktopVDI_RDSHSectionName = "Horizon 7 Desktops - VDI or RDS Host",
         
        
        #DFW Rule Names
        $RNHZN7Client2AgentName = "Internal - Horizon Client to Horizon Agent",
        $RNHZN7Browser2AgentHTMLName = "Internal - Browser to Horizon Agent HTML",
        $RNHZN7Agent2ConnServerName = "Desktops - Horizon Agent to View Connection Server JMS",
        $RNHZN7Agent2V4HName = "Desktops - Horizon Agent to V4H",
        $RNAPPVAgent2APPVMGRName = "Desktops - App Volumes Agent to App Volumes Manager",
        $RNUEMMGR2UEMFSSMBName = "Desktops - UEM Flex Engine to UEM File Servers",
        $RNHZN7BlockAllName = "Block All",
        
        #Service Names

        $SVHZN7BEClient2AgentTCPName = "Horizon 7 Blast Extreme TCP Excellent Typical Horizon Client to Horizon Agent",
        $SVHZN7BEClient2AgentUDPName = "Horizon 7 Blast Extreme UDP Typical Horizon Client to Horizon Agent",
        $SVHZN7PCOIPClient2AgentTCPName = "Horizon 7 PCoIP TCP Horizon Client to Horizon Agent",
        $SVHZN7PCOIPClient2AgentUDPName = "Horizon 7 PCoIP UDP Horizon Client to Horizon Agent",
        $SVHZN7RDPClient2AgentName = "Horizon 7 RDP Horizon Client to Horizon Agent",
        $SVHZN7CDRMMRClient2AgentName = "Horizon 7 CDR MMR Horizon Client to Horizon Agent",
        $SVHZN7USBClient2AgentName = "Horizon 7 USB Horizon Client to Horizon Agent USB Redirection",
        $SVHZN7Browser2AgentHTMLName = "Horizon 7 Browser to Horizon Agent HTML Access",
        $SVHZN7Agent2ConnServerEnhancedName = "Horizon 7 JMS Horizon Agent to Connection Server Enhanced",
        $SVHZN7Agent2ConnServerLegacyName = "Horizon 7 JMS Horizon Agent to Connection Server Legacy",
        $SVHZN7Agent2V4HRMIName = "Horizon 7 Horizon Agent to V4H RMI",
        $SVHZN7Agent2V4HDMSName = "Horizon 7 Horizon Agent to V4H Desktop Message Server",
        $SVAPPVAgent2APPVMGRSSLName = "App Volumes Agent to App Volumes Manager SSL",
        $SVAPPVAgent2APPVMGRSTDName = "App Volumes Agent to App Volumes Manager Standard",
        $SVUEMMGR2UEMFSSMBName = "User Environment Manager to UEM File Servers SMB",
        
        #IP Sets for VIPs and other
        $IPHorizon7ConnServerVIPName = "IP-Horizon7-ConnServer-VIP",
        $IPHorizon7ConnServerName = "IP-Horizon7-ConnServer",
        $IPHorizon7UAGVIPName = "IP-Horizon7-UAG-VIP",
        $IPHorizon7AppVolVIPName = "IP-Horizon7-AppVol-VIP",
        $IPHorizon7AppVolName = "IP-Horizon7-AppVol",
        $IPHorizon7VDIRDSHName = "IP-Horizon7-VDI-RDSH",
        $IPHorizon7UEM_FSName = "IP-Horizon7-UEM_FS",
        $IPHorizon7V4HName = "IP-Horizon7-V4H",
        $IPHorizon7DomainCtrlName = "IP-Horizon7-DomainCtrl",
        $IPHorizon7DNSName = "IP-Horizon7-DNS",
        
        #Service Port and Protocol
        
        #Protocol
        $TCP = "tcp",
        $UDP = "udp",
        
        #Port
        $80 = "80",
        $443 = "443",
        $22443 = "22443",
        $4172 = "4172",
        $3389 = "3389",
        $9427 = "9427",
        $32111 = "32111",
        $4002 = "4002",
        $4001 = "4001",
        $3091 = "3091",
        $3099 = "3099",
        $445 = "445"
        )

        ##Build New Horizon 7 DFW Sections
        ##Checks if Section exists first
        Write-host -ForegroundColor Green "Creating DFW Sections"

        $SectionNames = 
        "Horizon 7 Connectivity - Block All",
        "Horizon 7 Connectivity - Internal Connections",
        "Horizon 7 Desktops - VDI or RDS Host"
        
        foreach ($item in $SectionNames) {
        $Section = Get-NsxFirewallSection -Name "$item"
        if (!$Section)
        {
        New-NsxFirewallSection -name $item | out-null
        }}
    
        ##Build New Security Tags
        ##Checks if exists first
        ##$SecurityTagNames = 
        ##"ST-Horizon7-ConnServer",
        ##"ST-Horizon7-VDI",
        ##"ST-Horizon7-RDSHost",
        ##"ST-Horizon7-AppVolMgr",
        ##"ST-Horizon7-UEM_FS",
        ##"ST-Horizon7-DomainCtrl",
        ##"ST-Horizon7-DNS",
        ##"ST-Horizon7-V4H"
        ##foreach ($item in $SecurityTagNames) {
        ##$SecurityTag = Get-NsxSecurityTag -Name "$item"
        ##if (!$SecurityTag)
        ##{
        ##New-NsxSecurityTag -name $item | out-null
        ##}}

        #Build New IP Sets
        Write-host -ForegroundColor Green "Creating IP Sets"

        $IPHorizon7AppVol = New-NsxIpSet -name $IPHorizon7AppVolName -EnableInheritance
        $IPHorizon7AppVolVIP = New-NsxIpSet -name $IPHorizon7AppVolVIPName -EnableInheritance
        $IPHorizon7ConnServer = New-NsxIpSet -name $IPHorizon7ConnServerName -EnableInheritance
        $IPHorizon7ConnServerVIP = New-NsxIpSet -name $IPHorizon7ConnServerVIPName -EnableInheritance
        $IPHorizon7DNS = New-NsxIpSet -name $IPHorizon7DNSName -EnableInheritance
        $IPHorizon7DomainCtrl = New-NsxIpSet -name $IPHorizon7DomainCtrlName -EnableInheritance
        $IPHorizon7UEM_FS = New-NsxIpSet -name $IPHorizon7UEM_FSName -EnableInheritance
        $IPHorizon7V4H = New-NsxIpSet -name $IPHorizon7V4HName -EnableInheritance
        $IPHorizon7VDIRDSH = New-NsxIpSet -name $IPHorizon7VDIRDSHName -EnableInheritance

        #Build New Security Groups
        Write-host -ForegroundColor Green "Creating Security Groups"

        $SGHZN7ConnServer = New-NsxSecurityGroup -name $SGHZN7ConnServerName -IncludeMember (Get-NsxIpSet -Name $IPHorizon7ConnServerVIPName)
        Add-NsxSecurityGroupMember -SecurityGroup (Get-NsxSecurityGroup -Name $SGHZN7ConnServerName) -Member (Get-NsxIpSet -Name $IPHorizon7ConnServerName)
        $SGHZN7VDI = New-NsxSecurityGroup -name $SGHZN7VDIName -IncludeMember (Get-NsxIpSet -Name $IPHorizon7VDIRDSHName)
        $SGHZN7RDSHost = New-NsxSecurityGroup -name $SGHZN7RDSHostName -IncludeMember (Get-NsxIpSet -Name $IPHorizon7VDIRDSHName)
        $SGHZN7AppVolMgr = New-NsxSecurityGroup -name $SGHZN7AppVolMgrName -IncludeMember (Get-NsxIpSet -Name $IPHorizon7AppVolName)
        Add-NsxSecurityGroupMember -SecurityGroup (Get-NsxSecurityGroup -Name $SGHZN7AppVolMgrName) -Member (Get-NsxIpSet -Name $IPHorizon7AppVolVIPName)
        $SGHZN7UEM_FS = New-NsxSecurityGroup -name $SGHZN7UEM_FSName -IncludeMember (Get-NsxIpSet -Name $IPHorizon7UEM_FSName)
        $SGHZN7DomainCtrl = New-NsxSecurityGroup -name $SGHZN7DomainCtrlName -IncludeMember (Get-NsxIpSet -Name $IPHorizon7DomainCtrlName)
        $SGHZN7DNS = New-NsxSecurityGroup -name $SGHZN7DNSName -IncludeMember (Get-NsxIpSet -Name $IPHorizon7DNSName)
        $SGHZN7V4H = New-NsxSecurityGroup -name $SGHZN7V4HName -IncludeMember (Get-NsxIpSet -name $IPHorizon7V4HName)
        $SGHZN7BlockAll = New-NsxSecurityGroup -name $SGHZN7BlockAllName -IncludeMember (Get-NsxSecurityGroup -Name $SGHZN7DNSName)
        Add-NsxSecurityGroupMember -SecurityGroup (Get-NsxSecurityGroup -name $SGHZN7BlockAllName) -Member (Get-NsxSecurityGroup -Name $SGHZN7AppVolMgrName)
        Add-NsxSecurityGroupMember -SecurityGroup (Get-NsxSecurityGroup -name $SGHZN7BlockAllName) -Member (Get-NsxSecurityGroup -Name $SGHZN7ConnServerName)
        Add-NsxSecurityGroupMember -SecurityGroup (Get-NsxSecurityGroup -name $SGHZN7BlockAllName) -Member (Get-NsxSecurityGroup -Name $SGHZN7DomainCtrlName)
        Add-NsxSecurityGroupMember -SecurityGroup (Get-NsxSecurityGroup -name $SGHZN7BlockAllName) -Member (Get-NsxSecurityGroup -Name $SGHZN7RDSHostName)
        Add-NsxSecurityGroupMember -SecurityGroup (Get-NsxSecurityGroup -name $SGHZN7BlockAllName) -Member (Get-NsxSecurityGroup -Name $SGHZN7UEM_FSName)
        Add-NsxSecurityGroupMember -SecurityGroup (Get-NsxSecurityGroup -name $SGHZN7BlockAllName) -Member (Get-NsxSecurityGroup -Name $SGHZN7V4HName)
        Add-NsxSecurityGroupMember -SecurityGroup (Get-NsxSecurityGroup -name $SGHZN7BlockAllName) -Member (Get-NsxSecurityGroup -Name $SGHZN7VDIName)
              
        #Build New Services
        Write-host -ForegroundColor Green "Creating Services"
        
        $SVHZN7BEClient2AgentTCP = New-NsxService -name $SVHZN7BEClient2AgentTCPName -protocol $TCP -port $22443 -description "Horizon 7 Blast Extreme TCP Excellent Typical Horizon Client to Horizon Agent" -EnableInheritance
        $SVHZN7BEClient2AgentUDP = New-NsxService -name $SVHZN7BEClient2AgentUDPName -protocol $UDP -port $22443 -description "Horizon 7 Blast Extreme UDP Typical Horizon Client to Horizon Agent" -EnableInheritance
        $SVHZN7PCOIPClient2AgentTCP = New-NsxService -name $SVHZN7PCOIPClient2AgentTCPName -protocol $TCP -port $4172 -description "Horizon 7 PCoIP TCP Horizon Client to Horizon Agent" -EnableInheritance
        $SVHZN7PCOIPClient2AgentUDP = New-NsxService -name $SVHZN7PCOIPClient2AgentUDPName -protocol $UDP -port $4172 -description "Horizon 7 PCoIP UDP Horizon Client to Horizon Agent" -EnableInheritance
        $SVHZN7RDPClient2Agent = New-NsxService -name $SVHZN7RDPClient2AgentName -protocol $TCP -port $3389 -description "Horizon 7 RDP Horizon Client to Horizon Agent" -EnableInheritance
        $SVHZN7CDRMMRClient2Agent = New-NsxService -name $SVHZN7CDRMMRClient2AgentName -protocol $TCP -port $9427 -description "Horizon 7 CDR MMR Horizon Client to Horizon Agent" -EnableInheritance
        $SVHZN7USBClient2Agent = New-NsxService -name $SVHZN7USBClient2AgentName -protocol $TCP -port $32111 -description "Horizon 7 USB Horizon Client to Horizon Agent USB Redirection" -EnableInheritance
        $SVHZN7Browser2AgentHTML = New-NsxService -name $SVHZN7Browser2AgentHTMLName -protocol $TCP -port $443 -description "Horizon 7 Browser to Horizon Agent HTML Access" -EnableInheritance
        $SVHZN7Agent2ConnServerEnhanced = New-NsxService -name $SVHZN7Agent2ConnServerEnhancedName -protocol $TCP -port $4002 -description "Horizon 7 JMS Horizon Agent to Connection Server Enhanced" -EnableInheritance
        $SVHZN7Agent2ConnServerLegacy = New-NsxService -name $SVHZN7Agent2ConnServerLegacyName -protocol $TCP -port $4001 -description "Horizon 7 JMS Horizon Agent to Connection Server Legacy" -EnableInheritance
        $SVHZN7Agent2V4HRMI = New-NsxService -name $SVHZN7Agent2V4HRMIName -protocol $TCP -port $3091 -description "Horizon 7 Horizon Agent to V4H RMI" -EnableInheritance
        $SVHZN7Agent2V4HDMS = New-NsxService -name $SVHZN7Agent2V4HDMSName -protocol $TCP -port $3099 -description "Horizon 7 Horizon Agent to V4H Desktop Message Server" -EnableInheritance
        $SVAPPVAgent2APPVMGRSSL = New-NsxService -name $SVAPPVAgent2APPVMGRSSLName -protocol $TCP -port $443 -description "App Volumes Agent to App Volumes Manager SSL" -EnableInheritance
        $SVAPPVAgent2APPVMGRSTD = New-NsxService -name $SVAPPVAgent2APPVMGRSTDName -protocol $TCP -port $80 -description "App Volumes Agent to App Volumes Manager Standard" -EnableInheritance
        $SVUEMMGR2UEMFSSMB = New-NsxService -name $SVUEMMGR2UEMFSSMBName -protocol $TCP -port $445 -description "User Environment Manager to UEM File Servers SMB" -EnableInheritance


        #Build New Service Groups
   
        #Build Firewall Rules
        Write-host -ForegroundColor Green "Creating Firewall Rules"

        Get-NsxFirewallSection $SNHZN7BlockAllName | New-NsxFirewallRule -Name $RNHZN7BlockAllName -source $SGHZN7BlockAll -Destination $SGHZN7BlockAll -action deny -AppliedTo $SGHZN7BlockAll
        Get-NsxFirewallSection $SNHZN7ConnInternalSectionName  | New-NsxFirewallRule -Name $RNHZN7Client2AgentName -destination $SGHZN7VDI,$SGHZN7RDSHost -service $SVHZN7BEClient2AgentTCP,$SVHZN7BEClient2AgentUDP,$SVHZN7PCOIPClient2AgentTCP,$SVHZN7PCOIPClient2AgentUDP,$SVHZN7RDPClient2Agent,$SVHZN7CDRMMRClient2Agent,$SVHZN7USBClient2Agent -action allow -AppliedTo $SGHZN7VDI,$SGHZN7RDSHost -Position Top
        Get-NsxFirewallSection $SNHZN7ConnInternalSectionName  | New-NsxFirewallRule -Name $RNHZN7Browser2AgentHTMLName -destination $SGHZN7VDI,$SGHZN7RDSHost -service $SVHZN7Browser2AgentHTML -action allow -AppliedTo $SGHZN7VDI,$SGHZN7RDSHost -Position Top
        Get-NsxFirewallSection $SNHZN7DesktopVDI_RDSHSectionName  | New-NsxFirewallRule -Name $RNHZN7Agent2ConnServerName -source $SGHZN7VDI,$SGHZN7RDSHost -destination $SGHZN7ConnServer -service $SVHZN7Agent2ConnServerEnhanced,$SVHZN7Agent2ConnServerLegacy -action allow -AppliedTo $SGHZN7ConnServer,$SGHZN7VDI,$SGHZN7RDSHost -Position Top
        Get-NsxFirewallSection $SNHZN7DesktopVDI_RDSHSectionName  | New-NsxFirewallRule -Name $RNHZN7Agent2V4HName -source $SGHZN7VDI,$SGHZN7RDSHost -destination $SGHZN7V4H -service $SVHZN7Agent2V4HRMI,$SVHZN7Agent2V4HDMS -action allow -AppliedTo $SGHZN7VDI,$SGHZN7RDSHost,$SGHZN7V4H -Position Top
        Get-NsxFirewallSection $SNHZN7DesktopVDI_RDSHSectionName  | New-NsxFirewallRule -Name $RNAPPVAgent2APPVMGRName -source $SGHZN7VDI,$SGHZN7RDSHost -destination $SGHZN7AppVolMgr -service $SVAPPVAgent2APPVMGRSSL,$SVAPPVAgent2APPVMGRSTD -action allow -AppliedTo $SGHZN7VDI,$SGHZN7RDSHost,$SGHZN7AppVolMgr -Position Top
        Get-NsxFirewallSection $SNHZN7DesktopVDI_RDSHSectionName  | New-NsxFirewallRule -Name $RNUEMMGR2UEMFSSMBName -source $SGHZN7VDI,$SGHZN7RDSHost -destination $SGHZN7UEM_FS -service $SVUEMMGR2UEMFSSMB -action allow -AppliedTo $SGHZN7VDI,$SGHZN7RDSHost,$SGHZN7UEM_FS -Position Top
        Get-NsxFirewallSection $SNHZN7DesktopVDI_RDSHSectionName  | New-NsxFirewallRule -Name $RNHZN7BlockVDI2VDIName -source $SGHZN7VDI,$SGHZN7RDSHost -Destination $SGHZN7vIDM,$SGHZN7RDSHost -Action deny -AppliedTo $SGHZN7VDI,$SGHZN7RDSHost -Position Bottom
 

    