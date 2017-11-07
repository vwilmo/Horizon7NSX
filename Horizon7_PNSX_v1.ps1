#Script
    param (
        ##Creating Horizon 7 Groupings
        
        #Security Groups
        $SGHZN7ClientName = "SG-Horizon7-Client",
        $SGHZN7ConnServerName = "SG-Horizon7-ConnServer",
        $SGHZN7vIDMName = "SG-Horizon7-vIDM",
        $SGHZN7UAGName = "SG-Horizon7-UAG",
        $SGHZN7VDIName = "SG-Horizon7-VDI",
        $SGHZN7RDSHostName = "SG-Horizon7-RDSHost",
        $SGHZN7EnrollServerName = "SG-Horizon7-EnrollServer",
        $SGHZN7AppVolMgrName = "SG-Horizon7-AppVolMgr",
        $SGHZNvCenterMGMTName = "SG-Horizon7-vCenterMgmt",
        $SGHZNvCenterVDI_RDSHName = "SG-Horizon7-vCenterVDI_RDSH",
        $SGHZNUEM_FSName = "SG-Horizon7-UEM_FS",
        $SGHZNUEM_MgrName = "SG-Horizon7-UEM_Mgr",
        $SGHZNComposerName = "SG-Horizon7-Composer",
        $SGHZNDomainCtrlName = "SG-Horizon7-DomainCtrl",
        $SGHZNDNSName = "SG-Horizon7-DNS",
        $SGHZNSMTPName = "SG-Horizon7-SMTP",
        $SGHZNCitrixName = "SG-Horizon7-Citrix",
        $SGHZNThinApp_FSName = "SG-Horizon7-ThinApp_FS",
        $SGHZN2FAName = "SG-Horizon7-2FA",
        $SGHZNAirWatchName = "SG-Horizon7-AirWatch",
        $SGHZNV4HName = "SG-Horizon7-V4H",
        
        #Security Tags
        $STHZN7ClientName = "ST-Horizon7Client",
        $STHZN7ConnServerName = "ST-Horizon7ConnServer",
        $STHZN7vIDMName = "ST-Horizon7vIDM",
        $STHZN7UAGName = "ST-Horizon7UAG",
        $STHZN7VDIName = "ST-Horizon7VDI",
        $STHZN7RDSHostName = "ST-Horizon7RDSHost",
        $STHZN7EnrollServerName = "ST-Horizon7EnrollServer",
        $STHZN7AppVolMgrName = "ST-Horizon7AppVolMgr",
        $STHZNvCenterMGMTName = "ST-Horizon7-vCenterMgmt",
        $STHZNvCenterVDI_RDSHName = "ST-Horizon7-vCenterVDI_RDSH",
        $STHZNUEM_FSName = "ST-Horizon7-UEM_FS",
        $STHZNUEM_MgrName = "ST-Horizon7-UEM_Mgr",
        $STHZNComposerName = "ST-Horizon7-Composer",
        $STHZNDomainCtrlName = "ST-Horizon7-DomainCtrl",
        $STHZNDNSName = "ST-Horizon7-DNS",
        $STHZNSMTPName = "ST-Horizon7-SMTP",
        $STHZNCitrixName = "ST-Horizon7-Citrix",
        $STHZNThinApp_FSName = "ST-Horizon7-ThinApp_FS",
        $STHZN2FAName = "ST-Horizon7-2FA",
        $STHZNAirWatchName = "ST-Horizon7-AirWatch",
        $STHZNV4HName = "ST-Horizon7-V4H",
        
        #DFW Firewall Section Names
        $SNHZN7ConnExternalSectionName = "Horizon 7 Connectivity - External Connections",
        $SNHZN7ConnTunneledSectionName = "Horizon 7 Connectivity - Tunneled Connections",
        $SNHZN7ConnInternalSectionName = "Horizon 7 Connectivity - Internal Connections",
        $SNHZN7DesktopVDI_RDSHSectionName = "Horizon 7 Desktops - VDI or RDS Host",
        $SNHZN7InfraConnServerSectionName = "Horizon 7 Infrastructure - View Connection Server",
        $SNHZN7InfravCenterViewCompSectionName = "Horizon 7 Infrastructure - vCenter Server and View Composer",
        $SNHZN7InfraUAGSectionName = "Horizon 7 Infrastructure - Unified Access Gateway",
        $SNHZN7InfravIDMSectionName = "Horizon 7 Infrastructure - VMware Identity Manager",
        $SNHZN7InfraAppVolMgrSectionName = "Horizon 7 Infrastructure - App Volumes Manager",
        $SNHZN7InfraV4HSectionName = "Horizon 7 Infrastructure - vRealize Operations for Horizon",
        $SNHHZN7InfraMgmtSectionName = "Horizon 7 Infrastructure - Management",
    
        #DFW Rule Names
        
        $RNHZNClient2ConnServerName = "Internal - Horizon Client to View Connection Server",
        $RNHZNClient2AgentName = "Internal - Horizon Client to Horizon Agent",
        $RNHZNBrowser2AgentHTMLName = "Internal - Browser to Horizon Agent HTML",
        $RNHZNBrowser2VIDMName = "Internal - Browser to vIDM",
        $RNHZNClient2UAGName = "External - Horizon Client to UAG",
        $RNHZNBrowser2UAGHTMLName = "External - Browser to UAG HTML",
        $RNHZNBrowser2UAGVIDMName = "External - Browser to UAG VIDM",
        $RNHZNClient2ConnServerTunnName = "Tunneled - Horizon Client to View Connection Server HTTPS",
        $RNHZNBrowser2AgentTunnName = "Tunneled - Browser to View Connection Server",
        $RNHZNBrowser2VIDMTunnName = "Tunneled - Browser to VIDM",
        $RNHZNAgent2ConnServerName = "Desktops - Horizon Agent to View Connection Server JMS",
        $RNHZNAgent2V4HName = "Desktops - Horizon Agent to V4H",
        $RNAPPVAgent2APPVMGRName = "Desktops - App Volumes Agent to App Volumes Manager",
        $RNUEMMGR2UEMFSSMBName = "Desktops - UEM Flex Engine to UEM File Servers",
        $RNHZNConnServ2AgentTunnName = "Infrastructure - View Connection Server to Horizon Agent Tunneled",
        $RNHZNConnServer2vCenterName = "Infrastructure - View Connection Server to vCenter Server",
        $RNHZNConnServer2CompName = "Infrastructure - View Connection Server to View Composer",
        $RNHZNConnServer2ConnServerName = "Infrastructure - View Connection Server to View Connection Server",
        $RNHZNConnServer2EnrollmentName = "Infrastructure - View Connection Server to Enrollment Server",
        $RNHZNConnServer2VIDMName = "Infrastructure - View Connection Server to VIDM",
        $RNHZNConnServer2V4HName = "Infrastructure - View Connection Server to V4H",
        $RNHZNConnServer22FAMGRName = "Infrastructure - View Connection Server to 2FA Manager",
        $RNvCenter2ESXiName = "Infrastructure - vCenter Server to ESXi",
        $RNHZNComp2vCenterName = "Infrastructure - View Composer to vCenter Server",
        $RNHZNComp2ESXiName = "Infrastructure - View Composer to ESXi",
        $RNHZNUAG2ConnServerName = "Infrastructure - UAG to View Connection Server",
        $RNHZNUAG2AgentName = "Infrastructure - UAG to Horizon Agent",
        $RNHZNVIDM2ConnServerName = "Infrastructure - VIDM to View Connection Server",
        $RNHZNVIDM2VIDMName = "Infrastructure - VIDM to VIDM",
        $RNHZNVIDM2SMTPName = "Infrastructure - VIDM to SMTP Server",
        $RNHZNVIDM2DCName = "Infrastructure - VIDM to Domain Controller",
        $RNHZNVIDM2DNSName = "Infrastructure - VIDM to DNS",
        $RNHZNVIDM2CTXBName = "Infrastructure - VIDM to Citrix Integration",
        $RNHZNVIDM2ThinAppFSName = "Infrastructure - VIDM to ThinApp FS",
        $RNHZNVIDM2UpgradeServerName = "Infrastructure - VIDM to Upgrade Server",
        $RNHZNVIDM22FAMGRName = "Infrastructure - VIDM to 2FA Manager",
        $RNHZNVIDM2AirWatchName = "Infrastructure - VIDM to AirWatch",
        $RNHZNVIDM2Name = "Infrastructure - VIDM to External DB",
        $RNHZNAPPVMGR2vCenterName = "Infrastructure - App Volumes Manager to vCenter Server",
        $RNHZNAPPVMGR2ESXiName = "Infrastructure - App Volumes Manager to ESXi",
        $RNHZNAPPVMGR2Name = "Infrastructure - App Volumes Manager to External DB",
        $RNV4H2ConnServerName = "Infrastructure - V4H to View Connection Server",
        $RNV4H2AgentName = "Infrastrucutre - V4H to Horizon Agent",
        $RNV4H2UAGMonitorName = "Infrastructure - V4H to UAG Monitoring",
        $RNV4H2APPVMGRMonitorName = "Infrastructure - V4H to App Volumes Manager Monitoring",
        $RNHZNAdmin2Name = "Management - Admin Console to Conn Server, vCenter, AppV Mgr, V4H",
        $RNHZNAdmin2UAGName = "Management - Admin Console to UAG",
        $RNHZNAdmin2VIDMName = "Management - Admin Console to VIDM",
        
        #Service Names

        $SVHZNClient2ConnServerHTTPName = "Horizon 7 HTTP Horizon Client to View Connection Servers Standard",
        $SVHZNClient2ConnServerHTTPSName = "Horizon 7 HTTPS Horizon Client to View Connection Servers SSL",
        $SVHZNBEClient2AgentTCPName = "Horizon 7 Blast Extreme TCP Excellent Typical Horizon Client to Horizon Agent",
        $SVHZNBEClient2AgentUDPName = "Horizon 7 Blast Extreme UDP Typical Horizon Client to Horizon Agent",
        $SVHZNPCOIPClient2AgentTCPName = "Horizon 7 PCoIP TCP Horizon Client to Horizon Agent",
        $SVHZNPCOIPClient2AgentUDPName = "Horizon 7 PCoIP UDP Horizon Client to Horizon Agent",
        $SVHZNRDPClient2AgentName = "Horizon 7 RDP Horizon Client to Horizon Agent",
        $SVHZNCDRMMRClient2AgentName = "Horizon 7 CDR MMR Horizon Client to Horizon Agent",
        $SVHZNUSBClient2AgentName = "Horizon 7 USB Horizon Client to Horizon Agent USB Redirection",
        $SVHZNBrowser2AgentHTMLName = "Horizon 7 Browser to Horizon Agent HTML Access",
        $SVHZNBrowser2VIDMName = "Horizon 7 Browser to VMware Identity Manager",
        $SVHZNClient2UAGName = "Horizon 7 Horizon Client to Unified Access Gateway",
        $SVHZNPCOIPClient2UAGTCPName = "Horizon 7 PCoIP TCP Horizon Client to Unified Access Gateway",
        $SVHZNPCOIPClient2UAGUDPName = "Horizon 7 PCoIP UDP Horizon Client to Unified Access Gateway",
        $SVHZNBEClient2UAGTCP443Name = "Horizon 7 Blast Extreme TCP 443 Excellent Typical Horizon Client to Unified Access Gateway",
        $SVHZNBEClient2UAGTCP8443Name = "Horizon 7 Blast Extreme TCP 8443 Excellent Typical Horizon Client to Unified Access Gateway",
        $SVHZNBEClient2UAGUDP443Name = "Horizon 7 Blast Extreme UDP 443 Poor Typical Horizon Client to Unified Access Gateway",
        $SVHZNBEClient2UAGUDP8443Name = "Horizon 7 Blast Extreme UDP 8443 Poor Typical Horizon Client to Unified Access Gateway",
        $SVHZNBrowser2UAGHTMLName = "Horizon 7 Browser to Unified Access Gateway HTML Access",
        $SVHZNBrowser2UAGVIDMName = "Horizon 7 Browser to Unified Access Gateway VIDM",
        $SVHZNClient2ConnServerTunnHTTPSName = "Horizon 7 HTTPS Horizon Client to Connection Servers Tunneled",
        $SVHZNClient2ConnServerTunnHTTPName = "Horizon 7 HTTP Horizon Client to View Connection Servers Tunneled",
        $SVHZNBEClient2ConnServerTCPName = "Horizon 7 Blast Extreme TCP Excellent Typical Horizon Client to View Connection Server",
        $SVHZNPCOIPClient2ConnServerTCPName = "Horizon 7 PCoIP TCP Horizon Client to View Connection Server",
        $SVHZNPCOIPClient2ConnServerUDPName = "Horizon 7 PCoIP UDP Horizon Client to View Connection Server",
        $SVHZNBrowser2AgentTunnHTMLName = "Horizon 7 Browser to Horizon Agent HTML Access Tunneled",
        $SVHZNBrowser2VIDMTunnName = "Horizon 7 Browser to VMware Identity Manager Tunneled",
        $SVHZNAgent2ConnServerEnhancedName = "Horizon 7 JMS Horizon Agent to Connection Server Enhanced",
        $SVHZNAgent2ConnServerLegacyName = "Horizon 7 JMS Horizon Agent to Connection Server Legacy",
        $SVHZNAgent2V4HRMIName = "Horizon 7 Horizon Agent to V4H RMI",
        $SVHZNAgent2V4HDMSName = "Horizon 7 Horizon Agent to V4H Desktop Message Server",
        $SVAPPVAgent2APPVMGRSSLName = "App Volumes Agent to App Volumes Manager SSL",
        $SVAPPVAgent2APPVMGRSTDName = "App Volumes Agent to App Volumes Manager Standard",
        $SVUEMMGR2UEMFSSMBName = "User Environment Manager to UEM File Servers SMB",
        $SVHZNBEConnServ2AgentTunnName = "Horizon 7 Blast Extreme TCP View Connection Server to Horizon Agent Tunneled",
        $SVHZNPCOIPConnServ2AgentTunnTCPName = "Horizon 7 PCoIP TCP View Connection Server to Horizon Agent Tunneled",
        $SVHZNPCOIPConnServ2AgentTunnUDPName = "Horizon 7 PCoIP UDP View Connection Server to Horizon Agent Tunneled",
        $SVHZNRDPConnServer2AgentTunnName = "Horizon 7 RDP View Connection Server to Horizon Agent Tunneled",
        $SVHZNCDRMMRConnServer2AgentTunnName = "Horizon 7 CDR MMR View Connection Server to Horizon Agent Tunneled",
        $SVHZNUSBClient2AgentUSBTunnName = "Horizon 7 USB Horizon Client to Horizon Agent USB Redirection Tunneled",
        $SVHZNConnServer2vCenterSOAPName = "Horizon 7 HTTPS View Connection Server to vCenter Server SOAP",
        $SVHZNConnServer2CompSOAPName = "Horizon 7 View Connection Server to View Composer SOAP",
        $SVHZNConnServer2ConnServerJMSLegacyName = "Horizon 7 JMS View Connection Server to View Connection Server Legacy",
        $SVHZNConnServer2ConnServerJMSSSLName = "Horizon 7 JMS View Connection Server to View Connection Server SSL",
        $SVHZNCPALDAPREPLName = "Horizon 7 CPA Global LDAP Replication",
        $SVHZNCPALDAPREPLSSLName = "Horizon 7 CPA Global LDAP Replication SSL",
        $SVHZCPAInterPodVIPAName = "Horizon 7 CPA Inter-Pod VIPA",
        $SVHZNConnServerInstallReplicaName = "Horizon 7 View Connection Server Install Replica",
        $SVHZNConnServer2EnrollmentName = "Horizon 7 View Connection Server to Enrollment Server View Framework",
        $SVHZNConnServer2VIDMName = "Horizon 7 View Connection Server to VMware Identity Manager Message Bus",
        $SVHZNConnServer2V4HRMIName = "Horizon 7 View Connection Server to V4H RMI",
        $SVHZNConnServer2V4HBMSName = "Horizon 7 View Connection Server to V4H Broker Message Server",
        $SVHZNConnServer2V4HCMSName = "Horizon 7 View Connection Server to V4H Cert Management Server",
        $SVHZNConnServer22FAMGRName = "Horizon 7 Default View Connection Server to 2FA Manager",
        $SVvCenter2ESXiSOAPName = "vCenter Server to ESXi SOAP",
        $SVHZNComp2vCenterSOAPName = "Horion 7 View Composer to vCenter Server SOAP",
        $SVHZNComp2ESXiSOAPName = "Horizon 7 View Composer to ESXi SOAP",
        $SVHZNUAG2ConnServerLoginName = "Horizon 7 Unified Access Gateway to View Connection Server Login",
        $SVHZNBEUAG2AgentTCPName = "Horizon 7 Unified Blast Extreme TCP Unified Access Gateway to Horizon Agent",
        $SVHZNBEUAG2AgentUDPName = "Horizon 7 Unified Blast Extreme UDP Unified Access Gateway to Horizon Agent",
        $SVHZNPCOIP2AgentTCPName = "Horizon 7 PCoIP TCP Unified Access Gateway to Horizon Agent",
        $SVHZNPCOIP2AgentUDPName = "Horizon 7 PCoIP UDP Unified Access Gateway to Horizon Agent",
        $SVHZNRDPUAG2AgentName = "Horizon 7 RDP Unified Access Gateway to Horizon Agent",
        $SVHZNCDRMMRUAG2AgentName = "Horizon 7 CDR MMR Unified Access Gateway to Horizon Agent",
        $SVHZNUSBUAG2AgentName = "Horizon 7 USB Unified Acess Gateway to Horizon Agent USB Redirection",
        $SVHZNUAG2AgentName = "Horizon 7 Unified Access Gateway to Horizon Agent",
        $SVHZNUAG22FAMGRName = "Horizon 7 Default Unified Access Gateway to 2FA",
        $SVHZNVIDM2ConnServerLDAPName = "Horizon 7 LDAP VMware Identity Manager to View Connection Server",
        $SVHZNVIDM2ConnServerHTTPSName = "Horizon 7 HTTPS VMware Identity Manager to View Connection Server",
        $SVHZNVIDM2VIDMHTTPSName = "Horizon 7 HTTPS VMware Identity Manager to VMware Identity Manager",
        $SVHZNVIDM2VIDMAuditName = "Horizon 7 VMware Identity Manager to VMware Identity Manager Audit",
        $SVHZNVIDM2SMTPName = "Horizon 7 VMware Identity Manager to SMTP Server",
        $SVHZNVIDM2DCLDAPName = "Horizon 7 LDAP VMware Identity Manager to Domain Controller",
        $SVHZNVIDM2DCKerberosTCPName = "Horizon 7 Kerberos TCP VMware Identity Manager to Domain Controller",
        $SVHZNVIDM2DCKerberosUDPName = "Horizon 7 Kerberos UDP VMware Identity Manager to Domain Controller",
        $SVHZNVIDM2DCKerberosPWDTCPName = "Horizon 7 TCP Kerberos PWD VMware Identity Manager to Domain Controller",
        $SVHZNVIDM2DCKerberosPWDUDPName = "Horizon 7 UDP Kerberos PWD VMware Identity Manager to Domain Controller",
        $SVHZNVIDM2DCRPCName = "Horizon 7 RPC VMware Identity Manager to Domain Controller",
        $SVHZNVIDM2DNSTCPName = "Horizon 7 DNS TCP VMware Identity Manager to DNS Server",
        $SVHZNVIDM2DNSUDPName = "Horizon 7 DNS UDP VMware Identity Manager to DNS Server",
        $SVHZNVIDM2CTXBSTDName = "VMware Identity Manager to Citrix integration Broker Standard",
        $SVHZNVIDM2CTXSSLName = "VMware Identity Manager to Citrix integration Broker SSL",
        $SVHZNVIDM2ThinAppFSSMBName = "VMware Identity Manger to ThinApp File Servers SMB",
        $SVHZNVIDM2UpgradeServerName = "VMware Identity Manager to Upgrade Server",
        $SVHZNVIDM22FAMGRName = "VMware Identity Manager Default to 2FA Manager",
        $SVHZNVIDM2AirWatchRESTAPIName = "VMware Identity Manager to VMware AirWatch REST API",
        $SVHZNVIDM2MSSQLName = "VMware Identity Manager to External MSSQL",
        $SVHZNVIDM2PostgreSQLName = "VMware Identity Manager to Extenal PostgreSQL",
        $SVHZNVIDM2OracleName = "VMware Identity Manager to External Oracle",
        $SVHZNAPPVMGR2vCenterSOAPName = "App Volumes Manager to vCenter Server SOAP",
        $SVHZNAPPVMGR2ESXiName = "App Volumes Manager to ESXi Hostd",
        $SVHZNAPPVMGR2MSSQLName = "App Volumes Manager Default to MSSQL",
        $SVV4H2ConnServerRMIName = "V4H to View Connection Server RMI",
        $SVV4H2ConnServerBMSName = "V4H to View Connection Server Broker Message Server",
        $SVV4H2ConnServerCMSName = "V4H to View Connection Server Cert Management Server",
        $SVV4H2AgentRMIName = "V4H to Horizon Agent RMI",
        $SVV4H2AgentDMSName = "V4H to Horizon Agent Desktop Message Server",
        $SVV4H2UAGMonitorName = "V4H to Unified Access Gateway Monitoring",
        $SVV4H2APPVMGRMonitorName = "V4H to App Volumes Manager Monitoring",
        $SVHZNAdmin2ConnServerName = "Horizon 7 Admin Console to View Connection Server",
        $SVHZNAdmin2vCenterName = "Horizon 7 Admin Console to vCenter Server",
        $SVHZNAdmin2APPVMGRName = "Horizon 7 Admin Console to App Volumes Manager",
        $SVHZNAdmin2VIDMName = "Horizon 7 Admin Console to VMware Identity Manager",
        $SVHZNAdmin2V4HName = "Horizon 7 Admin Console to V4H",
        $SVHZNAdmin2UAGName = "Horizon 7 Admin Console to Unified Access Gateway"

        #Service Port and Protocol
        
        #Protocol
        $TCP = "tcp"
        $UDP = "udp"
        
        #Port
        $80 = "80"
        $443 = "443"
        $22443 = "22443"
        $4172 = "4172"
        $3389 = "3389"
        $9427 = "9427"
        $32111 = "32111"
        $8443 = "8443"
        $4002 = "4002"
        $4001 = "4001"
        $3091 = "3091"
        $3099 = "3099"
        $445 = "445"
        $18443 = "18443"
        $4100 = "4100"
        $4101 = "4101"
        $22389 = "22389"
        $22636 = "22636"
        $8472 = "8472"
        $3901 = "3901"
        $3101 = "3101"
        $3100 = "3100"
        $5500 = "5500"
        $902 = "902"
        $389 = "389"
        $93009400 = "9300-9400"
        $25 = "25"
        $88 = "88"
        $464 = "464"
        $135 = "135"
        $53 = "53"
        $1433 = "1433"
        $5432 = "5432"
        $1521 = "1521"
        $3909 = "3909"
        $9443 = "9443"

        ##Build New Horizon 7 DFW Sections
        ##Checks if Section exists first
    
        $SectionNames = 
        "Horizon 7 Connectivity - External Connections",
        "Horizon 7 Connectivity - Tunneled Connections",
        "Horizon 7 Connectivity - Internal Connections",
        "Horizon 7 Desktops - VDI or RDS Host",
        "Horizon 7 Infrastructure - View Connection Server",
        "Horizon 7 Infrastructure - vCenter Server and View Composer",
        "Horizon 7 Infrastructure - Unified Access Gateway",
        "Horizon 7 Infrastructure - VMware Identity Manager",
        "Horizon 7 Infrastructure - App Volumes Manager",
        "Horizon 7 Infrastructure - vRealize Operations for Horizon",
        "Horizon 7 Infrastructure - Management"
        foreach ($item in $SectionNames) {
        $Section = Get-NsxFirewallSection -Name "$item"
        if (!$Section)
        {
        New-NsxFirewallSection -name $item | out-null
        }}
    
        ##Build New Security Tags
        ##Checks if exists first
        $SecurityTagNames = 
        "ST-Horizon7-Client",
        "ST-Horizon7-ConnServer",
        "ST-Horizon7-vIDM",
        "ST-Horizon7-UAG",
        "ST-Horizon7-VDI",
        "ST-Horizon7-RDSHost",
        "ST-Horizon7-EnrollServer",
        "ST-Horizon7-AppVolMgr",
        "ST-Horizon7-vCenterMgmt",
        "ST-Horizon7-vCenterVDI_RDSH",
        "ST-Horizon7-UEM_FS",
        "ST-Horizon7-UEM_Mgr",
        "ST-Horizon7-Composer",
        "ST-Horizon7-DomainCtrl",
        "ST-Horizon7-DNS",
        "ST-Horizon7-SMTP",
        "ST-Horizon7-Citrix",
        "ST-Horizon7-ThinApp_FS",
        "ST-Horizon7-2FA",
        "ST-Horizon7-AirWatch",
        "ST-Horizon7-V4H"
        foreach ($item in $SecurityTagNames) {
        $SecurityTag = Get-NsxSecurityTag -Name "$item"
        if (!$SecurityTag)
        {
        New-NsxSecurityTag -name $item | out-null
        }}

        #Build New Security Groups
        #Section for Future nested loop to attach ST to SG
        #$SecurityGroupNames = 
        #"SG-Horizon7Client",
        #"SG-Horizon7ConnServer",
        #"SG-Horizon7vIDM",
        #"SG-Horizon7UAG",
        #"SG-Horizon7VDI",
        #"SG-Horizon7RDSHoSG",
        #"SG-Horizon7EnrollServer",
        #"SG-Horizon7AppVolMgr",
        #"SG-Horizon7-vCenterMgmt",
        #"SG-Horizon7-vCenterVDI_RDSH",
        #"SG-Horizon7-UEM_FS",
        #"SG-Horizon7-UEM_Mgr",
        #"SG-Horizon7-Composer",
        #"SG-Horizon7-DomainCtrl",
        #"SG-Horizon7-DNS",
        #"SG-Horizon7-SMTP",
        #"SG-Horizon7-Citrix",
        #"SG-Horizon7-ThinApp_FS",
        #"SG-Horizon7-2FA",
        #"SG-Horizon7-AirWatch",
        #"SG-Horizon7-V4H"
        #foreach ($item in $SecurityGroupNames) {
        #$SecurityGroup = Get-NsxSecurityGroup -Name "$item"
        #if (!$SecurityGroup)
        #{
        #New-NsxSecurityGroup -name $item -IncludeMember   out-null
        #}}
   
        $SGHZN7Client = New-NsxSecurityGroup -name $SGHZN7ClientName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7ClientName)
        $SGHZN7ConnServer = New-NsxSecurityGroup -name $SGHZN7ConnServerName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7ConnServerName)
        $SGHZN7vIDM = New-NsxSecurityGroup -name $SGHZN7vIDMName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7vIDMName)
        $SGHZN7UAG = New-NsxSecurityGroup -name $SGHZN7UAGName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7UAGName)
        $SGHZN7VDI = New-NsxSecurityGroup -name $SGHZN7VDIName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7VDIName)
        $SGHZN7RDSHost = New-NsxSecurityGroup -name $SGHZN7RDSHostName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7RDSHostName)
        $SGHZN7EnrollServer = New-NsxSecurityGroup -name $SGHZN7EnrollServerName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7EnrollServerName)
        $SGHZN7AppVolMgr = New-NsxSecurityGroup -name $SGHZN7AppVolMgrName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7AppVolMgrName)
        $SGHZNvCenterMGMT = New-NsxSecurityGroup -name $SGHZN7ClientName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7ClientName)
        $SGHZNvCenterVDI_RDSH = New-NsxSecurityGroup -name $SGHZN7vCenterVDI_RDSHName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7vCenterVDI_RDSHName)
        $SGHZNUEM_FS = New-NsxSecurityGroup -name $SGHZN7UEM_FSName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7UEM_FSName)
        $SGHZNUEM_Mgr = New-NsxSecurityGroup -name $SGHZN7UEM_MgrName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7UEM_MgrName)
        $SGHZNComposer = New-NsxSecurityGroup -name $SGHZN7ComposerName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7ComposerName)
        $SGHZNDomainCtrl = New-NsxSecurityGroup -name $SGHZN7DomainCtrlName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7DomainCtrlName)
        $SGHZNDNS = New-NsxSecurityGroup -name $SGHZN7DNSName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7DNSName)
        $SGHZNSMTP = New-NsxSecurityGroup -name $SGHZN7SMTPName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7SMTPName)
        $SGHZNCitrix = New-NsxSecurityGroup -name $SGHZN7CitrixName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7CitrixName)
        $SGHZNThinApp_FS = New-NsxSecurityGroup -name $SGHZN7ThinApp_FSName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7ThinApp_FSName)
        $SGHZN2FA = New-NsxSecurityGroup -name $SGHZN72FAName -IncludeMember (Get-NsxSecurityTag -Name $STHZN72FAName)
        $SGHZNAirWatch = New-NsxSecurityGroup -name $SGHZN7AirWatchName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7AirWatchName)
    
        #Build New Services
    
        $SVHZNClient2ConnServerHTTP = New-NsxService -name $SVHZNClient2ConnServerHTTPName -protocol $TCP -port $80 -description "Horizon 7 HTTP Horizon Client to View Connection Servers Standard" -EnableInheritance
        $SVHZNClient2ConnServerHTTPS = New-NsxService -name $SVHZNClient2ConnServerHTTPSName -protocol $TCP -port $443 -description "Horizon 7 HTTPS Horizon Client to View Connection Servers SSL" -EnableInheritance
        $SVHZNBEClient2AgentTCP = New-NsxService -name $SVHZNBEClient2AgentTCPName -protocol $TCP -port $22443 -description "Horizon 7 Blast Extreme TCP Excellent Typical Horizon Client to Horizon Agent" -EnableInheritance
        $SVHZNBEClient2AgentUDP = New-NsxService -name $SVHZNBEClient2AgentUDPName -protocol $UDP -port $22443 -description "Horizon 7 Blast Extreme UDP Typical Horizon Client to Horizon Agent" -EnableInheritance
        $SVHZNPCOIPClient2AgentTCP = New-NsxService -name $SVHZNPCOIPClient2AgentTCPName -protocol $TCP -port $4172 -description "Horizon 7 PCoIP TCP Horizon Client to Horizon Agent" -EnableInheritance
        $SVHZNPCOIPClient2AgentUDP = New-NsxService -name $SVHZNPCOIPClient2AgentUDPName -protocol $UDP -port $4172 -description "Horizon 7 PCoIP UDP Horizon Client to Horizon Agent" -EnableInheritance
        $SVHZNRDPClient2Agent = New-NsxService -name $SVHZNRDPClient2AgentName -protocol $TCP -port $3389 -description "Horizon 7 RDP Horizon Client to Horizon Agent" -EnableInheritance
        $SVHZNCDRMMRClient2Agent = New-NsxService -name $SVHZNCDRMMRClient2AgentName -protocol $TCP -port $9427 -description "Horizon 7 CDR MMR Horizon Client to Horizon Agent" -EnableInheritance
        $SVHZNUSBClient2Agent = New-NsxService -name $SVHZNUSBClient2AgentName -protocol $TCP -port $32111 -description "Horizon 7 USB Horizon Client to Horizon Agent USB Redirection" -EnableInheritance
        $SVHZNBrowser2AgentHTML = New-NsxService -name $SVHZNBrowser2AgentHTMLName -protocol $TCP -port $443 -description "Horizon 7 Browser to Horizon Agent HTML Access" -EnableInheritance
        $SVHZNBrowser2VIDM = New-NsxService -name $SVHZNBrowser2VIDMName -protocol $TCP -port $443 -description "Horizon 7 Browser to VMware Identity Manager" -EnableInheritance
        $SVHZNClient2UAG = New-NsxService -name $SVHZNClient2UAGName -protocol $TCP -port $443 -description "Horizon 7 Horizon Client to Unified Access Gateway" -EnableInheritance
        $SVHZNPCOIPClient2UAGTCP = New-NsxService -name $SVHZNPCOIPClient2UAGTCPName -protocol $TCP -port $4172 -description "Horizon 7 PCoIP TCP Horizon Client to Unified Access Gateway" -EnableInheritance
        $SVHZNPCOIPClient2UAGUDP = New-NsxService -name $SVHZNPCOIPClient2UAGUDPName -protocol $TCP -port $4172 -description "Horizon 7 PCoIP UDP Horizon Client to Unified Access Gateway" -EnableInheritance
        $SVHZNBEClient2UAGTCP443 = New-NsxService -name $SVHZNBEClient2UAGTCP443Name -protocol $TCP -port $443 -description "Horizon 7 Blast Extreme TCP 443 Excellent Typical Horizon Client to Unified Access Gateway" -EnableInheritance
        $SVHZNBEClient2UAGTCP8443 = New-NsxService -name $SVHZNBEClient2UAGTCP8443Name -protocol $TCP -port $8443 -description "Horizon 7 Blast Extreme TCP 8443 Excellent Typical Horizon Client to Unified Access Gateway" -EnableInheritance
        $SVHZNBEClient2UAGUDP443 = New-NsxService -name $SVHZNBEClient2UAGUDP443Name -protocol $UDP -port $8443 -description "Horizon 7 Blast Extreme UDP 443 Poor Typical Horizon Client to Unified Access Gateway" -EnableInheritance
        $SVHZNBEClient2UAGUDP8443 = New-NsxService -name $SVHZNBEClient2UAGUDP8443Name -protocol $UDP -port $443 -description "Horizon 7 Blast Extreme UDP 8443 Poor Typical Horizon Client to Unified Access Gateway" -EnableInheritance
        $SVHZNBrowser2UAGHTML = New-NsxService -name $SVHZNBrowser2UAGHTMLName -protocol $TCP -port $443 -description "Horizon 7 Browser to Unified Access Gateway HTML Access" -EnableInheritance
        $SVHZNBrowser2UAGVIDM = New-NsxService -name $SVHZNBrowser2UAGVIDMName -protocol $TCP -port $443 -description "Horizon 7 Browser to Unified Access Gateway VIDM" -EnableInheritance
        $SVHZNClient2ConnServerTunnHTTPS = New-NsxService -name $SVHZNClient2ConnServerTunnHTTPSName -protocol $TCP -port $443 -description "Horizon 7 HTTPS Horizon Client to Connection Servers Tunneled" -EnableInheritance
        $SVHZNClient2ConnServerTunnHTTP = New-NsxService -name $SVHZNClient2ConnServerTunnHTTPName -protocol $TCP -port $80 -description "Horizon 7 HTTP Horizon Client to View Connection Servers Tunneled" -EnableInheritance
        $SVHZNBEClient2ConnServerTCP = New-NsxService -name $SVHZNBEClient2ConnServerTCPName -protocol $TCP -port $8443 -description "Horizon 7 Blast Extreme TCP Excellent Typical Horizon Client to View Connection Server" -EnableInheritance
        $SVHZNPCOIPClient2ConnServerTCP = New-NsxService -name $SVHZNPCOIPClient2ConnServerTCPName -protocol $TCP -port $4172 -description "Horizon 7 PCoIP TCP Horizon Client to View Connection Server" -EnableInheritance
        $SVHZNPCOIPClient2ConnServerUDP = New-NsxService -name $SVHZNPCOIPClient2ConnServerUDPName -protocol $UDP -port $4172 -description "Horizon 7 PCoIP UDP Horizon Client to View Connection Server" -EnableInheritance
        $SVHZNBrowser2AgentTunnHTML = New-NsxService -name $SVHZNBrowser2AgentTunnHTMLName -protocol $TCP -port $443 -description "Horizon 7 Browser to Horizon Agent HTML Access Tunneled" -EnableInheritance
        $SVHZNBrowser2VIDMTunn = New-NsxService -name $SVHZNBrowser2VIDMTunnName -protocol $TCP -port $443 -description "Horizon 7 Browser to VMware Identity Manager Tunneled" -EnableInheritance
        $SVHZNAgent2ConnServerEnhanced = New-NsxService -name $SVHZNAgent2ConnServerEnhancedName -protocol $TCP -port $4002 -description "Horizon 7 JMS Horizon Agent to Connection Server Enhanced" -EnableInheritance
        $SVHZNAgent2ConnServerLegacy = New-NsxService -name $SVHZNAgent2ConnServerLegacyName -protocol $TCP -port $4001 -description "Horizon 7 JMS Horizon Agent to Connection Server Legacy" -EnableInheritance
        $SVHZNAgent2V4HRMI = New-NsxService -name $SVHZNAgent2V4HRMIName -protocol $TCP -port $3091 -description "Horizon 7 Horizon Agent to V4H RMI" -EnableInheritance
        $SVHZNAgent2V4HDMS = New-NsxService -name $SVHZNAgent2V4HDMSName -protocol $TCP -port $3099 -description "Horizon 7 Horizon Agent to V4H Desktop Message Server" -EnableInheritance
        $SVAPPVAgent2APPVMGRSSL = New-NsxService -name $SVAPPVAgent2APPVMGRSSLName -protocol $TCP -port $443 -description "App Volumes Agent to App Volumes Manager SSL" -EnableInheritance
        $SVAPPVAgent2APPVMGRSTD = New-NsxService -name $SVAPPVAgent2APPVMGRSTDName -protocol $TCP -port $80 -description "App Volumes Agent to App Volumes Manager Standard" -EnableInheritance
        $SVUEMMGR2UEMFSSMB = New-NsxService -name $SVUEMMGR2UEMFSSMBName -protocol $TCP -port $445 -description "User Environment Manager to UEM File Servers SMB" -EnableInheritance
        $SVHZNBEConnServ2AgentTunn = New-NsxService -name $SVHZNBEConnServ2AgentTunnName -protocol $TCP -port $22443 -description "Horizon 7 Blast Extreme TCP View Connection Server to Horizon Agent Tunneled" -EnableInheritance
        $SVHZNPCOIPConnServ2AgentTunnTCP = New-NsxService -name $SVHZNPCOIPConnServ2AgentTunnTCPName -protocol $TCP -port $4172 -description "Horizon 7 PCoIP TCP View Connection Server to Horizon Agent Tunneled" -EnableInheritance
        $SVHZNPCOIPConnServ2AgentTunnUDP = New-NsxService -name $SVHZNPCOIPConnServ2AgentTunnUDPName -protocol $UDP -port $4172 -description "Horizon 7 PCoIP UDP View Connection Server to Horizon Agent Tunneled" -EnableInheritance
        $SVHZNRDPConnServer2AgentTunn = New-NsxService -name $SVHZNRDPConnServer2AgentTunnName -protocol $TCP -port $3389 -description "Horizon 7 RDP View Connection Server to Horizon Agent Tunneled" -EnableInheritance
        $SVHZNCDRMMRConnServer2AgentTunn = New-NsxService -name $SVHZNCDRMMRConnServer2AgentTunnName -protocol $TCP -port $9427 -description "Horizon 7 CDR MMR View Connection Server to Horizon Agent Tunneled" -EnableInheritance
        $SVHZNUSBClient2AgentUSBTunn = New-NsxService -name $SVHZNUSBClient2AgentUSBTunnName -protocol $TCP -port $32111 -description "Horizon 7 USB Horizon Client to Horizon Agent USB Redirection Tunneled" -EnableInheritance
        $SVHZNConnServer2vCenterSOAP = New-NsxService -name $SVHZNConnServer2vCenterSOAPName -protocol $TCP -port $433 -description "Horizon 7 HTTPS View Connection Server to vCenter Server SOAP" -EnableInheritance
        $SVHZNConnServer2CompSOAP = New-NsxService -name $SVHZNConnServer2CompSOAPName -protocol $TCP -port $18443 -description "Horizon 7 View Connection Server to View Composer SOAP" -EnableInheritance
        $SVHZNConnServer2ConnServerJMSLegacy = New-NsxService -name $SVHZNConnServer2ConnServerJMSLegacyName -protocol $TCP -port $4100 -description "Horizon 7 JMS View Connection Server to View Connection Server Legacy" -EnableInheritance
        $SVHZNConnServer2ConnServerJMSSSL = New-NsxService -name $SVHZNConnServer2ConnServerJMSSSLName -protocol $TCP -port $4101 -description "Horizon 7 JMS View Connection Server to View Connection Server SSL" -EnableInheritance
        $SVHZNCPALDAPREPL = New-NsxService -name $SVHZNCPALDAPREPLName -protocol $TCP -port $22389 -description "Horizon 7 CPA Global LDAP Replication" -EnableInheritance
        $SVHZNCPALDAPREPLSSL = New-NsxService -name $SVHZNCPALDAPREPLSSLName -protocol $TCP -port $22636 -description "Horizon 7 CPA Global LDAP Replication SSL" -EnableInheritance
        $SVHZCPAInterPodVIPA = New-NsxService -name $SVHZCPAInterPodVIPAName -protocol $TCP -port $8472 -description "Horizon 7 CPA Inter-Pod VIPA" -EnableInheritance
        $SVHZNConnServerInstallReplica = New-NsxService -name $SVHZNConnServerInstallReplicaName -protocol $TCP -port $32111 -description "Horizon 7 View Connection Server Install Replica" -EnableInheritance
        $SVHZNConnServer2Enrollment = New-NsxService -name $SVHZNConnServer2EnrollmentName -protocol $TCP -port $32111 -description "Horizon 7 View Connection Server to Enrollment Server View Framework" -EnableInheritance
        $SVHZNConnServer2VIDM = New-NsxService -name $SVHZNConnServer2VIDMName -protocol $TCP -port $443 -description "Horizon 7 View Connection Server to VMware Identity Manager Message Bus" -EnableInheritance
        $SVHZNConnServer2V4HRMI = New-NsxService -name $SVHZNConnServer2V4HRMIName -protocol $TCP -port $3901 -description "Horizon 7 View Connection Server to V4H RMI" -EnableInheritance
        $SVHZNConnServer2V4HBMS = New-NsxService -name $SVHZNConnServer2V4HBMSName -protocol $TCP -port $3101 -description "Horizon 7 View Connection Server to V4H Broker Message Server" -EnableInheritance
        $SVHZNConnServer2V4HCMS = New-NsxService -name $SVHZNConnServer2V4HCMSName -protocol $TCP -port $3100 -description "Horizon 7 View Connection Server to V4H Cert Management Server" -EnableInheritance
        $SVHZNConnServer22FAMGR = New-NsxService -name $SVHZNConnServer22FAMGRName -protocol $UDP -port $5500 -description "Horizon 7 Default View Connection Server to 2FA Manager  " -EnableInheritance
        $SVvCenter2ESXiSOAP = New-NsxService -name $SVvCenter2ESXiSOAPName -protocol $TCP -port $902 -description "vCenter Server to ESXi SOAP" -EnableInheritance
        $SVHZNComp2vCenterSOAP = New-NsxService -name $SVHZNComp2vCenterSOAPName -protocol $TCP -port $443 -description "Horion 7 View Composer to vCenter Server SOAP" -EnableInheritance
        $SVHZNComp2ESXiSOAP = New-NsxService -name $SVHZNComp2ESXiSOAPName -protocol $TCP -port $902 -description "Horizon 7 View Composer to ESXi SOAP" -EnableInheritance
        $SVHZNUAG2ConnServerLogin = New-NsxService -name $SVHZNUAG2ConnServerLoginName -protocol $TCP -port $443 -description "Horizon 7 Unified Access Gateway to View Connection Server Login" -EnableInheritance
        $SVHZNBEUAG2AgentTCP = New-NsxService -name $SVHZNBEUAG2AgentTCPName -protocol $TCP -port $22443 -description "Horizon 7 Unified Blast Extreme TCP Unified Access Gateway to Horizon Agent " -EnableInheritance
        $SVHZNBEUAG2AgentUDP = New-NsxService -name $SVHZNBEUAG2AgentUDPName -protocol $UDP -port $22443 -description "Horizon 7 Unified Blast Extreme UDP Unified Access Gateway to Horizon Agent " -EnableInheritance
        $SVHZNPCOIP2AgentTCP = New-NsxService -name $SVHZNPCOIP2AgentTCPName -protocol $TCP -port $4172 -description "Horizon 7 PCoIP TCP Unified Access Gateway to Horizon Agent" -EnableInheritance
        $SVHZNPCOIP2AgentUDP = New-NsxService -name $SVHZNPCOIP2AgentUDPName -protocol $UDP -port $4172 -description "Horizon 7 PCoIP UDP Unified Access Gateway to Horizon Agent" -EnableInheritance
        $SVHZNRDPUAG2Agent = New-NsxService -name $SVHZNRDPUAG2AgentName -protocol $TCP -port $3389 -description "Horizon 7 RDP Unified Access Gateway to Horizon Agent" -EnableInheritance
        $SVHZNCDRMMRUAG2Agent = New-NsxService -name $SVHZNCDRMMRUAG2AgentName -protocol $TCP -port $9427 -description "Horizon 7 CDR MMR Unified Access Gateway to Horizon Agent" -EnableInheritance
        $SVHZNUSBUAG2Agent = New-NsxService -name $SVHZNUSBUAG2AgentName -protocol $TCP -port $32111 -description "Horizon 7 USB Unified Acess Gateway to Horizon Agent USB Redirection" -EnableInheritance
        $SVHZNUAG2Agent = New-NsxService -name $SVHZNUAG2AgentName -protocol $TCP -port $443 -description "Horizon 7 Unified Access Gateway to Horizon Agent" -EnableInheritance
        $SVHZNUAG22FAMGR = New-NsxService -name $SVHZNUAG22FAMGRName -protocol $UDP -port $5500 -description "Horizon 7 Default Unified Access Gateway to 2FA " -EnableInheritance
        $SVHZNVIDM2ConnServerLDAP = New-NsxService -name $SVHZNVIDM2ConnServerLDAPName -protocol $TCP -port $389 -description "Horizon 7 LDAP VMware Identity Manager to View Connection Server" -EnableInheritance
        $SVHZNVIDM2ConnServerHTTPS = New-NsxService -name $SVHZNVIDM2ConnServerHTTPSName -protocol $TCP -port $443 -description "Horizon 7 HTTPS VMware Identity Manager to View Connection Server " -EnableInheritance
        $SVHZNVIDM2VIDMHTTPS = New-NsxService -name $SVHZNVIDM2VIDMHTTPSName -protocol $TCP -port $443 -description "Horizon 7 HTTPS VMware Identity Manager to VMware Identity Manager" -EnableInheritance
        $SVHZNVIDM2VIDMAudit = New-NsxService -name $SVHZNVIDM2VIDMAuditName -protocol $TCP -port $9300-9400 -description "Horizon 7 VMware Identity Manager to VMware Identity Manager Audit" -EnableInheritance
        $SVHZNVIDM2SMTP = New-NsxService -name $SVHZNVIDM2SMTPName -protocol $TCP -port $25 -description "Horizon 7 VMware Identity Manager to SMTP Server" -EnableInheritance
        $SVHZNVIDM2DCLDAP = New-NsxService -name $SVHZNVIDM2DCLDAPName -protocol $TCP -port $389 -description "Horizon 7 LDAP VMware Identity Manager to Domain Controller" -EnableInheritance
        $SVHZNVIDM2DCKerberosTCP = New-NsxService -name $SVHZNVIDM2DCKerberosTCPName -protocol $TCP -port $88 -description "Horizon 7 Kerberos TCP VMware Identity Manager to Domain Controller" -EnableInheritance
        $SVHZNVIDM2DCKerberosUDP = New-NsxService -name $SVHZNVIDM2DCKerberosUDPName -protocol $UDP -port $88 -description "Horizon 7 Kerberos UDP VMware Identity Manager to Domain Controller" -EnableInheritance
        $SVHZNVIDM2DCKerberosPWDTCP = New-NsxService -name $SVHZNVIDM2DCKerberosPWDTCPName -protocol $TCP -port $464 -description "Horizon 7 TCP Kerberos PWD VMware Identity Manager to Domain Controller" -EnableInheritance
        $SVHZNVIDM2DCKerberosPWDUDP = New-NsxService -name $SVHZNVIDM2DCKerberosPWDUDPName -protocol $UDP -port $464 -description "Horizon 7 UDP Kerberos PWD VMware Identity Manager to Domain Controller" -EnableInheritance
        $SVHZNVIDM2DCRPC = New-NsxService -name $SVHZNVIDM2DCRPCName -protocol $TCP -port $135 -description "Horizon 7 RPC VMware Identity Manager to Domain Controller" -EnableInheritance
        $SVHZNVIDM2DNSTCP = New-NsxService -name $SVHZNVIDM2DNSTCPName -protocol $TCP -port $53 -description "Horizon 7 DNS TCP VMware Identity Manager to DNS Server" -EnableInheritance
        $SVHZNVIDM2DNSUDP = New-NsxService -name $SVHZNVIDM2DNSUDPName -protocol $UDP -port $53 -description "Horizon 7 DNS UDP VMware Identity Manager to DNS Server" -EnableInheritance
        $SVHZNVIDM2CTXBSTD = New-NsxService -name $SVHZNVIDM2CTXBSTDName -protocol $TCP -port $80 -description "VMware Identity Manager to Citrix integration Broker Standard" -EnableInheritance
        $SVHZNVIDM2CTXSSL = New-NsxService -name $SVHZNVIDM2CTXSSLName -protocol $TCP -port $443 -description "VMware Identity Manager to Citrix integration Broker SSL" -EnableInheritance
        $SVHZNVIDM2ThinAppFSSMB = New-NsxService -name $SVHZNVIDM2ThinAppFSSMBName -protocol $TCP -port $445 -description "VMware Identity Manger to ThinApp File Servers SMB" -EnableInheritance
        $SVHZNVIDM2UpgradeServer = New-NsxService -name $SVHZNVIDM2UpgradeServerName -protocol $TCP -port $443 -description "VMware Identity Manager to Upgrade Server" -EnableInheritance
        $SVHZNVIDM22FAMGR = New-NsxService -name $SVHZNVIDM22FAMGRName -protocol $UDP -port $5500 -description "VMware Identity Manager Default to 2FA Manager" -EnableInheritance
        $SVHZNVIDM2AirWatchRESTAPI = New-NsxService -name $SVHZNVIDM2AirWatchRESTAPIName -protocol $TCP -port $443 -description "VMware Identity Manager to VMware AirWatch REST API" -EnableInheritance
        $SVHZNVIDM2MSSQL = New-NsxService -name $SVHZNVIDM2MSSQLName -protocol $TCP -port $1433 -description "VMware Identity Manager to External MSSQL" -EnableInheritance
        $SVHZNVIDM2PostgreSQL = New-NsxService -name $SVHZNVIDM2PostgreSQLName -protocol $TCP -port $5432 -description "VMware Identity Manager to Extenal PostgreSQL" -EnableInheritance
        $SVHZNVIDM2Oracle = New-NsxService -name $SVHZNVIDM2OracleName -protocol $TCP -port $1521 -description "VMware Identity Manager to External Oracle" -EnableInheritance
        $SVHZNAPPVMGR2vCenterSOAP = New-NsxService -name $SVHZNAPPVMGR2vCenterSOAPName -protocol $TCP -port $443 -description "App Volumes Manager to vCenter Server SOAP" -EnableInheritance
        $SVHZNAPPVMGR2ESXi = New-NsxService -name $SVHZNAPPVMGR2ESXiName -protocol $TCP -port $443 -description "App Volumes Manager to ESXi Hostd" -EnableInheritance
        $SVHZNAPPVMGR2MSSQL = New-NsxService -name $SVHZNAPPVMGR2MSSQLName -protocol $TCP -port $1433 -description "App Volumes Manager Default to MSSQL" -EnableInheritance
        $SVV4H2ConnServerRMI = New-NsxService -name $SVV4H2ConnServerRMIName -protocol $TCP -port $3091 -description "V4H to View Connection Server RMI" -EnableInheritance
        $SVV4H2ConnServerBMS = New-NsxService -name $SVV4H2ConnServerBMSName -protocol $TCP -port $3101 -description "V4H to View Connection Server Broker Message Server" -EnableInheritance
        $SVV4H2ConnServerCMS = New-NsxService -name $SVV4H2ConnServerCMSName -protocol $TCP -port $3100 -description "V4H to View Connection Server Cert Management Server" -EnableInheritance
        $SVV4H2AgentRMI = New-NsxService -name $SVV4H2AgentRMIName -protocol $TCP -port $3901 -description "V4H to Horizon Agent RMI" -EnableInheritance
        $SVV4H2AgentDMS = New-NsxService -name $SVV4H2AgentDMSName -protocol $TCP -port $3909 -description "V4H to Horizon Agent Desktop Message Server" -EnableInheritance
        $SVV4H2UAGMonitor = New-NsxService -name $SVV4H2UAGMonitorName -protocol $TCP -port $9443 -description "V4H to Unified Access Gateway Monitoring" -EnableInheritance
        $SVV4H2APPVMGRMonitor = New-NsxService -name $SVV4H2APPVMGRMonitorName -protocol $TCP -port $443 -description "V4H to App Volumes Manager Monitoring" -EnableInheritance
        $SVHZNAdmin2ConnServer = New-NsxService -name $SVHZNAdmin2ConnServerName -protocol $TCP -port $443 -description "Horizon 7 Admin Console to View Connection Server" -EnableInheritance
        $SVHZNAdmin2vCenter = New-NsxService -name $SVHZNAdmin2vCenterName -protocol $TCP -port $443 -description "Horizon 7 Admin Console to vCenter Server" -EnableInheritance
        $SVHZNAdmin2APPVMGR = New-NsxService -name $SVHZNAdmin2APPVMGRName -protocol $TCP -port $443 -description "Horizon 7 Admin Console to App Volumes Manager" -EnableInheritance
        $SVHZNAdmin2VIDM = New-NsxService -name $SVHZNAdmin2VIDMName -protocol $TCP -port $8443 -description "Horizon 7 Admin Console to VMware Identity Manager" -EnableInheritance
        $SVHZNAdmin2V4H = New-NsxService -name $SVHZNAdmin2V4HName -protocol $TCP -port $443 -description "Horizon 7 Admin Console to V4H" -EnableInheritance
        $SVHZNAdmin2UAG = New-NsxService -name $SVHZNAdmin2UAGName -protocol $TCP -port $9443 -description "Horizon 7 Admin Console to Unified Access Gateway" -EnableInheritance
    
        #Build New Service Groups
   
        #Build Firewall Rules
        #$FWRInterDesktopFWRuleName = "Inter Desktop FW Rule"
        #$FWRInterDesktopFWRule = Get-NsxFirewallRule -Name $FWRInterDesktopFWRuleName
        #if (!$FWRInterDesktopFWRule)
        #{
        #  $FWRInterDesktopFWRule = Get-NsxFirewallSection $SNHorizonDesktopBlockSectionName | New-NsxFirewallRule -name $InterDesktopFWRule -action deny -Direction inout -Source $SGHorizonViewDesktops -Destination $SGHorizonViewDesktops -EnableLogging -AppliedTo $SGHorizonViewDesktops
        #  }
  
        
        $RNHZNClient2ConnServerName = "Internal - Horizon Client to View Connection Server",
        $RNHZNClient2AgentName = "Internal - Horizon Client to Horizon Agent",
        $RNHZNBrowser2AgentHTMLName = "Internal - Browser to Horizon Agent HTML",
        $RNHZNBrowser2VIDMName = "Internal - Browser to vIDM",
        $RNHZNClient2UAGName = "External - Horizon Client to UAG",
        $RNHZNBrowser2UAGHTMLName = "External - Browser to UAG HTML",
        $RNHZNBrowser2UAGVIDMName = "External - Browser to UAG VIDM",
        $RNHZNClient2ConnServerTunnName = "Tunneled - Horizon Client to View Connection Server HTTPS",
        $RNHZNBrowser2AgentTunnName = "Tunneled - Browser to View Connection Server",
        $RNHZNBrowser2VIDMTunnName = "Tunneled - Browser to VIDM",
        $RNHZNAgent2ConnServerName = "Desktops - Horizon Agent to View Connection Server JMS",
        $RNHZNAgent2V4HName = "Desktops - Horizon Agent to V4H",
        $RNAPPVAgent2APPVMGRName = "Desktops - App Volumes Agent to App Volumes Manager",
        $RNUEMMGR2UEMFSSMBName = "Desktops - UEM Flex Engine to UEM File Servers",
        $RNHZNConnServ2AgentTunnName = "Infrastructure - View Connection Server to Horizon Agent Tunneled",
        $RNHZNConnServer2vCenterName = "Infrastructure - View Connection Server to vCenter Server",
        $RNHZNConnServer2CompName = "Infrastructure - View Connection Server to View Composer",
        $RNHZNConnServer2ConnServerName = "Infrastructure - View Connection Server to View Connection Server",
        $RNHZNConnServer2EnrollmentName = "Infrastructure - View Connection Server to Enrollment Server",
        $RNHZNConnServer2VIDMName = "Infrastructure - View Connection Server to VIDM",
        $RNHZNConnServer2V4HName = "Infrastructure - View Connection Server to V4H",
        $RNHZNConnServer22FAMGRName = "Infrastructure - View Connection Server to 2FA Manager",
        $RNvCenter2ESXiName = "Infrastructure - vCenter Server to ESXi",
        $RNHZNComp2vCenterName = "Infrastructure - View Composer to vCenter Server",
        $RNHZNComp2ESXiName = "Infrastructure - View Composer to ESXi",
        $RNHZNUAG2ConnServerName = "Infrastructure - UAG to View Connection Server",
        $RNHZNUAG2AgentName = "Infrastructure - UAG to Horizon Agent",
        $RNHZNVIDM2ConnServerName = "Infrastructure - VIDM to View Connection Server",
        $RNHZNVIDM2VIDMName = "Infrastructure - VIDM to VIDM",
        $RNHZNVIDM2SMTPName = "Infrastructure - VIDM to SMTP Server",
        $RNHZNVIDM2DCName = "Infrastructure - VIDM to Domain Controller",
        $RNHZNVIDM2DNSName = "Infrastructure - VIDM to DNS",
        $RNHZNVIDM2CTXBName = "Infrastructure - VIDM to Citrix Integration",
        $RNHZNVIDM2ThinAppFSName = "Infrastructure - VIDM to ThinApp FS",
        $RNHZNVIDM2UpgradeServerName = "Infrastructure - VIDM to Upgrade Server",
        $RNHZNVIDM22FAMGRName = "Infrastructure - VIDM to 2FA Manager",
        $RNHZNVIDM2AirWatchName = "Infrastructure - VIDM to AirWatch",
        $RNHZNVIDM2Name = "Infrastructure - VIDM to External DB",
        $RNHZNAPPVMGR2vCenterName = "Infrastructure - App Volumes Manager to vCenter Server",
        $RNHZNAPPVMGR2ESXiName = "Infrastructure - App Volumes Manager to ESXi",
        $RNHZNAPPVMGR2Name = "Infrastructure - App Volumes Manager to External DB",
        $RNV4H2ConnServerName = "Infrastructure - V4H to View Connection Server",
        $RNV4H2AgentName = "Infrastrucutre - V4H to Horizon Agent",
        $RNV4H2UAGMonitorName = "Infrastructure - V4H to UAG Monitoring",
        $RNV4H2APPVMGRMonitorName = "Infrastructure - V4H to App Volumes Manager Monitoring",
        $RNHZNAdmin2Name = "Management - Admin Console to Conn Server, vCenter, AppV Mgr, V4H",
        $RNHZNAdmin2UAGName = "Management - Admin Console to UAG",
        $RNHZNAdmin2VIDMName = "Management - Admin Console to VIDM"

