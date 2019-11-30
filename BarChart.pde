
void axis(){
  
  //axis
 strokeWeight(0.5f);
 stroke(0xff8F9090);
 line(200,450,1750,450);
 line(200,0,200,800);
  
  //axis labels
 int xStart = table.getRow(1).getInt("Year");
 int yStart = 25;
 fill(1);

 for(int a = xStart, incrementor = 0; a <= 2019; a++, incrementor +=48){
   text(a, 210 + incrementor, 500);
 }
 for(int a = yStart; a >= -25; a-=5){
   text(a, 180, 450-a*15); 
   
 } 
}







void drawBars(){ //all data

   background(0xffFFFFFF); //taking into consideration black background after snowfall
   stroke(0xff8F9090); //cleaner bars
   strokeWeight(0.25);
   
   int counter = 0;
   
   ////max temp
   
   //IF BAR IS ON WHILE MAX AND MIN OFF, THEN SHOW NORMAL BAR GRAPH
   if(bar.isOn() && (!max.isOn() && !min.isOn())){
     
         fill(0xffF08C8C);
      
         for(TemperatureData d: tempData){
           rect(xMin + counter, yMin - d.maxTemp*multFact, initialWidth, d.maxTemp*multFact);
           counter+=4;
         }
      
         
         //min temp
         counter = 0;
         fill(0xff8CEBF0);
         for(TemperatureData d: tempData){
           rect(xMin + counter, yMin - d.minTemp*multFact, initialWidth, d.minTemp*multFact);
           counter+=4;
         }
        
      
         //temporary solution to maxTemp graphs under 0 not showing: just redraw
         counter = 0;
         fill(0xffF08C8C);
         for(TemperatureData d: tempData){
           if(d.maxTemp < 0){
             rect(xMin + counter, yMin - d.maxTemp*multFact, initialWidth, d.maxTemp*multFact);
           }
           counter+=4;
         }
           
           
           
   }
   //IF BAR AND MAX IS ON, SHOW ONLY MAX
   else if(bar.isOn() && max.isOn()){
       fill(0xffF08C8C);
    
       for(TemperatureData d: tempData){
         rect(xMin + counter, yMin - d.maxTemp*multFact, initialWidth, d.maxTemp*multFact);
         counter+=4;
       }
     
   }
   //IF BAR AND MIN IS ON, SHOW ONLY MIN
   else if(bar.isOn() && min.isOn()){
     
       counter = 0;
       fill(0xff8CEBF0);
       for(TemperatureData d: tempData){
         rect(xMin + counter, yMin - d.minTemp*multFact, initialWidth, d.minTemp*multFact);
         counter+=4;
       }
   }
   
   axis();
   for(Button b: buttons){
     
      if(b.isOn()){
         drawBarMonth(); 
      }
   }
   
}








//portraying bar graphs according to month buttons pushed
void drawBarMonth(){
    println("hiya!~");
    background(#FFFFFF); //taking into consideration black background after snowfall  
   
    
    int count = 1;
    int counter = 0;
    for(Button a: buttons){ //check each individual button to see which one is on
     if(a.isOn() && (!min.isOn() && !max.isOn())){ // when max and min are unselected
         
         fill(0xffF08C8C);
      
         for(int x = 0; x < tempData.length; x++){
           if(tempData[x].date.Month == count){
             rect(xMin + counter, yMin - tempData[x].maxTemp*multFact, initialWidth, tempData[x].maxTemp*multFact);
           }
           counter+=4;
         }
      
         
         //min temp
         counter = 0;
         fill(0xff8CEBF0);
         for(int x = 0; x < tempData.length; x++){
           if(tempData[x].date.Month == count){
             rect(xMin + counter, yMin - tempData[x].minTemp*multFact, initialWidth, tempData[x].minTemp*multFact);
           }
           counter+=4;
         }
        
      
         //temporary solution to maxTemp graphs under 0 not showing: just redraw
         counter = 0;
         fill(0xffF08C8C);
         for(int x = 0; x < tempData.length; x++){
           if(tempData[x].maxTemp < 0){
             if(tempData[x].date.Month == count){
                rect(xMin + counter, yMin - tempData[x].maxTemp*multFact, initialWidth, tempData[x].maxTemp*multFact);
             }
           }
           counter+=4;
         }
       //////////////

     }
     else if(a.isOn() && max.isOn()){
         
         fill(0xffF08C8C);
      
         for(int x = 0; x < tempData.length; x++){
           if(tempData[x].date.Month == count){
             rect(xMin + counter, yMin - tempData[x].maxTemp*multFact, initialWidth, tempData[x].maxTemp*multFact);
           }
           counter+=4;
         }      
       
     }
     else if(a.isOn() && min.isOn()){
         counter = 0;
         fill(0xff8CEBF0);
         for(int x = 0; x < tempData.length; x++){
           if(tempData[x].date.Month == count){
             rect(xMin + counter, yMin - tempData[x].minTemp*multFact, initialWidth, tempData[x].minTemp*multFact);
           }
           counter+=4;
         }
              
       
       
     }
     count++;
    }

  axis();
  
  
}
