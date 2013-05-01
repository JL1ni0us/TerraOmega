ArrayList<Organism> org = new ArrayList<Organism>();
Plant p;

void setup() {
    size(500, 500);
    p = new Plant(new PVector(random(100, 400), random(100, 400)), new DNA());
    org.add(p);
    p = new Plant(new PVector(random(100, 400), random(100, 400)), new DNA());
    org.add(p);
    p = new Plant(new PVector(random(100, 400), random(100, 400)), new DNA());
    org.add(p);
    Herbivore h = new Herbivore(new PVector(200, 200), new DNA());
    org.add(h);
}

void draw() {
    background(255, 255, 255);
    for (int k = 0; k < org.size(); k++) {
        org.get(k).run();
        if (k >= org.size()) {
            continue;
        }
        System.out.println((org.get(k)).health);
    }
}
