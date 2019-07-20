class Hero {
  float xPos;
  float yPos;
  int speed = 8;
  int numHeart=3;
  int floor = 480;
  boolean moveLeft, moveRight, moveUp, moveDown = false;
 
  Hero(float x_in, float y_in) {
    xPos = x_in;
    yPos = y_in;
  }
  
  void display() {
    fill(255);
    noStroke();
    image(heroStand, xPos, yPos);
    
    //Player's Static
    image(heart, 20, 13);
    text("x "+numHeart, 100, 50);
  }
  
  void move() {
    if (stageNum==1) {
      floor = stage01BlockStandCheck();
    }
    else if(stageNum==2) {
      floor = stage02BlockStandCheck();
    }
    if(moveLeft) xPos -= speed;
    if(moveRight) xPos += speed;
    if(moveUp) {
      if(yPos < 20) {
        yPos = 20;
      }
      yPos -= speed*3;
    }
    else if(moveDown) yPos += speed*3;
    if (yPos > floor) {
      yPos = floor;
      moveDown = false;
    }
  }
  
  //Stage1
  int stage01BlockStandCheck ()
  {
    floor = 480;
    if (xPos>=400 && xPos<=670 && yPos<=360 && yPos>230){
      floor = 350;
      //println("position 1");
    }
    if (xPos>=500 && xPos<=671 && yPos<=230){
      floor = 230;
      //println("position 2");
    }
      
    if (xPos>=720 && xPos<=830 && yPos<=150){
      floor = 140;
      //println("position 4");
    }
     
    if (xPos>=840 && xPos<=990 && yPos<=300 && yPos>40){
      floor = 290;
      //println("position 5");
    }
    if (xPos>=910 && xPos<=990 && yPos<=40){
      floor = 40;
      //println("position 6");
    }
    if (xPos>=1100 && xPos<=1180 && yPos<=190){
      floor = 190;
      //println("position 7");
    }
    if(floor==480){
      moveDown = true;
    }
    return floor;
  }
  
  //Stage2
  int stage02BlockStandCheck ()
  {
    floor = 480;
    if (xPos>=130 && xPos<=300 && yPos<=425 && yPos>375){
      floor = 425;
      //println("position 1");
    }
    if (xPos>=270 && xPos<=400 && yPos<=375 && yPos>325){
      floor = 375;
      //println("position 2");
    }
    if (xPos>=370 && xPos<=500 && yPos<=325){
      floor = 325;
      //println("position 3");
    }
    
    if (xPos>=580 && xPos<=710 && yPos<=425 && yPos>375){
      floor = 425;
      //println("position 4");
    }
    if (xPos>=690 && xPos<=770 && yPos<=375 && yPos>325){
      floor = 375;
      //println("position 5");
    }
    if (xPos>=740 && xPos<=820 && yPos<=325 && yPos>275){
      floor = 325;
      //println("position 6");
    }
    if (xPos>=790 && xPos<=970 && yPos<=275){
      floor = 275;
      //println("position 7");
    }
    if (xPos>=880 && xPos<=970 && yPos<=425 && yPos>275){
      floor = 425;
      //println("position 8");
    }
    if (xPos>=990 && xPos<=1080 && yPos<=150){
      floor = 150;
      //println("position 9");
    }
    if (xPos>=1220 && xPos<=1300 && yPos<=425 && yPos>375){
      floor = 425;
      //println("position 10");
    }
    if (xPos>=1270 && xPos<=1350 && yPos<=375){
      floor = 375;
      //println("position 11");
    }
    
    
    
    if(floor==480){
      moveDown = true;
    }
    return floor;
  }
}