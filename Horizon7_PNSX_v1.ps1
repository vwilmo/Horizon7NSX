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
        #$InterDesktopFWRule = "Inter Desktop FW Rule"
        
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
        $t = "tcp"
        $u = "udp"
        
        #Port
        $HTTP = "80"
        $HTTPS = "443"
        $BLAST = "22443"
        $PCOIP = "4172"
        $RDP = "3389"
        $CDRMMR = "9427"
        $USB = "32111"
        $HTTPS8443 = "8443"
        $JMSE = "4002"
        $JMSL = "4001"
        $RMI = "3091"
        $DMS = "3099"
        $SMB = "445"
        $SOAP = "18443"
        $JMSL2 = "4100"
        $JMSSSL = "4101"
        $CPALDAP = "22389"
        $CPALDAPS = "22636"
        $VIPA = "8472"
        $RMI2 = "3901"
        $BMS = "3101"
        $CMS = "3100"
        $2FA = "5500"
        $SOAP2 = "902"
        $LDAP = "389"
        $AUDIT = "9300-9400"
        $SMTP = "25"
        $KERB = "88"
        $KERBPWD = "464"
        $RPC = "135"
        $DNS = "53"
        $MSSQL = "1433"
        $PSQL = "5432"
        $ORACLE = "1521"
        $DMS2 = "3909"
        $HTTPS9443 = "9443"

        
    )

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
    
    $SVClient2ConnServ = New-NsxService -name $SVClient2ConnServName 

    #Build New Service Groups
   
    #Build Firewall Rules
    $FWRInterDesktopFWRuleName = "Inter Desktop FW Rule"
    $FWRInterDesktopFWRule = Get-NsxFirewallRule -Name $FWRInterDesktopFWRuleName
    if (!$FWRInterDesktopFWRule)
    {
      $FWRInterDesktopFWRule = Get-NsxFirewallSection $SNHorizonDesktopBlockSectionName | New-NsxFirewallRule -name $InterDesktopFWRule -action deny -Direction inout -Source $SGHorizonViewDesktops -Destination $SGHorizonViewDesktops -EnableLogging -AppliedTo $SGHorizonViewDesktops
      }
  
   
