package Model;

public class OggettoQuantita {
    //Questa classe serve a contenere un prodotto con la relativa quantità,
    //e viene utilizzata principalmente per gestire il carrello
    int quantita;
    Prodotto prodotto;

    public int getQuantita() {
        return quantita;
    }

    public Prodotto getProdotto() {
        return prodotto;
    }

    public void setQuantita(int quantita) {
        this.quantita = quantita;
    }

    public void setProdotto(Prodotto prodotto) {
        this.prodotto = prodotto;
    }
}
