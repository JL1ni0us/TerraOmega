ArrayList<Organism> org = new ArrayList<Organism>();
Plant p;
Herbivore h;
Carnivore1 c1;

void setup() {
    size(700, 700);
    frameRate(20);
    p = new Plant(new PVector(random(100, 400), random(100, 400)), new DNA());
    org.add(p);
    p = new Plant(new PVector(random(100, 400), random(100, 400)), new DNA());
    org.add(p);
    p = new Plant(new PVector(random(100, 400), random(100, 400)), new DNA());
    org.add(p);
    h = new Herbivore(new PVector(200, 200), new DNA());
    org.add(h);
    h = new Herbivore(new PVector(200, 200), new DNA());
    org.add(h);
    h = new Herbivore(new PVector(200, 200), new DNA());
    org.add(h);
    c1 = new Carnivore1(new PVector(random(100, 400), random(100, 400)), new DNA());
    org.add(c1);
}

void draw() {
    background(255, 255, 255);
    if (random(0, 1) < 0.003) {
        p = new Plant(new PVector(random(100, 400), random(100, 400)), new DNA());
        org.add(p);
    }
    if (random(0, 1) < 0.003) {
        h = new Herbivore(new PVector(random(100, 400), random(100, 400)), new DNA());
        org.add(p);
    }
    if (random(0, 1) < 0.003) {
        c1 = new Carnivore1(new PVector(random(100, 400), random(100, 400)), new DNA());
        org.add(p);
    }
    for (int k = 0; k < org.size(); k++) {
        org.get(k).run();
        if (k >= org.size()) {
            continue;
        }
        System.out.println((org.get(k)).health);
    }
}

