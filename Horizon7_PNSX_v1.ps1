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
        $SGHZN7vCenterMGMTName = "SG-Horizon7-vCenterMgmt",
        $SGHZN7vCenterVDI_RDSHName = "SG-Horizon7-vCenterVDI_RDSH",
        $SGHZN7UEM_FSName = "SG-Horizon7-UEM_FS",
        $SGHZN7UEM_MgrName = "SG-Horizon7-UEM_Mgr",
        $SGHZN7ComposerName = "SG-Horizon7-Composer",
        $SGHZN7DomainCtrlName = "SG-Horizon7-DomainCtrl",
        $SGHZN7DNSName = "SG-Horizon7-DNS",
        $SGHZN7SMTPName = "SG-Horizon7-SMTP",
        $SGHZN7CitrixName = "SG-Horizon7-Citrix",
        $SGHZN7ThinApp_FSName = "SG-Horizon7-ThinApp_FS",
        $SGHZN72FAName = "SG-Horizon7-2FA",
        $SGHZN7AirWatchName = "SG-Horizon7-AirWatch",
        $SGHZN7V4HName = "SG-Horizon7-V4H",
        $SGHZN7AdminConsoleName = "SG-Horizon7-AdminConsole",
        $SGHZN7DatabaseName = "SG-Horizon7-Database",
        
        #Security Tags
        $STHZN7ClientName = "ST-Horizon7Client",
        $STHZN7ConnServerName = "ST-Horizon7ConnServer",
        $STHZN7vIDMName = "ST-Horizon7vIDM",
        $STHZN7UAGName = "ST-Horizon7UAG",
        $STHZN7VDIName = "ST-Horizon7VDI",
        $STHZN7RDSHostName = "ST-Horizon7RDSHost",
        $STHZN7EnrollServerName = "ST-Horizon7EnrollServer",
        $STHZN7AppVolMgrName = "ST-Horizon7AppVolMgr",
        $STHZN7vCenterMGMTName = "ST-Horizon7-vCenterMgmt",
        $STHZN7vCenterVDI_RDSHName = "ST-Horizon7-vCenterVDI_RDSH",
        $STHZN7UEM_FSName = "ST-Horizon7-UEM_FS",
        $STHZN7UEM_MgrName = "ST-Horizon7-UEM_Mgr",
        $STHZN7ComposerName = "ST-Horizon7-Composer",
        $STHZN7DomainCtrlName = "ST-Horizon7-DomainCtrl",
        $STHZN7DNSName = "ST-Horizon7-DNS",
        $STHZN7SMTPName = "ST-Horizon7-SMTP",
        $STHZN7CitrixName = "ST-Horizon7-Citrix",
        $STHZN7ThinApp_FSName = "ST-Horizon7-ThinApp_FS",
        $STHZN72FAName = "ST-Horizon7-2FA",
        $STHZN7AirWatchName = "ST-Horizon7-AirWatch",
        $STHZN7V4HName = "ST-Horizon7-V4H",
        $STHZN7AdminConsole = "ST-Horizon7-AdminConsole",
        $STHZN7Database = "ST-Horizon7-Database",
        
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
        $SNHZN7InfraMgmtSectionName = "Horizon 7 Infrastructure - Management",
    
        #DFW Rule Names
        
        $RNHZN7Client2ConnServerName = "Internal - Horizon Client to View Connection Server",
        $RNHZN7Client2AgentName = "Internal - Horizon Client to Horizon Agent",
        $RNHZN7Browser2AgentHTMLName = "Internal - Browser to Horizon Agent HTML",
        $RNHZN7Browser2VIDMName = "Internal - Browser to vIDM",
        $RNHZN7Client2UAGName = "External - Horizon Client to UAG",
        $RNHZN7Browser2UAGHTMLName = "External - Browser to UAG HTML",
        $RNHZN7Browser2UAGVIDMName = "External - Browser to UAG VIDM",
        $RNHZN7Client2ConnServerTunnName = "Tunneled - Horizon Client to View Connection Server HTTPS",
        $RNHZN7Browser2AgentTunnName = "Tunneled - Browser to View Connection Server",
        $RNHZN7Browser2VIDMTunnName = "Tunneled - Browser to VIDM",
        $RNHZN7Agent2ConnServerName = "Desktops - Horizon Agent to View Connection Server JMS",
        $RNHZN7Agent2V4HName = "Desktops - Horizon Agent to V4H",
        $RNAPPVAgent2APPVMGRName = "Desktops - App Volumes Agent to App Volumes Manager",
        $RNUEMMGR2UEMFSSMBName = "Desktops - UEM Flex Engine to UEM File Servers",
        $RNHZN7ConnServ2AgentTunnName = "Infrastructure - View Connection Server to Horizon Agent Tunneled",
        $RNHZN7ConnServer2vCenterName = "Infrastructure - View Connection Server to vCenter Server",
        $RNHZN7ConnServer2CompName = "Infrastructure - View Connection Server to View Composer",
        $RNHZN7ConnServer2ConnServerName = "Infrastructure - View Connection Server to View Connection Server",
        $RNHZN7ConnServer2EnrollmentName = "Infrastructure - View Connection Server to Enrollment Server",
        $RNHZN7ConnServer2VIDMName = "Infrastructure - View Connection Server to VIDM",
        $RNHZN7ConnServer2V4HName = "Infrastructure - View Connection Server to V4H",
        $RNHZN7ConnServer22FAMGRName = "Infrastructure - View Connection Server to 2FA Manager",
        $RNvCenter2ESXiName = "Infrastructure - vCenter Server to ESXi",
        $RNHZN7Comp2vCenterName = "Infrastructure - View Composer to vCenter Server",
        $RNHZN7Comp2ESXiName = "Infrastructure - View Composer to ESXi",
        $RNHZN7UAG2ConnServerName = "Infrastructure - UAG to View Connection Server",
        $RNHZN7UAG2AgentName = "Infrastructure - UAG to Horizon Agent",
        $RNHZN7VIDM2ConnServerName = "Infrastructure - VIDM to View Connection Server",
        $RNHZN7VIDM2VIDMName = "Infrastructure - VIDM to VIDM",
        $RNHZN7VIDM2SMTPName = "Infrastructure - VIDM to SMTP Server",
        $RNHZN7VIDM2DCName = "Infrastructure - VIDM to Domain Controller",
        $RNHZN7VIDM2DNSName = "Infrastructure - VIDM to DNS",
        $RNHZN7VIDM2CTXBName = "Infrastructure - VIDM to Citrix Integration",
        $RNHZN7VIDM2ThinAppFSName = "Infrastructure - VIDM to ThinApp FS",
        $RNHZN7VIDM2UpgradeServerName = "Infrastructure - VIDM to Upgrade Server",
        $RNHZN7VIDM22FAMGRName = "Infrastructure - VIDM to 2FA Manager",
        $RNHZN7VIDM2AirWatchName = "Infrastructure - VIDM to AirWatch",
        $RNHZN7VIDM2Name = "Infrastructure - VIDM to External DB",
        $RNHZN7APPVMGR2vCenterName = "Infrastructure - App Volumes Manager to vCenter Server",
        $RNHZN7APPVMGR2ESXiName = "Infrastructure - App Volumes Manager to ESXi",
        $RNHZN7APPVMGR2Name = "Infrastructure - App Volumes Manager to External DB",
        $RNV4H72ConnServerName = "Infrastructure - V4H to View Connection Server",
        $RNV4H72AgentName = "Infrastrucutre - V4H to Horizon Agent",
        $RNV4H72UAGMonitorName = "Infrastructure - V4H to UAG Monitoring",
        $RNV4H72APPVMGRMonitorName = "Infrastructure - V4H to App Volumes Manager Monitoring",
        $RNHZN7Admin2Name = "Management - Admin Console to Conn Server, vCenter, AppV Mgr, V4H",
        $RNHZN7Admin2UAGName = "Management - Admin Console to UAG",
        $RNHZN7Admin2VIDMName = "Management - Admin Console to VIDM",
        
        #Service Names

        $SVHZN7Client2ConnServerHTTPName = "Horizon 7 HTTP Horizon Client to View Connection Servers Standard",
        $SVHZN7Client2ConnServerHTTPSName = "Horizon 7 HTTPS Horizon Client to View Connection Servers SSL",
        $SVHZN7BEClient2AgentTCPName = "Horizon 7 Blast Extreme TCP Excellent Typical Horizon Client to Horizon Agent",
        $SVHZN7BEClient2AgentUDPName = "Horizon 7 Blast Extreme UDP Typical Horizon Client to Horizon Agent",
        $SVHZN7PCOIPClient2AgentTCPName = "Horizon 7 PCoIP TCP Horizon Client to Horizon Agent",
        $SVHZN7PCOIPClient2AgentUDPName = "Horizon 7 PCoIP UDP Horizon Client to Horizon Agent",
        $SVHZN7RDPClient2AgentName = "Horizon 7 RDP Horizon Client to Horizon Agent",
        $SVHZN7CDRMMRClient2AgentName = "Horizon 7 CDR MMR Horizon Client to Horizon Agent",
        $SVHZN7USBClient2AgentName = "Horizon 7 USB Horizon Client to Horizon Agent USB Redirection",
        $SVHZN7Browser2AgentHTMLName = "Horizon 7 Browser to Horizon Agent HTML Access",
        $SVHZN7Browser2VIDMName = "Horizon 7 Browser to VMware Identity Manager",
        $SVHZN7Client2UAGName = "Horizon 7 Horizon Client to Unified Access Gateway",
        $SVHZN7PCOIPClient2UAGTCPName = "Horizon 7 PCoIP TCP Horizon Client to Unified Access Gateway",
        $SVHZN7PCOIPClient2UAGUDPName = "Horizon 7 PCoIP UDP Horizon Client to Unified Access Gateway",
        $SVHZN7BEClient2UAGTCP443Name = "Horizon 7 Blast Extreme TCP 443 Excellent Typical Horizon Client to Unified Access Gateway",
        $SVHZN7BEClient2UAGTCP8443Name = "Horizon 7 Blast Extreme TCP 8443 Excellent Typical Horizon Client to Unified Access Gateway",
        $SVHZN7BEClient2UAGUDP443Name = "Horizon 7 Blast Extreme UDP 443 Poor Typical Horizon Client to Unified Access Gateway",
        $SVHZN7BEClient2UAGUDP8443Name = "Horizon 7 Blast Extreme UDP 8443 Poor Typical Horizon Client to Unified Access Gateway",
        $SVHZN7Browser2UAGHTMLName = "Horizon 7 Browser to Unified Access Gateway HTML Access",
        $SVHZN7Browser2UAGVIDMName = "Horizon 7 Browser to Unified Access Gateway VIDM",
        $SVHZN7Client2ConnServerTunnHTTPSName = "Horizon 7 HTTPS Horizon Client to Connection Servers Tunneled",
        $SVHZN7Client2ConnServerTunnHTTPName = "Horizon 7 HTTP Horizon Client to View Connection Servers Tunneled",
        $SVHZN7BEClient2ConnServerTCPName = "Horizon 7 Blast Extreme TCP Excellent Typical Horizon Client to View Connection Server",
        $SVHZN7PCOIPClient2ConnServerTCPName = "Horizon 7 PCoIP TCP Horizon Client to View Connection Server",
        $SVHZN7PCOIPClient2ConnServerUDPName = "Horizon 7 PCoIP UDP Horizon Client to View Connection Server",
        $SVHZN7Browser2AgentTunnHTMLName = "Horizon 7 Browser to Horizon Agent HTML Access Tunneled",
        $SVHZN7Browser2VIDMTunnName = "Horizon 7 Browser to VMware Identity Manager Tunneled",
        $SVHZN7Agent2ConnServerEnhancedName = "Horizon 7 JMS Horizon Agent to Connection Server Enhanced",
        $SVHZN7Agent2ConnServerLegacyName = "Horizon 7 JMS Horizon Agent to Connection Server Legacy",
        $SVHZN7Agent2V4HRMIName = "Horizon 7 Horizon Agent to V4H RMI",
        $SVHZN7Agent2V4HDMSName = "Horizon 7 Horizon Agent to V4H Desktop Message Server",
        $SVAPPVAgent2APPVMGRSSLName = "App Volumes Agent to App Volumes Manager SSL",
        $SVAPPVAgent2APPVMGRSTDName = "App Volumes Agent to App Volumes Manager Standard",
        $SVUEMMGR2UEMFSSMBName = "User Environment Manager to UEM File Servers SMB",
        $SVHZN7BEConnServ2AgentTunnName = "Horizon 7 Blast Extreme TCP View Connection Server to Horizon Agent Tunneled",
        $SVHZN7PCOIPConnServ2AgentTunnTCPName = "Horizon 7 PCoIP TCP View Connection Server to Horizon Agent Tunneled",
        $SVHZN7PCOIPConnServ2AgentTunnUDPName = "Horizon 7 PCoIP UDP View Connection Server to Horizon Agent Tunneled",
        $SVHZN7RDPConnServer2AgentTunnName = "Horizon 7 RDP View Connection Server to Horizon Agent Tunneled",
        $SVHZN7CDRMMRConnServer2AgentTunnName = "Horizon 7 CDR MMR View Connection Server to Horizon Agent Tunneled",
        $SVHZN7USBClient2AgentUSBTunnName = "Horizon 7 USB Horizon Client to Horizon Agent USB Redirection Tunneled",
        $SVHZN7ConnServer2vCenterSOAPName = "Horizon 7 HTTPS View Connection Server to vCenter Server SOAP",
        $SVHZN7ConnServer2CompSOAPName = "Horizon 7 View Connection Server to View Composer SOAP",
        $SVHZN7ConnServer2ConnServerJMSLegacyName = "Horizon 7 JMS View Connection Server to View Connection Server Legacy",
        $SVHZN7ConnServer2ConnServerJMSSSLName = "Horizon 7 JMS View Connection Server to View Connection Server SSL",
        $SVHZN7CPALDAPREPLName = "Horizon 7 CPA Global LDAP Replication",
        $SVHZN7CPALDAPREPLSSLName = "Horizon 7 CPA Global LDAP Replication SSL",
        $SVHZN7CPAInterPodVIPAName = "Horizon 7 CPA Inter-Pod VIPA",
        $SVHZN7ConnServerInstallReplicaName = "Horizon 7 View Connection Server Install Replica",
        $SVHZN7ConnServer2EnrollmentName = "Horizon 7 View Connection Server to Enrollment Server View Framework",
        $SVHZN7ConnServer2VIDMName = "Horizon 7 View Connection Server to VMware Identity Manager Message Bus",
        $SVHZN7ConnServer2V4HRMIName = "Horizon 7 View Connection Server to V4H RMI",
        $SVHZN7ConnServer2V4HBMSName = "Horizon 7 View Connection Server to V4H Broker Message Server",
        $SVHZN7ConnServer2V4HCMSName = "Horizon 7 View Connection Server to V4H Cert Management Server",
        $SVHZN7ConnServer22FAMGRName = "Horizon 7 Default View Connection Server to 2FA Manager",
        $SVvCenter2ESXiSOAPName = "vCenter Server to ESXi SOAP",
        $SVHZN7Comp2vCenterSOAPName = "Horion 7 View Composer to vCenter Server SOAP",
        $SVHZN7Comp2ESXiSOAPName = "Horizon 7 View Composer to ESXi SOAP",
        $SVHZN7UAG2ConnServerLoginName = "Horizon 7 Unified Access Gateway to View Connection Server Login",
        $SVHZN7BEUAG2AgentTCPName = "Horizon 7 Unified Blast Extreme TCP Unified Access Gateway to Horizon Agent",
        $SVHZN7BEUAG2AgentUDPName = "Horizon 7 Unified Blast Extreme UDP Unified Access Gateway to Horizon Agent",
        $SVHZN7PCOIP2AgentTCPName = "Horizon 7 PCoIP TCP Unified Access Gateway to Horizon Agent",
        $SVHZN7PCOIP2AgentUDPName = "Horizon 7 PCoIP UDP Unified Access Gateway to Horizon Agent",
        $SVHZN7RDPUAG2AgentName = "Horizon 7 RDP Unified Access Gateway to Horizon Agent",
        $SVHZN7CDRMMRUAG2AgentName = "Horizon 7 CDR MMR Unified Access Gateway to Horizon Agent",
        $SVHZN7USBUAG2AgentName = "Horizon 7 USB Unified Acess Gateway to Horizon Agent USB Redirection",
        $SVHZN7UAG2AgentName = "Horizon 7 Unified Access Gateway to Horizon Agent",
        $SVHZN7UAG22FAMGRName = "Horizon 7 Default Unified Access Gateway to 2FA",
        $SVHZN7VIDM2ConnServerLDAPName = "Horizon 7 LDAP VMware Identity Manager to View Connection Server",
        $SVHZN7VIDM2ConnServerHTTPSName = "Horizon 7 HTTPS VMware Identity Manager to View Connection Server",
        $SVHZN7VIDM2VIDMHTTPSName = "Horizon 7 HTTPS VMware Identity Manager to VMware Identity Manager",
        $SVHZN7VIDM2VIDMAuditName = "Horizon 7 VMware Identity Manager to VMware Identity Manager Audit",
        $SVHZN7VIDM2SMTPName = "Horizon 7 VMware Identity Manager to SMTP Server",
        $SVHZN7VIDM2DCLDAPName = "Horizon 7 LDAP VMware Identity Manager to Domain Controller",
        $SVHZN7VIDM2DCKerberosTCPName = "Horizon 7 Kerberos TCP VMware Identity Manager to Domain Controller",
        $SVHZN7VIDM2DCKerberosUDPName = "Horizon 7 Kerberos UDP VMware Identity Manager to Domain Controller",
        $SVHZN7VIDM2DCKerberosPWDTCPName = "Horizon 7 TCP Kerberos PWD VMware Identity Manager to Domain Controller",
        $SVHZN7VIDM2DCKerberosPWDUDPName = "Horizon 7 UDP Kerberos PWD VMware Identity Manager to Domain Controller",
        $SVHZN7VIDM2DCRPCName = "Horizon 7 RPC VMware Identity Manager to Domain Controller",
        $SVHZN7VIDM2DNSTCPName = "Horizon 7 DNS TCP VMware Identity Manager to DNS Server",
        $SVHZN7VIDM2DNSUDPName = "Horizon 7 DNS UDP VMware Identity Manager to DNS Server",
        $SVHZN7VIDM2CTXBSTDName = "VMware Identity Manager to Citrix integration Broker Standard",
        $SVHZN7VIDM2CTXSSLName = "VMware Identity Manager to Citrix integration Broker SSL",
        $SVHZN7VIDM2ThinAppFSSMBName = "VMware Identity Manger to ThinApp File Servers SMB",
        $SVHZN7VIDM2UpgradeServerName = "VMware Identity Manager to Upgrade Server",
        $SVHZN7VIDM22FAMGRName = "VMware Identity Manager Default to 2FA Manager",
        $SVHZN7VIDM2AirWatchRESTAPIName = "VMware Identity Manager to VMware AirWatch REST API",
        $SVHZN7VIDM2MSSQLName = "VMware Identity Manager to External MSSQL",
        $SVHZN7VIDM2PostgreSQLName = "VMware Identity Manager to Extenal PostgreSQL",
        $SVHZN7VIDM2OracleName = "VMware Identity Manager to External Oracle",
        $SVHZN7APPVMGR2vCenterSOAPName = "App Volumes Manager to vCenter Server SOAP",
        $SVHZN7APPVMGR2ESXiName = "App Volumes Manager to ESXi Hostd",
        $SVHZN7APPVMGR2MSSQLName = "App Volumes Manager Default to MSSQL",
        $SVV4H2ConnServerRMIName = "V4H to View Connection Server RMI",
        $SVV4H2ConnServerBMSName = "V4H to View Connection Server Broker Message Server",
        $SVV4H2ConnServerCMSName = "V4H to View Connection Server Cert Management Server",
        $SVV4H2AgentRMIName = "V4H to Horizon Agent RMI",
        $SVV4H2AgentDMSName = "V4H to Horizon Agent Desktop Message Server",
        $SVV4H2UAGMonitorName = "V4H to Unified Access Gateway Monitoring",
        $SVV4H2APPVMGRMonitorName = "V4H to App Volumes Manager Monitoring",
        $SVHZN7Admin2ConnServerName = "Horizon 7 Admin Console to View Connection Server",
        $SVHZN7Admin2vCenterName = "Horizon 7 Admin Console to vCenter Server",
        $SVHZN7Admin2APPVMGRName = "Horizon 7 Admin Console to App Volumes Manager",
        $SVHZN7Admin2VIDMName = "Horizon 7 Admin Console to VMware Identity Manager",
        $SVHZN7Admin2V4HName = "Horizon 7 Admin Console to V4H",
        $SVHZN7Admin2UAGName = "Horizon 7 Admin Console to Unified Access Gateway"

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
        "ST-Horizon7-AdminConsole",
        "ST-Horizon7-Database"
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
        $SGHZN7vCenterMGMT = New-NsxSecurityGroup -name $SGHZN7vCenterMGMTName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7vCenterMGMTName)
        $SGHZN7vCenterVDI_RDSH = New-NsxSecurityGroup -name $SGHZN7vCenterVDI_RDSHName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7vCenterVDI_RDSHName)
        $SGHZN7UEM_FS = New-NsxSecurityGroup -name $SGHZN7UEM_FSName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7UEM_FSName)
        $SGHZN7UEM_Mgr = New-NsxSecurityGroup -name $SGHZN7UEM_MgrName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7UEM_MgrName)
        $SGHZN7Composer = New-NsxSecurityGroup -name $SGHZN7ComposerName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7ComposerName)
        $SGHZN7DomainCtrl = New-NsxSecurityGroup -name $SGHZN7DomainCtrlName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7DomainCtrlName)
        $SGHZN7DNS = New-NsxSecurityGroup -name $SGHZN7DNSName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7DNSName)
        $SGHZN7SMTP = New-NsxSecurityGroup -name $SGHZN7SMTPName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7SMTPName)
        $SGHZN7Citrix = New-NsxSecurityGroup -name $SGHZN7CitrixName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7CitrixName)
        $SGHZN7ThinApp_FS = New-NsxSecurityGroup -name $SGHZN7ThinApp_FSName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7ThinApp_FSName)
        $SGHZN72FA = New-NsxSecurityGroup -name $SGHZN72FAName -IncludeMember (Get-NsxSecurityTag -Name $STHZN72FAName)
        $SGHZN7AirWatch = New-NsxSecurityGroup -name $SGHZN7AirWatchName -IncludeMember (Get-NsxSecurityTag -Name $STHZN7AirWatchName)
        $SGHZN7V4H = New-NsxSecurityGroup -name $SGHZN7V4HName -IncludeMember (Get-NsxSecurityTag -name $STHZN7V4HName)
        $SGHZN7AdminConsole = New-NsxSecurityGroup -name $SGHZN7AdminConsoleName -IncludeMember (Get-NsxSecurityTag -name $STHZN7AdminConsoleName)
        $SGHZN7Database = New-NsxSecurityGroup -name $SGHZN7DatabaseName -IncludeMember (Get-NsxSecurityTag -name $STHZN7DatabaseName)
    
        #Build New Services
    
        $SVHZN7Client2ConnServerHTTP = New-NsxService -name $SVHZN7Client2ConnServerHTTPName -protocol $TCP -port $80 -description "Horizon 7 HTTP Horizon Client to View Connection Servers Standard" -EnableInheritance
        $SVHZN7Client2ConnServerHTTPS = New-NsxService -name $SVHZN7Client2ConnServerHTTPSName -protocol $TCP -port $443 -description "Horizon 7 HTTPS Horizon Client to View Connection Servers SSL" -EnableInheritance
        $SVHZN7BEClient2AgentTCP = New-NsxService -name $SVHZN7BEClient2AgentTCPName -protocol $TCP -port $22443 -description "Horizon 7 Blast Extreme TCP Excellent Typical Horizon Client to Horizon Agent" -EnableInheritance
        $SVHZN7BEClient2AgentUDP = New-NsxService -name $SVHZN7BEClient2AgentUDPName -protocol $UDP -port $22443 -description "Horizon 7 Blast Extreme UDP Typical Horizon Client to Horizon Agent" -EnableInheritance
        $SVHZN7PCOIPClient2AgentTCP = New-NsxService -name $SVHZN7PCOIPClient2AgentTCPName -protocol $TCP -port $4172 -description "Horizon 7 PCoIP TCP Horizon Client to Horizon Agent" -EnableInheritance
        $SVHZN7PCOIPClient2AgentUDP = New-NsxService -name $SVHZN7PCOIPClient2AgentUDPName -protocol $UDP -port $4172 -description "Horizon 7 PCoIP UDP Horizon Client to Horizon Agent" -EnableInheritance
        $SVHZN7RDPClient2Agent = New-NsxService -name $SVHZN7RDPClient2AgentName -protocol $TCP -port $3389 -description "Horizon 7 RDP Horizon Client to Horizon Agent" -EnableInheritance
        $SVHZN7CDRMMRClient2Agent = New-NsxService -name $SVHZN7CDRMMRClient2AgentName -protocol $TCP -port $9427 -description "Horizon 7 CDR MMR Horizon Client to Horizon Agent" -EnableInheritance
        $SVHZN7USBClient2Agent = New-NsxService -name $SVHZN7USBClient2AgentName -protocol $TCP -port $32111 -description "Horizon 7 USB Horizon Client to Horizon Agent USB Redirection" -EnableInheritance
        $SVHZN7Browser2AgentHTML = New-NsxService -name $SVHZN7Browser2AgentHTMLName -protocol $TCP -port $443 -description "Horizon 7 Browser to Horizon Agent HTML Access" -EnableInheritance
        $SVHZN7Browser2VIDM = New-NsxService -name $SVHZN7Browser2VIDMName -protocol $TCP -port $443 -description "Horizon 7 Browser to VMware Identity Manager" -EnableInheritance
        $SVHZN7Client2UAG = New-NsxService -name $SVHZN7Client2UAGName -protocol $TCP -port $443 -description "Horizon 7 Horizon Client to Unified Access Gateway" -EnableInheritance
        $SVHZN7PCOIPClient2UAGTCP = New-NsxService -name $SVHZN7PCOIPClient2UAGTCPName -protocol $TCP -port $4172 -description "Horizon 7 PCoIP TCP Horizon Client to Unified Access Gateway" -EnableInheritance
        $SVHZN7PCOIPClient2UAGUDP = New-NsxService -name $SVHZN7PCOIPClient2UAGUDPName -protocol $TCP -port $4172 -description "Horizon 7 PCoIP UDP Horizon Client to Unified Access Gateway" -EnableInheritance
        $SVHZN7BEClient2UAGTCP443 = New-NsxService -name $SVHZN7BEClient2UAGTCP443Name -protocol $TCP -port $443 -description "Horizon 7 Blast Extreme TCP 443 Excellent Typical Horizon Client to Unified Access Gateway" -EnableInheritance
        $SVHZN7BEClient2UAGTCP8443 = New-NsxService -name $SVHZN7BEClient2UAGTCP8443Name -protocol $TCP -port $8443 -description "Horizon 7 Blast Extreme TCP 8443 Excellent Typical Horizon Client to Unified Access Gateway" -EnableInheritance
        $SVHZN7BEClient2UAGUDP443 = New-NsxService -name $SVHZN7BEClient2UAGUDP443Name -protocol $UDP -port $8443 -description "Horizon 7 Blast Extreme UDP 443 Poor Typical Horizon Client to Unified Access Gateway" -EnableInheritance
        $SVHZN7BEClient2UAGUDP8443 = New-NsxService -name $SVHZN7BEClient2UAGUDP8443Name -protocol $UDP -port $443 -description "Horizon 7 Blast Extreme UDP 8443 Poor Typical Horizon Client to Unified Access Gateway" -EnableInheritance
        $SVHZN7Browser2UAGHTML = New-NsxService -name $SVHZN7Browser2UAGHTMLName -protocol $TCP -port $443 -description "Horizon 7 Browser to Unified Access Gateway HTML Access" -EnableInheritance
        $SVHZN7Browser2UAGVIDM = New-NsxService -name $SVHZN7Browser2UAGVIDMName -protocol $TCP -port $443 -description "Horizon 7 Browser to Unified Access Gateway VIDM" -EnableInheritance
        $SVHZN7Client2ConnServerTunnHTTPS = New-NsxService -name $SVHZN7Client2ConnServerTunnHTTPSName -protocol $TCP -port $443 -description "Horizon 7 HTTPS Horizon Client to Connection Servers Tunneled" -EnableInheritance
        $SVHZN7Client2ConnServerTunnHTTP = New-NsxService -name $SVHZN7Client2ConnServerTunnHTTPName -protocol $TCP -port $80 -description "Horizon 7 HTTP Horizon Client to View Connection Servers Tunneled" -EnableInheritance
        $SVHZN7BEClient2ConnServerTCP = New-NsxService -name $SVHZN7BEClient2ConnServerTCPName -protocol $TCP -port $8443 -description "Horizon 7 Blast Extreme TCP Excellent Typical Horizon Client to View Connection Server" -EnableInheritance
        $SVHZN7PCOIPClient2ConnServerTCP = New-NsxService -name $SVHZN7PCOIPClient2ConnServerTCPName -protocol $TCP -port $4172 -description "Horizon 7 PCoIP TCP Horizon Client to View Connection Server" -EnableInheritance
        $SVHZN7PCOIPClient2ConnServerUDP = New-NsxService -name $SVHZN7PCOIPClient2ConnServerUDPName -protocol $UDP -port $4172 -description "Horizon 7 PCoIP UDP Horizon Client to View Connection Server" -EnableInheritance
        $SVHZN7Browser2AgentTunnHTML = New-NsxService -name $SVHZN7Browser2AgentTunnHTMLName -protocol $TCP -port $443 -description "Horizon 7 Browser to Horizon Agent HTML Access Tunneled" -EnableInheritance
        $SVHZN7Browser2VIDMTunn = New-NsxService -name $SVHZN7Browser2VIDMTunnName -protocol $TCP -port $443 -description "Horizon 7 Browser to VMware Identity Manager Tunneled" -EnableInheritance
        $SVHZN7Agent2ConnServerEnhanced = New-NsxService -name $SVHZN7Agent2ConnServerEnhancedName -protocol $TCP -port $4002 -description "Horizon 7 JMS Horizon Agent to Connection Server Enhanced" -EnableInheritance
        $SVHZN7Agent2ConnServerLegacy = New-NsxService -name $SVHZN7Agent2ConnServerLegacyName -protocol $TCP -port $4001 -description "Horizon 7 JMS Horizon Agent to Connection Server Legacy" -EnableInheritance
        $SVHZN7Agent2V4HRMI = New-NsxService -name $SVHZN7Agent2V4HRMIName -protocol $TCP -port $3091 -description "Horizon 7 Horizon Agent to V4H RMI" -EnableInheritance
        $SVHZN7Agent2V4HDMS = New-NsxService -name $SVHZN7Agent2V4HDMSName -protocol $TCP -port $3099 -description "Horizon 7 Horizon Agent to V4H Desktop Message Server" -EnableInheritance
        $SVAPPVAgent2APPVMGRSSL = New-NsxService -name $SVAPPVAgent2APPVMGRSSLName -protocol $TCP -port $443 -description "App Volumes Agent to App Volumes Manager SSL" -EnableInheritance
        $SVAPPVAgent2APPVMGRSTD = New-NsxService -name $SVAPPVAgent2APPVMGRSTDName -protocol $TCP -port $80 -description "App Volumes Agent to App Volumes Manager Standard" -EnableInheritance
        $SVUEMMGR2UEMFSSMB = New-NsxService -name $SVUEMMGR2UEMFSSMBName -protocol $TCP -port $445 -description "User Environment Manager to UEM File Servers SMB" -EnableInheritance
        $SVHZN7BEConnServ2AgentTunn = New-NsxService -name $SVHZN7BEConnServ2AgentTunnName -protocol $TCP -port $22443 -description "Horizon 7 Blast Extreme TCP View Connection Server to Horizon Agent Tunneled" -EnableInheritance
        $SVHZN7PCOIPConnServ2AgentTunnTCP = New-NsxService -name $SVHZN7PCOIPConnServ2AgentTunnTCPName -protocol $TCP -port $4172 -description "Horizon 7 PCoIP TCP View Connection Server to Horizon Agent Tunneled" -EnableInheritance
        $SVHZN7PCOIPConnServ2AgentTunnUDP = New-NsxService -name $SVHZN7PCOIPConnServ2AgentTunnUDPName -protocol $UDP -port $4172 -description "Horizon 7 PCoIP UDP View Connection Server to Horizon Agent Tunneled" -EnableInheritance
        $SVHZN7RDPConnServer2AgentTunn = New-NsxService -name $SVHZN7RDPConnServer2AgentTunnName -protocol $TCP -port $3389 -description "Horizon 7 RDP View Connection Server to Horizon Agent Tunneled" -EnableInheritance
        $SVHZN7CDRMMRConnServer2AgentTunn = New-NsxService -name $SVHZN7CDRMMRConnServer2AgentTunnName -protocol $TCP -port $9427 -description "Horizon 7 CDR MMR View Connection Server to Horizon Agent Tunneled" -EnableInheritance
        $SVHZN7USBClient2AgentUSBTunn = New-NsxService -name $SVHZN7USBClient2AgentUSBTunnName -protocol $TCP -port $32111 -description "Horizon 7 USB Horizon Client to Horizon Agent USB Redirection Tunneled" -EnableInheritance
        $SVHZN7ConnServer2vCenterSOAP = New-NsxService -name $SVHZN7ConnServer2vCenterSOAPName -protocol $TCP -port $433 -description "Horizon 7 HTTPS View Connection Server to vCenter Server SOAP" -EnableInheritance
        $SVHZN7ConnServer2CompSOAP = New-NsxService -name $SVHZN7ConnServer2CompSOAPName -protocol $TCP -port $18443 -description "Horizon 7 View Connection Server to View Composer SOAP" -EnableInheritance
        $SVHZN7ConnServer2ConnServerJMSLegacy = New-NsxService -name $SVHZN7ConnServer2ConnServerJMSLegacyName -protocol $TCP -port $4100 -description "Horizon 7 JMS View Connection Server to View Connection Server Legacy" -EnableInheritance
        $SVHZN7ConnServer2ConnServerJMSSSL = New-NsxService -name $SVHZN7ConnServer2ConnServerJMSSSLName -protocol $TCP -port $4101 -description "Horizon 7 JMS View Connection Server to View Connection Server SSL" -EnableInheritance
        $SVHZN7CPALDAPREPL = New-NsxService -name $SVHZN7CPALDAPREPLName -protocol $TCP -port $22389 -description "Horizon 7 CPA Global LDAP Replication" -EnableInheritance
        $SVHZN7CPALDAPREPLSSL = New-NsxService -name $SVHZN7CPALDAPREPLSSLName -protocol $TCP -port $22636 -description "Horizon 7 CPA Global LDAP Replication SSL" -EnableInheritance
        $SVHZN7CPAInterPodVIPA = New-NsxService -name $SVHZN7CPAInterPodVIPAName -protocol $TCP -port $8472 -description "Horizon 7 CPA Inter-Pod VIPA" -EnableInheritance
        $SVHZN7ConnServerInstallReplica = New-NsxService -name $SVHZN7ConnServerInstallReplicaName -protocol $TCP -port $32111 -description "Horizon 7 View Connection Server Install Replica" -EnableInheritance
        $SVHZN7ConnServer2Enrollment = New-NsxService -name $SVHZN7ConnServer2EnrollmentName -protocol $TCP -port $32111 -description "Horizon 7 View Connection Server to Enrollment Server View Framework" -EnableInheritance
        $SVHZN7ConnServer2VIDM = New-NsxService -name $SVHZN7ConnServer2VIDMName -protocol $TCP -port $443 -description "Horizon 7 View Connection Server to VMware Identity Manager Message Bus" -EnableInheritance
        $SVHZN7ConnServer2V4HRMI = New-NsxService -name $SVHZN7ConnServer2V4HRMIName -protocol $TCP -port $3901 -description "Horizon 7 View Connection Server to V4H RMI" -EnableInheritance
        $SVHZN7ConnServer2V4HBMS = New-NsxService -name $SVHZN7ConnServer2V4HBMSName -protocol $TCP -port $3101 -description "Horizon 7 View Connection Server to V4H Broker Message Server" -EnableInheritance
        $SVHZN7ConnServer2V4HCMS = New-NsxService -name $SVHZN7ConnServer2V4HCMSName -protocol $TCP -port $3100 -description "Horizon 7 View Connection Server to V4H Cert Management Server" -EnableInheritance
        $SVHZN7ConnServer22FAMGR = New-NsxService -name $SVHZN7ConnServer22FAMGRName -protocol $UDP -port $5500 -description "Horizon 7 Default View Connection Server to 2FA Manager  " -EnableInheritance
        $SVvCenter2ESXiSOAP = New-NsxService -name $SVvCenter2ESXiSOAPName -protocol $TCP -port $902 -description "vCenter Server to ESXi SOAP" -EnableInheritance
        $SVHZN7Comp2vCenterSOAP = New-NsxService -name $SVHZNComp2vCenterSOAPName -protocol $TCP -port $443 -description "Horion 7 View Composer to vCenter Server SOAP" -EnableInheritance
        $SVHZN7Comp2ESXiSOAP = New-NsxService -name $SVHZNComp2ESXiSOAPName -protocol $TCP -port $902 -description "Horizon 7 View Composer to ESXi SOAP" -EnableInheritance
        $SVHZN7UAG2ConnServerLogin = New-NsxService -name $SVHZN7UAG2ConnServerLoginName -protocol $TCP -port $443 -description "Horizon 7 Unified Access Gateway to View Connection Server Login" -EnableInheritance
        $SVHZN7BEUAG2AgentTCP = New-NsxService -name $SVHZN7BEUAG2AgentTCPName -protocol $TCP -port $22443 -description "Horizon 7 Unified Blast Extreme TCP Unified Access Gateway to Horizon Agent " -EnableInheritance
        $SVHZN7BEUAG2AgentUDP = New-NsxService -name $SVHZN7BEUAG2AgentUDPName -protocol $UDP -port $22443 -description "Horizon 7 Unified Blast Extreme UDP Unified Access Gateway to Horizon Agent " -EnableInheritance
        $SVHZN7PCOIP2AgentTCP = New-NsxService -name $SVHZN7PCOIP2AgentTCPName -protocol $TCP -port $4172 -description "Horizon 7 PCoIP TCP Unified Access Gateway to Horizon Agent" -EnableInheritance
        $SVHZN7PCOIP2AgentUDP = New-NsxService -name $SVHZN7PCOIP2AgentUDPName -protocol $UDP -port $4172 -description "Horizon 7 PCoIP UDP Unified Access Gateway to Horizon Agent" -EnableInheritance
        $SVHZN7RDPUAG2Agent = New-NsxService -name $SVHZN7RDPUAG2AgentName -protocol $TCP -port $3389 -description "Horizon 7 RDP Unified Access Gateway to Horizon Agent" -EnableInheritance
        $SVHZN7CDRMMRUAG2Agent = New-NsxService -name $SVHZN7CDRMMRUAG2AgentName -protocol $TCP -port $9427 -description "Horizon 7 CDR MMR Unified Access Gateway to Horizon Agent" -EnableInheritance
        $SVHZN7USBUAG2Agent = New-NsxService -name $SVHZN7USBUAG2AgentName -protocol $TCP -port $32111 -description "Horizon 7 USB Unified Acess Gateway to Horizon Agent USB Redirection" -EnableInheritance
        $SVHZN7UAG2Agent = New-NsxService -name $SVHZN7UAG2AgentName -protocol $TCP -port $443 -description "Horizon 7 Unified Access Gateway to Horizon Agent" -EnableInheritance
        $SVHZN7UAG22FAMGR = New-NsxService -name $SVHZN7UAG22FAMGRName -protocol $UDP -port $5500 -description "Horizon 7 Default Unified Access Gateway to 2FA " -EnableInheritance
        $SVHZN7VIDM2ConnServerLDAP = New-NsxService -name $SVHZN7VIDM2ConnServerLDAPName -protocol $TCP -port $389 -description "Horizon 7 LDAP VMware Identity Manager to View Connection Server" -EnableInheritance
        $SVHZN7VIDM2ConnServerHTTPS = New-NsxService -name $SVHZN7VIDM2ConnServerHTTPSName -protocol $TCP -port $443 -description "Horizon 7 HTTPS VMware Identity Manager to View Connection Server " -EnableInheritance
        $SVHZN7VIDM2VIDMHTTPS = New-NsxService -name $SVHZN7VIDM2VIDMHTTPSName -protocol $TCP -port $443 -description "Horizon 7 HTTPS VMware Identity Manager to VMware Identity Manager" -EnableInheritance
        $SVHZN7VIDM2VIDMAudit = New-NsxService -name $SVHZN7VIDM2VIDMAuditName -protocol $TCP -port $9300-9400 -description "Horizon 7 VMware Identity Manager to VMware Identity Manager Audit" -EnableInheritance
        $SVHZN7VIDM2SMTP = New-NsxService -name $SVHZN7VIDM2SMTPName -protocol $TCP -port $25 -description "Horizon 7 VMware Identity Manager to SMTP Server" -EnableInheritance
        $SVHZN7VIDM2DCLDAP = New-NsxService -name $SVHZN7VIDM2DCLDAPName -protocol $TCP -port $389 -description "Horizon 7 LDAP VMware Identity Manager to Domain Controller" -EnableInheritance
        $SVHZN7VIDM2DCKerberosTCP = New-NsxService -name $SVHZN7VIDM2DCKerberosTCPName -protocol $TCP -port $88 -description "Horizon 7 Kerberos TCP VMware Identity Manager to Domain Controller" -EnableInheritance
        $SVHZN7VIDM2DCKerberosUDP = New-NsxService -name $SVHZN7VIDM2DCKerberosUDPName -protocol $UDP -port $88 -description "Horizon 7 Kerberos UDP VMware Identity Manager to Domain Controller" -EnableInheritance
        $SVHZN7VIDM2DCKerberosPWDTCP = New-NsxService -name $SVHZN7VIDM2DCKerberosPWDTCPName -protocol $TCP -port $464 -description "Horizon 7 TCP Kerberos PWD VMware Identity Manager to Domain Controller" -EnableInheritance
        $SVHZN7VIDM2DCKerberosPWDUDP = New-NsxService -name $SVHZN7VIDM2DCKerberosPWDUDPName -protocol $UDP -port $464 -description "Horizon 7 UDP Kerberos PWD VMware Identity Manager to Domain Controller" -EnableInheritance
        $SVHZN7VIDM2DCRPC = New-NsxService -name $SVHZN7VIDM2DCRPCName -protocol $TCP -port $135 -description "Horizon 7 RPC VMware Identity Manager to Domain Controller" -EnableInheritance
        $SVHZN7VIDM2DNSTCP = New-NsxService -name $SVHZN7VIDM2DNSTCPName -protocol $TCP -port $53 -description "Horizon 7 DNS TCP VMware Identity Manager to DNS Server" -EnableInheritance
        $SVHZN7VIDM2DNSUDP = New-NsxService -name $SVHZN7VIDM2DNSUDPName -protocol $UDP -port $53 -description "Horizon 7 DNS UDP VMware Identity Manager to DNS Server" -EnableInheritance
        $SVHZN7VIDM2CTXBSTD = New-NsxService -name $SVHZN7VIDM2CTXBSTDName -protocol $TCP -port $80 -description "VMware Identity Manager to Citrix integration Broker Standard" -EnableInheritance
        $SVHZN7VIDM2CTXSSL = New-NsxService -name $SVHZN7VIDM2CTXSSLName -protocol $TCP -port $443 -description "VMware Identity Manager to Citrix integration Broker SSL" -EnableInheritance
        $SVHZN7VIDM2ThinAppFSSMB = New-NsxService -name $SVHZN7VIDM2ThinAppFSSMBName -protocol $TCP -port $445 -description "VMware Identity Manger to ThinApp File Servers SMB" -EnableInheritance
        $SVHZN7VIDM2UpgradeServer = New-NsxService -name $SVHZN7VIDM2UpgradeServerName -protocol $TCP -port $443 -description "VMware Identity Manager to Upgrade Server" -EnableInheritance
        $SVHZN7VIDM22FAMGR = New-NsxService -name $SVHZN7VIDM22FAMGRName -protocol $UDP -port $5500 -description "VMware Identity Manager Default to 2FA Manager" -EnableInheritance
        $SVHZN7VIDM2AirWatchRESTAPI = New-NsxService -name $SVHZN7VIDM2AirWatchRESTAPIName -protocol $TCP -port $443 -description "VMware Identity Manager to VMware AirWatch REST API" -EnableInheritance
        $SVHZN7VIDM2MSSQL = New-NsxService -name $SVHZN7VIDM2MSSQLName -protocol $TCP -port $1433 -description "VMware Identity Manager to External MSSQL" -EnableInheritance
        $SVHZN7VIDM2PostgreSQL = New-NsxService -name $SVHZN7VIDM2PostgreSQLName -protocol $TCP -port $5432 -description "VMware Identity Manager to Extenal PostgreSQL" -EnableInheritance
        $SVHZNVIDM2Oracle = New-NsxService -name $SVHZN7VIDM2OracleName -protocol $TCP -port $1521 -description "VMware Identity Manager to External Oracle" -EnableInheritance
        $SVHZN7APPVMGR2vCenterSOAP = New-NsxService -name $SVHZNAPPVMGR2vCenterSOAPName -protocol $TCP -port $443 -description "App Volumes Manager to vCenter Server SOAP" -EnableInheritance
        $SVHZN7APPVMGR2ESXi = New-NsxService -name $SVHZN7APPVMGR2ESXiName -protocol $TCP -port $443 -description "App Volumes Manager to ESXi Hostd" -EnableInheritance
        $SVHZN7APPVMGR2MSSQL = New-NsxService -name $SVHZN7APPVMGR2MSSQLName -protocol $TCP -port $1433 -description "App Volumes Manager Default to MSSQL" -EnableInheritance
        $SVV4H2ConnServerRMI = New-NsxService -name $SVV4H2ConnServerRMIName -protocol $TCP -port $3091 -description "V4H to View Connection Server RMI" -EnableInheritance
        $SVV4H2ConnServerBMS = New-NsxService -name $SVV4H2ConnServerBMSName -protocol $TCP -port $3101 -description "V4H to View Connection Server Broker Message Server" -EnableInheritance
        $SVV4H2ConnServerCMS = New-NsxService -name $SVV4H2ConnServerCMSName -protocol $TCP -port $3100 -description "V4H to View Connection Server Cert Management Server" -EnableInheritance
        $SVV4H2AgentRMI = New-NsxService -name $SVV4H2AgentRMIName -protocol $TCP -port $3901 -description "V4H to Horizon Agent RMI" -EnableInheritance
        $SVV4H2AgentDMS = New-NsxService -name $SVV4H2AgentDMSName -protocol $TCP -port $3909 -description "V4H to Horizon Agent Desktop Message Server" -EnableInheritance
        $SVV4H2UAGMonitor = New-NsxService -name $SVV4H2UAGMonitorName -protocol $TCP -port $9443 -description "V4H to Unified Access Gateway Monitoring" -EnableInheritance
        $SVV4H2APPVMGRMonitor = New-NsxService -name $SVV4H2APPVMGRMonitorName -protocol $TCP -port $443 -description "V4H to App Volumes Manager Monitoring" -EnableInheritance
        $SVHZN7Admin2ConnServer = New-NsxService -name $SVHZN7Admin2ConnServerName -protocol $TCP -port $443 -description "Horizon 7 Admin Console to View Connection Server" -EnableInheritance
        $SVHZN7Admin2vCenter = New-NsxService -name $SVHZN7Admin2vCenterName -protocol $TCP -port $443 -description "Horizon 7 Admin Console to vCenter Server" -EnableInheritance
        $SVHZN7Admin2APPVMGR = New-NsxService -name $SVHZN7Admin2APPVMGRName -protocol $TCP -port $443 -description "Horizon 7 Admin Console to App Volumes Manager" -EnableInheritance
        $SVHZN7Admin2VIDM = New-NsxService -name $SVHZN7Admin2VIDMName -protocol $TCP -port $8443 -description "Horizon 7 Admin Console to VMware Identity Manager" -EnableInheritance
        $SVHZN7Admin2V4H = New-NsxService -name $SVHZN7Admin2V4HName -protocol $TCP -port $443 -description "Horizon 7 Admin Console to V4H" -EnableInheritance
        $SVHZN7Admin2UAG = New-NsxService -name $SVHZN7Admin2UAGName -protocol $TCP -port $9443 -description "Horizon 7 Admin Console to Unified Access Gateway" -EnableInheritance
    
        #Build New Service Groups
   
        #Build Firewall Rules
        #$FWRInterDesktopFWRuleName = "Inter Desktop FW Rule"
        #$FWRInterDesktopFWRule = Get-NsxFirewallRule -Name $FWRInterDesktopFWRuleName
        #if (!$FWRInterDesktopFWRule)
        #{
        #  $FWRInterDesktopFWRule = Get-NsxFirewallSection $SNHorizonDesktopBlockSectionName | New-NsxFirewallRule -name $InterDesktopFWRule -action deny -Direction inout -Source $SGHorizonViewDesktops -Destination $SGHorizonViewDesktops -EnableLogging -AppliedTo $SGHorizonViewDesktops
        #  }
  
        
        $RNHZN7Client2ConnServerName = "Internal - Horizon Client to View Connection Server",
        $RNHZN7Client2AgentName = "Internal - Horizon Client to Horizon Agent",
        $RNHZN7Browser2AgentHTMLName = "Internal - Browser to Horizon Agent HTML",
        $RNHZN7Browser2VIDMName = "Internal - Browser to vIDM",
        $RNHZN7Client2UAGName = "External - Horizon Client to UAG",
        $RNHZN7Browser2UAGHTMLName = "External - Browser to UAG HTML",
        $RNHZN7Browser2UAGVIDMName = "External - Browser to UAG VIDM",
        $RNHZN7Client2ConnServerTunnName = "Tunneled - Horizon Client to View Connection Server HTTPS",
        $RNHZN7Browser2AgentTunnName = "Tunneled - Browser to View Connection Server",
        $RNHZN7Browser2VIDMTunnName = "Tunneled - Browser to VIDM",
        $RNHZN7Agent2ConnServerName = "Desktops - Horizon Agent to View Connection Server JMS",
        $RNHZN7Agent2V4HName = "Desktops - Horizon Agent to V4H",
        $RNAPPVAgent2APPVMGRName = "Desktops - App Volumes Agent to App Volumes Manager",
        $RNUEMMGR2UEMFSSMBName = "Desktops - UEM Flex Engine to UEM File Servers",
        $RNHZN7ConnServ2AgentTunnName = "Infrastructure - View Connection Server to Horizon Agent Tunneled",
        $RNHZN7ConnServer2vCenterName = "Infrastructure - View Connection Server to vCenter Server",
        $RNHZN7ConnServer2CompName = "Infrastructure - View Connection Server to View Composer",
        $RNHZN7ConnServer2ConnServerName = "Infrastructure - View Connection Server to View Connection Server",
        $RNHZN7ConnServer2EnrollmentName = "Infrastructure - View Connection Server to Enrollment Server",
        $RNHZN7ConnServer2VIDMName = "Infrastructure - View Connection Server to VIDM",
        $RNHZN7ConnServer2V4HName = "Infrastructure - View Connection Server to V4H",
        $RNHZN7ConnServer22FAMGRName = "Infrastructure - View Connection Server to 2FA Manager",
        $RNvCenter2ESXiName = "Infrastructure - vCenter Server to ESXi",
        $RNHZN7Comp2vCenterName = "Infrastructure - View Composer to vCenter Server",
        $RNHZN7Comp2ESXiName = "Infrastructure - View Composer to ESXi",
        $RNHZN7UAG2ConnServerName = "Infrastructure - UAG to View Connection Server",
        $RNHZN7UAG2AgentName = "Infrastructure - UAG to Horizon Agent",
        $RNHZN7VIDM2ConnServerName = "Infrastructure - VIDM to View Connection Server",
        $RNHZN7VIDM2VIDMName = "Infrastructure - VIDM to VIDM",
        $RNHZN7VIDM2SMTPName = "Infrastructure - VIDM to SMTP Server",
        $RNHZN7VIDM2DCName = "Infrastructure - VIDM to Domain Controller",
        $RNHZN7VIDM2DNSName = "Infrastructure - VIDM to DNS",
        $RNHZN7VIDM2CTXBName = "Infrastructure - VIDM to Citrix Integration",
        $RNHZN7VIDM2ThinAppFSName = "Infrastructure - VIDM to ThinApp FS",
        $RNHZN7VIDM2UpgradeServerName = "Infrastructure - VIDM to Upgrade Server",
        $RNHZN7VIDM22FAMGRName = "Infrastructure - VIDM to 2FA Manager",
        $RNHZN7VIDM2AirWatchName = "Infrastructure - VIDM to AirWatch",
        $RNHZN7VIDM2Name = "Infrastructure - VIDM to External DB",
        $RNHZN7APPVMGR2vCenterName = "Infrastructure - App Volumes Manager to vCenter Server",
        $RNHZN7APPVMGR2ESXiName = "Infrastructure - App Volumes Manager to ESXi",
        $RNHZN7APPVMGR2Name = "Infrastructure - App Volumes Manager to External DB",
        $RNV4H27ConnServerName = "Infrastructure - V4H to View Connection Server",
        $RNV4H27AgentName = "Infrastrucutre - V4H to Horizon Agent",
        $RNV4H2UAGMonitorName = "Infrastructure - V4H to UAG Monitoring",
        $RNV4H2APPVMGRMonitorName = "Infrastructure - V4H to App Volumes Manager Monitoring",
        $RNHZN7Admin2Name = "Management - Admin Console to Conn Server, vCenter, AppV Mgr, V4H",
        $RNHZN7Admin2UAGName = "Management - Admin Console to UAG",
        $RNHZN7Admin2VIDMName = "Management - Admin Console to VIDM"

