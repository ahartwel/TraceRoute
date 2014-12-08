/* @pjs preload="blankNew.png"; */

float blockWidth, blockHeight;

ArrayList<point> points;
ArrayList<block> blocks;
ArrayList<data> theData;

PImage img;
SiteManager manager;
int coloringCount = 0;

float w = -149.2383;
float s = -38.8288;
float e = 155.0391;
float n = 83.9604;

//float w = -170.1536;
//float s = -52.7787;
//float e = 176.4844;
//float n = 98.6278;

int numOfBlocks = 15;

color[] col;
   int colorCount;             

//int ww = window.innerWidth;
//int hh = window.innerHeight;

void setup() {
 
 size( 2048, 1024,P3D ); 
 //size( 500,500,P3D ); 
  background(0,0,0);
  frameRate(10);
  img = loadImage("blankNew.png");
 // println(img.width);
  //size(window.innerWidth,window.innerHeight);
  blockWidth = width/numOfBlocks;
  blockHeight = height/numOfBlocks;
  points = new ArrayList<point>();
  blocks = new ArrayList<block>();
  theData = new ArrayList<data>();
  
 manager = new SiteManager();
  
  
  
  col = new color[5];
  
  colorCount = 1;

               console.log(colorCount); 
    col[0] = color(218,39,69);
    col[1] = color(135,142,246);
    col[2] = color(101,189,81);
    col[3] = color(240,96,0);
    col[4] = color(255,255,255);
  
  
  float x = 0;
  float y = 0;
  int iCount = 0;
  while(y<=height) {
    points.add( new point((int)x,(int)y, iCount) );
    x+=blockWidth;
    
    if (x>width) {
     x=0;
     y+=blockHeight;
    }
    
    
    iCount++;
  }
  println(iCount);
 int blockCount = points.size();
 int xCount  = 0;
 int yCount = 0;
 int counter = 0;
 for (int i = 0; i< points.size()-1; i++) {
   
    int id = xCount + (yCount * numOfBlocks);
//   println(id + " " + i + " " + xCount);
//   println(round((points.get(i).x/width) * numOfBlocks) + " " + points.get(i).x);
  
  int newX, newY,  newid;
   ArrayList<point> ps = new ArrayList<point>();
  
  
  newY = yCount - 1;
  //println("asdfasdfasf: " + newY + " " + yCount);
   if (newY>=0) {
    newX = xCount -  1;
    if (newX>=0) {
    newid = i - (numOfBlocks + 2);
    points.get(i).connections.add( points.get(newid) );
    points.get(i).distances.add(int(dist(points.get(newid).x,points.get(newid).y,points.get(i).x, points.get(i).y)));
    points.get(i).positions.add(0);
    }
    
    newX = xCount;
     newid = i - (numOfBlocks + 1); 
    points.get(i).connections.add( points.get(newid) );
    points.get(i).distances.add(int(dist(points.get(newid).x,points.get(newid).y,points.get(i).x, points.get(i).y)));
    points.get(i).positions.add(1);
// 
    newX = xCount+1;
    if (newX<numOfBlocks) {
     newid = i - (numOfBlocks); 
     //if (points.get(newid)) {
    points.get(i).connections.add( points.get(newid) );
     points.get(i).distances.add(int(dist(points.get(newid).x,points.get(newid).y,points.get(i).x, points.get(i).y)));
     points.get(i).positions.add(2);
    //  }
    }
   
       } 
   //println(ps);
    newY = yCount + 1;
   if (newY<=numOfBlocks) {
    newX = xCount -  1;
    if (newX>=0) {
    newid = i + (numOfBlocks);
    var newest = newid;
    //if (points.get(newid)) {
    points.get(i).connections.add( points.get(newid) );
   points.get(i).distances.add(int(dist(points.get(newest).x,points.get(newid).y,points.get(i).x, points.get(i).y)));
   points.get(i).positions.add(5);
    //}
    }
    
    newX = xCount;
    newid =  i + (numOfBlocks+1); 
    if (points.get(newid)) {
    points.get(i).connections.add( points.get(newid) );
   points.get(i).distances.add(int(dist(points.get(newid).x,points.get(newid).y,points.get(i).x, points.get(i).y)));
   points.get(i).positions.add(6);
    }
 
    newX = xCount+1;
    if (newX<numOfBlocks-1) {
    newid = i + (numOfBlocks+2); 
   if (points.get(newid)) {
   points.get(i).connections.add( points.get(newid) );
   console.log(points.get(newid) );
   console.log(i);
   points.get(i).distances.add(int(dist(points.get(newid).x,points.get(newid).y,points.get(i).x, points.get(i).y)));
   points.get(i).positions.add(7);
  }
    }
   
       } 
//       
           newY = yCount;
           newX = xCount -  1;
          // println(xCount + " " + newX);
    if (newX>=0) {
    newid = i - 1;
    points.get(i).connections.add( points.get(newid) );
  points.get(i).distances.add(int(dist(points.get(newid).x,points.get(newid).y,points.get(i).x, points.get(i).y)));
  points.get(i).positions.add(3);
    }
    
     newX = xCount +  1;
           //println(xCount + " " + newX);
    if (newX<=numOfBlocks) {
    newid = i + 1;
    points.get(i).connections.add( points.get(newid) );
     points.get(i).distances.add(int(dist(points.get(newid).x,points.get(newid).y,points.get(i).x, points.get(i).y)));
     points.get(i).positions.add(4);
    }
           
   //println(points.get(i).connections);
   
  
 
  
  
   
   xCount++;
   if (xCount>numOfBlocks) {
  
    xCount=0;
   yCount++; 
   } else {
    counter++; 
   }
   
 }  //end for loop for creating blocks
  
    
   for (int i = 0; i< points.size(); i++) {
  // points.get(i).messUpDist(); 
  }
    
    
    float blockX = 0;
    float blockY = 0;
    int iCounter = 0;
    
     for (int i = 0; i< points.size() - numOfBlocks - 1; i++) {
         
    
    blocks.add(new block(points.get(i), points.get(i+1), points.get(i+numOfBlocks+2), points.get(i+numOfBlocks+1) ) );
    //println(blockX + " " + blockY); 
    
        blockX++;
        iCounter++;
   if (blockX>numOfBlocks-1) {
  
    
    
     i++;     
    blockX=0;
   blockY++; 
   } else {
    counter++; 
   }
       
     }
  
  
  

  
  
//  int siteNum = manager.sites.size();
//  manager.sites.add(new Site("facebook") );
//  
//  
//  
//  JSONObject file = loadJSONObject("data.json");
//  for (int i = 0; i< file.size(); i++) {
//    JSONObject folders = file.getJSONObject(str(i));
//    //println(folders);
//      float lat = folders.getFloat("lat");
//      float lon = folders.getFloat("lon");
//      float time = folders.getFloat("time");
//      String country = folders.getString("country");
//      String city = folders.getString("city");
//      String state = folders.getString("state");
//      String zip = folders.getString("zip");
//      String ip = folders.getString("ip");
//      manager.sites.get(siteNum).addData(lat, lon, time, country, city, state, zip, ip);  
//  }
//  
//  
//  
//  
//siteNum = manager.sites.size();
//  manager.sites.add(new Site("netflix") );
//  
//  
//  
//JSONObject f = loadJSONObject("data2.json");
//  for (int i = 0; i< file.size(); i++) {
//    JSONObject folders = f.getJSONObject(str(i));
//    //println(folders);
//      float lat = folders.getFloat("lat");
//      float lon = folders.getFloat("lon");
//      float time = folders.getFloat("time");
//      String country = folders.getString("country");
//      String city = folders.getString("city");
//      String state = folders.getString("state");
//      String zip = folders.getString("zip");
//      String ip = folders.getString("ip");
//      manager.sites.get(1).addData(lat, lon, time, country, city, state, zip, ip);  
//  }
//  println(manager.sites);
  
  
  

  
} 




void draw() {
  background(0,0,0);
  fill(255,255,255);
  

  

  
  
    for (int i =0 ; i<points.size(); i++) {
   point pp = points.get(i);
   pp.push();
    }
  
    for (int i =0 ; i<points.size(); i++) {
    point pp = points.get(i);
    pp.applyForce();
    
    }
  
  
  for (int i = 0; i<blocks.size(); i++) {
    
   //if (dist(mouseX, mouseY,blocks.get(i).centerX, blocks.get(i).centerY)<.25*width) {
    blocks.get(i).display(); 
   // }
    
  }
  
  for (int i = 0; i<theData.size(); i++) {
    
   // if (dist(mouseX, mouseY,blocks.get(i).centerX, blocks.get(i).centerY)<.25*width) {
   theData.get(i).display(); 
    //}
    
  }
  
    for (int i =0 ; i<points.size(); i++) {
    point pp = points.get(i);
    pp.xForce = 0;
    pp.yForce = 0;
    }
  
  for (int i =0 ; i<points.size(); i++) {
   point pp = points.get(i);
  // pp.showConnections();
   //pp.stickToSpot();
  // pp.update();
  // pp.pull();
   //pp.push();
   //pp.stickToSpot();
   fill(pp.col);

   //rect(pp.x,pp.y,5,5);
  
  }
  
  
  manager.update();
    
  
  
  
   for (int i =0 ; i<points.size()-1; i++) {
     point pp = points.get(i);
    
    pp.x+=pp.xForce;
    
    
     
    
            
   pp.y += pp.yForce; 
     
    
    //println(pp.xForce); 
   }
  
  

  
  
}


 void keyPressed() {
  for (int i = 0; i< points.size(); i++) {
  // points.get(i).messUpDist(); 
  }
  
  manager.removeIt("netflix");
  
  saveFrame(); 
  
 }
class SiteManager {
  ArrayList<Site> sites;
  
 int timer = 0;
 boolean backToSpot = false;
     SiteManager() {
      
      sites = new ArrayList<Site>();
      
      
      
     } 
     
   
  
    void update() {
     for (int i = 0; i<sites.size(); i++) {
    println(i);
   sites.get(i).displayPoints(); 
    sites.get(i).applyDist();
  }
 
     if (backToSpot) {
      timer++;
     println("BACK TO SPOT");
     for (int i =0 ; i<points.size(); i++) {
       point pp = points.get(i);
     pp.stickToSpot();
        } 
       
       if (timer>120) {
        backToSpot = false;
        timer=0;
        
         
       }
       
     }
  
      
      
    }
    
    
    
    void removeIt(String site) {
    console.log(site);
    console.log(sites);
      for (int i = sites.size()-1; i>=0; i--) {
      console.log(i);
       console.log(sites.get(i));
       console.log(sites.get(i).name);
        if (sites.get(i).name==site) {
          backToSpot = true;
         sites.remove(i); 
        }
        
      }
      
    }
    
    
    
    void hideIt(String site) {
     console.log(site);
    console.log(sites);
      for (int i = sites.size()-1; i>=0; i--) {
      console.log(i);
       console.log(sites.get(i));
       console.log(sites.get(i).name);
        if (sites.get(i).name==site) {
        
          if (sites.get(i).hidden) {
            sites.get(i).hidden=false;
            } else {
            sites.get(i).hidden=true;
              backToSpot = true;
            }
        }
        
      }
    
    
    }
    
  
}






class data {
  
  
  
  
  ArrayList<Float> lat,  lon;
  ArrayList<String> time;
  
  ArrayList<point> gridPoints;
  
   data(ArrayList<Float> la, ArrayList<Float> lo, ArrayList<String> t) {
//  lat = new ArrayList<Float>();
//  lon = new ArrayList<Float>();
     //time = new ArrayList<Float>();
      gridPoints = new ArrayList<point>();
     lat = la;
     lon = lo;
     time = t;
    
    //println(lat);
    //println(lo);
    //println(time);
    //println("---");
   }
  
  
  
    
  
  
  
  void distortMap() {
   
   
   for (int i = 0; i<lat.size()-1; i++) {
     float lat1 = lat.get(i);
     float lat2 = lat.get(i+1);
     float lon1 = lon.get(i);
     float lon2 = lon.get(i+1);
     String tt = time.get(i);
     float t = float(tt.substring(0,tt.length()-3));
    ////println(t); 
    ////println(timeToDist(t));
    int x1,x2,y1,y2;
    
    gridPoints.add( getBlock(lat1, lon1) );
    
    if (i>0) {
     point pp = gridPoints.get(i-1);
     point ppp = gridPoints.get(i);
     
     if (pp.startX!=ppp.startX && pp.startY != ppp.startY) {
      int oldDist = int(dist(pp.x,pp.y,ppp.x,ppp.y));
       String oldtt = time.get(i);
     float oldt = float(tt.substring(0,tt.length()-3));
       ////println(oldt + " ms");
       int newDist = int( timeToDist(oldt)  );
      // //println("newDist " + newDist);
       pp.connections.add(ppp);
        pp.distances.add(newDist);
        pp.positions.add(-1);
       ppp.connections.add(pp); 
       ppp.distances.add(newDist);
       ppp.positions.add(-1);
       
       for (int p = 0; p < points.size(); p++) {
        point poi = points.get(p);
        // //println(poi.x + " " + poi.y);
       
        float range = map(poi.workX, pp.workY, ppp.workX, 0, 1);
        float yrange = map(poi.workY, pp.workY,ppp.workY,0,1);
        
        if (poi.workY==pp.workY && poi.workY==ppp.workY) {
         yrange = .5; 
        }
        
        if (poi.workX==pp.workX && poi.workX==ppp.workX) {
         range = .5; 
        }
        
        
         if (range>=0 && range<=1 && yrange>=0 && yrange<=1) {
         
           //println("coloring");
             poi.col = color(5,5,5);
                //println(poi.id);
           coloringCount++;
           
          float amount = newDist/oldDist;
          amount = .5;
          //println(amount + "  : amount");
           reduceDistance(poi,amount);
           
       
           
           
           
         }
         
         
         
        
         
       }
       
       
     }
     
      
    }
     
     
     
   }
   
   
  }
 
 
 void display() {
  fill(255,255,255);
  stroke(255,255,255);
  //println(gridPoints.size());
  for (int i = 0; i<gridPoints.size(); i++) {
//    fill(gridPoints.get(i).col);
fill(255,255,255,0);
  stroke(180,180,220);    
   ellipse(gridPoints.get(i).x, gridPoints.get(i).y,10,10);
//   fill(gridPoints.get(i).col);
   fill(255,255,255,0);
    strokeWeight(1);
   if (i<gridPoints.size()-1) {
    line(gridPoints.get(i).x, gridPoints.get(i).y,gridPoints.get(i+1).x, gridPoints.get(i+1).y); 
     if (i>0) {
        text( time.get(i+1),gridPoints.get(i+1).x, gridPoints.get(i+1).y+30); 
     }
   }
  //text( lat.get(i) + " " + lon.get(i),gridPoints.get(i).x, gridPoints.get(i).y+30); 
//    //println(lat.get(i) + " " + lon.get(i));
//   //println(gridPoints.get(i).x + " " + gridPoints.get(i).y);
//   //println("sdfsdfSdsfsdfsdf");
  }
  
 } 
  
  
  
  
  
  
  
}



class Site {
  
    String name;
    ArrayList<DataPoint> dataPoints;
    
    ArrayList<GumConnection> gums;
    
    boolean hidden;
    color colour;
    
     Site(String n) {
     gums = new ArrayList<GumConnection>();
      hidden = false;
      name = n;
      dataPoints = new ArrayList<DataPoint>();
    console.log(colorCount);
    console.log(col);
    colour = col[colorCount];
    
    colorCount++;
    
    if (colorCount>4) {
    colorCount=0;
    }
    
     }
    
    
    void addData(float lat,float lon,float time,String country,String city,String state,String zip, String ip) {
    
       dataPoints.add( new DataPoint(lat, lon, time, country, city, state, zip, ip) );
        gums.add(new GumConnection(new PVector(10,10), new PVector(100,100), 10, 10));
        gums.get(gums.size()-1).col = color(200, 20, 10, 100);
       println(dataPoints.get(dataPoints.size()-1).lat);
       println(dataPoints.get(dataPoints.size()-1).lon);
       println(dataPoints.get(dataPoints.size()-1).country);
        println(dataPoints.get(dataPoints.size()-1).ip);
    }
   
   
   
   
   void displayPoints() {
    
      for (int i = 0; i<dataPoints.size()-1; i++) {
        
        DataPoint p = dataPoints.get(i);
        DataPoint pp = dataPoints.get(i);
        boolean chosen = false;
        if (p.hasData) {
          int q = i+1;
          while(chosen==false&&q<dataPoints.size()) {
            if (dataPoints.get(q).hasData) {
             pp = dataPoints.get(q); 
            chosen=true;  
          } else {
              q++;
            }
            
            
          }
          
         if (chosen) {
          if (hidden==false) {
           float x1, x2, y1, y2;
           PVector pos = new PVector();
           PVector pos2 = new PVector();
           for (int s = 0; s<blocks.size();s++) {
             block b = blocks.get(s);
            
             if ((p.lat-b.lat1)*(p.lat-b.lat2)<=0 && (p.lon-b.lon1)*(p.lon-b.lon2)<=0) {
             println(s);
              pos = b.getPosition(p.lat, p.lon);
            // rect(b.poi[0].x, b.poi[0].y,10,10);
            } 
            
            
             if ((pp.lat-b.lat1)*(pp.lat-b.lat2)<=0 && (pp.lon-b.lon1)*(pp.lon-b.lon2)<=0) {
             println(s);
              pos2 = b.getPosition(pp.lat, pp.lon);
           //  rect(b.poi[0].x, b.poi[0].y,10,10);
            }
             
           }
           
        beginShape();
        stroke(colour);
        fill(colour);
        strokeWeight(2);
        ellipse(pos.x, pos.y, 5,5);
        ellipse(pos2.x, pos2.y, 5,5);
        
        p.realPos = pos;
        pp.realPos = pos2;
        
       line(pos.x, pos.y, pos2.x, pos2.y);
        //line(p.gridPoint.x, p.gridPoint.y, pp.gridPoint.x, pp.gridPoint.y);
        
        int gumX = pos.x;
        int gumY = pos.y;
      
        
        
        endShape();
        beginShape();
        noStroke();
        fill(0,0,0,50);
        //strokeWeight(1);
        ellipse(pos.x, pos.y, 5,5);
        ellipse(pos2.x, pos2.y, 5,5);
        endShape();
        }
         }
        }
        
        
      }
    
    
    
   } 
   
   
   
   void distortMap() {
     
     
     
     
     
     
     
   }
   
   
   void applyDist() {
    if (hidden==false) {
     for (int i = 0; i<dataPoints.size()-1;i++) {
       
       
        DataPoint p = dataPoints.get(i);
        DataPoint pp = dataPoints.get(i);
        boolean chosen = false;
        
        float time = 0;
        
        if (p.hasData) {
          int q = i+1;
          while(chosen==false&&q<dataPoints.size()) {
            if (dataPoints.get(q).hasData) {
             pp = dataPoints.get(q); 
//              println("lets get those grid points");
//             println(pp.gridPoint);
//             println(pp.gridPoint.y);
//             println(pp.gridPoint.x);
             time+=dataPoints.get(q).time;
            chosen=true;  
          } else {
            time+=dataPoints.get(q).time;
            q++;

            }
            
            
          }
          
          
           float newDist = timeToDist(time);
           float currentDist = dist(int(p.gridPoint.x),int(p.gridPoint.y), int(pp.gridPoint.x), int(pp.gridPoint.y));
           
           float distDiff = (currentDist - newDist)/2;
          if (distDiff>15 && distDiff>-15) {
//           println(distDiff + " distDigg");
//             println(newDist + " newDist");
//                  println(currentDist + " currentDist");
          }
         if (chosen && p!=pp && distDiff>.2*newDist && distDiff>-15) {
          
           color c = color(random(0,255),random(0,255),random(0,255));
          
           
           
              
           float mX = (p.gridPoint.x + pp.gridPoint.x)/2;
           float mY = (p.gridPoint.y + pp.gridPoint.y)/2;
           
           //println(currentDist);
           for (int g = 0; g<points.size(); g++) {
            point gg = points.get(g);
             float gW = abs( gg.x - p.gridPoint.x);
             float gH = abs(gg.y - p.gridPoint.y);
             if ( (gg.x-p.gridPoint.x)*(gg.x-pp.gridPoint.x)<=0 && (gg.y-p.gridPoint.y)*(gg.y-pp.gridPoint.y)<=0) {
               
                 fill(255,255,255);
                // rect(gg.x, gg.y,10,10);
                // rect(lerp(gg.x, mX,1 - distDiff/currentDist), lerp(gg.y, mY,1 - distDiff/currentDist), 10,10);
                  //text(p.gridPoint.y, gg.x+10, gg.y+15);
                 
                  
                  float le = newDist/currentDist * .001;
                 // println(le);
                  float lerpTrack = 0;
                  while (lerpTrack<le && currentDist>0) {
                   gg.xForce += lerp(gg.x, mX, .002) - gg.x;
                   gg.yForce += lerp(gg.y, mY, .002) - gg.y;
                   ArrayList<String> dir = new ArrayList<String>();
                   if (gg.x<mX) {
                    dir.add("left"); 
                   } else if (gg.x>mX) {
                    dir.add("right"); 
                   }
                   
                    if (gg.y<mY) {
                    dir.add("up"); 
                   } else if (gg.y>mY) {
                    dir.add("down"); 
                   }
                   gg.pullDirection(dir);
                  // gg.pull();
                   lerpTrack+=.002;
                  }
              // gg.yForce = lerp(gg.y, mY, distDiff/currentDist * .2) - gg.y;
               
             } else {
                ArrayList<String> dir = new ArrayList<String>();
                   if (gg.x<mX) {
                    dir.add("left"); 
                   } else if (gg.x>mX) {
                    dir.add("right"); 
                   }
                   
                    if (gg.y<mY) {
                    dir.add("up"); 
                   } else if (gg.y>mY) {
                    dir.add("down"); 
                   }
                   gg.pullDirection(dir);
               //CREATE PULL UP EVENT CREATE PULL DOWN EVEN, CREATE PULL LEFT EVEN, AND CREATE PULL RIGHT EVENT
               
             }
             
           }
           
           
          // p.gridPoint.x = lerp(p.gridPoint.x, pp.gridPoint.x,.5);
           //p.gridPoint.y = lerp(p.gridPoint.y, pp.gridPoint.y,.5);
              
        
         }
        }
       
       
       
       
       
     }
     
     
   }
   }
   
   
  
  
}


class DataPoint {
  
  float lat, lon, time;
  String country, city, state, zip, ip;
  point gridPoint;
  
  PVector realPos;
  
  boolean hasData;
  
  
  
  DataPoint(float la, float lo, float t, String cou, String ci, String st, String z, String i) {
    
    lat = la;
    lon = lo;
    time = t;
    country = cou;
    city = ci;
    state = st;
    zip = z;
    ip = i;
  
    realPos = new PVector();
    
  
    hasData = true;
    
    if (country.length()<=1) {
     hasData = false;
    println("FALSE!"); 
    }
  
    
    gridPoint = getBlock(lat, lon);
    println(gridPoint);
    
  }
  
  
  
}
class point {

  float x, y, startX, startY, workX, workY, tempX, tempY;
  ArrayList<point> connections;
  ArrayList<Integer> distances, positions; // 0 is up and left, 9 is bottom and  right
  boolean justStarted = false;
  int id;
  float xForce;
  float yForce;
  float lat, lon;
  color col;

  float imgX, imgY;
  //TO DO - ADD A CURRENTX AND USE THAT INSTEAD OF STARTX


  point (int xx, int yy, int ii) {

    x =xx;
    y = yy;
    startX = x;
    startY = y;
    workX = startX;
    workY = startY;
    
    lat = map(y,0,height,n,s);
    lon = map(x,0,width,w,e);

    xForce = 0;
    xForce = 0;

    col = color(255,255,255);

    imgX = (x/width) * img.width;
    imgY = (y/height) * img.height;

    connections = new ArrayList<point>();
    positions = new ArrayList();
    distances = new ArrayList();

    id = ii;
  } 


  void showConnections() {
    stroke(255, 255, 255, 100);
    strokeWeight(1);
    beginShape();
    for (int i = 0; i<connections.size (); i++) {

      line(x, y, lerp(x, connections.get(i).x, .55), lerp(connections.get(i).y, y, .25));
//      text(connections.get(i).lat, connections.get(i).x, connections.get(i).y);
//      text(connections.get(i).lon, connections.get(i).x, connections.get(i).y+15);
      
    } 
    endShape();
  }



  void stickToSpot() {
    if (dist(x, y, workX, workY)>(.6*blockHeight)) {
      x = lerp(x, workX, .008);
      y = lerp(y, workY, .008);
    }
  }


  void applyForce() {
    
    
   x+=xForce; 
    
    
  }


  void update() {

    if (x<0) {
      x=0;
    } else if (x>width) {
      x=width;
    }

    if (y<0) {
      y = 0;
    } else if (y>height) {
      y = height;
    }

    for (int i = 0; i<connections.size (); i++) {
      point pp = connections.get(i);

      if (positions.get(i)<=2) {
        if (y<pp.y) {

        yForce += lerp(y, workY, .012) - y;
        }
      }

      int pos = positions.get(i);

      if (pos>=5) {
        if (y>pp.y) {

        yForce += lerp(y,workY,.012) - y;
        }
      }

      if (pos==2 || pos ==4||pos==7) {
        if (x>pp.x) {
         xForce += lerp(x,workX,.012) - x;
        }
      }

      if (pos==0 || pos==3 || pos==5) {
        if (x<pp.x) {
         xForce += lerp(x, workX, .012) - x;
        }
      }
    }
    // workY = lerp(workY,  y,  .005);
    // workX = lerp(workX, x, .005);
  }




    void pullDirection(ArrayList<String> directions) {
      
      boolean up = false;
      boolean down = false;
      boolean left = false;
      boolean right = false;
      
      for (int i = 0; i<directions.size(); i++) {
         String dir = directions.get(i);
         if (dir=="up") {
         up = true;
         }
         
         if (dir=="down") {
        
        down = true;
         }
         
        if (dir=="left") {
          left = true;
        }
        
        if (dir=="right") {
          right = true;
        }
          
           
         }
    
      
      
      
      for (int i = 0; i<connections.size(); i++) {
      point pp = connections.get(i);
      int conDist = int(dist(pp.x, pp.y, x, y));
      if (conDist>distances.get(i)) {

         if (positions.get(i)>=0) {
          //pp.xForce += (pp.x-x) 10;
          boolean doIt = false;
          if (pp.x>x && right) {
            doIt = true;
          } else if (pp.x<x && left) {
            doIt = true;
          }
          
          if (pp.y<y && up) {
           doIt = true; 
          } else if (pp.y>y && down) {
           doIt = true; 
          }
          if (doIt) {
         float fAdd = lerp(pp.x, x, .0009) - pp.x;
        pp.xForce+=fAdd;  
        
        fAdd = lerp(pp.y, y, .0009) - pp.y;
        pp.yForce+=fAdd;  
          }

         } 
      }
    }
      
      
      
    }

  void pull() {

    for (int i = 0; i<connections.size (); i++) {
      point pp = connections.get(i);
      int conDist = int(dist(pp.x, pp.y, x, y));
      if (conDist>distances.get(i)) {

         if (positions.get(i)>=0) {
          //pp.xForce += (pp.x-x) 10;
          
          
         float fAdd = lerp(pp.x, x, .009) - pp.x;
        pp.xForce+=fAdd;  
        
        fAdd = lerp(pp.y, y, .009) - pp.y;
        pp.yForce+=fAdd;  

//        pp.x = lerp(pp.x, x, .04);
//        pp.y = lerp(pp.y, y, .04);
         } else {
        // pp.x = lerp(pp.x, x, .01);
        //pp.y = lerp(pp.y, y, .01);
         
            float fAdd = lerp(pp.x, x, .025) - pp.x;
                    pp.xForce+=fAdd;
                    
                      fAdd = lerp(pp.y, y, .025) - pp.y;
        pp.yForce+=fAdd;
         
         
      }
      }
    }
  }


  void messUpDist() {
    //    for (int i = 0; i<distances.size(); i++) {
    //     if (random(0,1)<.1) {
    //       int newD = int(distances.get(i) + random(0,5));
    //       
    //       int change = distances.get(i) - newD;
    //       
    //       int xC = change/2;
    //       int  yC = change/2;
    //       
    //       point ppp = connections.get(i);
    //       if (ppp.x>x) {
    //        ppp.workX -= xC;
    //       workX+=xC;
    //      ppp.workY -= yC; 
    //      workY+=yC;
    //       } else {
    //        ppp.workX += xC;
    //       workX-=xC;
    //      ppp.workY += yC; 
    //      workY-=yC;
    //         
    //       }
    //       
    //      distances.set(i, newD);
    //      
    //       for (int p = 0; p<connections.size(); p++) {
    //         point pp = connections.get(p);
    //         for (int q = 0; q<pp.connections.size(); q++) {
    //          point subp = pp.connections.get(q); 
    //           if (subp.id == id) {
    //              pp.distances.set(q, newD); 
    //           }
    //         }
    //        
    //        
    //      }
    //      
    //      
    //     } 
    //      
    //    }


    for (int i = 0; i<points.size (); i++) {
      if (points.get(i).id!=id) {
        if (random(0, 1)<.04) {
          point pp = points.get(i);
          connections.add( pp );
          int newDist = int(dist(x, y, pp.x, pp.y) * random(.7,1.3) );
          distances.add( newDist );
          positions.add(-1);

          for (int q = 0; q<pp.connections.size (); q++) {
            point subp = pp.connections.get(q); 
            if (subp.id == id) {
              subp.connections.add( this );
              subp.distances.add( newDist );
              subp.positions.add(-1);
            }
          }
        }
      }
    }
  }

  void push() {


    for (int i = 0; i<connections.size (); i++) {
      point pp = connections.get(i);
      //pp.xForce = 0;
      //pp.yForce = 0;

      if (int(dist(pp.x, pp.y, x, y))<distances.get(i) * .9) {
                 if (positions.get(i)>=0) {
        //pp.x = lerp(x, pp.x, 1.002);
        float fAdd = lerp(x, pp.x, 1.0005) - pp.x;
        pp.xForce+=fAdd;
        //pp.y = lerp(y, pp.y, 1.002);
        fAdd = lerp(y, pp.y, 1.0005) - pp.y;
        pp.yForce+=fAdd;
                 } else {
                   
                     float fAdd = lerp(x, pp.x, 1.025) - pp.x;
                    pp.xForce+=fAdd;
                    
                      fAdd = lerp(y, pp.y, 1.025) - pp.y;
        pp.yForce+=fAdd;
//          pp.x = lerp(x, pp.x, 1.05);
//          pp.y = lerp(y, pp.y, 1.05);
                 }
      }

      // pp.x+=pp.xForce;
      //pp.y+=pp.yForce;
    }
  }
}



class block {

  point[] poi = new point[4];
  float w, h;
  color col;
  float centerX, centerY;
    float lat1, lat2, lon1, lon2, x1, x2, y1, y2;
  block(point p1, point p2, point p3, point p4) {
    poi[0] = p1; 
    poi[1] = p2;
    poi[2] = p3;
    poi[3] = p4;
    
    lat1=poi[0].lat;
    lat2 = poi[3].lat;
    lon1=poi[0].lon;
    lon2=poi[1].lon;
    
     println(lat1 + " " + lat2 + " " + lon1 + " " + lon2 + "  asdfasdfasdfasdfasdfasdfasdf");


    centerX = p1.x + ((p2.x-p1.x)/2);
    centerY = p1.y + ((p2.y-p1.y)/2);

    col = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
  }



        PVector getPosition(float lat, float lon) {
          
            float x = map(lon, lon1, lon2, poi[0].x, poi[1].x);
            float y = map(lat, lat1, lat2, poi[0].y, poi[3].y);
            
            float x2 = map(lon,  lon1,  lon2, poi[3].x, poi[2].x);
            float y2 = map(lat,  lat1,  lat2, poi[1].y, poi[2].y);
            
            x= (x+x2)/2;
            y= (y+y2)/2;
            
            PVector pos = new PVector();
            pos.x = x;
            pos.y = y;
          
            return pos;
          
        }
    


  void display() {
    beginShape();
    // fill(col);
    texture(img);
    //tint(255,50);
    noStroke();
    for (int i = 0; i<poi.length; i++) {
      vertex(poi[i].x, poi[i].y, poi[i].imgX, poi[i].imgY);
      ////println(points[i].imgX + " " + points[i].imgY);
    } 
    // line(points[3].x, points[3].y, points[0].x, points[0].y);

    endShape();
  }
}





float timeToDist(float t) {
  
  return t/2 * (blockWidth);
  
}


point getBlock(float lat, float lon) {
 //  println(lat + " " + lon);
   float yy = map(lat, n, s, 0, blockHeight * numOfBlocks); 
    float xx = map(lon, w,e , 0, width);
  //  println(xx + " " + yy);
    
 
    
////     println(lat + " " + lon);
//    y = round(y/height * numOfBlocks);
//    x = round(x/width * numOfBlocks);
//  println(x + " fdsf  " + y);
//  int id = int(x + (y*numOfBlocks));
//  println(id);

    point pp = points.get(5);
    float dd = 350;

  for (int i = 0; i<points.size(); i++) {
    point ppp = points.get(i);
    
    if (dist(ppp.lon, ppp.lat, lon, lat)<dd) {
     dd = dist(ppp.lon, ppp.lat, lon, lat);
     println(dd);
    pp = ppp; 
      
    }
    
   //  println( i + " sdfsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgdsfgdsfg");   
  }
 

    println(pp.y + "  returning block shit");

  return pp;
  
}



void reduceDistance(point p,  float amount) {
  
   for (int i = 0; i<p.connections.size(); i++) {
      p.distances.get(i);
      if (p.positions.get(i)>=0) {
        p.distances.set(i, int(p.distances.get(i) * amount ));
        point pp = p.connections.get(i);
        for (int q = 0; q<pp.connections.size();q++) {
         
          if (pp.connections.get(q).id == p.id) {
             pp.distances.set(q, int(p.distances.get(i) * amount ));
          }
          
          
        }
        
        
      }
    
    
   } 
  
}



 int addSite(String name) {
     
     manager.sites.add(new Site(name) );
     return manager.sites.size()-1;
    }
    
    
    
    void addSomeData(float lat,float lon,float time,String country,String city,String state,String zip,String ip, int i) {
    
    manager.sites.get(i).addData(lat, lon, time, country, city, state, zip, ip);
    console.log(manager.sites.get(i));
    }
    
    
    void removeSite(String site) {
  
 manager.removeIt(site); 
  
}

  
    void letsHide(String site) {
  
 manager.hideIt(site); 
  
}



    SiteManager getSites(String site) {
    
      return manager;
    
    
    
    }




class GumConnection {

  /** The radius of the circles. */
  float radiusSP;
  float radiusEP;
  float radius;

  /**
   * The maximum distance between two circles. Used to normalize the vertical distance of the anchor points to the
   * direct line between both centers.
   */
  float maxDistance = 500;

  /** The color of the connection. */
  int col;

  /** Start point. The center of the start circle. */
  PVector sp;

  /** End point. The center of the end circle. */
  PVector ep;

  /** 1st upper anchor point. */
  PVector apTop1 = new PVector();
  /** 2nd upper anchor point. */
  PVector apTop2 = new PVector();
  /** 1st lower anchor point. */
  PVector apBot1 = new PVector();
  /** 2nd lower anchor point. */
  PVector apBot2 = new PVector();

  /** Perpendicular point at the end circle upper outline. */
  PVector epTop = new PVector();
  /** Perpendicular point at the start circle upper outline. */
  PVector spTop = new PVector();
  /** Perpendicular point at the end circle lower outline. */
  PVector epBot = new PVector();
  /** Perpendicular point at the start circle lower outline. */
  PVector spBot = new PVector();

  boolean autoUpdate = true;

  PVector apTop11;

  PVector apTop12;

  PVector apTopCenter;

  PVector apTop21;

  PVector apTop22;

  PVector apBot11;

  PVector apBot12;

  PVector apBotCenter;

  PVector apBot21;

  PVector apBot22;


  // Fractions to set anchor points (in parts of start to end points distance)
  float fract1 = 1 / 7f;
  float fract2 = 2 / 7f;
  float center = 1 / 2f;
  float fract3 = 1 - 2 / 7f;
  float fract4 = 1 - 1 / 7f;

  GumConnection(PVector sp, PVector ep, float radiusSP, float radiusEP) {
    update(sp, ep, radiusSP, radiusEP);

    // Set default color to half-transparent black
    this.col = color(0, 50);
  }

  GumConnection(PVector sp, PVector ep) {
    this(sp, ep, 10, 10);
  }

  void update(PVector sp, PVector ep, float radiusSP, float radiusEP) {
    this.sp = sp;
    this.ep = ep;
    this.radiusSP = radiusSP;
    this.radiusEP = radiusEP;
    updateRadius();
  }

  void setRadiusSP(float radiusSP) {
    this.radiusSP = radiusSP;
    updateRadius();
  }

  void addRadiusSP(float radiusSPDiff) {
    this.radiusSP += radiusSPDiff;
    updateRadius();
  }

  void setRadiusEP(float radiusEP) {
    this.radiusEP = radiusEP;
    updateRadius();
  }

  void addRadiusEP(float radiusEPDiff) {
    this.radiusEP += radiusEPDiff;
    updateRadius();
  }

  void updateRadius() {
    this.radius = (radiusSP + radiusEP) / 2;
  }

  void draw() {
    if (autoUpdate) {
      updateAnchorPoints();
    }

    noStroke();
    fill(col);
    beginShape();

    // Start point top
    vertex(spTop.x, spTop.y);
    // Top Bezier curves from start to end
    bezierVertex(apTop11.x, apTop11.y, apTop12.x, apTop12.y, apTopCenter.x, apTopCenter.y);
    bezierVertex(apTop21.x, apTop21.y, apTop22.x, apTop22.y, epTop.x, epTop.y);
    // End circle (from end top to end bottom)
    drawCircleVertices(ep, sp, radiusEP);

    // End point bottom
    vertex(epBot.x, epBot.y);
    // Bottom Bezier curves from end to start
    bezierVertex(apBot22.x, apBot22.y, apBot21.x, apBot21.y, apBotCenter.x, apBotCenter.y);
    bezierVertex(apBot12.x, apBot12.y, apBot11.x, apBot11.y, spBot.x, spBot.y);
    // Start circle (from start bottom to start top)
    drawCircleVertices(sp, ep, radiusSP);

    endShape();
  }

  void drawCircleVertices(PVector center, PVector center2, float radius) {
    float angle = getAngleBetween(center2, center);
    int circleVertexNr = 36;
    for (int i = 0; i < circleVertexNr; i++) {
      float theta = -angle + (PI / circleVertexNr * i);
      float x = sin(theta) * radius;
      float y = cos(theta) * radius;
      vertex(center.x + x, center.y + y);
    }
  }

  void drawDebug() {
    // Show upper and lower perpendicular points
    fill(0, 255, 0, 100);
    ellipse(epTop.x, epTop.y, 10, 10);
    ellipse(spTop.x, spTop.y, 10, 10);
    fill(0, 255, 255, 100);
    ellipse(epBot.x, epBot.y, 10, 10);
    ellipse(spBot.x, spBot.y, 10, 10);

    // Show anchor points
    fill(255, 0, 0, 40);
    ellipse(apTop11.x, apTop11.y, 5, 5);
    ellipse(apTop12.x, apTop12.y, 5, 5);
    fill(255, 0, 0, 100);
    ellipse(apTopCenter.x, apTopCenter.y, 5, 5);
    fill(255, 0, 0, 40);
    ellipse(apTop21.x, apTop21.y, 5, 5);
    ellipse(apTop22.x, apTop22.y, 5, 5);

    noFill();
  }

  void updateFractions() {
    float r = radiusSP + radiusEP;
    center = radiusSP / r;

    fract1 = center / 6 * 2;
    fract2 = center / 6 * 3;

    // center2 only needed for fract calculations
    float c2 = radiusEP / r;
    fract3 = 1 - c2 / 6 * 3;
    fract4 = 1 - c2 / 6 * 2;
  }

  void updateAnchorPoints() {
    PVector pv = getPerpendicular(sp, ep);
    updatePerpendicularPoints(pv);

    updateFractions();

    // Top
    // Calculate anchor points. Vertical distance depends on the horizontal distance.
    float ydistTop = map(PVector.dist(spTop, epTop), 0, maxDistance, radius, 0);
    // Limit vertical distance so even for distances > maxDistance no overlapping appears.
    ydistTop = max(ydistTop, radius * 0.1f);
    apTop11 = calcAnchorPoint(pv, radiusSP, fract1);
    apTop12 = calcAnchorPoint(pv, ydistTop, fract2);
    apTopCenter = calcAnchorPoint(pv, ydistTop, center);
    apTop21 = calcAnchorPoint(pv, ydistTop, fract3);
    apTop22 = calcAnchorPoint(pv, radiusEP, fract4);

    // Bottom
    float ydistBot = map(PVector.dist(spBot, epBot), 0, maxDistance, -radius, 0);
    ydistBot = min(ydistBot, -radius * 0.1f);
    apBot11 = calcAnchorPoint(pv, -radiusSP, fract1);
    apBot12 = calcAnchorPoint(pv, ydistBot, fract2);
    apBotCenter = calcAnchorPoint(pv, ydistBot, center);
    apBot21 = calcAnchorPoint(pv, ydistBot, fract3);
    apBot22 = calcAnchorPoint(pv, -radiusEP, fract4);
  }

  PVector calcAnchorPoint(PVector pv, float ydist, float fract) {
    PVector ap = new PVector();
    ap.x = lerp(sp.x + pv.x * ydist, ep.x + pv.x * ydist, fract);
    ap.y = lerp(sp.y + pv.y * ydist, ep.y + pv.y * ydist, fract);
    return ap;
  }

  // Calculate perpendicular points of both circles
  void updatePerpendicularPoints(PVector pv) {
    epTop.x = ep.x + pv.x * radiusEP;
    epTop.y = ep.y + pv.y * radiusEP;
    spTop.x = sp.x + pv.x * radiusSP;
    spTop.y = sp.y + pv.y * radiusSP;

    epBot.x = ep.x - pv.x * radiusEP;
    epBot.y = ep.y - pv.y * radiusEP;
    spBot.x = sp.x - pv.x * radiusSP;
    spBot.y = sp.y - pv.y * radiusSP;
  }

  /**
   * Returns the perpendicular vector to the line between the two given vectors.
   * 
   * @param sp
   *            Start point.
   * @param ep
   *            End point.
   * @return The perpendicular vector.
   */
  PVector getPerpendicular(PVector sp, PVector ep) {
    float angle = getAngleBetween(sp, ep);
    float theta = HALF_PI + angle;
    float x = cos(theta);
    float y = sin(theta);
    return new PVector(x, y);
  }

  void setEndPoint(int x, int y) {
    ep.x = x;
    ep.y = y;
  }

  /**
   * Calculates angle between two points, i.e. between the sum vector and the x-axis.
   * 
   * @param p1
   *            The first point.
   * @param p2
   *            The second point.
   * @return The angle between both points.
   */
  float getAngleBetween(PVector p1, PVector p2) {
    // Note: Raw values between point 1 and point 2 not valid, as they are are origin-based.
    PVector sub = PVector.sub(p2, p1);
    PVector xaxis = new PVector(1, 0);
    float angle = PVector.angleBetween(xaxis, sub);

    if (p2.y < p1.y) {
      angle = TWO_PI - angle;
    }
    return angle;
  }
}


