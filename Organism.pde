class Organism {    
    PVector location;
    DNA dna;
    float health, hCap, xoff, yoff, r, maxSpd;
    color colour;
    int type, troph;
    boolean negX, negY;

    Organism(PVector loc, DNA newDNA) {
        location = loc.get();
        health = 100;
        xoff = random(1000);
        yoff = random(1000);
        dna = newDNA;
        maxSpd = map(dna.geneSeq[0], 0, 1, 15, 0);
        r = map(dna.geneSeq[0], 0, 1, 0, 25);
    }

    void run() {
    }

    void eat(Organism f) {
        if (edible(this, f)) {
            health += f.health / 10;
            org.remove(org.indexOf(f));
            r *= 1.005;
        }
    }

    void move() {
        if (health < 20) {
            r *=0.999;
        }
        float vx = map(noise(xoff), 0, 1, -maxSpd, maxSpd);
        float vy = map(noise(yoff), 0, 1, -maxSpd, maxSpd);
        if (location.x < 0) {
            negX = !negX;
            xoff += 0.01;
            yoff += 0.01;
        }
        if (location.x > width) {
            negX = !negX;
            xoff += 0.01;
            yoff += 0.01;
        }

        if (location.y < 0) {
            negY = !negY;
            xoff += 0.01;
            yoff += 0.01;
        }
        if (location.y > height) {
            negY = !negY;
            xoff += 0.01;
            yoff += 0.01;
        }

        if (negX) {
            vx = -vx;
        }
        if (negY) {
            vy = -vy;
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
        ellipse(location.x, location.y, r * 2, r * 2);
    }
}

class Plant extends Organism {
    Plant(PVector loc, DNA newDNA) {
        super(loc, newDNA);
        type = 0;
        troph = 0;
        hCap = 500;
        colour = color(0, 200, 0);
    }

    void run() {
        if (health < hCap) {
            health += 0.1;
            r += 0.005;
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
        colour = color(125, 150, 50);
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
                eat(o);
            }
        }
        if (random(0, 1) < 0.003) {
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

class Carnivore2 extends Organism {
    Carnivore2(PVector loc, DNA newDNA) {
        super(loc, newDNA);
        type = 3;
        troph = 3;
        hCap = 200;
        colour = color(255, 0, 255);
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
                eat(o);
            }
        }

        if (random(0, 1) < 0.001) {
            DNA newDNA = dna;
            newDNA.mutate(0.001);
            Carnivore2 p = new Carnivore2(location, newDNA);
            org.add(p);
        }
    }
}

class Omnivore1 extends Organism {
    Omnivore1(PVector loc, DNA newDNA) {
        super(loc, newDNA);
        type = 4;
        troph = 2;
        hCap = 200;
        colour = color(0, 0, 255);
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
                eat(o);
            }
        }

        if (random(0, 1) < 0.002) {
            DNA newDNA = dna;
            newDNA.mutate(0.001);
            Omnivore1 p = new Omnivore1(location, newDNA);
            org.add(p);
        }
    }
}
class Omnivore2 extends Organism {
    Omnivore2(PVector loc, DNA newDNA) {
        super(loc, newDNA);
        type = 5;
        troph = 3;
        hCap = 200;
        colour = color(0, 255, 255);
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
                eat(o);
            }
        }

        if (random(0, 1) < 0.0005) {
            DNA newDNA = dna;
            newDNA.mutate(0.001);
            Omnivore2 p = new Omnivore2(location, newDNA);
            org.add(p);
        }
    }
}
