class Organism {    
    PVector location;
    DNA dna;
    float health, hCap, xoff, yoff, r, maxSpd;
    color colour;
    int type, troph;

    Organism(PVector loc, DNA newDNA) {
        location = loc.get();
        health = 100;
        xoff = random(1000);
        yoff = random(1000);
        dna = newDNA;
        maxSpd = map(dna.geneSeq[0], 0, 1, 15, 0);
        r = map(dna.geneSeq[0], 0, 1, 0, 50);
    }

    void run() {
    }

    void eat(Organism f) {
        if (edible(this, f)) {
            health += f.health / 10;
            org.remove(org.indexOf(f));
        }
    }

    void move() {
        float vx = map(noise(xoff), 0, 1, -maxSpd, maxSpd);
        float vy = map(noise(yoff), 0, 1, -maxSpd, maxSpd);
        if (location.x < 30) {
            vx = abs(vx) * 2;
            xoff += 0.01;
            yoff += 0.01;
        }
        if (location.x > width - 30) {
            vx = -abs(vx) * 2;
            xoff += 0.01;
            yoff += 0.01;
        }

        if (location.y < 30) {
            vy = abs(vy) * 2;
            xoff += 0.01;
            yoff += 0.01;
        }
        if (location.y > height - 30) {
            vy = -abs(vy) * 2;
            xoff += 0.01;
            yoff += 0.01;
        }

        PVector velocity = new PVector(vx, vy);
        xoff += 0.01;
        yoff += 0.01;
        location.add(velocity);
    }

    void render() {
        ellipseMode(CENTER);
        noStroke();
        fill(colour);
        ellipse(location.x - r/2, location.y-r/2, r, r);
    }
}

class Plant extends Organism {
    Plant(PVector loc, DNA newDNA) {
        super(loc, newDNA);
        type = 0;
        troph = 0;
        hCap = 1000;
        colour = color(0, 200, 0);
    }

    void run() {
        if (health < hCap) {
            health += 0.1;
            r += 0.05;
        }
        render();
    }
}

class Herbivore extends Organism {
    Herbivore(PVector loc, DNA newDNA) {
        super(loc, newDNA);
        type = 1;
        troph = 1;
        hCap = 200;
        colour = color(150, 150, 0);
    }

    void run() {
        if (health < hCap) {
            health -= 0.1;
            r += 0.01;
            if (health < 0) {
                org.remove(this);
            }
        }
        move();
        render();
        for (int i = 0; i < org.size(); i++) {
            Organism o = org.get(i);
            if (o == this) {
                continue;
            }
            if (dist(location.x, location.y, o.location.x, o.location.y) < r + o.r) {
                System.out.println("ATTEMPT TO EAT");
                eat(o);
            }
        }
        if (random(0, 1) < 0.002) {
            DNA newDNA = dna;
            newDNA.mutate(0.001);
            Herbivore p = new Herbivore(location, newDNA);
            org.add(p);
        }
    }
}

class Carnivore1 extends Organism {
    Carnivore1(PVector loc, DNA newDNA) {
        super(loc, newDNA);
        type = 2;
        troph = 2;
        hCap = 200;
        colour = color(255, 0, 0);
    }

    void run() {
        if (health < hCap) {
            health -= 0.1;
            r += 0.01;
            if (health < 0) {
                org.remove(this);
            }
        }
        move();
        render();
        for (int i = 0; i < org.size(); i++) {
            Organism o = org.get(i);
            if (o == this) {
                continue;
            }
            if (dist(location.x, location.y, o.location.x, o.location.y) < r + o.r) {
                System.out.println("ATTEMPT TO EAT");
                eat(o);
            }
        }

        if (random(0, 1) < 0.002) {
            DNA newDNA = dna;
            newDNA.mutate(0.001);
            Carnivore1 p = new Carnivore1(location, newDNA);
            org.add(p);
        }
    }
}

