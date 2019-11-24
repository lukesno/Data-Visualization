//plotting graph


void drawBars(){ //all data

   stroke(#8F9090); //cleaner bars
   strokeWeight(0.25);
   int xMin = 110;
   int xMax = 1490;
   int yMin = 400;
   int yMax = 800;
   int initialWidth = 4;
   int initialLength = 10;
   
   int counter = 0;
   
   //max temp
   fill(#F08C8C);
   for(TableRow row: table.rows()){
    
     maxTemp = row.getFloat("Max Temperature");
  
     rect(xMin + counter, 400.0 - maxTemp*15, initialWidth, maxTemp*15);
     
     counter+=4;
   }
   
   //min temp
   counter = 0;
   fill(#8CEBF0);
   for(TableRow row: table.rows()){
     minTemp = row.getFloat("Min Temperature");
     rect(xMin + counter, 400.0 - minTemp*15, initialWidth, minTemp*15);
     counter+=4;
   }
  

   //temporary solution to maxTemp graphs under 0 not showing: just redraw
   counter = 0;
   fill(#F08C8C);
   for(TableRow row: table.rows()){
     maxTemp = row.getFloat("Max Temperature");
     if(maxTemp < 0){
       rect(xMin + counter, 400.0 - maxTemp*15, initialWidth, maxTemp*15);
     }
     counter+=4;
   }
   
}
