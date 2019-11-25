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
  
  
}
