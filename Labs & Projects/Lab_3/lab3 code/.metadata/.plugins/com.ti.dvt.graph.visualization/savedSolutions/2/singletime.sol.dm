<?xml version="1.0" encoding="UTF-8"?> 
<java version="1.5.0_14" class="java.beans.XMLDecoder"> 
 <object class="com.ti.dvt.datamodel.core.DataModel"> 
  <void method="addSource"> 
   <object class="com.ti.dvt.datamodel.ccsgraphs.CCSGraphsJtagDataSource"> 
    <void method="connectOutput"> 
     <object class="com.ti.dvt.datamodel.ccsgraphs.SingleDualTimeCCSGraphDecoder"> 
      <void method="connectOutput"> 
       <object class="com.ti.dvt.datamodel.ccsgraphs.GraphScaleDecoder"> 
        <void method="connectOutput"> 
         <object class="com.ti.dvt.datamodel.core.CircularBuffer"> 
          <void property="name"> 
           <string>CircularBuffer</string> 
          </void> 
          <void property="recordsBlockMode"> 
           <boolean>true</boolean> 
          </void> 
          <void property="recordsPerBlock"> 
           <int>256</int> 
          </void> 
          <void property="size"> 
           <int>200</int> 
          </void> 
         </object> 
        </void> 
        <void property="name"> 
         <string>GraphScaleDecoder</string> 
        </void> 
       </object> 
      </void> 
      <void property="blockSize1"> 
       <int>256</int> 
      </void> 
      <void property="blockSize2"> 
       <int>256</int> 
      </void> 
      <void property="name"> 
       <string>SingleDualTimeCCSGraphDecoder</string> 
      </void> 
     </object> 
    </void> 
    <void property="blockSize1"> 
     <int>256</int> 
    </void> 
    <void property="blockSize2"> 
     <int>256</int> 
    </void> 
    <void property="name"> 
     <string>CCSGraphsJtagDataSource</string> 
    </void> 
    <void property="startAddress1Expr"> 
     <string>table[0]</string> 
    </void> 
   </object> 
  </void> 
 </object> 
</java> 
