package Model;

public class Prodotto {

    private static int lastID = 0;
    int id;
    String nome;
    String tipologia;
    String espansione;
    double costo;
    double percentuale_sconto;
    int quantita;

    public static int generateID(){
        return lastID++;
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getTipologia() {
        return tipologia;
    }

    public String getEspansione() {
        return espansione;
    }

    public double getCosto() {
        return costo;
    }

    public double getPercentuale_sconto() {
        return percentuale_sconto;
    }

    public int getQuantita() {
        return quantita;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setTipologia(String tipologia) {
        this.tipologia = tipologia;
    }

    public void setEspansione(String espansione) {
        this.espansione = espansione;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public void setPercentuale_sconto(double percentuale_sconto) {
        this.percentuale_sconto = percentuale_sconto;
    }

    public void setQuantita(int quantita) {
        this.quantita = quantita;
    }
}