package Model;

import java.util.ArrayList;

public class AcquistoCoinvolgimento {
    Acquisto acquisto;
    ArrayList<Coinvolgimento> prodottiCoinvolti;

    public Acquisto getAcquisto() {
        return acquisto;
    }

    public ArrayList<Coinvolgimento> getProdottiCoinvolti() {
        return prodottiCoinvolti;
    }

    public void setAcquisto(Acquisto acquisto) {
        this.acquisto = acquisto;
    }

    public void setProdottiCoinvolti(ArrayList<Coinvolgimento> prodottiCoinvolti) {
        this.prodottiCoinvolti = prodottiCoinvolti;
    }
}
