PVector location;
PVector velocity;
float[][] matrix = new float[10][2]; 

void setup() {
  size(600, 600);
  location = new PVector(100,100);
  velocity = new PVector(6,2);
}

void draw() {
  background(0);
  for(int i=0; i<10; i++){
    if(i==9){
      location.add(velocity);

      if(0>location.y||height<location.y){
        velocity.y *= -1;
      }
      if(0>location.x||height<location.x){
        velocity.x *= -1;
      }
      matrix[i][0] = location.x;
      matrix[i][1] = location.y;
    }else{
      matrix[i][0] = matrix[i+1][0];
      matrix[i][1] = matrix[i+1][1];
    }
  }
  for(int j=0; j<10; j++){
    if(matrix[j][0] != 0 && matrix[j][0] != 1){
      ellipse(matrix[j][0], matrix[j][1], 100+j,100+j);
    }
  }
  
  
}
