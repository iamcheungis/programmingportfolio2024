import ddf.minim.*;

Spaceship s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();
int score, level;
boolean play;
boolean turretActive = false;
int turretDuration = 11000;
int turretEndTime = 0;
Timer rTime, puTime;
PImage img, endImage;


Minim minim;
AudioPlayer startMusic;
AudioPlayer gameMusic;
AudioPlayer endMusic;
AudioSample laserSound;
AudioSample startSound;
AudioSample endSound;

int gameState = 0;

boolean endSoundPlayed = false;


void setup() {
  size(800, 800);
  for (int i = 0; i < 100; i++) {
    stars.add(new Star());
  }
  img = loadImage("background.jpg");
  endImage = loadImage("mission.jpg.png");
  
  minim = new Minim(this);
  laserSound = minim.loadSample("SHOTS.mp3");
  laserSound.setGain(-5);
  startSound = minim.loadSample("Clashroyale.mp3");
  endSound = minim.loadSample("Starwars.mp3");
  gameMusic = minim.loadFile("gameMusic.mp3");
  startMusic = minim.loadFile("Missionimpossible.mp3");
  delay(2000);
  endMusic = minim.loadFile("Defeat.mp3");
  
  
  s1 = new Spaceship();
  score = 0;
  level = 1;
  play = false;
  rTime = new Timer(1000);
  rTime.start();
  puTime = new Timer(5000);
  puTime.start();
  
  startMusic.loop();
  
}
void draw() {
  if (gameState == 0) {
    startGame();
  } else if (gameState == 1) {
    gameLoop();
  } else if (gameState == 2) {
    endGame();
  }
}

void gameLoop() {
  background(0);
  for (Star star : stars) {
    star.move();
    star.display();
  }
  
  //tint(255, 200);
  image(img, 400, 400, width, height);
  //noTint();
  
  if (s1.health <= 0 && gameState == 1) {
    if(!endSoundPlayed) {
      endSound.trigger();
      endSoundPlayed = true;
      
      gameMusic.pause();
      endMusic.rewind();
      endMusic.loop();
    }
    gameState = 2;
    return;
  }
  
   for (Star star : stars) {
    star.move();
    star.display();
  }

  //Render Powerups
  if(puTime.isFinished()) {
    powups.add(new Powerup());
    puTime.start();
  }
  for(int i = 0; i < powups.size(); i++) {
    Powerup pu = powups.get(i);
    if(pu.intersect(s1) && pu.type == 'h') {
      powups.remove(pu);
      //health benefit
      s1.health += 20;
    } else if (pu.intersect(s1) && pu.type == 'a') {
      powups.remove(pu);
      //ammo increase
      s1.laserCount += 100;
    } else if (pu.intersect(s1) && pu.type == 't') {
      powups.remove(pu);
      turretActive = true;
      turretEndTime = millis() + turretDuration;
    }
      
    pu.display();
    pu.move();
    if(pu.reachedBottom()) {
      powups.remove(pu);
    }
  }
  
  if (turretActive && millis() > turretEndTime) {
    turretActive = false;
  }
  // Render lasers and detect rock collide
  for (int i = 0; i < lasers.size(); i++) {
    Laser laser = lasers.get(i);
    for (int j = 0; j < rocks.size(); j++) {
      Rock rock = rocks.get(j);
      if (laser.intersect(rock)) {
        rock.diam -= 10;
        if (rock.diam<1) {
          rocks.remove(rock);
        }
        score += 10;
        lasers.remove(laser);
      }
    }
    laser.display();
    laser.move();
    if (laser.reachedTop()) {
      lasers.remove(laser);
    }
  }

   if (rTime.isFinished()) {
     rocks.add(new Rock());
     rTime.start();
  }
  for (int i = 0; i < rocks.size(); i++) {
    Rock rock = rocks.get(i);
    rock.display();
    rock.move();
    if (s1.intersect(rock)) {
      //deducts 10 points
      score -= 10;
      //deduct 10 health
      s1.health -= 10;
      // delete rock
      rocks.remove(rock);
    }
    if (rock.reachedBottom()) {
      rocks.remove(rock);
    }
  }
  
  //Update level based on score
  updateLevel();
  
  s1.display();
  s1.move(mouseX, mouseY);
  infoPanel();
  
}

void startGame() {

  background(0);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Welcome to Space Adventure", width/2, height/2-200);
  textSize(20);
  text("Made by: Isaac Cheung", width/2, height/2-150);
  text("Click 'Enter' to Start", width/2, height/2 -100);
}

void endGame() {
  background(0);
  image(endImage, 400, 500, width, height);
  fill(255);
  textSize(20);
  stroke(0);
  textAlign(CENTER);
  text("You Died", width/2, height/2 -200);
  text("Skill Issue", width/2, height/2-150);
  textSize(30);
  text("Final Score:" + score, width/2, height/2 -100);
  text("Final Level:" + level, width/2, height/2 -50);
  textSize(20);
  text("Click 'Enter' to Try Again", width/2, height/2 );
}

void mousePressed() {
  if (s1.fire()) {
    lasers.add(new Laser(s1.x, s1.y));
    
    if (turretActive) {
      lasers.add(new Laser(s1.x + 40, s1.y));
      lasers.add(new Laser(s1.x - 40, s1.y));
    }
    s1.laserCount--;
    
    if (laserSound !=  null) {
      laserSound.trigger();
    }
  }
}

void keyPressed() {
  if(keyCode == ENTER) {
    if (gameState == 0) {
      gameState = 1;
      startMusic.pause();
      gameMusic.loop();
    } else if (gameState == 2) {
      resetGame(); 
      endMusic.pause();
      startMusic.rewind();
      startMusic.loop();
      gameState = 0;
    }
  }
  
  if(gameState == 1 && (key == ' ' || key == CODED && keyCode == SHIFT)) {
    if(s1.fire()) {
      lasers.add(new Laser(s1.x, s1.y));
      
      if(turretActive) {
        lasers.add(new Laser(s1.x + 40, s1.y));
        lasers.add(new Laser(s1.x - 40, s1.y));
      }
      
      s1.laserCount--;
      
      if (laserSound != null) {
        laserSound.trigger();
      }
    }
  }
}







void resetGame() {
  s1 = new Spaceship();
  score = 0;
  level = 1;
  play = false;
  endSoundPlayed = false;
  rTime = new Timer(1000);
  rTime.start();
  puTime = new Timer(5000);
  puTime.start();
}

void infoPanel() {
  rectMode(CENTER);
  fill(127, 127);
  rect(width/2,20,width,45);
  fill(255);
  textSize(20);
  text("Score:" + score,20,36);
  text("Health:" + s1.health, 150, 36);
  text("Level:" + level, 300, 36);
  text("Ammo:" + s1.laserCount, 445, 36);
  
  if(turretActive) {
    int timeLeft = (turretEndTime - millis()) / 1000;
    text("Turret On:" + timeLeft + "s", 630, 36);
  } else {
    text("Turret Off", 630, 36);
  }
}

void updateLevel() {
  if(score>=1000*level) {
    level++;
    rTime = new Timer(1000-(level*30));
    rTime.start();
  }
}

void stop() {
  startMusic.close();
  gameMusic.close();
  endMusic.close();
  laserSound.close();
  startSound.close();
  endSound.close();
  minim.stop();
  super.stop();
}
