final float TOTAL_TYPES = 6;
final boolean T = true;
final boolean F = false;
boolean[][] fc = {
  {
    F, T, F, T, T, T
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
  if (random(0, 1) < (a.dna.geneSeq[2] * b.dna.geneSeq[3])) {
    if (b.r > a.r * 2) {
      return F;
    }
    if (a.troph == b.troph) {
      if (a.troph > 1) {
        if (a.health > b.health * 2) {
          return T;
        } 
        else {
          return F;
        }
      }
      else {
        return F;
      }
    } 
    else if (a.troph < b.troph) {
      if (a.troph > 1) {
        if (a.health > b.health * 10) {
          return T;
        } 
        else {
          return F;
        }
      }
      else {
        return F;
      }
    }
    else {
      if (fc[b.type][a.type]) {
        return T;
      } 
      else {
        return F;
      }
    }
  } 
  else return F;
}

