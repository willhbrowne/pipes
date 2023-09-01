int howmany = 100;

class Pipe {
  //HAVE
  int x;
  int y;
  int z;
  int directionX;
  int directionY;
  int directionZ;
  int onedirection;
  int timer = 0;
  color c;
  int r;
  int time = floor(random(20, 60));
  
  Pipe() {
    x = floor(random(width));
    y = floor(random(height));
    z = floor(random(100, 100));
    c = color(random(255), random (255), random(255));
  }
 
  //DISPLAY
  void display(){
    fill(c);
    stroke(c);
    pushMatrix();
    translate(x, y, z);
    box(20);
    popMatrix();
  }
  
  //UPDATE
  void update(){
    x = x + directionX;
    y = y + directionY;
    z = z + directionZ;
    
    if (timer == time){
      
    //IF TIME TO SWITCH, CHOOSE RANDOM #1-3 (X, Y, OR Z)
    onedirection = floor(random(1, 4));
    
    //if # = 1 CHANGE X, ONLY IF X IS 0
    if (onedirection == 1){
      if (directionX == 0){
      r = floor(random(0, 2));
      if (r < 1){
      directionX = 2;
      } else{
       directionX = -2;
      }
      directionY = 0;
      directionZ = 0;
    } 
    //IF X DOES NOT EQUAL 0, CHOOSE NEW NUMBER (2 OR 3)
    else{
      onedirection = floor(random(2, 4));
    }
    }
    
    // SAME FOR Y AND Z DIRECTIONS
     if (onedirection == 2){
        if (directionY == 0){
      r = floor(random(0, 2));
      if (r < 1){
      directionY = 2;
      } else{
       directionY = -2;
      }
      directionX = 0;
      directionZ = 0;
    } 
    //IF Y DOES NOT EQUAL 0, CHOOSE NEW NUMBER (1 OR 3)
    else{
      onedirection = floor(random(1, 4));
    }
    }
    
    if (onedirection == 3){
       if (directionZ == 0){
      r = floor(random(0, 2));
      if (r < 1){
      directionZ = 2;
      } else{
       directionZ = -2;
      }
      directionX = 0;
      directionY = 0;
    } 
    //IF Z DOES NOT EQUAL 0, CHOOSE NEW NUMBER (1 OR 2)
    else{
      onedirection = floor(random(1, 3));
    }
    }
    //FINALLY, RESET TIMER TO 0 AND SET NEW TIME TO CHANGE
    timer = 0;
    time = floor(random(20, 60));
    
    } 
    
    //IF TIME DOES NOT EQUAL TIMER, ADD ONE TO TIMER
    else{
    timer++;
    }
  }
}
 
 //NEW VARIABLE FOR ALL PIPES (ARRAY/LIST)
 Pipe[] pipes;

void setup() {
  size(500, 500, P3D);
  background(0);
  camera(width/1, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  //VARIABLE(PIPES) = NEW PIPES (HOWEVER MANY)
  pipes = new Pipe[howmany];
  //GIVE EACH PIPE ITS OWN VALUES BY RUNNING THE FUNCTION
  for (int i = 0; i < howmany; i++){
    pipes[i] = new Pipe();
  }
}

  void draw() {
    directionalLight(255, 0, 0, 0, -1, 0);
   //AT EACH FRAME, DISPLAY AND UPDATE EACH PIPE
   for (int i = 0; i < howmany; i++){
   pipes[i].display();
   pipes[i].update();
    }
  }
