<?xml version="1.0" encoding="UTF-8"?>
<unattend xmlns="urn:schemas-microsoft-com:unattend">
   <settings pass="windowsPE">
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-International-Core-WinPE" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <!-- https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/microsoft-windows-international-core-winpe -->
         <SetupUILanguage>
            <UILanguage>${win_os_locale}</UILanguage>
         </SetupUILanguage>
         <InputLocale>${win_kb_locale}</InputLocale>
         <SystemLocale>${win_os_locale}</SystemLocale>
         <UILanguage>${win_os_locale}</UILanguage>
         <UILanguageFallback>${win_os_locale}</UILanguageFallback>
         <UserLocale>${win_os_locale}</UserLocale>
      </component>
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <!-- https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/microsoft-windows-setup -->
         <DiskConfiguration>
            <Disk wcm:action="add">
               <CreatePartitions>
                  <CreatePartition wcm:action="add">
                     <Type>Primary</Type>
                     <Order>1</Order>
                     <Size>499</Size>
                  </CreatePartition>
                  <CreatePartition wcm:action="add">
                     <Order>2</Order>
                     <Type>Primary</Type>
                     <Extend>true</Extend>
                  </CreatePartition>
               </CreatePartitions>
               <ModifyPartitions>
                  <ModifyPartition wcm:action="add">
                     <Active>true</Active>
                     <Format>NTFS</Format>
                     <Label>boot</Label>
                     <Order>1</Order>
                     <PartitionID>1</PartitionID>
                  </ModifyPartition>
                  <ModifyPartition wcm:action="add">
                     <Format>NTFS</Format>
                     <Label>System</Label>
                     <Letter>C</Letter>
                     <Order>2</Order>
                     <PartitionID>2</PartitionID>
                  </ModifyPartition>
               </ModifyPartitions>
               <DiskID>0</DiskID>
               <WillWipeDisk>true</WillWipeDisk>
            </Disk>
         </DiskConfiguration>
         <ImageInstall>
            <OSImage>
               <InstallFrom>
                  <!-- https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/microsoft-windows-setup-imageinstall-dataimage-installfrom-metadata-key -->
                  <!-- Get-WindowsImage -ImagePath D:\sources\install.wim -->
                  <MetaData wcm:action="add">
                     <Key>/IMAGE/INDEX</Key>
                     <Value>4</Value>
                  </MetaData>
               </InstallFrom>
               <InstallTo>
                  <DiskID>0</DiskID>
                  <PartitionID>2</PartitionID>
               </InstallTo>
            </OSImage>
         </ImageInstall>
         <UserData>
            <!-- Product Key from http://technet.microsoft.com/en-us/library/jj612867.aspx -->
            <ProductKey>
               <!-- Do not uncomment the Key element if you are using trial ISOs -->
               <!-- You must uncomment the Key element (and optionally insert your own key) if you are using retail or volume license ISOs -->
               <!--<Key>WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY</Key>-->
               <Key>${win_product_key}</Key>
            </ProductKey>
            <AcceptEula>true</AcceptEula>
            <FullName>${win_name}</FullName>
            <Organization>${win_organization}</Organization>
         </UserData>
      </component>
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-PnpCustomizationsWinPE" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <DriverPaths>
            <PathAndCredentials wcm:action="add" wcm:keyValue="1">
               <Path>e:\Windows Server 2019\x64</Path>
            </PathAndCredentials>
         </DriverPaths>
      </component>
   </settings>
   <settings pass="specialize">
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-International-Core" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <!-- https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/microsoft-windows-international-core -->
         <InputLocale>${win_kb_locale}</InputLocale>
         <SystemLocale>${win_os_locale}</SystemLocale>
         <UILanguage>${win_os_locale}</UILanguage>
         <UILanguageFallback>${win_os_locale}</UILanguageFallback>
         <UserLocale>${win_os_locale}</UserLocale>
      </component>
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-Shell-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <!-- https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/microsoft-windows-shell-setup -->
         <ComputerName>${win_computer_name }</ComputerName>
         <TimeZone>${win_timezone}</TimeZone>
      </component>
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-ServerManager-SvrMgrNc" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <!-- https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/microsoft-windows-servermanager-svrmgrnc -->
         <DoNotOpenServerManagerAtLogon>true</DoNotOpenServerManagerAtLogon>
      </component>
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-IE-ESC" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <!-- https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/microsoft-windows-ie-esc -->
         <IEHardenAdmin>false</IEHardenAdmin>
         <IEHardenUser>true</IEHardenUser>
      </component>
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-OutOfBoxExperience" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <!-- https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/microsoft-windows-outofboxexperience -->
         <DoNotOpenInitialConfigurationTasksAtLogon>true</DoNotOpenInitialConfigurationTasksAtLogon>
      </component>
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-Security-SPP-UX" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <!-- https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/microsoft-windows-security-spp-ux -->
         <SkipAutoActivation>true</SkipAutoActivation>
      </component>
   </settings>
   <settings pass="oobeSystem">
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-Shell-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <!-- https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/microsoft-windows-shell-setup -->
         <AutoLogon>
            <Password>
               <Value>${win_password}</Value>
               <PlainText>true</PlainText>
            </Password>
            <Enabled>true</Enabled>
            <Username>Administrator</Username>
         </AutoLogon>
         <FirstLogonCommands>
                <SynchronousCommand wcm:action="add">
                    <CommandLine>cmd.exe /c netsh advfirewall firewall add rule dir=in name="WinRm" action=allow enable=yes profile=any protocol=TCP localport=5985</CommandLine>
                    <Description>Win RM port open</Description>
                    <Order>1</Order>
                    <RequiresUserInput>true</RequiresUserInput>
                </SynchronousCommand>
                <SynchronousCommand wcm:action="add">
                    <CommandLine>cmd.exe /c winrm quickconfig -quiet</CommandLine>
                    <Description>Win RM enable</Description>
                    <Order>2</Order>
                    <RequiresUserInput>true</RequiresUserInput>
                </SynchronousCommand>
                <SynchronousCommand wcm:action="add">
                   <CommandLine>powershell -Command "Enable-PSRemoting -SkipNetworkProfileCheck -Force"</CommandLine>
                   <Description>Enable PS-Remoting</Description>
                   <Order>3</Order>
                   <RequiresUserInput>true</RequiresUserInput>
                </SynchronousCommand>
                <SynchronousCommand wcm:action="add">
                   <CommandLine>powershell -Command "Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force"</CommandLine>
                   <Description>Enable Remote-Signing</Description>
                   <Order>4</Order>
                   <RequiresUserInput>false</RequiresUserInput>
                </SynchronousCommand>
            <SynchronousCommand wcm:action="add">
               <CommandLine>%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -Command Set-Item WSMan:\localhost\Service\Auth\Basic -Value $true</CommandLine>
               <Description>Enable Basic authentication</Description>
               <Order>5</Order>
               <RequiresUserInput>false</RequiresUserInput>
            </SynchronousCommand>
            <SynchronousCommand wcm:action="add">
               <CommandLine>%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -Command Set-Item WSMan:\localhost\Service\AllowUnencrypted -Value $true</CommandLine>
               <Description>Stop the WinRM service to allow the dism process to finish before packer executes scripts</Description>
               <Order>6</Order>
               <RequiresUserInput>false</RequiresUserInput>
            </SynchronousCommand>
            <SynchronousCommand wcm:action="add">
               <CommandLine>%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -Command Restart-Service WinRM</CommandLine>
               <Description>Stop the WinRM service to allow the dism process to finish before packer executes scripts</Description>
               <Order>7</Order>
               <RequiresUserInput>false</RequiresUserInput>
            </SynchronousCommand>
         </FirstLogonCommands>
         <OOBE>
            <HideEULAPage>true</HideEULAPage>
            <HideLocalAccountScreen>true</HideLocalAccountScreen>
            <HideOEMRegistrationScreen>true</HideOEMRegistrationScreen>
            <HideOnlineAccountScreens>true</HideOnlineAccountScreens>
            <HideWirelessSetupInOOBE>true</HideWirelessSetupInOOBE>
            <NetworkLocation>Home</NetworkLocation>
            <ProtectYourPC>1</ProtectYourPC>
         </OOBE>
         <UserAccounts>
            <AdministratorPassword>
               <Value>${win_password}</Value>
               <PlainText>true</PlainText>
            </AdministratorPassword>
         </UserAccounts>
         <RegisteredOwner />
      </component>
   </settings>
   <settings pass="offlineServicing">
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-LUA-Settings" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <!-- https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/microsoft-windows-lua-settings -->
         <EnableLUA>false</EnableLUA>
      </component>
   </settings>
   <cpi:offlineImage xmlns:cpi="urn:schemas-microsoft-com:cpi" cpi:source="" />
</unattend>