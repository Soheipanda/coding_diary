PVector location;
PVector velocity;

void setup() {
  size(600, 600);
  location = new PVector(100,100);
  velocity = new PVector(6,2);
}

void draw() {
  if(frameCount%10 == 0){
    background(0);
  }
  location.add(velocity);

  if(0>location.y||height<location.y){
    velocity.y *= -1;
  }
  if(0>location.x||height<location.x){
    velocity.x *= -1;
  }
  ellipse(location.x, location.y, 100,100);
}
