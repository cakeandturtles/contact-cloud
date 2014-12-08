<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="cs491" generation="1" functional="0" release="0" Id="c061d37c-0655-4905-b32f-64c22a08b4e7" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="cs491Group" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="contactWebsite:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/cs491/cs491Group/LB:contactWebsite:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="contactWebsite:MyConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/cs491/cs491Group/MapcontactWebsite:MyConnectionString" />
          </maps>
        </aCS>
        <aCS name="contactWebsiteInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/cs491/cs491Group/MapcontactWebsiteInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:contactWebsite:Endpoint1">
          <toPorts>
            <inPortMoniker name="/cs491/cs491Group/contactWebsite/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapcontactWebsite:MyConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/cs491/cs491Group/contactWebsite/MyConnectionString" />
          </setting>
        </map>
        <map name="MapcontactWebsiteInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/cs491/cs491Group/contactWebsiteInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="contactWebsite" generation="1" functional="0" release="0" software="C:\Users\Jake\Documents\Visual Studio 2013\Projects\cs491\cs491\csx\Debug\roles\contactWebsite" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="MyConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;contactWebsite&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;contactWebsite&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/cs491/cs491Group/contactWebsiteInstances" />
            <sCSPolicyUpdateDomainMoniker name="/cs491/cs491Group/contactWebsiteUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/cs491/cs491Group/contactWebsiteFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="contactWebsiteUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="contactWebsiteFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="contactWebsiteInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="47d5a0a8-e0f4-419e-8c25-7f4ca47b9817" ref="Microsoft.RedDog.Contract\ServiceContract\cs491Contract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="1342fc8c-36e8-4b62-9205-f431f5d0c2d1" ref="Microsoft.RedDog.Contract\Interface\contactWebsite:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/cs491/cs491Group/contactWebsite:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>