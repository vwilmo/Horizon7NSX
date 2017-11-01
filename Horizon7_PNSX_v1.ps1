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

    #Build New Horizon 7 DFW Sections
    $SNHorizonDesktopBlockSectionName = "Horizon Desktop Block Section"
    $SNHorizonDesktopBlockSection = Get-NsxFirewallSection -Name $SNHorizonDesktopBlockSectionName
    if (!$SNHorizonDesktopBlockSection)
    {
      $SNHorizonDesktopBlockSection = New-NsxFirewallSection $SNHorizonDesktopBlockSectionName
    }
    $SNHorizonViewManagementBlockSectionName = "Horizon View Management Block Section"
    $SNHorizonViewManagementBlockSection = Get-NsxFirewallSection -Name $SNHorizonViewManagementBlockSectionName
    if (!$SNHorizonViewManagementBlockSection)
    {
      $SNHorizonViewManagementBlockSection = New-NsxFirewallSection $SNHorizonViewManagementBlockSectionName
    }
    $SNHorizonViewExternalConnectionsSectionName = "Horizon View External Connections Section"
    $SNHorizonViewExternalConnectionsSection = Get-NsxFirewallSection -Name $SNHorizonViewExternalConnectionsSectionName
    if (!$SNHorizonViewExternalConnectionsSection)
    {
      $SNHorizonViewExternalConnectionsSection = New-NsxFirewallSection $SNHorizonViewExternalConnectionsSectionName
    }
    $SNHorizonOperationManagementSectionName = "Horizon Operation Management Section"
    $SNHorizonOperationManagementSection = Get-NsxFirewallSection -Name $SNHorizonOperationManagementSectionName
    if (!$SNHorizonOperationManagementSection)
    {
      $SNHorizonOperationManagementSection = New-NsxFirewallSection $SNHorizonOperationManagementSectionName
    }
    #Build New Security Tags
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
  
   
