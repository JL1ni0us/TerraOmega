class DNA {
    float[] geneSeq;

    DNA() {
        geneSeq = new float[1];
        geneSeq[0] = random(0, 1);
    }

    DNA(float[] newGene) {
        geneSeq = newGene;
    }

    void mutate(float chance) {
        if (random(0, 1) < chance) {
            for (int i = 0; i < geneSeq.length; i++) {
                geneSeq[i] = random(0, 1);
            }
        }
    }
}
