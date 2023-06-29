PVector location;
PVector velocity;
float locations[][] = new float[8][3];
int count = 0;
float x1 = -100;
float x2 = 100;
float y1 = -100;
float y2 = 100;
float z1 = -100;
float z2 = 100;

void setup() {
  size(600, 600, P3D);
  location = new PVector(0, 0, 0);
  velocity = new PVector(2, 3, -4);
  
  for(int i=0; i<2; i++){
    for(int j=0; j<2; j++){
      for(int k=0; k<2; k++){
        if(i==0){
          locations[count][0] = x1-50;
        }else{
          locations[count][0] = x2+50;
        }
        if(j==0){
          locations[count][1] = y1-50;
        }else{
          locations[count][1] = y2+50;
        }
        if(k==0){
          locations[count][2] = z1-50;
        }else{
          locations[count][2] = z2+50;
        }
        println(locations[count]);
        println("-------------");
        count++;
      }
    }
  }
}

void draw() {
  background(255);
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(frameCount*0.01);
  translate(location.x, location.y, location.z);
  location.add(velocity);
  if(x1>location.x||x2<location.x){
    velocity.x *= -1;
  }
  if(y1>location.y||y2<location.y){
    velocity.y *= -1;
  }
  if(z1>location.z||z2<location.z){
    velocity.z *= -1;
  }
  sphere(10);
  popMatrix();
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(frameCount*0.01);
  for(int i=0; i<8; i++){
    for(int j=0; j<8; j++){
      line(locations[i][0],locations[i][1],locations[i][2],locations[j][0],locations[j][1],locations[j][2]);
    }
  }
  popMatrix();
  
}
