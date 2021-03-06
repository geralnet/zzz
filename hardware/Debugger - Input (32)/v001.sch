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
<library name="switch-dil">
<description>&lt;b&gt;DIL Switches and Code Switches&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="DIP08S">
<description>&lt;b&gt;DIL/CODE SWITCH&lt;/b&gt;&lt;p&gt;</description>
<wire x1="-9.525" y1="-1.27" x2="-8.255" y2="-1.27" width="0.254" layer="21"/>
<wire x1="-8.255" y1="-1.27" x2="-8.255" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="-8.255" y1="1.27" x2="-9.525" y2="1.27" width="0.254" layer="21"/>
<wire x1="-9.525" y1="1.27" x2="-9.525" y2="-0.635" width="0.254" layer="21"/>
<wire x1="-6.985" y1="-1.27" x2="-5.715" y2="-1.27" width="0.254" layer="21"/>
<wire x1="-5.715" y1="-1.27" x2="-5.715" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-6.985" y2="1.27" width="0.254" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-6.985" y2="-0.635" width="0.254" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-3.175" y2="-1.27" width="0.254" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-3.175" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-4.445" y2="1.27" width="0.254" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-4.445" y2="-0.635" width="0.254" layer="21"/>
<wire x1="-9.525" y1="-0.9398" x2="-8.255" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="-9.525" y1="-0.9398" x2="-9.525" y2="-1.27" width="0.254" layer="21"/>
<wire x1="-8.255" y1="-0.9398" x2="-8.255" y2="-0.635" width="0.254" layer="21"/>
<wire x1="-9.525" y1="-0.635" x2="-8.255" y2="-0.635" width="0.254" layer="21"/>
<wire x1="-9.525" y1="-0.635" x2="-9.525" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="-8.255" y1="-0.635" x2="-8.255" y2="1.27" width="0.254" layer="21"/>
<wire x1="-6.985" y1="-0.9398" x2="-5.715" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="-6.985" y1="-0.9398" x2="-6.985" y2="-1.27" width="0.254" layer="21"/>
<wire x1="-5.715" y1="-0.9398" x2="-5.715" y2="-0.635" width="0.254" layer="21"/>
<wire x1="-6.985" y1="-0.635" x2="-5.715" y2="-0.635" width="0.254" layer="21"/>
<wire x1="-6.985" y1="-0.635" x2="-6.985" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="-5.715" y1="-0.635" x2="-5.715" y2="1.27" width="0.254" layer="21"/>
<wire x1="-4.445" y1="-0.9398" x2="-3.175" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="-4.445" y1="-0.9398" x2="-4.445" y2="-1.27" width="0.254" layer="21"/>
<wire x1="-3.175" y1="-0.9398" x2="-3.175" y2="-0.635" width="0.254" layer="21"/>
<wire x1="-4.445" y1="-0.635" x2="-3.175" y2="-0.635" width="0.254" layer="21"/>
<wire x1="-4.445" y1="-0.635" x2="-4.445" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="-3.175" y1="-0.635" x2="-3.175" y2="1.27" width="0.254" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-0.635" y2="-1.27" width="0.254" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-0.635" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="-1.905" y2="1.27" width="0.254" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-1.905" y2="-0.635" width="0.254" layer="21"/>
<wire x1="-1.905" y1="-0.9398" x2="-0.635" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="-1.905" y1="-0.9398" x2="-1.905" y2="-1.27" width="0.254" layer="21"/>
<wire x1="-0.635" y1="-0.9398" x2="-0.635" y2="-0.635" width="0.254" layer="21"/>
<wire x1="-1.905" y1="-0.635" x2="-0.635" y2="-0.635" width="0.254" layer="21"/>
<wire x1="-1.905" y1="-0.635" x2="-1.905" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="-0.635" y1="-0.635" x2="-0.635" y2="1.27" width="0.254" layer="21"/>
<wire x1="-7.874" y1="-3.81" x2="-9.906" y2="-3.81" width="0.1524" layer="51"/>
<wire x1="-9.906" y1="3.81" x2="-7.874" y2="3.81" width="0.1524" layer="51"/>
<wire x1="-9.906" y1="3.81" x2="-10.16" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-9.906" y1="-3.81" x2="-10.16" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-3.81" x2="-10.16" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-7.874" y1="3.81" x2="-7.366" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-7.366" y1="3.81" x2="-5.334" y2="3.81" width="0.1524" layer="51"/>
<wire x1="-4.826" y1="3.81" x2="-2.794" y2="3.81" width="0.1524" layer="51"/>
<wire x1="-2.286" y1="3.81" x2="-0.254" y2="3.81" width="0.1524" layer="51"/>
<wire x1="-5.334" y1="3.81" x2="-4.826" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="3.81" x2="-2.286" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-7.874" y1="-3.81" x2="-7.366" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="-5.334" y1="-3.81" x2="-4.826" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="-3.81" x2="-2.286" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="-7.366" y1="-3.81" x2="-5.334" y2="-3.81" width="0.1524" layer="51"/>
<wire x1="-4.826" y1="-3.81" x2="-2.794" y2="-3.81" width="0.1524" layer="51"/>
<wire x1="-2.286" y1="-3.81" x2="-0.254" y2="-3.81" width="0.1524" layer="51"/>
<wire x1="0.635" y1="-1.27" x2="1.905" y2="-1.27" width="0.254" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="1.905" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="1.905" y1="1.27" x2="0.635" y2="1.27" width="0.254" layer="21"/>
<wire x1="0.635" y1="1.27" x2="0.635" y2="-0.635" width="0.254" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="4.445" y2="-1.27" width="0.254" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="4.445" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="4.445" y1="1.27" x2="3.175" y2="1.27" width="0.254" layer="21"/>
<wire x1="3.175" y1="1.27" x2="3.175" y2="-0.635" width="0.254" layer="21"/>
<wire x1="5.715" y1="-1.27" x2="6.985" y2="-1.27" width="0.254" layer="21"/>
<wire x1="6.985" y1="-1.27" x2="6.985" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="6.985" y1="1.27" x2="5.715" y2="1.27" width="0.254" layer="21"/>
<wire x1="5.715" y1="1.27" x2="5.715" y2="-0.635" width="0.254" layer="21"/>
<wire x1="0.635" y1="-0.9398" x2="1.905" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="0.635" y1="-0.9398" x2="0.635" y2="-1.27" width="0.254" layer="21"/>
<wire x1="1.905" y1="-0.9398" x2="1.905" y2="-0.635" width="0.254" layer="21"/>
<wire x1="0.635" y1="-0.635" x2="1.905" y2="-0.635" width="0.254" layer="21"/>
<wire x1="0.635" y1="-0.635" x2="0.635" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="1.905" y1="-0.635" x2="1.905" y2="1.27" width="0.254" layer="21"/>
<wire x1="3.175" y1="-0.9398" x2="4.445" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="3.175" y1="-0.9398" x2="3.175" y2="-1.27" width="0.254" layer="21"/>
<wire x1="4.445" y1="-0.9398" x2="4.445" y2="-0.635" width="0.254" layer="21"/>
<wire x1="3.175" y1="-0.635" x2="4.445" y2="-0.635" width="0.254" layer="21"/>
<wire x1="3.175" y1="-0.635" x2="3.175" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="4.445" y1="-0.635" x2="4.445" y2="1.27" width="0.254" layer="21"/>
<wire x1="5.715" y1="-0.9398" x2="6.985" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="5.715" y1="-0.9398" x2="5.715" y2="-1.27" width="0.254" layer="21"/>
<wire x1="6.985" y1="-0.9398" x2="6.985" y2="-0.635" width="0.254" layer="21"/>
<wire x1="5.715" y1="-0.635" x2="6.985" y2="-0.635" width="0.254" layer="21"/>
<wire x1="5.715" y1="-0.635" x2="5.715" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="6.985" y1="-0.635" x2="6.985" y2="1.27" width="0.254" layer="21"/>
<wire x1="8.255" y1="-1.27" x2="9.525" y2="-1.27" width="0.254" layer="21"/>
<wire x1="9.525" y1="-1.27" x2="9.525" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="9.525" y1="1.27" x2="8.255" y2="1.27" width="0.254" layer="21"/>
<wire x1="8.255" y1="1.27" x2="8.255" y2="-0.635" width="0.254" layer="21"/>
<wire x1="8.255" y1="-0.9398" x2="9.525" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="8.255" y1="-0.9398" x2="8.255" y2="-1.27" width="0.254" layer="21"/>
<wire x1="9.525" y1="-0.9398" x2="9.525" y2="-0.635" width="0.254" layer="21"/>
<wire x1="8.255" y1="-0.635" x2="9.525" y2="-0.635" width="0.254" layer="21"/>
<wire x1="8.255" y1="-0.635" x2="8.255" y2="-0.9398" width="0.254" layer="21"/>
<wire x1="9.525" y1="-0.635" x2="9.525" y2="1.27" width="0.254" layer="21"/>
<wire x1="2.286" y1="-3.81" x2="0.254" y2="-3.81" width="0.1524" layer="51"/>
<wire x1="0.254" y1="3.81" x2="2.286" y2="3.81" width="0.1524" layer="51"/>
<wire x1="0.254" y1="3.81" x2="-0.254" y2="3.81" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-3.81" x2="-0.254" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="9.906" y1="-3.81" x2="10.16" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="9.906" y1="3.81" x2="10.16" y2="3.81" width="0.1524" layer="21"/>
<wire x1="10.16" y1="3.81" x2="10.16" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="2.286" y1="3.81" x2="2.794" y2="3.81" width="0.1524" layer="21"/>
<wire x1="2.794" y1="3.81" x2="4.826" y2="3.81" width="0.1524" layer="51"/>
<wire x1="5.334" y1="3.81" x2="7.366" y2="3.81" width="0.1524" layer="51"/>
<wire x1="7.874" y1="3.81" x2="9.906" y2="3.81" width="0.1524" layer="51"/>
<wire x1="4.826" y1="3.81" x2="5.334" y2="3.81" width="0.1524" layer="21"/>
<wire x1="7.366" y1="3.81" x2="7.874" y2="3.81" width="0.1524" layer="21"/>
<wire x1="2.286" y1="-3.81" x2="2.794" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="4.826" y1="-3.81" x2="5.334" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="7.366" y1="-3.81" x2="7.874" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="2.794" y1="-3.81" x2="4.826" y2="-3.81" width="0.1524" layer="51"/>
<wire x1="5.334" y1="-3.81" x2="7.366" y2="-3.81" width="0.1524" layer="51"/>
<wire x1="7.874" y1="-3.81" x2="9.906" y2="-3.81" width="0.1524" layer="51"/>
<pad name="1" x="-8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="-3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="-1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="13" x="-1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="14" x="-3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="15" x="-6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="16" x="-8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="9" x="8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="10" x="6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="11" x="3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="12" x="1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-9.271" y="1.778" size="0.9906" layer="21" ratio="12">1</text>
<text x="-6.731" y="1.778" size="0.9906" layer="21" ratio="12">2</text>
<text x="-4.191" y="1.778" size="0.9906" layer="21" ratio="12">3</text>
<text x="-1.651" y="1.778" size="0.9906" layer="21" ratio="12">4</text>
<text x="-10.16" y="4.699" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="4.699" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-9.652" y="-2.7432" size="0.9906" layer="21" ratio="12">OFF</text>
<text x="0.889" y="1.778" size="0.9906" layer="21" ratio="12">5</text>
<text x="3.429" y="1.778" size="0.9906" layer="21" ratio="12">6</text>
<text x="5.969" y="1.778" size="0.9906" layer="21" ratio="12">7</text>
<text x="8.509" y="1.778" size="0.9906" layer="21" ratio="12">8</text>
</package>
</packages>
<symbols>
<symbol name="S">
<wire x1="0" y1="-3.175" x2="0" y2="-1.905" width="0.254" layer="94"/>
<wire x1="0" y1="-1.905" x2="-1.27" y2="1.905" width="0.254" layer="94"/>
<wire x1="0" y1="1.905" x2="0" y2="3.175" width="0.254" layer="94"/>
<text x="2.54" y="-3.81" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<pin name="1" x="0" y="-5.08" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="2" x="0" y="5.08" visible="pad" length="short" direction="pas" rot="R270"/>
</symbol>
<symbol name="S+V">
<wire x1="0" y1="-3.175" x2="0" y2="-1.905" width="0.254" layer="94"/>
<wire x1="0" y1="-1.905" x2="-1.27" y2="1.905" width="0.254" layer="94"/>
<wire x1="0" y1="1.905" x2="0" y2="3.175" width="0.254" layer="94"/>
<text x="2.54" y="-3.81" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="5.08" y="-3.81" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="1" x="0" y="-5.08" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="2" x="0" y="5.08" visible="pad" length="short" direction="pas" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="DIP08S" prefix="S" uservalue="yes">
<description>&lt;b&gt;DIL/CODE SWITCH&lt;/b&gt;</description>
<gates>
<gate name="-1" symbol="S" x="0" y="0" addlevel="always"/>
<gate name="-2" symbol="S" x="5.08" y="0" addlevel="always"/>
<gate name="-3" symbol="S" x="10.16" y="0" addlevel="always"/>
<gate name="-4" symbol="S" x="15.24" y="0" addlevel="always"/>
<gate name="-5" symbol="S" x="20.32" y="0" addlevel="always"/>
<gate name="-6" symbol="S" x="25.4" y="0" addlevel="always"/>
<gate name="-7" symbol="S" x="30.48" y="0" addlevel="always"/>
<gate name="-8" symbol="S+V" x="35.56" y="0" addlevel="always"/>
</gates>
<devices>
<device name="" package="DIP08S">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-1" pin="2" pad="16"/>
<connect gate="-2" pin="1" pad="2"/>
<connect gate="-2" pin="2" pad="15"/>
<connect gate="-3" pin="1" pad="3"/>
<connect gate="-3" pin="2" pad="14"/>
<connect gate="-4" pin="1" pad="4"/>
<connect gate="-4" pin="2" pad="13"/>
<connect gate="-5" pin="1" pad="5"/>
<connect gate="-5" pin="2" pad="12"/>
<connect gate="-6" pin="1" pad="6"/>
<connect gate="-6" pin="2" pad="11"/>
<connect gate="-7" pin="1" pad="7"/>
<connect gate="-7" pin="2" pad="10"/>
<connect gate="-8" pin="1" pad="8"/>
<connect gate="-8" pin="2" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-molex">
<description>&lt;b&gt;Molex Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="7395-03">
<description>&lt;b&gt;MOLEX 2.54mm KK RA CONNECTOR&lt;/b&gt;
&lt;br&gt;Fixed Orientation</description>
<wire x1="3.81" y1="-5.08" x2="3.81" y2="-1.905" width="0.254" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="3.175" y2="-1.905" width="0.254" layer="21"/>
<wire x1="3.175" y1="-1.905" x2="3.175" y2="-2.54" width="0.254" layer="21"/>
<wire x1="3.175" y1="-2.54" x2="1.905" y2="-2.54" width="0.254" layer="21"/>
<wire x1="1.905" y1="-2.54" x2="1.905" y2="-1.905" width="0.254" layer="21"/>
<wire x1="1.905" y1="-1.905" x2="0.635" y2="-1.905" width="0.254" layer="21"/>
<wire x1="0.635" y1="-1.905" x2="0.635" y2="-2.54" width="0.254" layer="21"/>
<wire x1="0.635" y1="-2.54" x2="-0.635" y2="-2.54" width="0.254" layer="21"/>
<wire x1="-0.635" y1="-2.54" x2="-0.635" y2="-1.905" width="0.254" layer="21"/>
<wire x1="-0.635" y1="-1.905" x2="-1.905" y2="-1.905" width="0.254" layer="21"/>
<wire x1="-1.905" y1="-1.905" x2="-1.905" y2="-2.54" width="0.254" layer="21"/>
<wire x1="-1.905" y1="-2.54" x2="-3.175" y2="-2.54" width="0.254" layer="21"/>
<wire x1="-3.175" y1="-2.54" x2="-3.175" y2="-1.905" width="0.254" layer="21"/>
<wire x1="-3.175" y1="-1.905" x2="-3.81" y2="-1.905" width="0.254" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-3.81" y2="-5.08" width="0.254" layer="21"/>
<wire x1="-3.81" y1="-5.08" x2="-2.921" y2="-5.08" width="0.254" layer="21"/>
<wire x1="-2.921" y1="-5.08" x2="2.54" y2="-5.08" width="0.127" layer="21"/>
<wire x1="2.54" y1="-5.08" x2="3.81" y2="-5.08" width="0.254" layer="21"/>
<wire x1="2.54" y1="-5.08" x2="2.54" y2="-13.081" width="0.254" layer="21"/>
<wire x1="2.54" y1="-13.081" x2="2.286" y2="-13.589" width="0.254" layer="21"/>
<wire x1="2.286" y1="-13.589" x2="-1.3208" y2="-13.589" width="0.254" layer="21"/>
<wire x1="-2.54" y1="-5.08" x2="-2.54" y2="-13.081" width="0.254" layer="21"/>
<wire x1="-2.54" y1="-13.081" x2="-2.286" y2="-13.589" width="0.254" layer="21"/>
<wire x1="-2.286" y1="-13.589" x2="-1.2192" y2="-13.589" width="0.254" layer="21"/>
<wire x1="0" y1="-5.08" x2="-0.381" y2="-5.08" width="0.254" layer="51"/>
<wire x1="-2.921" y1="-5.08" x2="-2.921" y2="-11.303" width="0.254" layer="21"/>
<wire x1="-2.921" y1="-11.303" x2="-2.5908" y2="-11.6586" width="0.254" layer="21"/>
<wire x1="2.921" y1="-5.08" x2="2.921" y2="-11.303" width="0.254" layer="21"/>
<wire x1="2.921" y1="-11.303" x2="2.5908" y2="-11.6586" width="0.254" layer="21"/>
<pad name="1" x="2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="3.9101" y="2.9479" size="1.016" layer="25" ratio="10" rot="R180">&gt;NAME</text>
<text x="2.0559" y="-3.4021" size="1.27" layer="21" ratio="14" rot="R270">1</text>
<text x="-2.9733" y="-3.2751" size="1.27" layer="21" ratio="14" rot="R270">3</text>
<text x="4.6721" y="-2.4399" size="0.8128" layer="27" ratio="10" rot="R270">&gt;VALUE</text>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="-2.794" y1="-0.254" x2="-2.286" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-2.5146" x2="2.794" y2="-0.2794" layer="51"/>
<rectangle x1="-0.254" y1="-2.5146" x2="0.254" y2="-0.2794" layer="51"/>
<rectangle x1="-2.794" y1="-2.5146" x2="-2.286" y2="-0.2794" layer="51"/>
</package>
<package name="6410-03">
<description>&lt;b&gt;MOLEX 2.54mm KK  CONNECTOR&lt;/b&gt;</description>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="2.921" width="0.127" layer="21"/>
<wire x1="-3.81" y1="0" x2="-3.81" y2="2.921" width="0.254" layer="21"/>
<wire x1="-3.81" y1="2.921" x2="-2.54" y2="2.921" width="0.254" layer="21"/>
<wire x1="-2.286" y1="2.921" x2="-2.54" y2="2.921" width="0.127" layer="21"/>
<wire x1="-2.54" y1="2.921" x2="-1.27" y2="2.921" width="0.254" layer="21"/>
<wire x1="3.81" y1="0" x2="3.81" y2="2.921" width="0.254" layer="21"/>
<wire x1="3.81" y1="2.921" x2="-1.27" y2="2.921" width="0.254" layer="21"/>
<wire x1="-3.81" y1="0" x2="-3.81" y2="-2.921" width="0.254" layer="21"/>
<wire x1="-3.81" y1="-2.921" x2="-1.27" y2="-2.921" width="0.127" layer="21"/>
<wire x1="3.81" y1="0" x2="3.81" y2="-2.921" width="0.254" layer="21"/>
<wire x1="3.175" y1="-2.921" x2="1.905" y2="-2.921" width="0.254" layer="21"/>
<wire x1="0.635" y1="-2.921" x2="-0.635" y2="-2.921" width="0.254" layer="21"/>
<wire x1="-0.635" y1="-2.921" x2="-1.27" y2="-2.921" width="0.127" layer="21"/>
<wire x1="-3.556" y1="-2.921" x2="-3.175" y2="-2.921" width="0.254" layer="21"/>
<wire x1="-3.175" y1="-2.921" x2="-3.175" y2="-2.286" width="0.254" layer="21"/>
<wire x1="-3.175" y1="-2.286" x2="-1.905" y2="-2.286" width="0.254" layer="21"/>
<wire x1="-1.905" y1="-2.286" x2="-1.905" y2="-2.921" width="0.254" layer="21"/>
<wire x1="-1.905" y1="-2.921" x2="-3.175" y2="-2.921" width="0.254" layer="21"/>
<wire x1="-1.905" y1="-2.921" x2="-0.635" y2="-2.921" width="0.254" layer="21"/>
<wire x1="-0.635" y1="-2.921" x2="-0.635" y2="-2.286" width="0.254" layer="21"/>
<wire x1="-0.635" y1="-2.286" x2="0.635" y2="-2.286" width="0.254" layer="21"/>
<wire x1="0.635" y1="-2.286" x2="0.635" y2="-2.921" width="0.254" layer="21"/>
<wire x1="0.635" y1="-2.921" x2="1.905" y2="-2.921" width="0.254" layer="21"/>
<wire x1="1.905" y1="-2.921" x2="1.905" y2="-2.286" width="0.254" layer="21"/>
<wire x1="1.905" y1="-2.286" x2="3.175" y2="-2.286" width="0.254" layer="21"/>
<wire x1="3.175" y1="-2.286" x2="3.175" y2="-2.921" width="0.254" layer="21"/>
<wire x1="3.175" y1="-2.921" x2="3.81" y2="-2.921" width="0.254" layer="21"/>
<wire x1="-2.54" y1="1.905" x2="-2.54" y2="2.921" width="0.254" layer="21"/>
<wire x1="-2.54" y1="1.905" x2="-2.286" y2="1.905" width="0.254" layer="21"/>
<wire x1="-2.286" y1="1.905" x2="2.286" y2="1.905" width="0.254" layer="21"/>
<wire x1="2.286" y1="1.905" x2="2.54" y2="1.905" width="0.254" layer="21"/>
<wire x1="2.54" y1="1.905" x2="2.54" y2="2.921" width="0.254" layer="21"/>
<wire x1="-2.54" y1="1.905" x2="-2.286" y2="1.397" width="0.254" layer="21"/>
<wire x1="-2.286" y1="2.921" x2="-2.286" y2="1.905" width="0.254" layer="21"/>
<wire x1="-2.286" y1="1.397" x2="2.286" y2="1.397" width="0.254" layer="21"/>
<wire x1="2.286" y1="1.397" x2="2.54" y2="1.905" width="0.254" layer="21"/>
<wire x1="2.286" y1="2.921" x2="2.286" y2="1.905" width="0.254" layer="21"/>
<pad name="3" x="-2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="1" x="2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-3.7831" y="3.2751" size="1.016" layer="25" ratio="10">&gt;NAME</text>
<text x="4.4181" y="-0.7381" size="1.27" layer="21" ratio="14">1</text>
<text x="-4.9799" y="-0.6873" size="1.27" layer="21" ratio="14">3</text>
<text x="-3.7831" y="-4.5989" size="0.8128" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-2.794" y1="-0.254" x2="-2.286" y2="0.254" layer="51"/>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="MV">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<text x="-0.762" y="1.397" size="1.778" layer="96">&gt;VALUE</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="M">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="22-?-03" prefix="J">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
wire to board 2.54 mm (.1 inch) pitch header</description>
<gates>
<gate name="-1" symbol="MV" x="0" y="5.08" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M" x="0" y="0" addlevel="always" swaplevel="1"/>
<gate name="-3" symbol="M" x="0" y="-5.08" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="05-7038" package="7395-03">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="27-2031" package="6410-03">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
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
<symbol name="+5V">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+5V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="+12V">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<wire x1="1.27" y1="-0.635" x2="0" y2="1.27" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="-1.27" y2="-0.635" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+12V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
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
<deviceset name="+5V" prefix="P+">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="+5V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+12V" prefix="P+">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="+12V" x="0" y="0"/>
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
<library name="pinhead">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="2X08">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-10.16" y1="-1.905" x2="-9.525" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="-2.54" x2="-7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-6.985" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-2.54" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-4.445" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-2.54" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-2.54" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-2.54" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="3.175" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-2.54" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-1.905" x2="-10.16" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="1.905" x2="-9.525" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="2.54" x2="-8.255" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="2.54" x2="-7.62" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-6.985" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="2.54" x2="-5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="2.54" x2="-5.08" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.905" x2="-4.445" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="2.54" x2="-3.175" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="2.54" x2="-2.54" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.905" x2="-1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="2.54" x2="-0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="2.54" x2="0" y2="1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="1.905" x2="0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.635" y1="2.54" x2="1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.905" y1="2.54" x2="2.54" y2="1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.905" x2="3.175" y2="2.54" width="0.1524" layer="21"/>
<wire x1="3.175" y1="2.54" x2="4.445" y2="2.54" width="0.1524" layer="21"/>
<wire x1="4.445" y1="2.54" x2="5.08" y2="1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="1.905" x2="5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="5.715" y1="2.54" x2="6.985" y2="2.54" width="0.1524" layer="21"/>
<wire x1="6.985" y1="2.54" x2="7.62" y2="1.905" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="6.985" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.905" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="7.62" y1="1.905" x2="7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-2.54" x2="6.985" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-2.54" x2="4.445" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-2.54" x2="1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-2.54" x2="-0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-2.54" x2="-3.175" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-2.54" x2="-5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="-2.54" x2="-8.255" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="7.62" y1="1.905" x2="8.255" y2="2.54" width="0.1524" layer="21"/>
<wire x1="8.255" y1="2.54" x2="9.525" y2="2.54" width="0.1524" layer="21"/>
<wire x1="9.525" y1="2.54" x2="10.16" y2="1.905" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-1.905" x2="9.525" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="8.255" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="10.16" y1="1.905" x2="10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="8.255" y1="-2.54" x2="9.525" y2="-2.54" width="0.1524" layer="21"/>
<pad name="1" x="-8.89" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="2" x="-8.89" y="1.27" drill="1.016" shape="octagon"/>
<pad name="3" x="-6.35" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="4" x="-6.35" y="1.27" drill="1.016" shape="octagon"/>
<pad name="5" x="-3.81" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="6" x="-3.81" y="1.27" drill="1.016" shape="octagon"/>
<pad name="7" x="-1.27" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="8" x="-1.27" y="1.27" drill="1.016" shape="octagon"/>
<pad name="9" x="1.27" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="10" x="1.27" y="1.27" drill="1.016" shape="octagon"/>
<pad name="11" x="3.81" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="12" x="3.81" y="1.27" drill="1.016" shape="octagon"/>
<pad name="13" x="6.35" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="14" x="6.35" y="1.27" drill="1.016" shape="octagon"/>
<pad name="15" x="8.89" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="16" x="8.89" y="1.27" drill="1.016" shape="octagon"/>
<text x="-10.16" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-10.16" y="-4.445" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-9.144" y1="-1.524" x2="-8.636" y2="-1.016" layer="51"/>
<rectangle x1="-9.144" y1="1.016" x2="-8.636" y2="1.524" layer="51"/>
<rectangle x1="-6.604" y1="1.016" x2="-6.096" y2="1.524" layer="51"/>
<rectangle x1="-6.604" y1="-1.524" x2="-6.096" y2="-1.016" layer="51"/>
<rectangle x1="-4.064" y1="1.016" x2="-3.556" y2="1.524" layer="51"/>
<rectangle x1="-4.064" y1="-1.524" x2="-3.556" y2="-1.016" layer="51"/>
<rectangle x1="-1.524" y1="1.016" x2="-1.016" y2="1.524" layer="51"/>
<rectangle x1="1.016" y1="1.016" x2="1.524" y2="1.524" layer="51"/>
<rectangle x1="3.556" y1="1.016" x2="4.064" y2="1.524" layer="51"/>
<rectangle x1="-1.524" y1="-1.524" x2="-1.016" y2="-1.016" layer="51"/>
<rectangle x1="1.016" y1="-1.524" x2="1.524" y2="-1.016" layer="51"/>
<rectangle x1="3.556" y1="-1.524" x2="4.064" y2="-1.016" layer="51"/>
<rectangle x1="6.096" y1="1.016" x2="6.604" y2="1.524" layer="51"/>
<rectangle x1="6.096" y1="-1.524" x2="6.604" y2="-1.016" layer="51"/>
<rectangle x1="8.636" y1="1.016" x2="9.144" y2="1.524" layer="51"/>
<rectangle x1="8.636" y1="-1.524" x2="9.144" y2="-1.016" layer="51"/>
</package>
<package name="2X08/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-10.16" y1="-1.905" x2="-7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="0.635" x2="-10.16" y2="-1.905" width="0.1524" layer="21"/>
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
<pad name="2" x="-8.89" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="4" x="-6.35" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="6" x="-3.81" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="8" x="-1.27" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="10" x="1.27" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="12" x="3.81" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="14" x="6.35" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="16" x="8.89" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="1" x="-8.89" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="3" x="-6.35" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="5" x="-3.81" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="7" x="-1.27" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="9" x="1.27" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="11" x="3.81" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="13" x="6.35" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="15" x="8.89" y="-6.35" drill="1.016" shape="octagon"/>
<text x="-10.795" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="12.065" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-9.271" y1="0.635" x2="-8.509" y2="1.143" layer="21"/>
<rectangle x1="-6.731" y1="0.635" x2="-5.969" y2="1.143" layer="21"/>
<rectangle x1="-4.191" y1="0.635" x2="-3.429" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="3.429" y1="0.635" x2="4.191" y2="1.143" layer="21"/>
<rectangle x1="5.969" y1="0.635" x2="6.731" y2="1.143" layer="21"/>
<rectangle x1="8.509" y1="0.635" x2="9.271" y2="1.143" layer="21"/>
<rectangle x1="-9.271" y1="-2.921" x2="-8.509" y2="-1.905" layer="21"/>
<rectangle x1="-6.731" y1="-2.921" x2="-5.969" y2="-1.905" layer="21"/>
<rectangle x1="-9.271" y1="-5.461" x2="-8.509" y2="-4.699" layer="21"/>
<rectangle x1="-9.271" y1="-4.699" x2="-8.509" y2="-2.921" layer="51"/>
<rectangle x1="-6.731" y1="-4.699" x2="-5.969" y2="-2.921" layer="51"/>
<rectangle x1="-6.731" y1="-5.461" x2="-5.969" y2="-4.699" layer="21"/>
<rectangle x1="-4.191" y1="-2.921" x2="-3.429" y2="-1.905" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="-4.191" y1="-5.461" x2="-3.429" y2="-4.699" layer="21"/>
<rectangle x1="-4.191" y1="-4.699" x2="-3.429" y2="-2.921" layer="51"/>
<rectangle x1="-1.651" y1="-4.699" x2="-0.889" y2="-2.921" layer="51"/>
<rectangle x1="-1.651" y1="-5.461" x2="-0.889" y2="-4.699" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
<rectangle x1="3.429" y1="-2.921" x2="4.191" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-5.461" x2="1.651" y2="-4.699" layer="21"/>
<rectangle x1="0.889" y1="-4.699" x2="1.651" y2="-2.921" layer="51"/>
<rectangle x1="3.429" y1="-4.699" x2="4.191" y2="-2.921" layer="51"/>
<rectangle x1="3.429" y1="-5.461" x2="4.191" y2="-4.699" layer="21"/>
<rectangle x1="5.969" y1="-2.921" x2="6.731" y2="-1.905" layer="21"/>
<rectangle x1="8.509" y1="-2.921" x2="9.271" y2="-1.905" layer="21"/>
<rectangle x1="5.969" y1="-5.461" x2="6.731" y2="-4.699" layer="21"/>
<rectangle x1="5.969" y1="-4.699" x2="6.731" y2="-2.921" layer="51"/>
<rectangle x1="8.509" y1="-4.699" x2="9.271" y2="-2.921" layer="51"/>
<rectangle x1="8.509" y1="-5.461" x2="9.271" y2="-4.699" layer="21"/>
</package>
<package name="1X01">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="0" y="0" drill="1.016" shape="octagon"/>
<text x="-1.3462" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.27" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="PINH2X8">
<wire x1="-6.35" y1="-12.7" x2="8.89" y2="-12.7" width="0.4064" layer="94"/>
<wire x1="8.89" y1="-12.7" x2="8.89" y2="10.16" width="0.4064" layer="94"/>
<wire x1="8.89" y1="10.16" x2="-6.35" y2="10.16" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="10.16" x2="-6.35" y2="-12.7" width="0.4064" layer="94"/>
<text x="-6.35" y="10.795" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-15.24" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="5.08" y="7.62" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="3" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="5.08" y="5.08" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="5" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="5.08" y="2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="7" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="8" x="5.08" y="0" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="9" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="10" x="5.08" y="-2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="11" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="12" x="5.08" y="-5.08" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="13" x="-2.54" y="-7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="14" x="5.08" y="-7.62" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="15" x="-2.54" y="-10.16" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="16" x="5.08" y="-10.16" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
</symbol>
<symbol name="PINHD1">
<wire x1="-6.35" y1="-2.54" x2="1.27" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.27" y2="2.54" width="0.4064" layer="94"/>
<wire x1="1.27" y1="2.54" x2="-6.35" y2="2.54" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="2.54" x2="-6.35" y2="-2.54" width="0.4064" layer="94"/>
<text x="-6.35" y="3.175" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-2X8" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINH2X8" x="0" y="0"/>
</gates>
<devices>
<device name="" package="2X08">
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
<device name="/90" package="2X08/90">
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
<deviceset name="PINHD-1X1" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="PINHD1" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X01">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
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
<part name="S1" library="switch-dil" deviceset="DIP08S" device=""/>
<part name="S2" library="switch-dil" deviceset="DIP08S" device=""/>
<part name="S3" library="switch-dil" deviceset="DIP08S" device=""/>
<part name="S4" library="switch-dil" deviceset="DIP08S" device=""/>
<part name="JP1" library="pinhead" deviceset="PINHD-2X8" device=""/>
<part name="JP2" library="pinhead" deviceset="PINHD-2X8" device=""/>
<part name="JP3" library="pinhead" deviceset="PINHD-2X8" device=""/>
<part name="JP4" library="pinhead" deviceset="PINHD-2X8" device=""/>
<part name="J2" library="con-molex" deviceset="22-?-03" device="27-2031" value="Power"/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="P+3" library="supply1" deviceset="+5V" device=""/>
<part name="P+4" library="supply1" deviceset="+12V" device=""/>
<part name="JP-5V" library="pinhead" deviceset="PINHD-1X1" device=""/>
<part name="JP-12V" library="pinhead" deviceset="PINHD-1X1" device=""/>
<part name="JP-GND" library="pinhead" deviceset="PINHD-1X1" device=""/>
<part name="JP-SELECTED" library="pinhead" deviceset="PINHD-1X1" device=""/>
<part name="P+1" library="supply1" deviceset="+5V" device=""/>
<part name="P+2" library="supply1" deviceset="+12V" device=""/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="PCB1" library="GNLib" deviceset="ZZZ_MODULE" device="05X05"/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="S1" gate="-1" x="7.62" y="78.74" rot="R270"/>
<instance part="S1" gate="-2" x="7.62" y="73.66" rot="R270"/>
<instance part="S1" gate="-3" x="7.62" y="68.58" rot="R270"/>
<instance part="S1" gate="-4" x="7.62" y="63.5" rot="R270"/>
<instance part="S1" gate="-5" x="7.62" y="58.42" rot="R270"/>
<instance part="S1" gate="-6" x="7.62" y="53.34" rot="R270"/>
<instance part="S1" gate="-7" x="7.62" y="48.26" rot="R270"/>
<instance part="S1" gate="-8" x="7.62" y="43.18" rot="R270"/>
<instance part="S2" gate="-1" x="7.62" y="38.1" rot="R270"/>
<instance part="S2" gate="-2" x="7.62" y="33.02" rot="R270"/>
<instance part="S2" gate="-3" x="7.62" y="27.94" rot="R270"/>
<instance part="S2" gate="-4" x="7.62" y="22.86" rot="R270"/>
<instance part="S2" gate="-5" x="7.62" y="17.78" rot="R270"/>
<instance part="S2" gate="-6" x="7.62" y="12.7" rot="R270"/>
<instance part="S2" gate="-7" x="7.62" y="7.62" rot="R270"/>
<instance part="S2" gate="-8" x="7.62" y="2.54" rot="R270"/>
<instance part="S3" gate="-1" x="55.88" y="78.74" rot="R270"/>
<instance part="S3" gate="-2" x="55.88" y="73.66" rot="R270"/>
<instance part="S3" gate="-3" x="55.88" y="68.58" rot="R270"/>
<instance part="S3" gate="-4" x="55.88" y="63.5" rot="R270"/>
<instance part="S3" gate="-5" x="55.88" y="58.42" rot="R270"/>
<instance part="S3" gate="-6" x="55.88" y="53.34" rot="R270"/>
<instance part="S3" gate="-7" x="55.88" y="48.26" rot="R270"/>
<instance part="S3" gate="-8" x="55.88" y="43.18" rot="R270"/>
<instance part="S4" gate="-1" x="55.88" y="38.1" rot="R270"/>
<instance part="S4" gate="-2" x="55.88" y="33.02" rot="R270"/>
<instance part="S4" gate="-3" x="55.88" y="27.94" rot="R270"/>
<instance part="S4" gate="-4" x="55.88" y="22.86" rot="R270"/>
<instance part="S4" gate="-5" x="55.88" y="17.78" rot="R270"/>
<instance part="S4" gate="-6" x="55.88" y="12.7" rot="R270"/>
<instance part="S4" gate="-7" x="55.88" y="7.62" rot="R270"/>
<instance part="S4" gate="-8" x="55.88" y="2.54" rot="R270"/>
<instance part="JP1" gate="A" x="38.1" y="71.12"/>
<instance part="JP2" gate="A" x="38.1" y="30.48"/>
<instance part="JP3" gate="A" x="86.36" y="71.12"/>
<instance part="JP4" gate="A" x="86.36" y="30.48"/>
<instance part="J2" gate="-1" x="-40.64" y="81.28" rot="MR0"/>
<instance part="J2" gate="-2" x="-40.64" y="78.74" rot="MR0"/>
<instance part="J2" gate="-3" x="-40.64" y="76.2" rot="MR0"/>
<instance part="GND3" gate="1" x="-30.48" y="71.12"/>
<instance part="P+3" gate="1" x="-35.56" y="88.9"/>
<instance part="P+4" gate="1" x="-25.4" y="88.9"/>
<instance part="JP-5V" gate="G$1" x="-43.18" y="53.34" rot="MR270"/>
<instance part="JP-12V" gate="G$1" x="-33.02" y="53.34" rot="MR270"/>
<instance part="JP-GND" gate="G$1" x="-22.86" y="58.42" rot="MR90"/>
<instance part="JP-SELECTED" gate="G$1" x="-15.24" y="78.74" rot="MR0"/>
<instance part="P+1" gate="1" x="-43.18" y="58.42"/>
<instance part="P+2" gate="1" x="-33.02" y="58.42"/>
<instance part="GND1" gate="1" x="-22.86" y="53.34"/>
<instance part="PCB1" gate="G$1" x="-33.02" y="33.02"/>
<instance part="GND2" gate="1" x="-33.02" y="30.48"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="J2" gate="-1" pin="S"/>
<pinref part="GND3" gate="1" pin="GND"/>
<wire x1="-38.1" y1="81.28" x2="-30.48" y2="81.28" width="0.1524" layer="91"/>
<wire x1="-30.48" y1="81.28" x2="-30.48" y2="73.66" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND1" gate="1" pin="GND"/>
<pinref part="JP-GND" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="PCB1" gate="G$1" pin="GND"/>
<pinref part="GND2" gate="1" pin="GND"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="S1" gate="-1" pin="2"/>
<wire x1="12.7" y1="78.74" x2="35.56" y2="78.74" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="1"/>
<pinref part="JP1" gate="A" pin="2"/>
<wire x1="35.56" y1="78.74" x2="43.18" y2="78.74" width="0.1524" layer="91"/>
<junction x="35.56" y="78.74"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="S1" gate="-2" pin="2"/>
<wire x1="12.7" y1="73.66" x2="15.24" y2="73.66" width="0.1524" layer="91"/>
<wire x1="15.24" y1="73.66" x2="15.24" y2="76.2" width="0.1524" layer="91"/>
<wire x1="15.24" y1="76.2" x2="35.56" y2="76.2" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="3"/>
<pinref part="JP1" gate="A" pin="4"/>
<wire x1="43.18" y1="76.2" x2="35.56" y2="76.2" width="0.1524" layer="91"/>
<junction x="35.56" y="76.2"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="S1" gate="-3" pin="2"/>
<wire x1="12.7" y1="68.58" x2="17.78" y2="68.58" width="0.1524" layer="91"/>
<wire x1="17.78" y1="68.58" x2="17.78" y2="73.66" width="0.1524" layer="91"/>
<wire x1="17.78" y1="73.66" x2="35.56" y2="73.66" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="5"/>
<pinref part="JP1" gate="A" pin="6"/>
<wire x1="35.56" y1="73.66" x2="43.18" y2="73.66" width="0.1524" layer="91"/>
<junction x="35.56" y="73.66"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="S1" gate="-4" pin="2"/>
<wire x1="12.7" y1="63.5" x2="20.32" y2="63.5" width="0.1524" layer="91"/>
<wire x1="20.32" y1="63.5" x2="20.32" y2="71.12" width="0.1524" layer="91"/>
<wire x1="20.32" y1="71.12" x2="35.56" y2="71.12" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="7"/>
<pinref part="JP1" gate="A" pin="8"/>
<wire x1="43.18" y1="71.12" x2="35.56" y2="71.12" width="0.1524" layer="91"/>
<junction x="35.56" y="71.12"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="S1" gate="-5" pin="2"/>
<wire x1="12.7" y1="58.42" x2="22.86" y2="58.42" width="0.1524" layer="91"/>
<wire x1="22.86" y1="58.42" x2="22.86" y2="68.58" width="0.1524" layer="91"/>
<wire x1="22.86" y1="68.58" x2="35.56" y2="68.58" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="9"/>
<pinref part="JP1" gate="A" pin="10"/>
<wire x1="35.56" y1="68.58" x2="43.18" y2="68.58" width="0.1524" layer="91"/>
<junction x="35.56" y="68.58"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="S1" gate="-6" pin="2"/>
<wire x1="12.7" y1="53.34" x2="25.4" y2="53.34" width="0.1524" layer="91"/>
<wire x1="25.4" y1="53.34" x2="25.4" y2="66.04" width="0.1524" layer="91"/>
<wire x1="25.4" y1="66.04" x2="35.56" y2="66.04" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="11"/>
<pinref part="JP1" gate="A" pin="12"/>
<wire x1="43.18" y1="66.04" x2="35.56" y2="66.04" width="0.1524" layer="91"/>
<junction x="35.56" y="66.04"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="S1" gate="-7" pin="2"/>
<wire x1="12.7" y1="48.26" x2="27.94" y2="48.26" width="0.1524" layer="91"/>
<wire x1="27.94" y1="48.26" x2="27.94" y2="63.5" width="0.1524" layer="91"/>
<wire x1="27.94" y1="63.5" x2="35.56" y2="63.5" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="13"/>
<pinref part="JP1" gate="A" pin="14"/>
<wire x1="35.56" y1="63.5" x2="43.18" y2="63.5" width="0.1524" layer="91"/>
<junction x="35.56" y="63.5"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="S1" gate="-8" pin="2"/>
<wire x1="12.7" y1="43.18" x2="30.48" y2="43.18" width="0.1524" layer="91"/>
<wire x1="30.48" y1="43.18" x2="30.48" y2="60.96" width="0.1524" layer="91"/>
<wire x1="30.48" y1="60.96" x2="35.56" y2="60.96" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="15"/>
<pinref part="JP1" gate="A" pin="16"/>
<wire x1="43.18" y1="60.96" x2="35.56" y2="60.96" width="0.1524" layer="91"/>
<junction x="35.56" y="60.96"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="S2" gate="-1" pin="2"/>
<wire x1="12.7" y1="38.1" x2="35.56" y2="38.1" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="2"/>
<wire x1="35.56" y1="38.1" x2="43.18" y2="38.1" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="1"/>
<junction x="35.56" y="38.1"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="S2" gate="-2" pin="2"/>
<wire x1="12.7" y1="33.02" x2="15.24" y2="33.02" width="0.1524" layer="91"/>
<wire x1="15.24" y1="33.02" x2="15.24" y2="35.56" width="0.1524" layer="91"/>
<wire x1="15.24" y1="35.56" x2="35.56" y2="35.56" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="4"/>
<wire x1="43.18" y1="35.56" x2="35.56" y2="35.56" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="3"/>
<junction x="35.56" y="35.56"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="S2" gate="-3" pin="2"/>
<wire x1="12.7" y1="27.94" x2="17.78" y2="27.94" width="0.1524" layer="91"/>
<wire x1="17.78" y1="27.94" x2="17.78" y2="33.02" width="0.1524" layer="91"/>
<wire x1="17.78" y1="33.02" x2="35.56" y2="33.02" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="6"/>
<wire x1="35.56" y1="33.02" x2="43.18" y2="33.02" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="5"/>
<junction x="35.56" y="33.02"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="S2" gate="-4" pin="2"/>
<wire x1="12.7" y1="22.86" x2="20.32" y2="22.86" width="0.1524" layer="91"/>
<wire x1="20.32" y1="22.86" x2="20.32" y2="30.48" width="0.1524" layer="91"/>
<wire x1="20.32" y1="30.48" x2="35.56" y2="30.48" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="8"/>
<wire x1="43.18" y1="30.48" x2="35.56" y2="30.48" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="7"/>
<junction x="35.56" y="30.48"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="S2" gate="-5" pin="2"/>
<wire x1="12.7" y1="17.78" x2="22.86" y2="17.78" width="0.1524" layer="91"/>
<wire x1="22.86" y1="17.78" x2="22.86" y2="27.94" width="0.1524" layer="91"/>
<wire x1="22.86" y1="27.94" x2="35.56" y2="27.94" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="10"/>
<wire x1="35.56" y1="27.94" x2="43.18" y2="27.94" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="9"/>
<junction x="35.56" y="27.94"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="S2" gate="-6" pin="2"/>
<wire x1="12.7" y1="12.7" x2="25.4" y2="12.7" width="0.1524" layer="91"/>
<wire x1="25.4" y1="12.7" x2="25.4" y2="25.4" width="0.1524" layer="91"/>
<wire x1="25.4" y1="25.4" x2="35.56" y2="25.4" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="12"/>
<wire x1="43.18" y1="25.4" x2="35.56" y2="25.4" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="11"/>
<junction x="35.56" y="25.4"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="S2" gate="-7" pin="2"/>
<wire x1="12.7" y1="7.62" x2="27.94" y2="7.62" width="0.1524" layer="91"/>
<wire x1="27.94" y1="7.62" x2="27.94" y2="22.86" width="0.1524" layer="91"/>
<wire x1="27.94" y1="22.86" x2="35.56" y2="22.86" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="14"/>
<wire x1="35.56" y1="22.86" x2="43.18" y2="22.86" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="13"/>
<junction x="35.56" y="22.86"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="S2" gate="-8" pin="2"/>
<wire x1="12.7" y1="2.54" x2="30.48" y2="2.54" width="0.1524" layer="91"/>
<wire x1="30.48" y1="2.54" x2="30.48" y2="20.32" width="0.1524" layer="91"/>
<wire x1="30.48" y1="20.32" x2="35.56" y2="20.32" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="16"/>
<wire x1="43.18" y1="20.32" x2="35.56" y2="20.32" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="15"/>
<junction x="35.56" y="20.32"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="S3" gate="-1" pin="2"/>
<wire x1="60.96" y1="78.74" x2="83.82" y2="78.74" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="2"/>
<wire x1="83.82" y1="78.74" x2="91.44" y2="78.74" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="1"/>
<junction x="83.82" y="78.74"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="S3" gate="-2" pin="2"/>
<wire x1="60.96" y1="73.66" x2="63.5" y2="73.66" width="0.1524" layer="91"/>
<wire x1="63.5" y1="73.66" x2="63.5" y2="76.2" width="0.1524" layer="91"/>
<wire x1="63.5" y1="76.2" x2="83.82" y2="76.2" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="4"/>
<wire x1="91.44" y1="76.2" x2="83.82" y2="76.2" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="3"/>
<junction x="83.82" y="76.2"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="S3" gate="-3" pin="2"/>
<wire x1="60.96" y1="68.58" x2="66.04" y2="68.58" width="0.1524" layer="91"/>
<wire x1="66.04" y1="68.58" x2="66.04" y2="73.66" width="0.1524" layer="91"/>
<wire x1="66.04" y1="73.66" x2="83.82" y2="73.66" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="6"/>
<wire x1="83.82" y1="73.66" x2="91.44" y2="73.66" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="5"/>
<junction x="83.82" y="73.66"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="S3" gate="-4" pin="2"/>
<wire x1="60.96" y1="63.5" x2="68.58" y2="63.5" width="0.1524" layer="91"/>
<wire x1="68.58" y1="63.5" x2="68.58" y2="71.12" width="0.1524" layer="91"/>
<wire x1="68.58" y1="71.12" x2="83.82" y2="71.12" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="8"/>
<wire x1="91.44" y1="71.12" x2="83.82" y2="71.12" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="7"/>
<junction x="83.82" y="71.12"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="S3" gate="-5" pin="2"/>
<wire x1="60.96" y1="58.42" x2="71.12" y2="58.42" width="0.1524" layer="91"/>
<wire x1="71.12" y1="58.42" x2="71.12" y2="68.58" width="0.1524" layer="91"/>
<wire x1="71.12" y1="68.58" x2="83.82" y2="68.58" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="10"/>
<wire x1="83.82" y1="68.58" x2="91.44" y2="68.58" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="9"/>
<junction x="83.82" y="68.58"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="S3" gate="-6" pin="2"/>
<wire x1="60.96" y1="53.34" x2="73.66" y2="53.34" width="0.1524" layer="91"/>
<wire x1="73.66" y1="53.34" x2="73.66" y2="66.04" width="0.1524" layer="91"/>
<wire x1="73.66" y1="66.04" x2="83.82" y2="66.04" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="12"/>
<wire x1="91.44" y1="66.04" x2="83.82" y2="66.04" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="11"/>
<junction x="83.82" y="66.04"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<pinref part="S3" gate="-7" pin="2"/>
<wire x1="60.96" y1="48.26" x2="76.2" y2="48.26" width="0.1524" layer="91"/>
<wire x1="76.2" y1="48.26" x2="76.2" y2="63.5" width="0.1524" layer="91"/>
<wire x1="76.2" y1="63.5" x2="83.82" y2="63.5" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="14"/>
<wire x1="83.82" y1="63.5" x2="91.44" y2="63.5" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="13"/>
<junction x="83.82" y="63.5"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="S3" gate="-8" pin="2"/>
<wire x1="60.96" y1="43.18" x2="78.74" y2="43.18" width="0.1524" layer="91"/>
<wire x1="78.74" y1="43.18" x2="78.74" y2="60.96" width="0.1524" layer="91"/>
<wire x1="78.74" y1="60.96" x2="83.82" y2="60.96" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="16"/>
<wire x1="91.44" y1="60.96" x2="83.82" y2="60.96" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="15"/>
<junction x="83.82" y="60.96"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<pinref part="S4" gate="-1" pin="2"/>
<wire x1="60.96" y1="38.1" x2="83.82" y2="38.1" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="2"/>
<wire x1="83.82" y1="38.1" x2="91.44" y2="38.1" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="1"/>
<junction x="83.82" y="38.1"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<pinref part="S4" gate="-2" pin="2"/>
<wire x1="60.96" y1="33.02" x2="63.5" y2="33.02" width="0.1524" layer="91"/>
<wire x1="63.5" y1="33.02" x2="63.5" y2="35.56" width="0.1524" layer="91"/>
<wire x1="63.5" y1="35.56" x2="83.82" y2="35.56" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="4"/>
<wire x1="91.44" y1="35.56" x2="83.82" y2="35.56" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="3"/>
<junction x="83.82" y="35.56"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<pinref part="S4" gate="-3" pin="2"/>
<wire x1="60.96" y1="27.94" x2="66.04" y2="27.94" width="0.1524" layer="91"/>
<wire x1="66.04" y1="27.94" x2="66.04" y2="33.02" width="0.1524" layer="91"/>
<wire x1="66.04" y1="33.02" x2="83.82" y2="33.02" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="6"/>
<wire x1="83.82" y1="33.02" x2="91.44" y2="33.02" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="5"/>
<junction x="83.82" y="33.02"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<pinref part="S4" gate="-4" pin="2"/>
<wire x1="60.96" y1="22.86" x2="68.58" y2="22.86" width="0.1524" layer="91"/>
<wire x1="68.58" y1="22.86" x2="68.58" y2="30.48" width="0.1524" layer="91"/>
<wire x1="68.58" y1="30.48" x2="83.82" y2="30.48" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="8"/>
<wire x1="91.44" y1="30.48" x2="83.82" y2="30.48" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="7"/>
<junction x="83.82" y="30.48"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<pinref part="S4" gate="-5" pin="2"/>
<wire x1="60.96" y1="17.78" x2="71.12" y2="17.78" width="0.1524" layer="91"/>
<wire x1="71.12" y1="17.78" x2="71.12" y2="27.94" width="0.1524" layer="91"/>
<wire x1="71.12" y1="27.94" x2="83.82" y2="27.94" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="10"/>
<wire x1="83.82" y1="27.94" x2="91.44" y2="27.94" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="9"/>
<junction x="83.82" y="27.94"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<pinref part="S4" gate="-6" pin="2"/>
<wire x1="60.96" y1="12.7" x2="73.66" y2="12.7" width="0.1524" layer="91"/>
<wire x1="73.66" y1="12.7" x2="73.66" y2="25.4" width="0.1524" layer="91"/>
<wire x1="73.66" y1="25.4" x2="83.82" y2="25.4" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="12"/>
<wire x1="91.44" y1="25.4" x2="83.82" y2="25.4" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="11"/>
<junction x="83.82" y="25.4"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<pinref part="S4" gate="-7" pin="2"/>
<wire x1="60.96" y1="7.62" x2="76.2" y2="7.62" width="0.1524" layer="91"/>
<wire x1="76.2" y1="7.62" x2="76.2" y2="22.86" width="0.1524" layer="91"/>
<wire x1="76.2" y1="22.86" x2="83.82" y2="22.86" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="14"/>
<wire x1="83.82" y1="22.86" x2="91.44" y2="22.86" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="13"/>
<junction x="83.82" y="22.86"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<pinref part="S4" gate="-8" pin="2"/>
<wire x1="60.96" y1="2.54" x2="78.74" y2="2.54" width="0.1524" layer="91"/>
<wire x1="78.74" y1="2.54" x2="78.74" y2="20.32" width="0.1524" layer="91"/>
<wire x1="78.74" y1="20.32" x2="83.82" y2="20.32" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="16"/>
<wire x1="91.44" y1="20.32" x2="83.82" y2="20.32" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="15"/>
<junction x="83.82" y="20.32"/>
</segment>
</net>
<net name="N$34" class="0">
<segment>
<pinref part="S1" gate="-1" pin="1"/>
<pinref part="S1" gate="-2" pin="1"/>
<wire x1="2.54" y1="78.74" x2="2.54" y2="73.66" width="0.1524" layer="91"/>
<pinref part="S1" gate="-3" pin="1"/>
<wire x1="2.54" y1="68.58" x2="2.54" y2="73.66" width="0.1524" layer="91"/>
<pinref part="S1" gate="-4" pin="1"/>
<wire x1="2.54" y1="68.58" x2="2.54" y2="63.5" width="0.1524" layer="91"/>
<pinref part="S1" gate="-5" pin="1"/>
<wire x1="2.54" y1="63.5" x2="2.54" y2="58.42" width="0.1524" layer="91"/>
<pinref part="S2" gate="-8" pin="1"/>
<wire x1="2.54" y1="2.54" x2="2.54" y2="7.62" width="0.1524" layer="91"/>
<wire x1="2.54" y1="7.62" x2="2.54" y2="12.7" width="0.1524" layer="91"/>
<wire x1="2.54" y1="12.7" x2="2.54" y2="17.78" width="0.1524" layer="91"/>
<wire x1="2.54" y1="17.78" x2="2.54" y2="22.86" width="0.1524" layer="91"/>
<wire x1="2.54" y1="22.86" x2="2.54" y2="27.94" width="0.1524" layer="91"/>
<wire x1="2.54" y1="27.94" x2="2.54" y2="33.02" width="0.1524" layer="91"/>
<wire x1="2.54" y1="33.02" x2="2.54" y2="38.1" width="0.1524" layer="91"/>
<wire x1="2.54" y1="38.1" x2="2.54" y2="43.18" width="0.1524" layer="91"/>
<junction x="2.54" y="78.74"/>
<junction x="2.54" y="73.66"/>
<junction x="2.54" y="68.58"/>
<junction x="2.54" y="63.5"/>
<junction x="2.54" y="58.42"/>
<pinref part="S1" gate="-6" pin="1"/>
<junction x="2.54" y="53.34"/>
<wire x1="2.54" y1="43.18" x2="2.54" y2="48.26" width="0.1524" layer="91"/>
<wire x1="2.54" y1="48.26" x2="2.54" y2="53.34" width="0.1524" layer="91"/>
<wire x1="2.54" y1="53.34" x2="2.54" y2="58.42" width="0.1524" layer="91"/>
<pinref part="S1" gate="-7" pin="1"/>
<junction x="2.54" y="48.26"/>
<pinref part="S1" gate="-8" pin="1"/>
<junction x="2.54" y="43.18"/>
<pinref part="S2" gate="-1" pin="1"/>
<junction x="2.54" y="38.1"/>
<pinref part="S2" gate="-2" pin="1"/>
<junction x="2.54" y="33.02"/>
<pinref part="S2" gate="-3" pin="1"/>
<junction x="2.54" y="27.94"/>
<pinref part="S2" gate="-4" pin="1"/>
<junction x="2.54" y="22.86"/>
<pinref part="S2" gate="-5" pin="1"/>
<junction x="2.54" y="17.78"/>
<pinref part="S2" gate="-6" pin="1"/>
<junction x="2.54" y="12.7"/>
<pinref part="S2" gate="-7" pin="1"/>
<junction x="2.54" y="7.62"/>
<wire x1="2.54" y1="78.74" x2="-12.7" y2="78.74" width="0.1524" layer="91"/>
<wire x1="2.54" y1="78.74" x2="2.54" y2="83.82" width="0.1524" layer="91"/>
<pinref part="S3" gate="-1" pin="1"/>
<pinref part="S3" gate="-2" pin="1"/>
<wire x1="50.8" y1="78.74" x2="50.8" y2="73.66" width="0.1524" layer="91"/>
<pinref part="S3" gate="-3" pin="1"/>
<wire x1="50.8" y1="68.58" x2="50.8" y2="73.66" width="0.1524" layer="91"/>
<pinref part="S3" gate="-4" pin="1"/>
<wire x1="50.8" y1="68.58" x2="50.8" y2="63.5" width="0.1524" layer="91"/>
<pinref part="S3" gate="-5" pin="1"/>
<wire x1="50.8" y1="63.5" x2="50.8" y2="58.42" width="0.1524" layer="91"/>
<pinref part="S4" gate="-8" pin="1"/>
<wire x1="50.8" y1="2.54" x2="50.8" y2="7.62" width="0.1524" layer="91"/>
<wire x1="50.8" y1="7.62" x2="50.8" y2="12.7" width="0.1524" layer="91"/>
<wire x1="50.8" y1="12.7" x2="50.8" y2="17.78" width="0.1524" layer="91"/>
<wire x1="50.8" y1="17.78" x2="50.8" y2="22.86" width="0.1524" layer="91"/>
<wire x1="50.8" y1="22.86" x2="50.8" y2="27.94" width="0.1524" layer="91"/>
<wire x1="50.8" y1="27.94" x2="50.8" y2="33.02" width="0.1524" layer="91"/>
<wire x1="50.8" y1="33.02" x2="50.8" y2="38.1" width="0.1524" layer="91"/>
<wire x1="50.8" y1="38.1" x2="50.8" y2="43.18" width="0.1524" layer="91"/>
<junction x="50.8" y="78.74"/>
<junction x="50.8" y="73.66"/>
<junction x="50.8" y="68.58"/>
<junction x="50.8" y="63.5"/>
<junction x="50.8" y="58.42"/>
<pinref part="S3" gate="-6" pin="1"/>
<junction x="50.8" y="53.34"/>
<wire x1="50.8" y1="43.18" x2="50.8" y2="48.26" width="0.1524" layer="91"/>
<wire x1="50.8" y1="48.26" x2="50.8" y2="53.34" width="0.1524" layer="91"/>
<wire x1="50.8" y1="53.34" x2="50.8" y2="58.42" width="0.1524" layer="91"/>
<pinref part="S3" gate="-7" pin="1"/>
<junction x="50.8" y="48.26"/>
<pinref part="S3" gate="-8" pin="1"/>
<junction x="50.8" y="43.18"/>
<pinref part="S4" gate="-1" pin="1"/>
<junction x="50.8" y="38.1"/>
<pinref part="S4" gate="-2" pin="1"/>
<junction x="50.8" y="33.02"/>
<pinref part="S4" gate="-3" pin="1"/>
<junction x="50.8" y="27.94"/>
<pinref part="S4" gate="-4" pin="1"/>
<junction x="50.8" y="22.86"/>
<pinref part="S4" gate="-5" pin="1"/>
<junction x="50.8" y="17.78"/>
<pinref part="S4" gate="-6" pin="1"/>
<junction x="50.8" y="12.7"/>
<pinref part="S4" gate="-7" pin="1"/>
<junction x="50.8" y="7.62"/>
<wire x1="2.54" y1="83.82" x2="50.8" y2="83.82" width="0.1524" layer="91"/>
<wire x1="50.8" y1="83.82" x2="50.8" y2="78.74" width="0.1524" layer="91"/>
<pinref part="JP-SELECTED" gate="G$1" pin="1"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<pinref part="J2" gate="-2" pin="S"/>
<pinref part="P+3" gate="1" pin="+5V"/>
<wire x1="-38.1" y1="78.74" x2="-35.56" y2="78.74" width="0.1524" layer="91"/>
<wire x1="-35.56" y1="78.74" x2="-35.56" y2="86.36" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="JP-5V" gate="G$1" pin="1"/>
<pinref part="P+1" gate="1" pin="+5V"/>
</segment>
</net>
<net name="+12V" class="0">
<segment>
<pinref part="J2" gate="-3" pin="S"/>
<pinref part="P+4" gate="1" pin="+12V"/>
<wire x1="-38.1" y1="76.2" x2="-25.4" y2="76.2" width="0.1524" layer="91"/>
<wire x1="-25.4" y1="76.2" x2="-25.4" y2="86.36" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="JP-12V" gate="G$1" pin="1"/>
<pinref part="P+2" gate="1" pin="+12V"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
