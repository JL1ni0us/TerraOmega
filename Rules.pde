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
        if (a.troph > 1) {
            if (a.health > b.health * 2) {
                System.out.println("aye");
                return T;
            } 
            else {
                System.out.println("nay");
                return F;
            }
        }
        else return false;
    } 
    else {
        System.out.println("check");
        if (fc[b.type][a.type]) {
            System.out.println("aye");
            return T;
        } 
        else {
            System.out.println("nay");
            return F;
        }
    }
}

