//plotting graph


void drawPlot(){
  
  background(#FFFFFF); //taking into consideration black background after snowfall
  strokeWeight(5);
  //max temp
  int counter = 0;
  
  //if plot is on while max and min are off, show full plot
  if(plot.isOn() && (!max.isOn() && !min.isOn())){
    
      stroke(#F08C8C);
        for(TemperatureData d: tempData){
          point(xMin + counter, yMin - d.maxTemp*multFact );
          counter+=4;
        }
      
      counter = 0;
      stroke(#8CEBF0);
        for(TemperatureData d: tempData){
         point(xMin + counter, yMin - d.minTemp*multFact); 
         counter+=4;
        }
    
  }
  // if plot is on while max is on, show max plot
  else if(plot.isOn() && max.isOn()){
      stroke(#F08C8C);
        for(TemperatureData d: tempData){
        point(xMin + counter, yMin - d.maxTemp*multFact );
        counter+=4;
        }
    
  }
  // if plot is on while min is on, show min plot
  else if(plot.isOn() && min.isOn()){
      stroke(#8CEBF0);
        for(TemperatureData d: tempData){
         point(xMin + counter, yMin - d.minTemp*multFact); 
         counter+=4;
        }
    
  }
  
  axis(); //creates new axis labels
  for(Button b: buttons){
     
      if(b.isOn()){
         drawPlotMonth(); 
      }
   }
  
  
}

void drawPlotMonth(){
    println("hiya!~ V2");
    background(#FFFFFF); //taking into consideration black background after snowfall  
    strokeWeight(5);
   
    
    int count = 1;
    int counter = 0;
    for(Button a: buttons){ //check each individual button to see which one is on
     if(a.isOn() && (!max.isOn() && !min.isOn())){ // when max and min are unselected
         println("testing");
         stroke(0xffF08C8C);
      
         for(int x = 0; x < tempData.length; x++){
           if(tempData[x].date.Month == count){
             point(xMin + counter, yMin - tempData[x].maxTemp*multFact);
             println("1");
             
           }
           counter+=4;
         }
      
         
         //min temp
         counter = 0;
         stroke(0xff8CEBF0);
         for(int x = 0; x < tempData.length; x++){
           if(tempData[x].date.Month == count){
             point(xMin + counter, yMin - tempData[x].minTemp*multFact);
             println("2");
           }
           counter+=4;
         }
     }
     
     else if(a.isOn() && max.isOn()){
         println("testing");
         stroke(0xffF08C8C);
      
         for(int x = 0; x < tempData.length; x++){
           if(tempData[x].date.Month == count){
             point(xMin + counter, yMin - tempData[x].maxTemp*multFact);
             println("3");
           }
           counter+=4;
         }      
     }
     
     else if(a.isOn() && min.isOn()){
         println("testing");
         counter = 0;
         stroke(0xff8CEBF0);
         for(int x = 0; x < tempData.length; x++){
           if(tempData[x].date.Month == count){
             point(xMin + counter, yMin - tempData[x].minTemp*multFact);
             println("4");
           }
           counter+=4;
         }
     }
     
     
     count++;
    }

  axis();
  
    
  
  
  
}
