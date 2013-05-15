ArrayList<Organism> org = new ArrayList<Organism>();
Plant p;
Herbivore h;
Carnivore1 c1;
Carnivore2 c2;
Omnivore1 o1;
Omnivore2 o2;
int deploy;

void setup() {
  size(displayWidth, displayHeight);
  background(50, 50, 50);
  frameRate(30);
  for (int i = 0; i < 250; i++) {
    p = new Plant(new PVector(random(0, width), random(0, height)), new DNA());
    org.add(p);
  }
  for (int i = 0; i < 25; i++) {
    h = new Herbivore(new PVector(random(0, width), random(0, height)), new DNA());
    org.add(h);
  }
  for (int i = 0; i < 3; i++) {
    c1 = new Carnivore1(new PVector(random(0, width), random(0, height)), new DNA());
    org.add(c1);
  }
  for (int i = 0; i < 1; i++) {
    c2 = new Carnivore2(new PVector(random(0, width), random(0, height)), new DNA());
    org.add(c2);
  }
  for (int i = 0; i < 3; i++) {
    o1 = new Omnivore1(new PVector(random(0, width), random(0, height)), new DNA());
    org.add(o1);
  }
  for (int i = 0; i < 1; i++) {
    o2 = new Omnivore2(new PVector(random(0, width), random(0, height)), new DNA());
    org.add(o2);
  }
}

void draw() {
  background(0);
  if (random(0, 1) < 0.1) {
    p = new Plant(new PVector(random(0, width), random(0, height)), new DNA());
    org.add(p);
  }
  /*
  if (random(0, 1) < 0.003) {
    h = new Herbivore(new PVector(random(0, width), random(0, height)), new DNA());
    org.add(h);
  }
  if (random(0, 1) < 0.001) {
    c1 = new Carnivore1(new PVector(random(0, width), random(0, height)), new DNA());
    org.add(c1);
  }
  if (random(0, 1) < 0.001) {
    c2 = new Carnivore2(new PVector(random(0, width), random(0, height)), new DNA());
    org.add(c2);
  }
  if (random(0, 1) < 0.001) {
    o1 = new Omnivore1(new PVector(random(0, width), random(0, height)), new DNA());
    org.add(o1);
  }
  */

  for (int k = 0; k < org.size(); k++) {
    org.get(k).run();
    if (k >= org.size()) {
      continue;
    }
  }
  for (int k = org.size(); k > 450; k--) {
    if (k >= org.size()) {
      continue;
    }
    org.remove(k);
  }
  println(frameRate + "        " + org.size());
}

boolean sketchFullScreen() {
  return true;
}

void keyTyped() {
  if (key == 'z') {
    deploy = -1;
  }
  else {
    int tmp = key - 48;
    deploy = tmp;
  }
}

void mousePressed() {
  if (deploy == 0) {
    p = new Plant(new PVector(mouseX, mouseY), new DNA());
    org.add(p);
  }
  if (deploy == 1) {
    h = new Herbivore(new PVector(mouseX, mouseY), new DNA());
    org.add(h);
  }
  if (deploy == 2) {
    c1 = new Carnivore1(new PVector(mouseX, mouseY), new DNA());
    org.add(c1);
  }
  if (deploy == 3) {
    c2 = new Carnivore2(new PVector(mouseX, mouseY), new DNA());
    org.add(c2);
  }
  if (deploy == 4) {
    o1 = new Omnivore1(new PVector(mouseX, mouseY), new DNA());
    org.add(o1);
  }
  if (deploy == 5) {
    o2 = new Omnivore2(new PVector(mouseX, mouseY), new DNA());
    org.add(o2);
  }
}

