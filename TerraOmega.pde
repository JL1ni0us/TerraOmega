ArrayList<Organism> org = new ArrayList<Organism>();
Plant p;
Herbivore h;
Carnivore1 c1;
Carnivore2 c2;
Omnivore1 o1;
Omnivore2 o2;

void setup() {
  size(800, 800);
  //frameRate(30);
  for (int i = 0; i < 1000; i++) {
    p = new Plant(new PVector(random(0, width), random(0, height)), new DNA());
    org.add(p);
  }
  for (int i = 0; i < 100; i++) {
    h = new Herbivore(new PVector(random(0, width), random(0, height)), new DNA());
    org.add(h);
  }
  for (int i = 0; i < 10; i++) {
    c1 = new Carnivore1(new PVector(random(0, width), random(0, height)), new DNA());
    org.add(c1);
  }
  for (int i = 0; i < 1; i++) {
    c2 = new Carnivore2(new PVector(random(0, width), random(0, height)), new DNA());
    org.add(c2);
  }
  for (int i = 0; i < 5; i++) {
    o1 = new Omnivore1(new PVector(random(0, width), random(0, height)), new DNA());
    org.add(o1);
  }
  for (int i = 0; i < 1; i++) {
    o2 = new Omnivore2(new PVector(random(0, width), random(0, height)), new DNA());
    org.add(o2);
  }
}

void draw() {
  background(255, 255, 255);
  if (random(0, 1) < 0.02) {
    p = new Plant(new PVector(random(0, width), random(0, height)), new DNA());
    org.add(p);
  }
  if (random(0, 1) < 0.005) {
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

  for (int k = 0; k < org.size(); k++) {
    org.get(k).run();
    if (k >= org.size()) {
      continue;
    }
  }
  println(frameRate + "        " + org.size());
}

