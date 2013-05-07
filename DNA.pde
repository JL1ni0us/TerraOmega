class DNA {
  float[] geneSeq;

  DNA() {
    geneSeq = new float[4];
    geneSeq[0] = random(0, 1);
    geneSeq[1] = random(0, 1);
    geneSeq[2] = random(0, 1);
    geneSeq[3] = random(0, 1);
  }

  DNA(float[] newGene) {
    geneSeq = newGene;
  }

  void mutate(float chance) {
    for (int i = 0; i < geneSeq.length; i++) {
      if (random(0, 1) < chance) {
        geneSeq[i] = random(0, 1);
      }
    }
  }
}

