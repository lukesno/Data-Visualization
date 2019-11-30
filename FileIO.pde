
import controlP5.*; 

//store following member variables
//filePath to store the path of the selected sensor data file
//dataTable of type Table to load the data in the csv input file




ControlP5 cp5;
Button bar, plot, max, min;
Button jan, feb, mar, apr, may, jun, jul ,aug ,sep , oct, nov, dec;
Button[] buttons= {jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec}; //used to assign buttons
String months[] = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"}; //used to name buttons

Table table;
Date[] date;
TemperatureData[] tempData;
public String name, name2; //for making month buttons
public int perYear, month;
public float maxTemp, minTemp, snowFall;

public int xMin = 210;
public int xMax = 1590;
public float yMin = 450;
public int yMax = 800;
public int initialWidth = 4;
public int initialLength = 10;
public int multFact = 15; //to scale raw data onto graphs




void setup(){
 
 background(0xffFFFFFF);
 size(1700,800);
 /* Adding buttons */
  
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
                       background(0xffFFFFFF);
                       axis(); //reset field
                    }
                    else if (plot.isOn()){
                       plot.setOff(); //since plot and bar cannot be on at same time
                       bar.setOn();
                       drawBars(); 
                       
                    }
                    else if(!bar.isOn()){
                       bar.setOn();
                       drawBars();                       
                    }
                    else{
                       for(Button b: buttons){
                         if (b.isOn()){
                           bar.setOn();
                           drawBarMonth(); 
                         }
                         else if (bar.isOn() && b.isOn()){
                          bar.setOff(); 
                         }
                         
                      }
                      
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
                       background(0xffFFFFFF);
                       axis(); //reset field
                    }
                    else if (bar.isOn()){
                       bar.setOff(); //since plot and bar cannot be on at same time
                       plot.setOn();
                       drawPlot(); 
                       
                    }
                    else if(!plot.isOn()){
                       plot.setOn();
                       drawPlot();                       
                    }
                    else{
                       for(Button b: buttons){
                         if (b.isOn()){
                           plot.setOn();
                           drawPlotMonth(); 
                         }
                         else if (plot.isOn() && b.isOn()){
                          plot.setOff(); 
                         }
                         
                      }
                      
                    }
 
                  }
                }
              });
               

///////////////////////////////////////////


 max = cp5.addButton("Max")
               .setValue(0)
               .setPosition(10,220)
               .setSize(50,50)
               .setColorBackground(0xff5C5D5D)
               .setColorForeground(0xff889393)
               .setColorActive(0xff889393)
               .setSwitch(true)
               .addCallback(new CallbackListener(){
                public void controlEvent(CallbackEvent event){
                  if(event.getAction() == ControlP5.ACTION_PRESS){
                    
                    //turn off min if it is already on when max is clicked
                    if((min.isOn())){
                       min.setOff();
                       max.setOn();
                          //if max was turned on while bar is turned on, draw max bar
                          if(max.isOn() && bar.isOn()){
                            drawBars();
                          }
                          //if max was turned on while plot is turned on, draw max plot
                          else if(max.isOn() && plot.isOn()){
                            drawPlot();
                          }
                    }
                    else if (!max.isOn()){
                        max.setOn();
                          //if max was turned on while bar is turned on, draw max bar
                          if(max.isOn() && bar.isOn()){
                            drawBars();
                          }
                          //if max was turned on while plot is turned on, draw max plot
                          else if(max.isOn() && plot.isOn()){
                            drawPlot();
                          }
                    }
                    //if max is turned off, redraw bars
                    else if(max.isOn() && bar.isOn()){
                     max.setOff();
                     drawBars(); 
                    }
                    else if(max.isOn() && plot.isOn()){
                     max.setOff();
                     drawPlot();
                    }
                    
                  }
                }
              });
              
 min = cp5.addButton("Min")
               .setValue(0)
               .setPosition(10,280)
               .setSize(50,50)
               .setColorBackground(0xff5C5D5D)
               .setColorForeground(0xff889393)
               .setColorActive(0xff889393)
               .setSwitch(true)
               .addCallback(new CallbackListener(){
                public void controlEvent(CallbackEvent event){
                  if(event.getAction() == ControlP5.ACTION_PRESS){
                    
                    //turn off max if it is already on when min is clicked
                    if(max.isOn()){
                       max.setOff();
                       min.setOn();
                              //if min was turned on while bar is turned on, draw min bar
                              if(min.isOn() && bar.isOn()){
                                 drawBars();
                              }
                              //if min was turned on while plot is on, draw min bar
                              else if(min.isOn() && plot.isOn()){
                                 drawPlot();
                              }      
                    }
                    else if(!min.isOn()){
                       min.setOn(); 
                              //if min was turned on while bar is turned on, draw min bar
                              if(min.isOn() && bar.isOn()){
                                 drawBars();
                              }
                              //if min was turned on while plot is on, draw min bar
                              else if(min.isOn() && plot.isOn()){
                                 drawPlot();
                              }    
                    }
                    //if min is turned on, and bar is still on draw bars again
                    else if(min.isOn() && bar.isOn()){
                       min.setOff();
                       drawBars();
                    }
                    //if min is turned on and plot is still on draw plot again
                    else if(min.isOn() && plot.isOn()){
                       min.setOff();
                       drawPlot();
                    }
                    
                  }
                }
              });;
               
////////////////////////////

//Month buttons
for(int a = 0, b = 400, c = 20; a < months.length-1; a++, b+=30){
  String name = months[a];
  String name2 = months[a+1];
  
  if(a%2 == 0){ //retrieve from index 0,2,4,6..

      buttons[a] = cp5.addButton(name)
      .setValue(0)
      .setPosition(c, b)
      .setSize(30,30)
      .setColorBackground(0xffFABD8B)
      .setColorForeground(0xffFADAC0)
      .setColorActive(0xffFADAC0)
      .setSwitch(true);

  }
  
  if((a+1)%2 != 0 ){ //retrieve from index 1,3,5,7...
      buttons[a+1] = cp5.addButton(name2)
      .setValue(0)
      .setPosition(c*4, b)
      .setSize(30,30)
      .setColorBackground(0xffFABD8B)
      .setColorForeground(0xffFADAC0)
      .setColorActive(0xffFADAC0)
      .setSwitch(true);
       

    
  }

}





for(Button b: buttons){
  final Button c = b;
  b.addCallback(new CallbackListener(){
                public void controlEvent(CallbackEvent event){
                     if (event.getAction() == ControlP5.ACTION_PRESS){
                       println("You're in!");
                       
                       //turn off all other month buttons
                       if(!c.isOn())
                         desMonth(c);
                         
                       //bar
                       if(bar.isOn() && !c.isOn()){
                          c.setOn();
                          drawBarMonth(); 
                       }
                       else if(bar.isOn() && c.isOn()){
                        c.setOff();
                        drawBars();
                       }

                       //plot
                       if(plot.isOn() && !c.isOn()){
                          c.setOn();
                          drawPlotMonth();
                       }
                       else if(plot.isOn() && c.isOn()){
                          c.setOff();
                          drawPlot();
                       }

                     
                   }
                }
   });
  
}

 /*                */
 
 
 /*CSV loader*/
 table = loadTable("CalgaryWeather.csv", "header");
 
 date = new Date[table.getRowCount()];
 tempData = new TemperatureData[table.getRowCount()];

 int counter =  0;
 for(TableRow row: table.rows()){
  
   date[counter] = new Date(row.getInt("Month"),row.getInt("Year"));
   tempData[counter] = new TemperatureData(date[counter], row.getFloat("Min Temperature"), row.getFloat("Max Temperature"), row.getFloat("Snow Fall"));

 //  print(tempData[counter].maxTemp);
 //  print(tempData[counter].minTemp, tempData[counter].maxTemp, tempData[counter].snowFall);
   counter++;
 }
 /*           */

 
 //axis labels
 axis();
}



void draw(){
 //axis(); //label is pixelated for some reason
}

void desMonth(Button a){ //turning off all other Month buttons other than the one selected. 
  
 for(Button b: buttons){
   
    if(b != a){
      b.setOff();
    }
   
   
 }
  
}
