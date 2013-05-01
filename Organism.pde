class Organism {    

    PVector location;
    DNA dna;
    float health, xoff, yoff, r, maxSpd;
    color colour;
    int type;

    Organism(PVector loc, DNA newDNA) {
        location = l.get();
        health = 200;
        xoff = random(1000);
        yoff = random(1000);
        dna = newDNA;
        maxspeed = map(dna.genes[0], 0, 1, 15, 0);
        r = map(dna.genes[0], 0, 1, 0, 50);
    }

    void run() {
    }

    void eat(Organism f) {
    }
    void render() {
        ellipseMode(CENTER);
        noStroke();
        fill();
        ellipse(location.x, location.y, r, r);
    }
}

class Plant extends Organism {

    Plant(PVector loc, DNA newDNA) {
        super(loc, newDNA);
        type = 0;
    }
}

