//store following member variables
//filePath to store the path of the selected sensor data file
//dataTable of type Table to load the data in the csv input file


import controlP5.*;

ControlP5 cp5;
Button bar;
Button plot;
Table table;
Date[] date;
TemperatureData[] tempData;
public int perYear,month;
public float maxTemp, minTemp, snowFall;

public int xMin = 210;
public int xMax = 1590;
public float yMin = 450;
public int yMax = 800;
public int initialWidth = 4;
public int initialLength = 10;
public int multFact = 15; //to scale raw data onto graphs




void setup(){
  
 background(#FFFFFF);
 
 /* Adding buttons */
 size(1700,800); 
 textSize(9); //for formatting
 PFont font = createFont("Georgia Bold", 5);
 cp5 = new ControlP5(this);
  
 bar = cp5.addButton("Bar")
              .setValue(0)
              .setPosition(10,10)
              .setSize(120,50)
              .setSwitch(true)
              .addCallback(new CallbackListener(){
                public void controlEvent(CallbackEvent event){
                  if(event.getAction() == ControlP5.ACTION_PRESS){
                    
                    if(bar.isOn()){
                       bar.setOff();
                       background(#FFFFFF);
                       reset();
                    }
                    else if (plot.isOn()){
                       plot.setOff(); //since plot and bar cannot be on at same time
                       bar.setOn();
                       drawBars(); 
                       reset();
                    }
                    else{
                       bar.setOn();
                       drawBars(); 
                       reset();                      
                    }
                    
                  }
                }
              });
              
 plot = cp5.addButton("Plot")
               .setValue(0)
               .setPosition(10,70)
               .setSize(120,50)
               .setSwitch(true)
               .addCallback(new CallbackListener(){
                public void controlEvent(CallbackEvent event){
                  if(event.getAction() == ControlP5.ACTION_PRESS){
                    
                    if(plot.isOn()){
                       plot.setOff();
                       background(#FFFFFF);
                       reset();
                    }
                    else if(bar.isOn()){
                       bar.setOff(); //since bar and plot cannot be on at same time
                       plot.setOn();
                       drawPlot(); 
                       reset();
                    }
                    else{
                       plot.setOn();
                       drawPlot(); 
                       reset();                      
                    }
                    
                  }
                }
              });
               
 Button monthly = cp5.addButton("Monthly")
                   .setValue(0)
                   .setPosition(10,160)
                   .setSize(50,50)
                   .setColorBackground(#5C5D5D);
 Button max = cp5.addButton("Max")
               .setValue(0)
               .setPosition(10,220)
               .setSize(50,50)
               .setColorBackground(#5C5D5D);
 Button min = cp5.addButton("Min")
               .setValue(0)
               .setPosition(10,280)
               .setSize(50,50)
               .setColorBackground(#5C5D5D);
               
 cp5.getController("bar");

 /*                */
 
 
 /*CSV loader*/
 table = loadTable("CalgaryWeather.csv", "header");
 
 date = new Date[table.getRowCount()];
 tempData = new TemperatureData[table.getRowCount()];

 int counter =  0;
 for(TableRow row: table.rows()){
  
   date[counter] = new Date(row.getInt("Month"),row.getInt("Year"));
   tempData[counter] = new TemperatureData(date[counter], row.getFloat("Min Temperature"), row.getFloat("Max Temperature"), row.getFloat("Snow Fall"));
   counter++;
  // print(tempData[counter].maxTemp);
 //  print(tempData[counter].a.Year, tempData[counter].a.Month, tempData[counter].minTemp, tempData[counter].maxTemp, tempData[counter].snowFall);
 }
 /*           */

 
 //axis labels
 axis();
}

void draw(){
 //axis(); //label is pixelated for some reason
}

void reset(){ // resets graph
   axis();
}




//void Bar(){
//  if(t){
//     bar.setOn();
//     drawBars(); 
//     reset();
//     t = false;
//  }
//  else{
//     bar.setOff();
//     background(#FFFFFF);
//     reset();
//  }

  //if(bar.isOn()){
  //   bar.setOff();
  //   background(#FFFFFF);
  //   reset();
  // }
  // else{
  //   bar.setOn();
  //   drawBars(); 
  //   reset();
  // }

//} 

//void plot(){
// if(plot.isOn()){
//   plot.setOff();
//   background(#FFFFFF);
//   reset();
// }
// else{
//   plot.setOn();
//   drawPlot();
//   reset();
// }
  
//}




//void controlEvent(ControlEvent theEvent){
  
// if(theEvent.getController().getName()=="Bar"){
//   if(bar.isOn()){
//     bar.setOff();
//   }
//   else{
//     bar.setOn();
//   }
//   drawBars();
//   reset();
// }
 
// if(theEvent.getController().getName()=="Plot"){
//   drawPlot();
//   reset(); 
// }
  
// if(theEvent.getController().getName()=="Monthly"){
//   drawPlot();
//   reset();
// }
 
// if(theEvent.getController().getName()=="Max"){

// }
 
// if(theEvent.getController().getName()=="Min"){
//   println("asd"); 
// }

//}

