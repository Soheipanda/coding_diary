void setup(){
  size(600,400);
  
}

void draw() {
  background(255);
  cantor(width/2,height-10,80,80);
  noLoop();
}

void cantor(float x, float y, float lenx, float leny) {
  lenx *= 0.79;
  leny *= 0.79;
  float dx = lenx*random(-1,1);
  float dy = leny*random(-1,1);
  if(lenx>=10){
    line(x,y,x+dx,y+dy);
    line(x+dx,y+dy,x+lenx+dx,y-leny+dy);
    line(x+dx,y+dy,x-lenx+dx,y-leny+dy);
    
    
    cantor(x+lenx+dx,y-leny+dy,lenx, leny);
    cantor(x-lenx+dx,y-leny+dy,lenx, leny);
  }
  
}
