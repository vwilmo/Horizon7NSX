#Script
    param (
        ##Creating Horizon 7 Groupings
        
        #Security Groups
        $SGHZN7ClientName = "SG-Horizon7Client",
        $SGHZN7ConnServerName = "SG-Horizon7ConnServer",
        $SGHZN7vIDMName = "SG-Horizon7vIDM",
        $SGHZN7UAGName = "SG-Horizon7UAG",
        $SGHZN7VDIName = "SG-Horizon7VDI",
        $SGHZN7RDSHoSGName = "SG-Horizon7RDSHoSG",
        $SGHZN7EnrollServerName = "SG-Horizon7EnrollServer",
        $SGHZN7AppVolMgrName = "SG-Horizon7AppVolMgr",
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
    "ST-Horizon7Client",
    "ST-Horizon7ConnServer",
    "ST-Horizon7vIDM",
    "ST-Horizon7UAG",
    "ST-Horizon7VDI",
    "ST-Horizon7RDSHost",
    "ST-Horizon7EnrollServer",
    "ST-Horizon7AppVolMgr",
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
    $SecurityTag = Get-NsxFirewallSection -Name "$item"
    if (!$SecurityTag)
    {
    New-NsxSecurityTag -name $item | out-null
    }}

    #Build New Security Groups
    
        #Build New Services
    
    #Build New Service Groups
   
    #Build Firewall Rules
    $FWRInterDesktopFWRuleName = "Inter Desktop FW Rule"
    $FWRInterDesktopFWRule = Get-NsxFirewallRule -Name $FWRInterDesktopFWRuleName
    if (!$FWRInterDesktopFWRule)
    {
      $FWRInterDesktopFWRule = Get-NsxFirewallSection $SNHorizonDesktopBlockSectionName | New-NsxFirewallRule -name $InterDesktopFWRule -action deny -Direction inout -Source $SGHorizonViewDesktops -Destination $SGHorizonViewDesktops -EnableLogging -AppliedTo $SGHorizonViewDesktops
      }
  
   
