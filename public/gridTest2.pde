/* @pjs preload="blank.png"; */

float blockWidth, blockHeight;

ArrayList<point> points;
ArrayList<block> blocks;
ArrayList<data> theData;

PImage img;

int coloringCount = 0;

float w = -170.1536;
float s = -52.7787;
float e = 176.4844;
float n = 73.6278;

int numOfBlocks = 10;

//int ww = window.innerWidth;
//int hh = window.innerHeight;

void setup() {
 
 size( 2048, 1024,P3D ); 
 //size( 500,500,P3D ); 
  background(0,0,0);
  frameRate(10);
  img = loadImage("blank.png");
 // println(img.width);
  //size(window.innerWidth,window.innerHeight);
  blockWidth = width/numOfBlocks;
  blockHeight = height/numOfBlocks;
  points = new ArrayList<point>();
  blocks = new ArrayList<block>();
  theData = new ArrayList<data>();
  
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
  
 int blockCount = points.size();
 int xCount  = 0;
 int yCount = 0;
 int counter = 0;
 for (int i = 0; i< points.size(); i++) {
   
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
    if (newX<=numOfBlocks) {
     newid = i - (numOfBlocks); 
    points.get(i).connections.add( points.get(newid) );
     points.get(i).distances.add(int(dist(points.get(newid).x,points.get(newid).y,points.get(i).x, points.get(i).y)));
     points.get(i).positions.add(2);
    }
   
       } 
   //println(ps);
    newY = yCount + 1;
   if (newY<=numOfBlocks) {
    newX = xCount -  1;
    if (newX>=0) {
    newid = i + (numOfBlocks);
    points.get(i).connections.add( points.get(newid) );
   points.get(i).distances.add(int(dist(points.get(newid).x,points.get(newid).y,points.get(i).x, points.get(i).y)));
   points.get(i).positions.add(5);
    }
    
    newX = xCount;
    newid =  i + (numOfBlocks+1); 
    points.get(i).connections.add( points.get(newid) );
   points.get(i).distances.add(int(dist(points.get(newid).x,points.get(newid).y,points.get(i).x, points.get(i).y)));
   points.get(i).positions.add(6);
 
    newX = xCount+1;
    if (newX<=numOfBlocks) {
    newid = i + (numOfBlocks+2); 
   points.get(i).connections.add( points.get(newid) );
   points.get(i).distances.add(int(dist(points.get(newid).x,points.get(newid).y,points.get(i).x, points.get(i).y)));
   points.get(i).positions.add(7);
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
  
  
  
  
  
  
  
  
  /*
  
  JSONObject file = loadJSONObject("output.json");
 //for (int f = 0; f< file.size(); f++) {
  JSONObject folders = file.getJSONObject("3");
 
  JSONObject data = folders.getJSONObject("data");
  
  for (int d = 0; d<data.size();d++) {
  JSONObject sites = data.getJSONObject(str(d));
  
  //println(sites.size());
  ArrayList<Float> la = new ArrayList<Float>();
    ArrayList<Float> lo = new ArrayList<Float>();
      ArrayList<String> t = new ArrayList<String>();
  for (int i = 2; i<sites.size(); i++) {
    JSONObject site = sites.getJSONObject(str(i));
   // println(i);
    //println(site);
    if (site.hasKey("long") && site.hasKey("time") && site.hasKey("ip")) {
      //println(site.getString("long"));
    String name = site.getString("name");
    //String address = site.getString("city") + " " + site.getString("state") + " " + site.getString("country");
    String address = "AsdasD";
    float lat = site.getFloat("lat");
    float lon = site.getFloat("long");
    String time = site.getString("time");
    la.add(lat);
    lo.add(lon);
    t.add(time);
    //JSONArray ips = site.getJSONArray("ip");
    //String ip = ips.getString(0);
    String ip = "asf";
    //points.add(new vert(lat, lon, i, address, ip, name));
    
    }
    
  }
  
  theData.add(new data(la, lo, t));
  
  
  }
  
  
  
  
  
  
  
     folders = file.getJSONObject("37");
 
    data = folders.getJSONObject("data");
  
  for (int d = 0; d<data.size();d++) {
  JSONObject sites = data.getJSONObject(str(d));
  
  //println(sites.size());
  ArrayList<Float> la = new ArrayList<Float>();
    ArrayList<Float> lo = new ArrayList<Float>();
      ArrayList<String> t = new ArrayList<String>();
  for (int i = 2; i<sites.size(); i++) {
    JSONObject site = sites.getJSONObject(str(i));
   // println(i);
    //println(site);
    if (site.hasKey("long") && site.hasKey("time") && site.hasKey("ip")) {
      //println(site.getString("long"));
    String name = site.getString("name");
    //String address = site.getString("city") + " " + site.getString("state") + " " + site.getString("country");
    String address = "AsdasD";
    float lat = site.getFloat("lat");
    float lon = site.getFloat("long");
    String time = site.getString("time");
    la.add(lat);
    lo.add(lon);
    t.add(time);
    //JSONArray ips = site.getJSONArray("ip");
    //String ip = ips.getString(0);
    String ip = "asf";
    //points.add(new vert(lat, lon, i, address, ip, name));
    
    }
    
  }
  
  theData.add(new data(la, lo, t));
  
  
  }
  
  
  
    folders = file.getJSONObject("32");
 
    data = folders.getJSONObject("data");
  
  for (int d = 6; d<data.size();d++) {
  JSONObject sites = data.getJSONObject(str(d));
  
  //println(sites.size());
  ArrayList<Float> la = new ArrayList<Float>();
    ArrayList<Float> lo = new ArrayList<Float>();
      ArrayList<String> t = new ArrayList<String>();
  for (int i = 2; i<sites.size(); i++) {
    JSONObject site = sites.getJSONObject(str(i));
   // println(i);
    //println(site);
    if (site.hasKey("long") && site.hasKey("time") && site.hasKey("ip")) {
      //println(site.getString("long"));
    String name = site.getString("name");
    //String address = site.getString("city") + " " + site.getString("state") + " " + site.getString("country");
    String address = "AsdasD";
    float lat = site.getFloat("lat");
    float lon = site.getFloat("long");
    String time = site.getString("time");
    la.add(lat);
    lo.add(lon);
    t.add(time);
    //JSONArray ips = site.getJSONArray("ip");
    //String ip = ips.getString(0);
    String ip = "asf";
    //points.add(new vert(lat, lon, i, address, ip, name));
    
    }
    
  }
  
  theData.add(new data(la, lo, t));
  
  
  }
  
  
  
  
  
  folders = file.getJSONObject("8");
 
    data = folders.getJSONObject("data");
  
  for (int d = 0; d<data.size();d++) {
  JSONObject sites = data.getJSONObject(str(d));
  
  //println(sites.size());
  ArrayList<Float> la = new ArrayList<Float>();
    ArrayList<Float> lo = new ArrayList<Float>();
      ArrayList<String> t = new ArrayList<String>();
  for (int i = 2; i<sites.size(); i++) {
    JSONObject site = sites.getJSONObject(str(i));
   // println(i);
    //println(site);
    if (site.hasKey("long") && site.hasKey("time") && site.hasKey("ip")) {
      //println(site.getString("long"));
    String name = site.getString("name");
    //String address = site.getString("city") + " " + site.getString("state") + " " + site.getString("country");
    String address = "AsdasD";
    float lat = site.getFloat("lat");
    float lon = site.getFloat("long");
    String time = site.getString("time", "100 ms");
    la.add(lat);
    lo.add(lon);
    t.add(time);
    //JSONArray ips = site.getJSONArray("ip");
    //String ip = ips.getString(0);
    String ip = "asf";
    //points.add(new vert(lat, lon, i, address, ip, name));
    
    }
    
  }
  if (la.size()<1) {
  theData.add(new data(la, lo, t));
  }
  
  }
  
  
  
  
  
 // println("ooogaaaabooooooooogggaaaaaaa " + theData.size());
  theData.get(0).distortMap();
//theData.get(1).distortMap();
theData.get(3).distortMap();
  theData.get(4).distortMap();
  theData.get(5).distortMap();
  theData.get(9).distortMap();
  theData.get(18).distortMap();
  theData.get(37).distortMap();
  
  
  theData.get(47).distortMap();
  
  theData.get(72).distortMap();
 // println(coloringCount + "      dsfasdfasdCOLORINGCOUNT");
  */
  
  
  
  for (int i = 0; i<points.size(); i++) {
   //s println(i);
   if (random(0,1)<0.05) {
      point pp = points.get(i);
      for (int p = 0; p<pp.distances.size(); p++) {
       // console.log("asd -- " + pp.distances.get(p));
      //  pp.distances.set(p, pp.distances.get(p)*0.2); 
        // console.log("asd -- " + pp.distances.get(p));
      }
      
   } 
    
  }
  
} 




void draw() {
  background(0,0,0);
  fill(255,255,255);
  

  
  for (int i =0 ; i<points.size(); i++) {
    point pp = points.get(i);
    pp.xForce = 0;
    pp.yForce = 0;
    }
  
  
  for (int i =0 ; i<points.size(); i++) {
   point pp = points.get(i);
  // pp.showConnections();
   //pp.stickToSpot();
   pp.update();
   pp.pull();
   pp.push();
   //pp.stickToSpot();
   fill(pp.col);

   //rect(pp.x,pp.y,5,5);
  
  }
  
   for (int i =0 ; i<points.size(); i++) {
     point pp = points.get(i);
     if (abs(pp.xForce)>1.3) {
    pp.x+=pp.xForce;
    
     }
     
     if (abs(pp.yForce)>1) {
            
   pp.y += pp.yForce; 
     }
    
    //println(pp.xForce); 
   }
  
  
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
  
}


 void keyPressed() {
  for (int i = 0; i< points.size(); i++) {
  // points.get(i).messUpDist(); 
  }
  
  saveFrame(); 
  
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
    stroke(255, 255, 255);
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
      x = lerp(x, workX, .003);
      y = lerp(y, workY, .003);
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

  block(point p1, point p2, point p3, point p4) {
    poi[0] = p1; 
    poi[1] = p2;
    poi[2] = p3;
    poi[3] = p4;

    centerX = p1.x + ((p2.x-p1.x)/2);
    centerY = p1.y + ((p2.y-p1.y)/2);

    col = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
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
  
  return t/100 * (blockWidth);
  
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

