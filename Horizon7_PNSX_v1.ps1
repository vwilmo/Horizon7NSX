#Script
    param (
        ##Creating Horizon 7 Groupings
        #Security Groups
        $SGHorizonViewDesktops = "SG-Horizon 7 View Desktops",
        #Security Tags
        $STHorizonViewDesktops = "ST-Horizon 7 View Desktops",
        #DFW Firewall Section Names
        $SNHorizonDesktopBlockSection = "Horizon Desktop Block Section",
        #DFW Rule Names
        $InterDesktopFWRule = "Inter Desktop FW Rule"
        #Services
        #Service Groups


    )

    ##Build New Horizon 7 DFW Sections
    ##Checks if Section exists first
    
    $SNHZN7ConnExternalSectionName = "Horizon 7 Connectivity - External Connections"
    $SNHZN7ConnExternalSection = Get-NsxFirewallSection -Name $SNHZN7ConnExternalSectionName
    if (!$SNHZN7ConnExternalSection)
    {
      $SNHZN7ConnExternalSection = New-NsxFirewallSection $SNHZN7ConnExternalSectionName 
    }
    $SNHZN7ConnTunneledSectionName = "Horizon 7 Connectivity - Tunneled Connections"
    $SNHZN7ConnTunneledSection = Get-NsxFirewallSection -Name $SNHZN7ConnTunneledSectionName
    if (!$SNHZN7ConnTunneledSectionName)
    {
      $SNHZN7ConnTunneledSection = New-NsxFirewallSection $SNHZN7ConnTunneledSectionName -position bottom
    }
    $SNHZN7ConnInternalSectionName = "Horizon 7 Connectivity - Internal Connections"
    $SNHZN7ConnInternalSection = Get-NsxFirewallSection -Name $SNHZN7ConnInternalSectionName
    if (!$SNHZN7ConnInternalSection)
    {
      $SNHZN7ConnInternalSection = New-NsxFirewallSection $SNHZN7ConnInternalSectionName -position bottom
    }
    $SNHZN7DesktopVDI_RDSHSectionName = "Horizon 7 Desktops - VDI or RDS Host"
    $SNHZN7DesktopVDI_RDSHSection = Get-NsxFirewallSection -Name $SNHZN7DesktopVDI_RDSHSectionName
    if (!$SNHZN7DesktopVDI_RDSHSection)
    {
      $SNHZN7DesktopVDI_RDSHSection = New-NsxFirewallSection $SNHZN7DesktopVDI_RDSHSectionName -position bottom
    }
    $SNHZN7InfraConnServerSectionName = "Horizon 7 Infrastructure - View Connection Server"
    $SNHZN7InfraConnServerSection = Get-NsxFirewallSection -Name $SNHZN7InfraConnServerSectionName
    if (!$SNHZN7InfraConnServerSection)
    {
      $SNHZN7InfraConnServerSection = New-NsxFirewallSection $SNHZN7InfraConnServerSectionName -position bottom
    }
    $SNHZN7InfravCenterViewCompSectionName = "Horizon 7 Infrastructure - vCenter Server and View Composer"
    $SNHZN7InfravCenterViewCompSection = Get-NsxFirewallSection -Name $SNHZN7InfravCenterViewCompSectionName
    if (!$SNHZN7InfravCenterViewCompSection)
    {
      $SNHZN7InfravCenterViewCompSection = New-NsxFirewallSection $SNHZN7InfravCenterViewCompSectionName -position bottom
    }
    $SNHZN7InfraUAGSectionName = "Horizon 7 Infrastructure - Unified Access Gateway"
    $SNHZN7InfraUAGSection = Get-NsxFirewallSection -Name $SNHZN7InfraUAGSectionName
    if (!$SNHZN7InfraUAGSection)
    {
      $SNHZN7InfraUAGSection = New-NsxFirewallSection $SNHZN7InfravUAGSectionName -position bottom
    }
    $SNHZN7InfravIDMSectionName = "Horizon 7 Infrastructure - VMware Identity Manager"
    $SNHZN7InfravIDMSection = Get-NsxFirewallSection -Name $SNHZN7InfravIDMSectionName
    if (!$SNHZN7InfravIDMSection)
    {
      $SNHZN7InfravIDMSectionn = New-NsxFirewallSection $SNHZN7InfravIDMSectionName -position bottom
    }
    $SNHZN7InfraAppVolMgrSectionName = "Horizon 7 Infrastructure - App Volumes Manager"
    $SNHZN7InfraAppVolMgrSection = Get-NsxFirewallSection -Name $SNHZN7InfraAppVolMgrSectionnName
    if (!$SNHZN7InfraAppVolMgrSection)
    {
      $SNHZN7InfraAppVolMgrSection = New-NsxFirewallSection $SNHZN7InfraAppVolMgrSectionName -position bottom
    }
    $SNHZN7InfraV4HSectionName = "Horizon 7 Infrastructure - vRealize Operations for Horizon"
    $SNHZN7InfraV4HSection = Get-NsxFirewallSection -Name $SNHZN7InfraV4HSectionName
    if (!$SNHZN7InfraV4HSection)
    {
      $SNHZN7InfraV4HSection = New-NsxFirewallSection $SNHZN7InfraV4HSectionName -position bottom
    }
    $SNHHZN7InfraMgmtSectionName = "Horizon 7 Infrastructure - Management"
    $SNHZN7InfraMgmtSection = Get-NsxFirewallSection -Name $SNHZN7InfraMgmtSectionName
    if (!$SNHZN7InfraMgmtSection)
    {
      $SNHZN7InfraMgmtSection = New-NsxFirewallSection $SNHZN7InfraMgmtSectionName -position bottom
    }
    ##Build New Security Tags
    ##Checks if exists first
    $STHorizonViewDesktopsName = "ST-Horizon 7 View Desktops"
    $STHorizonViewDesktops = Get-NsxSecurityTag -Name $STHorizonViewDesktopsName
    if (!$STHorizonViewDesktops)
    {
      $STHorizonViewDesktops = New-NsxSecurityTag $STHorizonViewDesktopsName
    }
    #Build New Security Groups
    $SGHorizonViewDesktopsName = "SG-Horizon 7 View Desktops"
    $SGHorizonViewDesktops = Get-NsxSecurityGroup -Name $SGHorizonViewDesktopsName
    if (!$SGHorizonViewDesktops)
    {
      $SGHorizonViewDesktops = New-NsxSecurityGroup $SGHorizonViewDesktopsName -IncludeMember $STHorizonViewDesktops
    }
        #Build New Services
    $SNHorizonDesktopBlockSectionName = "Horizon Desktop Block Section"
    $SNHorizonDesktopBlockSection = Get-NsxFirewallSection -Name $SNHorizonDesktopBlockSectionName
    if (!$SNHorizonDesktopBlockSection)
    {
      $SNHorizonDesktopBlockSection = New-NsxFirewallSection $SNHorizonDesktopBlockSectionName
    }
    #Build New Service Groups
    $SNHorizonDesktopBlockSectionName = "Horizon Desktop Block Section"
    $SNHorizonDesktopBlockSection = Get-NsxFirewallSection -Name $SNHorizonDesktopBlockSectionName
    if (!$SNHorizonDesktopBlockSection)
    {
      $SNHorizonDesktopBlockSection = New-NsxFirewallSection $SNHorizonDesktopBlockSectionName
    }

    #Build Firewall Rules
    $FWRInterDesktopFWRuleName = "Inter Desktop FW Rule"
    $FWRInterDesktopFWRule = Get-NsxFirewallRule -Name $FWRInterDesktopFWRuleName
    if (!$FWRInterDesktopFWRule)
    {
      $FWRInterDesktopFWRule = Get-NsxFirewallSection $SNHorizonDesktopBlockSectionName | New-NsxFirewallRule -name $InterDesktopFWRule -action deny -Direction inout -Source $SGHorizonViewDesktops -Destination $SGHorizonViewDesktops -EnableLogging -AppliedTo $SGHorizonViewDesktops
      }
  
   
