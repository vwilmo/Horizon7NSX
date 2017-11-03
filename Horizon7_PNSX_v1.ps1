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
        
        #Services


        
        #Service Groups


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
    
    #Build New Service Groups
   
    #Build Firewall Rules
    $FWRInterDesktopFWRuleName = "Inter Desktop FW Rule"
    $FWRInterDesktopFWRule = Get-NsxFirewallRule -Name $FWRInterDesktopFWRuleName
    if (!$FWRInterDesktopFWRule)
    {
      $FWRInterDesktopFWRule = Get-NsxFirewallSection $SNHorizonDesktopBlockSectionName | New-NsxFirewallRule -name $InterDesktopFWRule -action deny -Direction inout -Source $SGHorizonViewDesktops -Destination $SGHorizonViewDesktops -EnableLogging -AppliedTo $SGHorizonViewDesktops
      }
  
   
