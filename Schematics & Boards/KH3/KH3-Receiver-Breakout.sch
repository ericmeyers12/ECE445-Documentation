<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="KH3-RXM-LINX-315">
<packages>
<package name="KH3-RXM-LINX-315">
<smd name="10" x="-8" y="-3.34" dx="1.78" dy="1.65" layer="1"/>
<smd name="9" x="-8" y="-0.8" dx="1.78" dy="1.65" layer="1"/>
<smd name="8" x="-8" y="1.74" dx="1.78" dy="1.65" layer="1"/>
<smd name="7" x="-8" y="4.28" dx="1.78" dy="1.65" layer="1"/>
<smd name="11" x="-8" y="-5.88" dx="1.78" dy="1.65" layer="1"/>
<smd name="12" x="-8" y="-8.42" dx="1.78" dy="1.65" layer="1"/>
<smd name="6" x="-8" y="6.82" dx="1.78" dy="1.65" layer="1"/>
<smd name="5" x="-8" y="9.36" dx="1.78" dy="1.65" layer="1"/>
<smd name="13" x="-8" y="-10.96" dx="1.78" dy="1.65" layer="1"/>
<smd name="4" x="-8" y="11.9" dx="1.78" dy="1.65" layer="1"/>
<smd name="3" x="-8" y="14.44" dx="1.78" dy="1.65" layer="1"/>
<smd name="14" x="-8" y="-13.5" dx="1.78" dy="1.65" layer="1"/>
<smd name="19" x="7.49" y="-3.34" dx="1.78" dy="1.65" layer="1"/>
<smd name="20" x="7.49" y="-0.8" dx="1.78" dy="1.65" layer="1"/>
<smd name="21" x="7.49" y="1.74" dx="1.78" dy="1.65" layer="1"/>
<smd name="22" x="7.49" y="4.28" dx="1.78" dy="1.65" layer="1"/>
<smd name="18" x="7.49" y="-5.88" dx="1.78" dy="1.65" layer="1"/>
<smd name="17" x="7.49" y="-8.42" dx="1.78" dy="1.65" layer="1"/>
<smd name="23" x="7.49" y="6.82" dx="1.78" dy="1.65" layer="1"/>
<smd name="24" x="7.49" y="9.36" dx="1.78" dy="1.65" layer="1"/>
<smd name="16" x="7.49" y="-10.96" dx="1.78" dy="1.65" layer="1"/>
<smd name="25" x="7.49" y="11.9" dx="1.78" dy="1.65" layer="1"/>
<smd name="26" x="7.49" y="14.44" dx="1.78" dy="1.65" layer="1"/>
<smd name="15" x="7.49" y="-13.5" dx="1.78" dy="1.65" layer="1"/>
<smd name="31" x="4.95" y="-14.67" dx="1.78" dy="1.65" layer="1"/>
<smd name="30" x="-2.01" y="-14.67" dx="1.78" dy="1.65" layer="1"/>
<smd name="29" x="-4.55" y="-14.67" dx="1.78" dy="1.65" layer="1"/>
<smd name="2" x="-8" y="16.98" dx="1.78" dy="1.65" layer="1"/>
<smd name="1" x="-8" y="19.52" dx="1.78" dy="1.65" layer="1"/>
<smd name="27" x="7.49" y="16.98" dx="1.78" dy="1.65" layer="1"/>
<smd name="28" x="7.49" y="19.52" dx="1.78" dy="1.65" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="KH3-RXM-LINX-315">
<pin name="NC1" x="-20.32" y="15.24" length="middle" direction="nc"/>
<pin name="D0" x="-20.32" y="12.7" length="middle"/>
<pin name="D1" x="-20.32" y="10.16" length="middle"/>
<pin name="GND1" x="-20.32" y="7.62" length="middle"/>
<pin name="VCC" x="-20.32" y="5.08" length="middle"/>
<pin name="PDN" x="-20.32" y="2.54" length="middle"/>
<pin name="D2" x="-20.32" y="0" length="middle"/>
<pin name="D3" x="-20.32" y="-2.54" length="middle"/>
<pin name="D4" x="-20.32" y="-5.08" length="middle"/>
<pin name="DATA" x="-20.32" y="-7.62" length="middle"/>
<pin name="VT" x="-20.32" y="-10.16" length="middle"/>
<pin name="D5" x="-20.32" y="-12.7" length="middle"/>
<pin name="D6" x="-20.32" y="-15.24" length="middle"/>
<pin name="D7" x="-20.32" y="-17.78" length="middle"/>
<pin name="A0" x="20.32" y="-17.78" length="middle" rot="R180"/>
<pin name="A1" x="20.32" y="-15.24" length="middle" rot="R180"/>
<pin name="A2" x="20.32" y="-12.7" length="middle" rot="R180"/>
<pin name="A3" x="20.32" y="-10.16" length="middle" rot="R180"/>
<pin name="A4" x="20.32" y="-7.62" length="middle" rot="R180"/>
<pin name="A5" x="20.32" y="-5.08" length="middle" rot="R180"/>
<pin name="A6" x="20.32" y="-2.54" length="middle" rot="R180"/>
<pin name="A7" x="20.32" y="0" length="middle" rot="R180"/>
<pin name="A8" x="20.32" y="2.54" length="middle" rot="R180"/>
<pin name="A9" x="20.32" y="5.08" length="middle" rot="R180"/>
<pin name="RSSI" x="20.32" y="7.62" length="middle" rot="R180"/>
<pin name="NC2" x="20.32" y="10.16" length="middle" direction="nc" rot="R180"/>
<pin name="GND2" x="20.32" y="12.7" length="middle" rot="R180"/>
<pin name="ANT" x="20.32" y="15.24" length="middle" rot="R180"/>
<pin name="D_CFG" x="-5.08" y="-25.4" length="middle" rot="R90"/>
<pin name="A_CFG0" x="-2.54" y="-25.4" length="middle" rot="R90"/>
<pin name="A_CFG1" x="5.08" y="-25.4" length="middle" rot="R90"/>
<wire x1="15.24" y1="-20.32" x2="-15.24" y2="-20.32" width="0.254" layer="94"/>
<wire x1="-15.24" y1="-20.32" x2="-15.24" y2="17.78" width="0.254" layer="94"/>
<wire x1="-15.24" y1="17.78" x2="15.24" y2="17.78" width="0.254" layer="94"/>
<wire x1="15.24" y1="17.78" x2="15.24" y2="-20.32" width="0.254" layer="94"/>
<text x="-2.54" y="15.24" size="1.778" layer="94">&gt;Name</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="KH3-RXM-LINX-315">
<gates>
<gate name="G$1" symbol="KH3-RXM-LINX-315" x="0" y="0"/>
</gates>
<devices>
<device name="" package="KH3-RXM-LINX-315">
<connects>
<connect gate="G$1" pin="A0" pad="15"/>
<connect gate="G$1" pin="A1" pad="16"/>
<connect gate="G$1" pin="A2" pad="17"/>
<connect gate="G$1" pin="A3" pad="18"/>
<connect gate="G$1" pin="A4" pad="19"/>
<connect gate="G$1" pin="A5" pad="20"/>
<connect gate="G$1" pin="A6" pad="21"/>
<connect gate="G$1" pin="A7" pad="22"/>
<connect gate="G$1" pin="A8" pad="23"/>
<connect gate="G$1" pin="A9" pad="24"/>
<connect gate="G$1" pin="ANT" pad="28"/>
<connect gate="G$1" pin="A_CFG0" pad="30"/>
<connect gate="G$1" pin="A_CFG1" pad="31"/>
<connect gate="G$1" pin="D0" pad="2"/>
<connect gate="G$1" pin="D1" pad="3"/>
<connect gate="G$1" pin="D2" pad="7"/>
<connect gate="G$1" pin="D3" pad="8"/>
<connect gate="G$1" pin="D4" pad="9"/>
<connect gate="G$1" pin="D5" pad="12"/>
<connect gate="G$1" pin="D6" pad="13"/>
<connect gate="G$1" pin="D7" pad="14"/>
<connect gate="G$1" pin="DATA" pad="10"/>
<connect gate="G$1" pin="D_CFG" pad="29"/>
<connect gate="G$1" pin="GND1" pad="4"/>
<connect gate="G$1" pin="GND2" pad="27"/>
<connect gate="G$1" pin="NC1" pad="1"/>
<connect gate="G$1" pin="NC2" pad="26"/>
<connect gate="G$1" pin="PDN" pad="6"/>
<connect gate="G$1" pin="RSSI" pad="25"/>
<connect gate="G$1" pin="VCC" pad="5"/>
<connect gate="G$1" pin="VT" pad="11"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="pinhead">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="1X16">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="15.24" y1="0.635" x2="15.875" y2="1.27" width="0.1524" layer="21"/>
<wire x1="15.875" y1="1.27" x2="17.145" y2="1.27" width="0.1524" layer="21"/>
<wire x1="17.145" y1="1.27" x2="17.78" y2="0.635" width="0.1524" layer="21"/>
<wire x1="17.78" y1="0.635" x2="17.78" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="17.78" y1="-0.635" x2="17.145" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="17.145" y1="-1.27" x2="15.875" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="15.875" y1="-1.27" x2="15.24" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="10.795" y1="1.27" x2="12.065" y2="1.27" width="0.1524" layer="21"/>
<wire x1="12.065" y1="1.27" x2="12.7" y2="0.635" width="0.1524" layer="21"/>
<wire x1="12.7" y1="0.635" x2="12.7" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="12.7" y1="-0.635" x2="12.065" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="12.7" y1="0.635" x2="13.335" y2="1.27" width="0.1524" layer="21"/>
<wire x1="13.335" y1="1.27" x2="14.605" y2="1.27" width="0.1524" layer="21"/>
<wire x1="14.605" y1="1.27" x2="15.24" y2="0.635" width="0.1524" layer="21"/>
<wire x1="15.24" y1="0.635" x2="15.24" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-0.635" x2="14.605" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="14.605" y1="-1.27" x2="13.335" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="13.335" y1="-1.27" x2="12.7" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="8.255" y2="1.27" width="0.1524" layer="21"/>
<wire x1="8.255" y1="1.27" x2="9.525" y2="1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="1.27" x2="10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="0.635" x2="10.16" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-0.635" x2="9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="-1.27" x2="8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="8.255" y1="-1.27" x2="7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="10.795" y1="1.27" x2="10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-0.635" x2="10.795" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="12.065" y1="-1.27" x2="10.795" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="1.27" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-0.635" x2="6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-1.27" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-1.27" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-1.27" x2="-6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-1.27" x2="-7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-12.065" y1="1.27" x2="-10.795" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="1.27" x2="-10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="0.635" x2="-10.16" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-0.635" x2="-10.795" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="0.635" x2="-9.525" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="1.27" x2="-8.255" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="1.27" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-0.635" x2="-8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="-1.27" x2="-9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="-1.27" x2="-10.16" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="0.635" x2="-14.605" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="1.27" x2="-13.335" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="1.27" x2="-12.7" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="0.635" x2="-12.7" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="-0.635" x2="-13.335" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="-1.27" x2="-14.605" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="-1.27" x2="-15.24" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-12.065" y1="1.27" x2="-12.7" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="-0.635" x2="-12.065" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-1.27" x2="-12.065" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-19.685" y1="1.27" x2="-18.415" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-18.415" y1="1.27" x2="-17.78" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="0.635" x2="-17.78" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="-0.635" x2="-18.415" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="0.635" x2="-17.145" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-17.145" y1="1.27" x2="-15.875" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-15.875" y1="1.27" x2="-15.24" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="0.635" x2="-15.24" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="-0.635" x2="-15.875" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-15.875" y1="-1.27" x2="-17.145" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-17.145" y1="-1.27" x2="-17.78" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-20.32" y1="0.635" x2="-20.32" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-19.685" y1="1.27" x2="-20.32" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-20.32" y1="-0.635" x2="-19.685" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-18.415" y1="-1.27" x2="-19.685" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="17.78" y1="0.635" x2="18.415" y2="1.27" width="0.1524" layer="21"/>
<wire x1="18.415" y1="1.27" x2="19.685" y2="1.27" width="0.1524" layer="21"/>
<wire x1="19.685" y1="1.27" x2="20.32" y2="0.635" width="0.1524" layer="21"/>
<wire x1="20.32" y1="0.635" x2="20.32" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="20.32" y1="-0.635" x2="19.685" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="19.685" y1="-1.27" x2="18.415" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="18.415" y1="-1.27" x2="17.78" y2="-0.635" width="0.1524" layer="21"/>
<pad name="1" x="-19.05" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-16.51" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-13.97" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="-11.43" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="-8.89" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="-6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="7" x="-3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="8" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="9" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="10" x="3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="11" x="6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="12" x="8.89" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="13" x="11.43" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="14" x="13.97" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="15" x="16.51" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="16" x="19.05" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-20.3962" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-20.32" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="16.256" y1="-0.254" x2="16.764" y2="0.254" layer="51"/>
<rectangle x1="13.716" y1="-0.254" x2="14.224" y2="0.254" layer="51"/>
<rectangle x1="11.176" y1="-0.254" x2="11.684" y2="0.254" layer="51"/>
<rectangle x1="8.636" y1="-0.254" x2="9.144" y2="0.254" layer="51"/>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-6.604" y1="-0.254" x2="-6.096" y2="0.254" layer="51"/>
<rectangle x1="-9.144" y1="-0.254" x2="-8.636" y2="0.254" layer="51"/>
<rectangle x1="-11.684" y1="-0.254" x2="-11.176" y2="0.254" layer="51"/>
<rectangle x1="-14.224" y1="-0.254" x2="-13.716" y2="0.254" layer="51"/>
<rectangle x1="-16.764" y1="-0.254" x2="-16.256" y2="0.254" layer="51"/>
<rectangle x1="-19.304" y1="-0.254" x2="-18.796" y2="0.254" layer="51"/>
<rectangle x1="18.796" y1="-0.254" x2="19.304" y2="0.254" layer="51"/>
</package>
<package name="1X16/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-20.32" y1="-1.905" x2="-17.78" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="-1.905" x2="-17.78" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="0.635" x2="-20.32" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-20.32" y1="0.635" x2="-20.32" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-19.05" y1="6.985" x2="-19.05" y2="1.27" width="0.762" layer="21"/>
<wire x1="-17.78" y1="-1.905" x2="-15.24" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="-1.905" x2="-15.24" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="0.635" x2="-17.78" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-16.51" y1="6.985" x2="-16.51" y2="1.27" width="0.762" layer="21"/>
<wire x1="-15.24" y1="-1.905" x2="-12.7" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="-1.905" x2="-12.7" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="0.635" x2="-15.24" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-13.97" y1="6.985" x2="-13.97" y2="1.27" width="0.762" layer="21"/>
<wire x1="-12.7" y1="-1.905" x2="-10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-1.905" x2="-10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="0.635" x2="-12.7" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="6.985" x2="-11.43" y2="1.27" width="0.762" layer="21"/>
<wire x1="-10.16" y1="-1.905" x2="-7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="6.985" x2="-8.89" y2="1.27" width="0.762" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="6.985" x2="-6.35" y2="1.27" width="0.762" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="6.985" x2="-3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="6.985" x2="3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="6.985" x2="6.35" y2="1.27" width="0.762" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-1.905" x2="10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="0.635" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="8.89" y1="6.985" x2="8.89" y2="1.27" width="0.762" layer="21"/>
<wire x1="10.16" y1="-1.905" x2="12.7" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="12.7" y1="-1.905" x2="12.7" y2="0.635" width="0.1524" layer="21"/>
<wire x1="12.7" y1="0.635" x2="10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="11.43" y1="6.985" x2="11.43" y2="1.27" width="0.762" layer="21"/>
<wire x1="12.7" y1="-1.905" x2="15.24" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-1.905" x2="15.24" y2="0.635" width="0.1524" layer="21"/>
<wire x1="15.24" y1="0.635" x2="12.7" y2="0.635" width="0.1524" layer="21"/>
<wire x1="13.97" y1="6.985" x2="13.97" y2="1.27" width="0.762" layer="21"/>
<wire x1="15.24" y1="-1.905" x2="17.78" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="17.78" y1="-1.905" x2="17.78" y2="0.635" width="0.1524" layer="21"/>
<wire x1="17.78" y1="0.635" x2="15.24" y2="0.635" width="0.1524" layer="21"/>
<wire x1="16.51" y1="6.985" x2="16.51" y2="1.27" width="0.762" layer="21"/>
<wire x1="17.78" y1="-1.905" x2="20.32" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="20.32" y1="-1.905" x2="20.32" y2="0.635" width="0.1524" layer="21"/>
<wire x1="20.32" y1="0.635" x2="17.78" y2="0.635" width="0.1524" layer="21"/>
<wire x1="19.05" y1="6.985" x2="19.05" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-19.05" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-16.51" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-13.97" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="-11.43" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="-8.89" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="-6.35" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="7" x="-3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="8" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="9" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="10" x="3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="11" x="6.35" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="12" x="8.89" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="13" x="11.43" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="14" x="13.97" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="15" x="16.51" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="16" x="19.05" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-20.955" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="22.225" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-19.431" y1="0.635" x2="-18.669" y2="1.143" layer="21"/>
<rectangle x1="-16.891" y1="0.635" x2="-16.129" y2="1.143" layer="21"/>
<rectangle x1="-14.351" y1="0.635" x2="-13.589" y2="1.143" layer="21"/>
<rectangle x1="-11.811" y1="0.635" x2="-11.049" y2="1.143" layer="21"/>
<rectangle x1="-9.271" y1="0.635" x2="-8.509" y2="1.143" layer="21"/>
<rectangle x1="-6.731" y1="0.635" x2="-5.969" y2="1.143" layer="21"/>
<rectangle x1="-4.191" y1="0.635" x2="-3.429" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="3.429" y1="0.635" x2="4.191" y2="1.143" layer="21"/>
<rectangle x1="5.969" y1="0.635" x2="6.731" y2="1.143" layer="21"/>
<rectangle x1="8.509" y1="0.635" x2="9.271" y2="1.143" layer="21"/>
<rectangle x1="11.049" y1="0.635" x2="11.811" y2="1.143" layer="21"/>
<rectangle x1="13.589" y1="0.635" x2="14.351" y2="1.143" layer="21"/>
<rectangle x1="16.129" y1="0.635" x2="16.891" y2="1.143" layer="21"/>
<rectangle x1="18.669" y1="0.635" x2="19.431" y2="1.143" layer="21"/>
<rectangle x1="-19.431" y1="-2.921" x2="-18.669" y2="-1.905" layer="21"/>
<rectangle x1="-16.891" y1="-2.921" x2="-16.129" y2="-1.905" layer="21"/>
<rectangle x1="-14.351" y1="-2.921" x2="-13.589" y2="-1.905" layer="21"/>
<rectangle x1="-11.811" y1="-2.921" x2="-11.049" y2="-1.905" layer="21"/>
<rectangle x1="-9.271" y1="-2.921" x2="-8.509" y2="-1.905" layer="21"/>
<rectangle x1="-6.731" y1="-2.921" x2="-5.969" y2="-1.905" layer="21"/>
<rectangle x1="-4.191" y1="-2.921" x2="-3.429" y2="-1.905" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
<rectangle x1="3.429" y1="-2.921" x2="4.191" y2="-1.905" layer="21"/>
<rectangle x1="5.969" y1="-2.921" x2="6.731" y2="-1.905" layer="21"/>
<rectangle x1="8.509" y1="-2.921" x2="9.271" y2="-1.905" layer="21"/>
<rectangle x1="11.049" y1="-2.921" x2="11.811" y2="-1.905" layer="21"/>
<rectangle x1="13.589" y1="-2.921" x2="14.351" y2="-1.905" layer="21"/>
<rectangle x1="16.129" y1="-2.921" x2="16.891" y2="-1.905" layer="21"/>
<rectangle x1="18.669" y1="-2.921" x2="19.431" y2="-1.905" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="PINHD16">
<wire x1="-6.35" y1="-22.86" x2="1.27" y2="-22.86" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-22.86" x2="1.27" y2="20.32" width="0.4064" layer="94"/>
<wire x1="1.27" y1="20.32" x2="-6.35" y2="20.32" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="20.32" x2="-6.35" y2="-22.86" width="0.4064" layer="94"/>
<text x="-6.35" y="20.955" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-25.4" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="17.78" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="15.24" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="12.7" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="10.16" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="5" x="-2.54" y="7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="7" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="8" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="9" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="10" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="11" x="-2.54" y="-7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="12" x="-2.54" y="-10.16" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="13" x="-2.54" y="-12.7" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="14" x="-2.54" y="-15.24" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="15" x="-2.54" y="-17.78" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="16" x="-2.54" y="-20.32" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-1X16" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD16" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X16">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="11" pad="11"/>
<connect gate="A" pin="12" pad="12"/>
<connect gate="A" pin="13" pad="13"/>
<connect gate="A" pin="14" pad="14"/>
<connect gate="A" pin="15" pad="15"/>
<connect gate="A" pin="16" pad="16"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="1X16/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="11" pad="11"/>
<connect gate="A" pin="12" pad="12"/>
<connect gate="A" pin="13" pad="13"/>
<connect gate="A" pin="14" pad="14"/>
<connect gate="A" pin="15" pad="15"/>
<connect gate="A" pin="16" pad="16"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U$1" library="KH3-RXM-LINX-315" deviceset="KH3-RXM-LINX-315" device=""/>
<part name="JP1" library="pinhead" deviceset="PINHD-1X16" device=""/>
<part name="JP2" library="pinhead" deviceset="PINHD-1X16" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="63.5" y="58.42"/>
<instance part="JP1" gate="A" x="58.42" y="7.62"/>
<instance part="JP2" gate="A" x="63.5" y="5.08" rot="R180"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<wire x1="43.18" y1="68.58" x2="-7.62" y2="68.58" width="0.1524" layer="91"/>
<wire x1="-7.62" y1="68.58" x2="-7.62" y2="20.32" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="D1"/>
<wire x1="55.88" y1="20.32" x2="-7.62" y2="20.32" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="3"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<wire x1="43.18" y1="66.04" x2="-5.08" y2="66.04" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="66.04" x2="-5.08" y2="17.78" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="GND1"/>
<wire x1="55.88" y1="17.78" x2="-5.08" y2="17.78" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="4"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<wire x1="43.18" y1="63.5" x2="-2.54" y2="63.5" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="63.5" x2="-2.54" y2="15.24" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="VCC"/>
<wire x1="55.88" y1="15.24" x2="-2.54" y2="15.24" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="5"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<wire x1="43.18" y1="60.96" x2="0" y2="60.96" width="0.1524" layer="91"/>
<wire x1="0" y1="60.96" x2="0" y2="12.7" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="PDN"/>
<wire x1="55.88" y1="12.7" x2="0" y2="12.7" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="6"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="43.18" y1="58.42" x2="2.54" y2="58.42" width="0.1524" layer="91"/>
<wire x1="2.54" y1="58.42" x2="2.54" y2="10.16" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="D2"/>
<wire x1="55.88" y1="10.16" x2="2.54" y2="10.16" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="7"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<wire x1="43.18" y1="55.88" x2="5.08" y2="55.88" width="0.1524" layer="91"/>
<wire x1="5.08" y1="55.88" x2="5.08" y2="7.62" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="D3"/>
<wire x1="55.88" y1="7.62" x2="5.08" y2="7.62" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="8"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<wire x1="43.18" y1="53.34" x2="7.62" y2="53.34" width="0.1524" layer="91"/>
<wire x1="7.62" y1="53.34" x2="7.62" y2="5.08" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="D4"/>
<wire x1="55.88" y1="5.08" x2="7.62" y2="5.08" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="9"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<wire x1="10.16" y1="50.8" x2="10.16" y2="2.54" width="0.1524" layer="91"/>
<wire x1="10.16" y1="50.8" x2="43.18" y2="50.8" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="DATA"/>
<wire x1="55.88" y1="2.54" x2="10.16" y2="2.54" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="10"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<wire x1="43.18" y1="48.26" x2="12.7" y2="48.26" width="0.1524" layer="91"/>
<wire x1="12.7" y1="48.26" x2="12.7" y2="0" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="VT"/>
<wire x1="55.88" y1="0" x2="12.7" y2="0" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="11"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<wire x1="43.18" y1="45.72" x2="15.24" y2="45.72" width="0.1524" layer="91"/>
<wire x1="15.24" y1="45.72" x2="15.24" y2="-2.54" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="D5"/>
<wire x1="55.88" y1="-2.54" x2="15.24" y2="-2.54" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="12"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<wire x1="43.18" y1="43.18" x2="17.78" y2="43.18" width="0.1524" layer="91"/>
<wire x1="17.78" y1="43.18" x2="17.78" y2="-5.08" width="0.1524" layer="91"/>
<wire x1="17.78" y1="-5.08" x2="55.88" y2="-5.08" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="D6"/>
<pinref part="JP1" gate="A" pin="13"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<wire x1="43.18" y1="40.64" x2="20.32" y2="40.64" width="0.1524" layer="91"/>
<wire x1="20.32" y1="40.64" x2="20.32" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="20.32" y1="-7.62" x2="55.88" y2="-7.62" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="D7"/>
<pinref part="JP1" gate="A" pin="14"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<wire x1="58.42" y1="33.02" x2="22.86" y2="33.02" width="0.1524" layer="91"/>
<wire x1="22.86" y1="33.02" x2="22.86" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="22.86" y1="-10.16" x2="55.88" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="D_CFG"/>
<pinref part="JP1" gate="A" pin="15"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<wire x1="60.96" y1="33.02" x2="60.96" y2="30.48" width="0.1524" layer="91"/>
<wire x1="60.96" y1="30.48" x2="25.4" y2="30.48" width="0.1524" layer="91"/>
<wire x1="25.4" y1="30.48" x2="25.4" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="25.4" y1="-12.7" x2="55.88" y2="-12.7" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="A_CFG0"/>
<pinref part="JP1" gate="A" pin="16"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<wire x1="83.82" y1="68.58" x2="132.08" y2="68.58" width="0.1524" layer="91"/>
<wire x1="132.08" y1="68.58" x2="132.08" y2="17.78" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="NC2"/>
<wire x1="66.04" y1="17.78" x2="132.08" y2="17.78" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="13"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<wire x1="83.82" y1="66.04" x2="129.54" y2="66.04" width="0.1524" layer="91"/>
<wire x1="129.54" y1="66.04" x2="129.54" y2="15.24" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="RSSI"/>
<wire x1="66.04" y1="15.24" x2="129.54" y2="15.24" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="12"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<wire x1="83.82" y1="63.5" x2="127" y2="63.5" width="0.1524" layer="91"/>
<wire x1="127" y1="63.5" x2="127" y2="12.7" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="A9"/>
<wire x1="66.04" y1="12.7" x2="127" y2="12.7" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="11"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<wire x1="83.82" y1="60.96" x2="124.46" y2="60.96" width="0.1524" layer="91"/>
<wire x1="124.46" y1="60.96" x2="124.46" y2="10.16" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="A8"/>
<wire x1="66.04" y1="10.16" x2="124.46" y2="10.16" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="10"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<wire x1="83.82" y1="58.42" x2="121.92" y2="58.42" width="0.1524" layer="91"/>
<wire x1="121.92" y1="58.42" x2="121.92" y2="7.62" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="A7"/>
<wire x1="66.04" y1="7.62" x2="121.92" y2="7.62" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="9"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<wire x1="83.82" y1="55.88" x2="119.38" y2="55.88" width="0.1524" layer="91"/>
<wire x1="119.38" y1="55.88" x2="119.38" y2="5.08" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="A6"/>
<wire x1="66.04" y1="5.08" x2="119.38" y2="5.08" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="8"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<wire x1="83.82" y1="53.34" x2="116.84" y2="53.34" width="0.1524" layer="91"/>
<wire x1="116.84" y1="53.34" x2="116.84" y2="2.54" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="A5"/>
<wire x1="66.04" y1="2.54" x2="116.84" y2="2.54" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="7"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<wire x1="83.82" y1="50.8" x2="114.3" y2="50.8" width="0.1524" layer="91"/>
<wire x1="114.3" y1="50.8" x2="114.3" y2="0" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="A4"/>
<wire x1="66.04" y1="0" x2="114.3" y2="0" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="6"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<wire x1="83.82" y1="48.26" x2="111.76" y2="48.26" width="0.1524" layer="91"/>
<wire x1="111.76" y1="48.26" x2="111.76" y2="-2.54" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="A3"/>
<wire x1="66.04" y1="-2.54" x2="111.76" y2="-2.54" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="5"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<wire x1="83.82" y1="45.72" x2="109.22" y2="45.72" width="0.1524" layer="91"/>
<wire x1="109.22" y1="45.72" x2="109.22" y2="-5.08" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="A2"/>
<wire x1="66.04" y1="-5.08" x2="109.22" y2="-5.08" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="4"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<wire x1="83.82" y1="43.18" x2="106.68" y2="43.18" width="0.1524" layer="91"/>
<wire x1="106.68" y1="43.18" x2="106.68" y2="-7.62" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="A1"/>
<wire x1="66.04" y1="-7.62" x2="106.68" y2="-7.62" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="3"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<wire x1="83.82" y1="40.64" x2="104.14" y2="40.64" width="0.1524" layer="91"/>
<wire x1="104.14" y1="40.64" x2="104.14" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="A0"/>
<wire x1="66.04" y1="-10.16" x2="104.14" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="2"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<wire x1="68.58" y1="33.02" x2="68.58" y2="30.48" width="0.1524" layer="91"/>
<wire x1="68.58" y1="30.48" x2="81.28" y2="30.48" width="0.1524" layer="91"/>
<wire x1="81.28" y1="30.48" x2="81.28" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="81.28" y1="-12.7" x2="66.04" y2="-12.7" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="A_CFG1"/>
<pinref part="JP2" gate="A" pin="1"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="JP2" gate="A" pin="14"/>
<wire x1="66.04" y1="20.32" x2="134.62" y2="20.32" width="0.1524" layer="91"/>
<wire x1="134.62" y1="20.32" x2="134.62" y2="71.12" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="GND2"/>
<wire x1="134.62" y1="71.12" x2="83.82" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="ANT"/>
<wire x1="83.82" y1="73.66" x2="137.16" y2="73.66" width="0.1524" layer="91"/>
<wire x1="137.16" y1="73.66" x2="137.16" y2="22.86" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="15"/>
<wire x1="137.16" y1="22.86" x2="66.04" y2="22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<pinref part="JP1" gate="A" pin="2"/>
<wire x1="55.88" y1="22.86" x2="-10.16" y2="22.86" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="22.86" x2="-10.16" y2="71.12" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="D0"/>
<wire x1="-10.16" y1="71.12" x2="43.18" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="NC1"/>
<wire x1="43.18" y1="73.66" x2="-12.7" y2="73.66" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="73.66" x2="-12.7" y2="25.4" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="1"/>
<wire x1="-12.7" y1="25.4" x2="55.88" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
