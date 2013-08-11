<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.4">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
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
<library name="GNLib">
<packages>
<package name="ZZZ_MODULE_05X05">
<pad name="GND@6" x="5.08" y="2.54" drill="0.64" diameter="1.9304"/>
<wire x1="0" y1="0" x2="50" y2="0" width="0" layer="49"/>
<wire x1="50" y1="0" x2="50" y2="50" width="0" layer="49"/>
<wire x1="50" y1="50" x2="0" y2="50" width="0" layer="49"/>
<wire x1="0" y1="50" x2="0" y2="0" width="0" layer="49"/>
<pad name="GND@7" x="2.54" y="2.54" drill="0.64" diameter="1.9304" shape="square"/>
<pad name="GND@1" x="2.5" y="47.5" drill="0.64" diameter="1.9304" shape="square"/>
<pad name="GND@2" x="44.92" y="47.46" drill="0.64" diameter="1.9304" shape="square"/>
<pad name="GND@3" x="47.46" y="47.46" drill="0.64" diameter="1.9304"/>
<pad name="GND@4" x="5.08" y="47.46" drill="0.64" diameter="1.9304"/>
<pad name="GND@5" x="47.46" y="2.54" drill="0.64" diameter="1.9304"/>
<pad name="GND@8" x="44.92" y="2.54" drill="0.64" diameter="1.9304" shape="square"/>
</package>
</packages>
<symbols>
<symbol name="ZZZ_MODULE">
<pin name="GND" x="0" y="0" visible="off" length="short" direction="sup" rot="R90"/>
<rectangle x1="-5.08" y1="2.54" x2="5.08" y2="12.7" layer="94"/>
<text x="-5.08" y="12.7" size="1.778" layer="95">&gt;NAME</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="ZZZ_MODULE" prefix="PCB">
<gates>
<gate name="G$1" symbol="ZZZ_MODULE" x="45.72" y="-15.24"/>
</gates>
<devices>
<device name="05X05" package="ZZZ_MODULE_05X05">
<connects>
<connect gate="G$1" pin="GND" pad="GND@1 GND@2 GND@3 GND@4 GND@5 GND@6 GND@7 GND@8"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
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
<part name="PCB1" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB2" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB3" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB4" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB5" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB6" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB7" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="PCB8" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB9" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB10" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB11" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB12" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB13" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB14" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
<part name="GND10" library="supply1" deviceset="GND" device=""/>
<part name="GND11" library="supply1" deviceset="GND" device=""/>
<part name="GND12" library="supply1" deviceset="GND" device=""/>
<part name="GND13" library="supply1" deviceset="GND" device=""/>
<part name="GND14" library="supply1" deviceset="GND" device=""/>
<part name="PCB15" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB16" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB17" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB18" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB19" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB20" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB21" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="GND15" library="supply1" deviceset="GND" device=""/>
<part name="GND16" library="supply1" deviceset="GND" device=""/>
<part name="GND17" library="supply1" deviceset="GND" device=""/>
<part name="GND18" library="supply1" deviceset="GND" device=""/>
<part name="GND19" library="supply1" deviceset="GND" device=""/>
<part name="GND20" library="supply1" deviceset="GND" device=""/>
<part name="GND21" library="supply1" deviceset="GND" device=""/>
<part name="PCB22" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB23" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB24" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB25" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB26" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB27" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB28" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="GND22" library="supply1" deviceset="GND" device=""/>
<part name="GND23" library="supply1" deviceset="GND" device=""/>
<part name="GND24" library="supply1" deviceset="GND" device=""/>
<part name="GND25" library="supply1" deviceset="GND" device=""/>
<part name="GND26" library="supply1" deviceset="GND" device=""/>
<part name="GND27" library="supply1" deviceset="GND" device=""/>
<part name="GND28" library="supply1" deviceset="GND" device=""/>
<part name="PCB29" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB30" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB31" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB32" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB33" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB34" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB35" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="GND29" library="supply1" deviceset="GND" device=""/>
<part name="GND30" library="supply1" deviceset="GND" device=""/>
<part name="GND31" library="supply1" deviceset="GND" device=""/>
<part name="GND32" library="supply1" deviceset="GND" device=""/>
<part name="GND33" library="supply1" deviceset="GND" device=""/>
<part name="GND34" library="supply1" deviceset="GND" device=""/>
<part name="GND35" library="supply1" deviceset="GND" device=""/>
<part name="PCB36" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB37" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB38" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB39" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB40" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB41" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB42" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="GND36" library="supply1" deviceset="GND" device=""/>
<part name="GND37" library="supply1" deviceset="GND" device=""/>
<part name="GND38" library="supply1" deviceset="GND" device=""/>
<part name="GND39" library="supply1" deviceset="GND" device=""/>
<part name="GND40" library="supply1" deviceset="GND" device=""/>
<part name="GND41" library="supply1" deviceset="GND" device=""/>
<part name="GND42" library="supply1" deviceset="GND" device=""/>
<part name="PCB43" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB44" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB45" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB46" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB47" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB48" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="PCB49" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="GND43" library="supply1" deviceset="GND" device=""/>
<part name="GND44" library="supply1" deviceset="GND" device=""/>
<part name="GND45" library="supply1" deviceset="GND" device=""/>
<part name="GND46" library="supply1" deviceset="GND" device=""/>
<part name="GND47" library="supply1" deviceset="GND" device=""/>
<part name="GND48" library="supply1" deviceset="GND" device=""/>
<part name="GND49" library="supply1" deviceset="GND" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="PCB1" gate="G$1" x="60.96" y="99.06"/>
<instance part="PCB2" gate="G$1" x="73.66" y="99.06"/>
<instance part="PCB3" gate="G$1" x="86.36" y="99.06"/>
<instance part="PCB4" gate="G$1" x="99.06" y="99.06"/>
<instance part="PCB5" gate="G$1" x="111.76" y="99.06"/>
<instance part="PCB6" gate="G$1" x="124.46" y="99.06"/>
<instance part="PCB7" gate="G$1" x="137.16" y="99.06"/>
<instance part="GND1" gate="1" x="60.96" y="96.52"/>
<instance part="GND2" gate="1" x="73.66" y="96.52"/>
<instance part="GND3" gate="1" x="86.36" y="96.52"/>
<instance part="GND4" gate="1" x="99.06" y="96.52"/>
<instance part="GND5" gate="1" x="111.76" y="96.52"/>
<instance part="GND6" gate="1" x="124.46" y="96.52"/>
<instance part="GND7" gate="1" x="137.16" y="96.52"/>
<instance part="PCB8" gate="G$1" x="60.96" y="76.2"/>
<instance part="PCB9" gate="G$1" x="73.66" y="76.2"/>
<instance part="PCB10" gate="G$1" x="86.36" y="76.2"/>
<instance part="PCB11" gate="G$1" x="99.06" y="76.2"/>
<instance part="PCB12" gate="G$1" x="111.76" y="76.2"/>
<instance part="PCB13" gate="G$1" x="124.46" y="76.2"/>
<instance part="PCB14" gate="G$1" x="137.16" y="76.2"/>
<instance part="GND8" gate="1" x="60.96" y="73.66"/>
<instance part="GND9" gate="1" x="73.66" y="73.66"/>
<instance part="GND10" gate="1" x="86.36" y="73.66"/>
<instance part="GND11" gate="1" x="99.06" y="73.66"/>
<instance part="GND12" gate="1" x="111.76" y="73.66"/>
<instance part="GND13" gate="1" x="124.46" y="73.66"/>
<instance part="GND14" gate="1" x="137.16" y="73.66"/>
<instance part="PCB15" gate="G$1" x="60.96" y="53.34"/>
<instance part="PCB16" gate="G$1" x="73.66" y="53.34"/>
<instance part="PCB17" gate="G$1" x="86.36" y="53.34"/>
<instance part="PCB18" gate="G$1" x="99.06" y="53.34"/>
<instance part="PCB19" gate="G$1" x="111.76" y="53.34"/>
<instance part="PCB20" gate="G$1" x="124.46" y="53.34"/>
<instance part="PCB21" gate="G$1" x="137.16" y="53.34"/>
<instance part="GND15" gate="1" x="60.96" y="50.8"/>
<instance part="GND16" gate="1" x="73.66" y="50.8"/>
<instance part="GND17" gate="1" x="86.36" y="50.8"/>
<instance part="GND18" gate="1" x="99.06" y="50.8"/>
<instance part="GND19" gate="1" x="111.76" y="50.8"/>
<instance part="GND20" gate="1" x="124.46" y="50.8"/>
<instance part="GND21" gate="1" x="137.16" y="50.8"/>
<instance part="PCB22" gate="G$1" x="60.96" y="30.48"/>
<instance part="PCB23" gate="G$1" x="73.66" y="30.48"/>
<instance part="PCB24" gate="G$1" x="86.36" y="30.48"/>
<instance part="PCB25" gate="G$1" x="99.06" y="30.48"/>
<instance part="PCB26" gate="G$1" x="111.76" y="30.48"/>
<instance part="PCB27" gate="G$1" x="124.46" y="30.48"/>
<instance part="PCB28" gate="G$1" x="137.16" y="30.48"/>
<instance part="GND22" gate="1" x="60.96" y="27.94"/>
<instance part="GND23" gate="1" x="73.66" y="27.94"/>
<instance part="GND24" gate="1" x="86.36" y="27.94"/>
<instance part="GND25" gate="1" x="99.06" y="27.94"/>
<instance part="GND26" gate="1" x="111.76" y="27.94"/>
<instance part="GND27" gate="1" x="124.46" y="27.94"/>
<instance part="GND28" gate="1" x="137.16" y="27.94"/>
<instance part="PCB29" gate="G$1" x="60.96" y="7.62"/>
<instance part="PCB30" gate="G$1" x="73.66" y="7.62"/>
<instance part="PCB31" gate="G$1" x="86.36" y="7.62"/>
<instance part="PCB32" gate="G$1" x="99.06" y="7.62"/>
<instance part="PCB33" gate="G$1" x="111.76" y="7.62"/>
<instance part="PCB34" gate="G$1" x="124.46" y="7.62"/>
<instance part="PCB35" gate="G$1" x="137.16" y="7.62"/>
<instance part="GND29" gate="1" x="60.96" y="5.08"/>
<instance part="GND30" gate="1" x="73.66" y="5.08"/>
<instance part="GND31" gate="1" x="86.36" y="5.08"/>
<instance part="GND32" gate="1" x="99.06" y="5.08"/>
<instance part="GND33" gate="1" x="111.76" y="5.08"/>
<instance part="GND34" gate="1" x="124.46" y="5.08"/>
<instance part="GND35" gate="1" x="137.16" y="5.08"/>
<instance part="PCB36" gate="G$1" x="60.96" y="-15.24"/>
<instance part="PCB37" gate="G$1" x="73.66" y="-15.24"/>
<instance part="PCB38" gate="G$1" x="86.36" y="-15.24"/>
<instance part="PCB39" gate="G$1" x="99.06" y="-15.24"/>
<instance part="PCB40" gate="G$1" x="111.76" y="-15.24"/>
<instance part="PCB41" gate="G$1" x="124.46" y="-15.24"/>
<instance part="PCB42" gate="G$1" x="137.16" y="-15.24"/>
<instance part="GND36" gate="1" x="60.96" y="-17.78"/>
<instance part="GND37" gate="1" x="73.66" y="-17.78"/>
<instance part="GND38" gate="1" x="86.36" y="-17.78"/>
<instance part="GND39" gate="1" x="99.06" y="-17.78"/>
<instance part="GND40" gate="1" x="111.76" y="-17.78"/>
<instance part="GND41" gate="1" x="124.46" y="-17.78"/>
<instance part="GND42" gate="1" x="137.16" y="-17.78"/>
<instance part="PCB43" gate="G$1" x="60.96" y="-40.64"/>
<instance part="PCB44" gate="G$1" x="73.66" y="-40.64"/>
<instance part="PCB45" gate="G$1" x="86.36" y="-40.64"/>
<instance part="PCB46" gate="G$1" x="99.06" y="-40.64"/>
<instance part="PCB47" gate="G$1" x="111.76" y="-40.64"/>
<instance part="PCB48" gate="G$1" x="124.46" y="-40.64"/>
<instance part="PCB49" gate="G$1" x="137.16" y="-40.64"/>
<instance part="GND43" gate="1" x="60.96" y="-43.18"/>
<instance part="GND44" gate="1" x="73.66" y="-43.18"/>
<instance part="GND45" gate="1" x="86.36" y="-43.18"/>
<instance part="GND46" gate="1" x="99.06" y="-43.18"/>
<instance part="GND47" gate="1" x="111.76" y="-43.18"/>
<instance part="GND48" gate="1" x="124.46" y="-43.18"/>
<instance part="GND49" gate="1" x="137.16" y="-43.18"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="PCB1" gate="G$1" pin="GND"/>
<pinref part="GND1" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB2" gate="G$1" pin="GND"/>
<pinref part="GND2" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB3" gate="G$1" pin="GND"/>
<pinref part="GND3" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB4" gate="G$1" pin="GND"/>
<pinref part="GND4" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB5" gate="G$1" pin="GND"/>
<pinref part="GND5" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB6" gate="G$1" pin="GND"/>
<pinref part="GND6" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB7" gate="G$1" pin="GND"/>
<pinref part="GND7" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB8" gate="G$1" pin="GND"/>
<pinref part="GND8" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB9" gate="G$1" pin="GND"/>
<pinref part="GND9" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB10" gate="G$1" pin="GND"/>
<pinref part="GND10" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB11" gate="G$1" pin="GND"/>
<pinref part="GND11" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB12" gate="G$1" pin="GND"/>
<pinref part="GND12" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB13" gate="G$1" pin="GND"/>
<pinref part="GND13" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB14" gate="G$1" pin="GND"/>
<pinref part="GND14" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB15" gate="G$1" pin="GND"/>
<pinref part="GND15" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB16" gate="G$1" pin="GND"/>
<pinref part="GND16" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB17" gate="G$1" pin="GND"/>
<pinref part="GND17" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB18" gate="G$1" pin="GND"/>
<pinref part="GND18" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB19" gate="G$1" pin="GND"/>
<pinref part="GND19" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB20" gate="G$1" pin="GND"/>
<pinref part="GND20" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB21" gate="G$1" pin="GND"/>
<pinref part="GND21" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB22" gate="G$1" pin="GND"/>
<pinref part="GND22" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB23" gate="G$1" pin="GND"/>
<pinref part="GND23" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB24" gate="G$1" pin="GND"/>
<pinref part="GND24" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB25" gate="G$1" pin="GND"/>
<pinref part="GND25" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB26" gate="G$1" pin="GND"/>
<pinref part="GND26" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB27" gate="G$1" pin="GND"/>
<pinref part="GND27" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB28" gate="G$1" pin="GND"/>
<pinref part="GND28" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB29" gate="G$1" pin="GND"/>
<pinref part="GND29" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB30" gate="G$1" pin="GND"/>
<pinref part="GND30" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB31" gate="G$1" pin="GND"/>
<pinref part="GND31" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB32" gate="G$1" pin="GND"/>
<pinref part="GND32" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB33" gate="G$1" pin="GND"/>
<pinref part="GND33" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB34" gate="G$1" pin="GND"/>
<pinref part="GND34" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB35" gate="G$1" pin="GND"/>
<pinref part="GND35" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB36" gate="G$1" pin="GND"/>
<pinref part="GND36" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB37" gate="G$1" pin="GND"/>
<pinref part="GND37" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB38" gate="G$1" pin="GND"/>
<pinref part="GND38" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB39" gate="G$1" pin="GND"/>
<pinref part="GND39" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB40" gate="G$1" pin="GND"/>
<pinref part="GND40" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB41" gate="G$1" pin="GND"/>
<pinref part="GND41" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB42" gate="G$1" pin="GND"/>
<pinref part="GND42" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB43" gate="G$1" pin="GND"/>
<pinref part="GND43" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB44" gate="G$1" pin="GND"/>
<pinref part="GND44" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB45" gate="G$1" pin="GND"/>
<pinref part="GND45" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB46" gate="G$1" pin="GND"/>
<pinref part="GND46" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB47" gate="G$1" pin="GND"/>
<pinref part="GND47" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB48" gate="G$1" pin="GND"/>
<pinref part="GND48" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PCB49" gate="G$1" pin="GND"/>
<pinref part="GND49" gate="1" pin="GND"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
