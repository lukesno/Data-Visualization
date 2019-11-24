//store following member variables
//filePath to store the path of the selected sensor data file
//dataTable of type Table to load the data in the csv input file


import controlP5.*;

ControlP5 cp5;
Table table;
Date[] date;
TemperatureData[] tempData;
int perYear,month;
float maxTemp, minTemp, snowFall;



void setup(){
  
 /* Adding buttons */
 size(1700,800); 
 textSize(9); //for formatting
 PFont font = createFont("Georgia Bold", 5);
 cp5 = new ControlP5(this);

 Button monthly = cp5.addButton("Monthly")
                   .setValue(0)
                   .setPosition(10,10)
                   .setSize(50,50)
                   .setColorBackground(#5C5D5D);
 Button max = cp5.addButton("Max")
               .setValue(0)
               .setPosition(10,70)
               .setSize(50,50)
               .setColorBackground(#5C5D5D);
 Button min = cp5.addButton("Min")
               .setValue(0)
               .setPosition(10,130)
               .setSize(50,50)
               .setColorBackground(#5C5D5D);

 /*                */
 
 
 /*CSV loader*/
 table = loadTable("CalgaryWeather.csv", "header");
 
 date = new Date[table.getRowCount()];

 //println(table.getRowCount() + " total rows in table");
 
 //for(TableRow row: table.rows()){
    
 //  perYear = row.getInt("Year");
 //  month = row.getInt("Month");
 //  maxTemp = row.getInt("Max Temperature");
 //  minTemp = row.getInt("Min Temperature");
 //  snowFall = row.getInt("Snow Fall");
 //  println(perYear + " "+ month + " " + maxTemp + " " + minTemp + " " + snowFall);

 //}
 /*           */
}

void draw(){
  
  
 background(#FFFFFF); 

 
 //axis
 strokeWeight(0.5);
 stroke(#8F9090);
 line(100,400,1700,400);
 line(100,0,100,800);
 
 drawBars(); //draws initial graph
 
 //axis labels
 int xStart = table.getRow(1).getInt("Year");
 int yStart = 25;
 fill(1);

 for(int a = xStart, incrementor = 0; a <= 2019; a++, incrementor +=48){
   text(a, 110 + incrementor, 450);
 }
 for(int a = yStart; a >= -25; a-=5){
   text(a, 80, 400-a*15); 
   
 }
  
  
}

void controlEvent(ControlEvent theEvent){
  
 if(theEvent.getController().getName()=="Monthly"){
   
 }
 
 if(theEvent.getController().getName()=="Max"){
   println("annyoung");
 }
 
 if(theEvent.getController().getName()=="Min"){
   println("asd"); 
 }
 
}
