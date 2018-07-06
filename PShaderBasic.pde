PShader shader;
boolean doShader = true;

void setup() { 
  size(960, 540, P2D); // Need to use the 2D or 3D renderer to use shaders
  noStroke();
  ellipseMode(CENTER);
  shader = loadShader("example.glsl"); 
  shader.set("iResolution", float(width), float(height), 1.0);
}

void draw() {
  background(0);
  float size = 50.0 + (10.0 * sin(millis()/100.0));
  
  fill(255,0,0);
  ellipse(width/2, height/2, size, size);
  
  fill(0, 255, 0);
  ellipse(0, 0, size, size);
  ellipse(width, 0, size, size);
  ellipse(0, height, size, size);
  ellipse(width, height, size, size);

  fill(0, 255, 255);
  ellipse(width/4, height/4, size, size);
  ellipse(width/4, 3 * (height/4), size, size);
  ellipse(3 * (width/4), height/4, size, size);
  ellipse(3 * (width/4), 3 * (height/4), size, size);
  
  String msg = "Shader ";
  if (doShader) {
    msg += "ON";
    filter(shader);
  } else {
    msg += "OFF";
  }

  fill(0);
  text(msg, 12, 21);
  fill(255);
  text(msg, 10, 20);  
}

void keyPressed() {
  doShader = !doShader;
}
