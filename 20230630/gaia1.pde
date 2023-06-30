class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector fish1_target;
  PVector fish2_target;
  PVector fish3_target;
  PVector fish4_target;
  PVector fish5_target;
  PVector distance;
  boolean mousetracking;
  float radious;
  int species;
  PVector dir;
  
  
  Mover(boolean mousetracking, float radious) {
    this.radious = radious;
    this.mousetracking = mousetracking;
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void fish1_update() {
    fish1_target = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(fish1_target, location);
    dir.normalize();
    dir.mult(random(0,0.1));
    velocity.limit(10);
    location.add(velocity);
    velocity.add(dir);
  }
  
  void fish2_update(PVector[] fish1_loc) {
    float min_distance = 10000;
    for(int i=0; i<fish1_loc.length; i++){
      float distance = PVector.sub(location, fish1_loc[i]).mag();
      if(min_distance>distance){
        min_distance=distance;
        fish2_target = fish1_loc[i];
      }
    }
    line(fish2_target.x,fish2_target.y,location.x,location.y);
    dir = PVector.sub(fish2_target, location);
    float magnitude = dir.mag();
    dir.normalize();
    dir.mult(random(0,0.1));
    velocity.limit(10);
    location.add(velocity);
    velocity.add(dir);
  }
  
  void fish3_update(PVector[] fish2_loc) {
    float min_distance = 10000;
    for(int i=0; i<fish2_loc.length; i++){
      float distance = PVector.sub(location, fish2_loc[i]).mag();
      if(min_distance>distance){
        min_distance=distance;
        fish3_target = fish2_loc[i];
      }
    }
    line(fish3_target.x,fish3_target.y,location.x,location.y);
    dir = PVector.sub(fish3_target, location);
    float magnitude = dir.mag();
    dir.normalize();
    dir.mult(random(0,0.1));
    velocity.limit(10);
    location.add(velocity);
    velocity.add(dir);
  }
  void fish4_update(PVector[] fish3_loc) {
    float min_distance = 10000;
    for(int i=0; i<fish3_loc.length; i++){
      float distance = PVector.sub(location, fish3_loc[i]).mag();
      if(min_distance>distance){
        min_distance=distance;
        fish4_target = fish3_loc[i];
      }
    }
    line(fish4_target.x,fish4_target.y,location.x,location.y);
    dir = PVector.sub(fish4_target, location);
    float magnitude = dir.mag();
    dir.normalize();
    dir.mult(random(0,0.1));
    velocity.limit(10);
    location.add(velocity);
    velocity.add(dir);
  }
  void fish5_update(PVector[] fish4_loc) {
    float min_distance = 10000;
    for(int i=0; i<fish4_loc.length; i++){
      float distance = PVector.sub(location, fish4_loc[i]).mag();
      if(min_distance>distance){
        min_distance=distance;
        fish5_target = fish4_loc[i];
      }
    }
    line(fish5_target.x,fish5_target.y,location.x,location.y);
    dir = PVector.sub(fish5_target, location);
    float magnitude = dir.mag();
    dir.normalize();
    dir.mult(random(0,0.1));
    velocity.limit(10);
    location.add(velocity);
    velocity.add(dir);
  }
  
  
  void display(int species) {
    stroke(0);
    if(species == 1){
      fill(0,0,0);
    }
    if(species == 2){
      fill(255,0,0);
    }
    if(species == 3){
      fill(0,0,255);
    }
    if(species == 4){
      fill(0,255,0);
    }
    if(species == 5){
      fill(255,0,255);
    }
    ellipse(location.x, location.y, radious, radious);
  }
  
  void checkEdges() {
    if(location.x<0){
      location.x = 0;
    }
    if(location.x>width){
      location.x = width;
    }
    if(location.y<0){
      location.y = 0;
    }
    if(location.y>height){
      location.y = height;
    }
  }
}

Mover[] fish1 = new Mover[100];
Mover[] fish2 = new Mover[80];
Mover[] fish3 = new Mover[50];
Mover[] fish4 = new Mover[25];
Mover[] fish5 = new Mover[10];
PVector[] fish1_loc = new PVector[fish1.length];
PVector[] fish2_loc = new PVector[fish2.length];
PVector[] fish3_loc = new PVector[fish3.length];
PVector[] fish4_loc = new PVector[fish4.length];
boolean mousetracking;
float radious;
int species;

void setup(){
  size(1000,600);
  for (int i = 0; i < fish1.length; i++) {
    radious = random(10,20);
    fish1[i] = new Mover(true, radious);
  }
  for (int i = 0; i < fish2.length; i++) {
    radious = random(10,100);
    fish2[i] = new Mover(false, radious);
  }
  for (int i = 0; i < fish3.length; i++) {
    radious = random(20,50);
    fish3[i] = new Mover(false, radious);
  }
  for (int i = 0; i < fish4.length; i++) {
    radious = random(30,40);
    fish4[i] = new Mover(false, radious);
  }
  for (int i = 0; i < fish5.length; i++) {
    radious = random(10,20);
    fish5[i] = new Mover(false, radious);
  }
}

void draw(){
  background(255);
  
  for (int i = 0; i < fish1.length; i++) {
    species = 1;
    fish1[i].fish1_update();
    fish1[i].display(species);
    fish1_loc[i] = fish1[i].location;
    fish1[i].checkEdges();
    
  }
  for (int i = 0; i < fish2.length; i++) {
    species = 2;
    fish2[i].fish2_update(fish1_loc);
    fish2[i].display(species);
    fish2_loc[i] = fish2[i].location;
    fish2[i].checkEdges();
  }
  for (int i = 0; i < fish3.length; i++) {
    species = 3;
    fish3[i].fish3_update(fish2_loc);
    fish3[i].display(species);
    fish3_loc[i] = fish3[i].location;
    fish3[i].checkEdges();
  }
  for (int i = 0; i < fish4.length; i++) {
    species = 4;
    fish4[i].fish4_update(fish3_loc);
    fish4[i].display(species);
    fish4_loc[i] = fish4[i].location;
    fish4[i].checkEdges();
  }
  for (int i = 0; i < fish5.length; i++) {
    species = 5;
    fish5[i].fish5_update(fish4_loc);
    fish5[i].display(species);
    fish5[i].checkEdges();
  }
}
