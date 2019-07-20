class MonsterBrick
{
  float posX = 910;
  float posY = 200;
  color c;
  int hp;
  int deathcount;
  int monID;
  
  float leftHitPosX, rightHitPosX;
  float sizeX, sizeY;
  
  MonsterBrick(int hp, int monID)
  {
    this.hp = hp;
    deathcount = 0;
    this.monID = monID;
  }
  
  void display()
  {
    stroke(0);
    fill(255);
    
    
    switch (monID) {
      case 1:
        //rect(this.posX-(mon01L.width/2), posY, mon01L.width, mon01L.height);
        image(mon01L, this.posX-(mon01L.width/2), posY);
        leftHitPosX = this.posX-(mon01L.width/2);
        rightHitPosX = this.posX+(mon01L.width/2);
        //println("hitPosX = "+ hitPosX);
        sizeX = mon01L.width;
        sizeY = mon01L.height;
        //println("!!!!!!!sizeX = "+ sizeX);
        break;
      case 2:
        //rect(posX-(mon02L.width/2), posY, mon02L.width, mon02L.height);
        image(mon02L, posX-(mon02L.width/2), posY);
        leftHitPosX = this.posX-(mon02L.width/2);
        rightHitPosX = this.posX+(mon02L.width/2);
        sizeX = mon02L.width;
        sizeY = mon02L.height;
        break;
      case 3:
        //rect(posX-(mon03L.width/2), posY, mon03L.width, mon03L.height);
        image(mon03L, posX-(mon03L.width/2), posY);
        leftHitPosX = this.posX-(mon03L.width/2);
        rightHitPosX = this.posX+(mon03L.width/2);
        sizeX = mon03L.width;
        sizeY = mon03L.height;
        break;
      case 4:
        //rect(posX-(mon04L.width/2), posY, mon04L.width, mon04L.height);
        image(mon04L, posX-(mon04L.width/2), posY);
        leftHitPosX = this.posX-(mon04L.width/2);
        rightHitPosX = this.posX+(mon04L.width/2);
        sizeX = mon04L.width;
        sizeY = mon04L.height;
        break;
      case 5:
        //rect(posX-(mon05L.width/2), posY, mon05L.width, mon05L.height);
        image(mon05L, posX-(mon05L.width/2), posY);
        leftHitPosX = this.posX-(mon05L.width/2);
        rightHitPosX = this.posX+(mon05L.width/2);
        sizeX = mon05L.width;
        sizeY = mon05L.height;
        break;
    }
  }
  
  
  void sethp(int dcount)
  {
    hp = dcount;
  }
  
  boolean intersect(Ball b)
  {
    float disX = b.x - leftHitPosX;
    float disY = b.y - this.posY;
    if (disX <= sizeX && disY <= sizeY && disX >= -10 && disY >= -10) {
      return true;
    }
    else
    {
      return false;
    }
  }
 
}
    