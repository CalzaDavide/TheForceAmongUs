package Model;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Locale;

public class Prodotto {

    private static int lastID = 0;
    int id;
    String nome;
    String tipologia;
    String espansione;
    double costo;
    double percentuale_sconto;

    public static int generateID() {
        lastID++;
        return lastID;
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

    public double getPrezzoScontato(){
        Double ps = costo - (costo*percentuale_sconto/100);
        String psFormat = String.format(Locale.US, "%.2f", ps);
        return Double.parseDouble(psFormat);
    }

    public double getPercentuale_sconto() {
        return percentuale_sconto;
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

}