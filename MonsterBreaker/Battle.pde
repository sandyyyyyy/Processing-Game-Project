class Battle
{
  int monID;
  int monHP;
  int playerHP;
  //brick.add(new MonsterBrick(852,290,this.monHP,this.monID));
  Battle(int monID, int monHP, int playerHP) {
    this.monID = monID;
    this.monHP = monHP;
    this.playerHP = playerHP;
    brick.add(new MonsterBrick(this.monHP,this.monID));
    for (int i = balls.size()-1; i >= 0; i--) {
      balls.remove(i);
    }
    addBalls();
  }
  
  void display() {
    //text("xPos:"+mouseX, 100, 150);
    //text("yPos:"+mouseY, 100, 200);
    fill(255,255,0);
    text("HP: " + playerHP, 300,550);
    shoot = false;
    //println("brick size:" + brick.size());
    if(!gameFinished && !gameStart)
    {
      text("Let's Fight!", 910,height/2);
      text("(click mouse to Shoot)", 910,height/2+80);
    }
    if(gameFinished && brick.size()==0)
    {
      text("You Win!", 910, height/2);
      text("(click mouse to continue)", 910, height/2+80);
    }
    else if (gameFinished && brick.size()>0){
      text("Game Over",910,height/2);
      text("Re-run the game to Play Again",910,height/2+80);
    }
    
    if (gameStart && !gameFinished)
    {
        //println("Shoot");
        for (int i = balls.size()-1; i >= 0; i--) { 
          // An ArrayList doesn't know what it is storing so we have to cast the object coming out
          Ball ball = balls.get(i);
          ball.move();
          ball.display();
          for (int j = 0;j < brick.size(); j++)
          {
            MonsterBrick monBrick = (MonsterBrick) brick.get(j);
            monBrick.display();
            fill(255,255,0);
            text("Monster HP:" + monBrick.hp, 300,50);
            //println("hitPosX2 = "+ monBrick.hitPosX);
            //println("hitPos+sizeX = "+ (monBrick.hitPosX+monBrick.sizeX));
            if (monBrick.intersect(ball))
            {
              monBrick.hp -= 1;
              if(ball.y<=(monBrick.posY+10) || ball.y>=(monBrick.posY+monBrick.sizeY-10)){
                ball.yspeed *= -1;
              }
              println("ball X = " + ball.x);
              if(ball.x<=(monBrick.leftHitPosX+10) || ball.x>=(monBrick.rightHitPosX-10)){
                println("Left hitPosX2 = " + monBrick.leftHitPosX);
                println("Right hitPosX2 = " + (monBrick.rightHitPosX-10));
                ball.xspeed *= -1;
              }
              
              if (monBrick.hp == 0)
              {
                brick.remove(monBrick);
              }
            }
          }
          if (ball.finished()) {
            // Items can be deleted with remove()
            println("Count = "+ count);
            balls.remove(i);
          }
          
          if(brick.size()==0){
            /////////////////////////////////////////////
            println("Monster Dead, End");
            gameFinished = true;
          }
          if(balls.size()==0 && brick.size()!=0){
            playerHP -= 1;
            if(playerHP==0){
              /////////////////////////////////////////
              println("Player Dead, End");
              gameFinished = true;
            }
            addBalls();
            println("Monster Not Dead, Continue...");
          }
        }
      
    }
  }
}