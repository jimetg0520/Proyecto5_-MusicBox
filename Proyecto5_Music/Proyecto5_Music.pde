//Jimena Torres Godínez
//NUA 146016 
//Proyecto 5: Music Box


import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import ddf.minim.*;



ArrayList<Particle> particles;
ArrayList<Particula> particles2;
ArrayList<Revival> particulas;
int p;


PImage fondo3;
PImage nota1;

PImage note;
PImage note2;


PFont letra1;
PFont letra2;
PFont letra3;
PImage melodrama2;
PImage red2;
PImage stars;
PImage fondo;
PImage fondoprimer2;
PImage goldenfacil;
PImage goldenmedio;
PImage goldendificil;

PImage parar;
int puntos=100;
int album;
int pantalla;
int f,g;

Minim minim;

AudioPlayer cancion1;
AudioPlayer cancion2;
AudioPlayer cancion3;

Box box;

Box2DProcessing box2d;


void setup() {
   size(600,500);
  smooth();
letra1 = loadFont("Cubic-48.vlw");
 letra2 = loadFont("AgencyFB-Reg-48.vlw");
  letra3 = loadFont("CanterBold3D-48.vlw");
 fondo3= loadImage("fondo3.jpg");
  nota1= loadImage("nota.png");
  
    note= loadImage("note.png");
    note2= loadImage("note2.png");
    
    melodrama2= loadImage("melodrama2.jpg");
    fondo= loadImage("fondoultimo.jpg");
   red2= loadImage("red2.jpg");
   stars= loadImage("stars.jpg");
   fondoprimer2= loadImage("fondoprimer2.jpg");
   
   goldenfacil= loadImage("goldenfacil.png");
   goldenmedio= loadImage("goldenmedio.png");
   goldendificil= loadImage("goldendificil.png");
  
   parar= loadImage("parar.png");
   minim = new Minim(this);
 
  cancion1 = minim.loadFile("soberii.mp3");
  cancion2 = minim.loadFile("dance.mp3");
  cancion3 = minim.loadFile("we.mp3");
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  box2d.setGravity(0,0.00009);
  box2d.listenForCollisions();


  box = new Box(width/2,height/2);

  
  
  
  particles = new ArrayList<Particle>();
  particles2 = new ArrayList<Particula>();
    particulas = new ArrayList<Revival>();

}

void draw() { 
  
  switch(pantalla){
  case 0:
  
  inicio();
  break;
  
  
  case 1:
  inicio2();
  
  break;
 
 
  case 2:
  
  cubicmusic();
  seleccion();

  break;
  
  case 3:
  Sumatotal();
  
  break;
 
 }
 
  
  
  
  
}

void inicio(){

image(fondoprimer2,0,0,600,500);
image(nota1,380,200,250,120);



fill(random(255), random(100), random(50));

  textFont(letra3);
  textSize(100);
  text("Music ",60,350);
    text(" Box ",60,440);
    
    

noStroke();
fill(#00FA9A);
rect(350,400,130,60);

fill(255);
      textFont(letra2);
  textSize(40);
  text("Empezar ",355,438);
  
  
   if((mouseX>350)&(mouseX<480)&(mouseY>400)&(mouseY<460)){
     
     noStroke();
fill(#A65E2E);
rect(345,395,140,70);

     
     
     noStroke();
fill(#00FA9A);
rect(350,400,130,60);

fill(255);
      textFont(letra2);
  textSize(40);
  text("Empezar ",355,438);
  image(note,350,445,40,50);
  image(note,450,400,40,50);
  image(note2,390,350,40,50);
 
   
   
   }



}

void inicio2(){
 image(fondo3,0,0,600,500);
  
  fill(0);


 
textFont(letra3);
  textSize(50);
  text("Instrucciones ",80,100);
  
  textFont(letra2);
  fill(0);
  textSize(20);
  text("1. Elige el nivel de dificultad ",70,160);
  text("2. Controla el objeto box con las  ",70,190);
  text("teclas de dirección ",70,210);
  text("3. Golpea los objetos de acuerdo al nivel",70,240);
  text("que elegiste para sumar puntos",70,260);
  text("4.Evita golpear los objetos diferentes, ya que te", 70, 290);
    text("restarán puntos", 70, 310);
  text("5. Si tu puntaje es 0 perderás el juego", 70, 340);
  
 
  
 noStroke();
fill(#00FA9A);
rect(400,400,130,60);

fill(255);
      textFont(letra2);
  textSize(40);
  text("Jugar",415,438);



}

void seleccion(){
  
  image(melodrama2,450,90,70,70);
image(red2,450,220,70,70);
image(stars,450,350,70,70);

fill(0);
textFont(letra2);
textSize(20);
text("Seleccciona un nivel",440,50);
 
 textSize(20);
 fill(0,0,255);
  text("Fácil",460,80);
  if(album==1){
    
    noStroke();
    fill(0,255,0);
    rect(485,125,80,80);
    
  image(melodrama2,450,90,70,70);
  
  fill(0);
    textSize(15);
    text(puntos,560,130);

    fill(0);
    textSize(18);
     text("puntos",540,110);
     
    
       if(puntos<0){
    pantalla=3;
    }
     
     }
  
  
  
  textSize(20);
 fill(255,0,0);
  text("Medio",460,200);
  
  if(album==2){
    
    noStroke();
    fill(0,255,0);
    rect(485,255,80,80);
    
  image(red2,450,220,70,70);
  
  fill(0);
    textSize(15);
    text(puntos,560,280);

    fill(0);
    textSize(18);
     text("puntos",540,250);
     
     
       if(puntos<0){
    pantalla=3;
    }  
     
     
  
  
  
  }
  
  textSize(20);
 fill(0);
  text("Difícil",460,340);
  
  
  if(album==3){
    
    noStroke();
    fill(0,255,0);
    rect(485,385,80,80);
    
  image(stars,450,350,70,70);
  
  fill(0);
    textSize(15);
    text(puntos,560,400);

    fill(0);
    textSize(18);
     text("puntos",550,380);
     
     
       if(puntos<0){
    pantalla=3;
    }
  
  
  }
  
   
   
  


}




void cubicmusic(){
background(255);



  if(album==1||album==2||album==3){
if (random(1) < 0.1){

    float p = random(2,3);
   
   particles2.add(new Particula(random(400), 10,p));
   particulas.add(new Revival(random(400), 10,p));
    particles.add(new Particle(random(400), 10, p));
} 
  }




 box2d.step();
  
  
 
  box.body.setAngularVelocity(0);
  
  
   box.display();
  box.mover();
  box.posicion();
 


  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.display();
   
    if (p.done()) {
      particles.remove(i);
    }
  }
  
 for (int i = particles2.size()-1; i >= 0; i--) {
    Particula p = particles2.get(i);
    p.display();
    
    if (p.done()) {
      particles2.remove(i);
    }
  }

for (int i = particulas.size()-1; i >= 0; i--) {
    Revival p = particulas.get(i);
    p.display();
    
    if (p.done()) {
      particulas.remove(i);
    }
  }

 
box.impulso();
 


}



void Sumatotal(){
  image(fondo,0,0,600,500);
  textFont(letra3);
  fill(random(255), random(100), random(50));
  textSize(60);
  text("Music Box ",200,70);
   
   image(parar,260,360,80,80);
   
   
 
     if((mouseX>260)&(mouseX<340)&(mouseY>360)&(mouseY<430)){
   fill(255);
   textFont(letra2);
   textSize(20);
  text("Salir ",280,460);
   
   }
  
  
  if(album==1){
  
    image(goldenfacil,200,100,200,230);
    
  
  }
  
  
  if(album==2){
  
    image(goldenmedio,200,100,200,230);
  
  }

   if(album==3){
  
    image(goldendificil,200,100,200,230);
  
  }
  


}


// Collision event functions!
void beginContact(Contact cp) {
  // Get both fixtures
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  

  
  // Get both bodies
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();
  // Get our objects that reference these bodies
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();

  

  // If object 1 is a Box, then object 2 must be a particle
  
  if(album==1){
    
    //melodrama
  if (o1.getClass() == Box.class && o2.getClass() == Particle.class){
    
  puntos=puntos+4;
  box.cambio();
  
  } 
  // If object 2 is a Box, then object 1 must be a particle
 else if (o2.getClass() == Box.class && o1.getClass() == Particle.class) {

    puntos=puntos+4;
    box.cambio();
 }
 
 
  if (o1.getClass() == Box.class && o2.getClass() == Particula.class){
  puntos=puntos-3;
   box.cambio2();
  } 
  // If object 2 is a Box, then object 1 must be a particle
 else if (o2.getClass() == Box.class && o1.getClass() == Particula.class) {
    puntos=puntos-3;
    box.cambio2();
 }
 
 
  if (o1.getClass() == Box.class && o2.getClass() == Revival.class){
  puntos=puntos-2;
  box.cambio2();
  } 
  // If object 2 is a Box, then object 1 must be a particle
 else if (o2.getClass() == Box.class && o1.getClass() == Revival.class) {
    puntos=puntos-2;
    box.cambio2();
 }
 
  }
  
  
  //red
  if(album==2){
  if (o1.getClass() == Box.class && o2.getClass() == Particula.class){
  puntos=puntos+3;
  box.cambio();
  } 
  // If object 2 is a Box, then object 1 must be a particle
 else if (o2.getClass() == Box.class && o1.getClass() == Particula.class) {
    puntos=puntos+3;
    box.cambio();
 }
 
 
  if (o1.getClass() == Box.class && o2.getClass() == Particle.class){
    
  puntos=puntos-3;
  box.cambio2();
  } 
  // If object 2 is a Box, then object 1 must be a particle
 else if (o2.getClass() == Box.class && o1.getClass() == Particle.class) {
    puntos=puntos-3;
    box.cambio2();
 }
 
 
  if (o1.getClass() == Box.class && o2.getClass() == Revival.class){
  puntos=puntos-2;
  box.cambio2();
  } 
  // If object 2 is a Box, then object 1 must be a particle
 else if (o2.getClass() == Box.class && o1.getClass() == Revival.class) {
    puntos=puntos-2;
    box.cambio2();
 }
 
  }
  
  //stars dance
    if(album==3){
  if (o1.getClass() == Box.class && o2.getClass() == Revival.class){
  puntos=puntos+2;
  box.cambio();
  } 
  // If object 2 is a Box, then object 1 must be a particle
 else if (o2.getClass() == Box.class && o1.getClass() == Revival.class) {
    puntos=puntos+2;
     box.cambio();
 }
 
 
  if (o1.getClass() == Box.class && o2.getClass() == Particle.class){
  puntos=puntos-3;
  box.cambio2();
  
  } 
  // If object 2 is a Box, then object 1 must be a particle
 else if (o2.getClass() == Box.class && o1.getClass() == Particle.class) {
    puntos=puntos-3;
    box.cambio2();
 }
 
 
  if (o1.getClass() == Box.class && o2.getClass() == Particula.class){
  puntos=puntos-3;
  box.cambio2();
  } 
  // If object 2 is a Box, then object 1 must be a particle
 else if (o2.getClass() == Box.class && o1.getClass() == Particula.class) {
    puntos=puntos-3;
    box.cambio2();
 }
 
  }
  
  
  
 
 
  
}


// Objects stop touching each other
void endContact(Contact cp) {
}




void mousePressed() {
  
  switch(pantalla){
  
  case 0:
  
  if((mouseX>350)&(mouseX<480)&(mouseY>400)&(mouseY<460)){pantalla= 0;{
    pantalla =1;
     
  } 
}
  
  break;
  
  case 1:
  
  if((mouseX>400)&(mouseX<530)&(mouseY>400)&(mouseY<460)){pantalla= 1;{
    pantalla =2;
  } 
}
  
  
  break;
  
  case 2:
  
  
  if((mouseX>450)&(mouseX<530)&(mouseY>90)&(mouseY<160)){
  
  album=1;
  cancion1.play();
  cancion2.pause();
  cancion3.pause();
  }
  
  if((mouseX>450)&(mouseX<530)&(mouseY>220)&(mouseY<290)){
  
  album=2;
  cancion3.play();
  cancion1.pause();
  cancion2.pause();
  }
  
  
  if((mouseX>450)&(mouseX<530)&(mouseY>350)&(mouseY<420)){
  
  album=3;
  cancion2.play();
  cancion1.pause();
  cancion3.pause();
  }
  
  
  if(pantalla==3){
    
   cancion1.pause();
  cancion2.pause();
  cancion3.pause();
  
  }
  
  break;
  
  case 3:
  
  if((mouseX>260)&(mouseX<340)&(mouseY>360)&(mouseY<430)){
  
  exit();
  
  }
  
  
  break;
  
  }
  
  
 
 
}
