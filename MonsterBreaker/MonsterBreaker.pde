import processing.sound.*;
SoundFile file;

PImage main, stage1, stage2,
       heroStand, heroR, heroL,
       heart,
       mon01, mon02, mon03, mon04, mon05,
       mon01L, mon02L, mon03L, mon04L, mon05L,
       battleBG,
       character;
       
PFont font;

int stageNum = 0;
int floor = 480;

int count = 0;
int totalball = 10;

boolean inBattle = false;
boolean gameStart = false;
boolean gameFinished = false;
boolean shoot = false;

Hero hero;
Stage stage;

ArrayList<Heart> ListHeart01;
ArrayList<Heart> ListHeart02;
ArrayList<Monster> ListMon01;
ArrayList<Monster> ListMon02;
ArrayList<Ball> balls;
ArrayList<MonsterBrick> brick;
ArrayList<Battle> battles;

void setup() {
  size(1760, 600);
  font = createFont("ProcessingSansPro-Regular.ttf", 50);
  textFont(font);
  
  file = new SoundFile(this,"happy.mp3");
  file.play();
  
  //Load Images
  main = loadImage("img/cover.png");
  stage1 = loadImage("img/stage1.png");
  stage2 = loadImage("img/stage2.png");
  battleBG = loadImage("img/battleBG.png");
  character = loadImage("img/human-stand.png");
  heroStand = loadImage("img/stand.png"); 
  heroR = loadImage("img/runR.png");
  heroL = loadImage("img/runL.png");
  heart = loadImage("img/heart.png");
  mon01 = loadImage("img/mon01.png");
  mon02 = loadImage("img/mon02.png");
  mon03 = loadImage("img/mon03.png");
  mon04 = loadImage("img/mon04.png");
  mon05 = loadImage("img/mon05.png");
  mon01L = loadImage("img/mon01L.png");
  mon02L = loadImage("img/mon02L.png");
  mon03L = loadImage("img/mon03L.png");
  mon04L = loadImage("img/mon04L.png");
  mon05L = loadImage("img/mon05L.png");
  
  hero = new Hero(200, 480);
  stage = new Stage();
  
  ListHeart01 = new ArrayList<Heart>();
  ListHeart02 = new ArrayList<Heart>();
  ListMon01 = new ArrayList<Monster>();
  ListMon02 = new ArrayList<Monster>();
  balls = new ArrayList<Ball>();
  brick = new ArrayList<MonsterBrick>();
  battles = new ArrayList<Battle>();
  
  addMonsters01();
  addMonsters02();
  addHeart01();
  addHeart02();
  addBalls();
  //addBrick();
}

void draw() {
  background(200);
  textAlign(CENTER);
  
  //Test
  //text("xPos:"+mouseX, 100, 150);
  //text("yPos:"+mouseY, 100, 200);
  
  switch (stageNum)
  {
    case 1:
      background(255, 0, 0);
      image(stage1, 0, 0);
      stage.display(stageNum);
      hero.move();
      hero.display();
      text("Stage 1", 800, 100);
      fill(0);
      text("press arrow key to move", 260, 120);
      break;
    case 2:
      background(0, 255, 0);
      image(stage2, 0, 0);
      stage.display(stageNum);
      hero.move();
      hero.display();
      text("Stage 2", 800, 100);
      break;
      
    default:
      background(main);
      break;
  }
  //println("gameFinished = "+ gameFinished + ", gameStart = " + gameStart);
  
  if(inBattle == true){
    stage.BattleStage();
  }
}

void keyPressed() {
  if(keyPressed) {
    switch (stageNum)
    {
      //Main Page
      case 0:
        stageNum = 1;
        noLoop();
        break;
        
      //Stage 1
      case 1:
        if (key == CODED) {
          if (keyCode == LEFT) {
            hero.moveLeft = true;
            heroStand = heroL;
          }
          else if(keyCode == RIGHT) {
            hero.moveRight = true;
            heroStand = heroR;
          }
          else if(keyCode == UP) {
            hero.moveUp = true;
          }
        }
        if(hero.xPos>1550){
          hero.xPos = 200;
          stageNum = 2;
          //noLoop();
          break;
        }
        break;
        
      //Stage 2
      case 2:
      //Add condition to end
        /////////////////////
        if (key == CODED) {
          if (keyCode == LEFT) {
            hero.moveLeft = true;
            heroStand = heroL;
          }
          else if(keyCode == RIGHT) {
            hero.moveRight = true;
            heroStand = heroR;
          }
          else if(keyCode == UP) {
            hero.moveUp = true;
          }
        }
        if(hero.xPos>1550){
          stageNum = 2;
          //noLoop();
          break;
        }
        //break;
        //noLoop();
        break;
        
      //Battle
      case 3:
        stageNum = 3;
        noLoop();
        break;
    }
  }
}

void keyReleased() {
  switch (stageNum) {
    case 1:
      if (key == CODED) {
         if (keyCode == LEFT) {
           hero.moveLeft = false;
           heroStand = loadImage("img/stand.png");
         }
         else if(keyCode == RIGHT) {
           hero.moveRight = false;
           heroStand = loadImage("img/stand.png");
         }
         else if(keyCode == UP) {
           hero.moveUp = false;
           hero.moveDown = true;
         }
         hero.stage01BlockStandCheck();
      }
      break;
    case 2:
      if (key == CODED) {
         if (keyCode == LEFT) {
           hero.moveLeft = false;
           heroStand = loadImage("img/stand.png");
         }
         else if(keyCode == RIGHT) {
           hero.moveRight = false;
           heroStand = loadImage("img/stand.png");
         }
         else if(keyCode == UP) {
           hero.moveUp = false;
           hero.moveDown = true;
         }
         hero.stage02BlockStandCheck();
      }
      break;
  }
  loop();
}
  
void mouseReleased() {
  if (!gameFinished && !gameStart && battles.size()>0){
    gameStart = true;
  }
  if (gameFinished && brick.size()==0){
    inBattle = false;
    gameStart = false;
    gameFinished = false;
    battles.remove(0);
  }
  if (hero.numHeart>0 && battles.size()>0){
    shoot = true;
    gameStart = true;
  }
}

void addMonsters01() {
  println("add Monster");
  ListMon01.add(new Monster(350, 480, 1));
  ListMon01.add(new Monster(600, 480, 2));
  ListMon01.add(new Monster(550, 230, 2));
  ListMon01.add(new Monster(780, 140, 1));
  ListMon01.add(new Monster(940, 480, 1));
  ListMon01.add(new Monster(1200, 480, 2));
}
void addHeart01() {
  println("add Heart");
  ListHeart01.add(new Heart(850, 480));
  ListHeart01.add(new Heart(1130, 190));
}

void addMonsters02() {
  println("add Monster2");
  ListMon02.add(new Monster(340, 353, 3));
  ListMon02.add(new Monster(810, 450, 4));
  ListMon02.add(new Monster(870, 253, 3));
  ListMon02.add(new Monster(1290, 350, 4));
  ListMon02.add(new Monster(1620, 350, 5));
}
void addHeart02() {
  println("add Heart2");
  ListHeart02.add(new Heart(1030, 150));
  ListHeart02.add(new Heart(1530, 430));
}

void addBalls() {
  for(int i = 0; i < totalball; i++)
  {
    float r = random(750,1050);
    float l = random(480,520);
    balls.add(new Ball(r,l,10,10));
  }
}