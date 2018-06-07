

class Box {

 
  Body body;
  float w;
  float h;
  color col;
  
  

  
  Box(int x_, int y_) {
    int x = x_;
    int y = y_;
    w = 30;
    h = 30;
   
    makeBody(x, y,w, h);
    body.setUserData(this);
    col= color(175);
  }
  
  

 
  void killBody() {
    box2d.destroyBody(body);
  }

  boolean contains(float x, float y) {
    Vec2 worldPoint = box2d.coordPixelsToWorld(x, y);
    Fixture f = body.getFixtureList();
    boolean inside = f.testPoint(worldPoint);
    return inside;
  }
  
  void cambio(){
  col= color(0,255,0);
  }
  
    void cambio2(){
  col= color(255,0,0);
  }
  
  
  
  void display() {
    
    Vec2 pos = box2d.getBodyPixelCoord(body);
   
    float a = body.getAngle();

    rectMode(PConstants.CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(col);
    stroke(0);
    rect(0, 0, w, h);
    popMatrix();
  }
  
  
  void mover(){
    
    Vec2 e= new Vec2(0,0);
    Vec2 pos= body.getWorldCenter();
  
    if(keyPressed==true&&key ==CODED&&keyCode==UP){
    
    e.y+=70;
    
    }
    
    if(keyPressed==true&&key ==CODED&&keyCode==DOWN){
    
    e.y-=70;
    
    }
    
    
    if(keyPressed==true&&key ==CODED&&keyCode==LEFT){
    
    e.x-=70;
    
    }
    
    if(keyPressed==true&&key ==CODED&&keyCode==RIGHT){
    
    e.x+=70;
    
    }
    
    body.applyForce(e,pos);
  
  }
  
    void posicion(){
  Vec2 pos = box2d.getBodyPixelCoord(body);
    f = round (pos.x);
    g = round (pos.y);
  }

  void impulso(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y<=0){
    body.setLinearVelocity(new Vec2(0,-5));
    }
    else{
    if (pos.y>=500){
   body.setLinearVelocity(new Vec2(0,5));
    }
    }
    
    if(pos.x<=-0){
       body.setLinearVelocity(new Vec2(0,-5));
    }
    
    else{
    if (pos.x>=400){
   body.setLinearVelocity(new Vec2(0,5));
    }
    }
  }
  
  void makeBody( int x,int  y, float w_, float h_) {
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);

    
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

    
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    
    fd.density = 0.2;
    fd.friction = 0.3;
    //fd.restitution = 0.5;

    body.createFixture(fd);

    body.setLinearVelocity(new Vec2(0,10));;
    body.setAngularVelocity(random(-5, 5));
  }
  
  
  
}
