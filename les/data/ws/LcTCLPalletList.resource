<resource>
  <id>LcTCLPalletList</id>
  <name>LC TCL Pallet List</name>
  <description>List TCL Pallets</description>
  <properties>
        <property name="lodnum"         type="string"  pk="true"  description="LPN Number"/>
        <property name="prtnum"         type="string"  pk="false" description="Item on LPN"/>
        <property name="lpn_qty" 		type="integer" pk="false" description="Allocated quantity on LPN"/>
        <property name="order_number"   type="string"  pk="false" description="Order Number"/>
        <property name="order_type"		type="string"  pk="false" description="Order Type"/>
  </properties>
  <actions>
    <action type="list"     ref="listlctclpallets" />
	<action type="action"   ref="TagTCLPallets" />
  </actions>
</resource>