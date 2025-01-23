PFont myfont;
import processing.pdf.*;
boolean record;
color[] paleta={#ff007b,#ff3900,#008a31};
String mytext = "hmm"; 

void setup() {
  frameRate(001);
  myfont = createFont("IBMPlexMono-Medium.ttf", 8);
  size(568, 843);
}

void draw() {
  if (record) {
    beginRecord(PDF, "retition-####.pdf");
  }
  background(255);
  textFont(myfont); 
  int r= int(random(paleta.length));
  if (frameCount % 300 == 0) {
  println (r);
  background(paleta[r]);
  saveFrame("Processing/p9_onomatopeia/png");
  }
  fill(0);
  textSize(8);
  regular();
  espiga();
  drawCompactTextBlocks(); 
  
  
  saveFrame("png/onomatopeia-####.png");
  
  
  if (record) {
    endRecord();
    record = false;
  }
}

void mousePressed() {
  record = true;
}

void regular() {
  for (int y = 20; y <= width - 20; y += 25) {
    for (int x = 20; x <= width - 20; x += 25) {
      push();
      rotate(radians(random(90))); 
      text("h", x, y);
      pop();
    }
  }
}

void espiga() {
  for (int y = 20; y <= width - 20; y += 25) {
    for (int x = 20; x <= height - 20; x += 25) {
      if ((x % 10) == 0) {
        text("m", x + 120, y + 90);
      } else {
        text("h", x + 300, y + 400);
      }
    }
  }
}

void drawCompactTextBlocks() {
  for (int i = 0; i < 10; i++) { 
    float x = random(width - 150); 
    float y = random(height - 150);
    
   int blockSize = int(random(10, 50)); 
    float spacing = 8; 


    for (int j = 0; j < blockSize; j++) { 
      for (int k = 0; k < blockSize * int(random(1, 3)); k++) { 
        float posX = x + k * spacing * 0.6; 
        float posY = y + j * spacing * 0.6; 
        text(random(1) < 0.5 ? "h" : "m", posX, posY); //
      }
    }
  }
}
