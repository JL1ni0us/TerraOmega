final float TOTAL_TYPES = 6;
final boolean T = true;
final boolean F = false;
boolean[][] fc = {
    {
        F, T, F, T, F, T
    }
    , 
    {
        F, F, T, T, T, T
    }
    , 
    {
        F, F, F, T, F, T
    }
    , 
    {
        F, F, F, F, F, F
    }
    , 
    {
        F, F, F, T, F, T
    }
    , 
    {
        F, F, F, F, F, F
    }
};

boolean edible(Organism a, Organism b) {
    if (a.troph == b.troph) {
        if (a.health > b.health * 2) {
            return T;
        } 
        else {
            return F;
        }
    } 
    else {
        return fc[a.type][b.type];
    }
}

