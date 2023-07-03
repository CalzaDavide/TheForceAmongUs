package Model;

public class Coinvolgimento {
    int quantita;
    Prodotto Prodotto;
    int idAcquisto;

    public void setQuantita(int quantita) {
        this.quantita = quantita;
    }

    public void setIdAcquisto(int idAcquisto) {
        this.idAcquisto = idAcquisto;
    }

    public void setProdotto(Model.Prodotto prodotto) {
        Prodotto = prodotto;
    }

    public int getQuantita() {
        return quantita;
    }

    public int getIdAcquisto() {
        return idAcquisto;
    }

    public Model.Prodotto getProdotto() {
        return Prodotto;
    }
}
