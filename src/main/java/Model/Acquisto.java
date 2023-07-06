package Model;


import java.sql.Date;
import java.util.GregorianCalendar;

public class Acquisto {
    public static int lastId = 0;

    int id;
    Date data;
    float importo;
    String emailCliente;

    public static int generateId(){
        lastId++;
        return lastId;
    }

    public int getId() {
        return id;
    }

    public Date getData() {
        return data;
    }

    public float getImporto() {
        return importo;
    }

    public String getEmailCliente() {
        return emailCliente;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public void setEmailCliente(String emailCliente) {
        this.emailCliente = emailCliente;
    }

    public void setImporto(float importo) {
        this.importo = importo;
    }
}