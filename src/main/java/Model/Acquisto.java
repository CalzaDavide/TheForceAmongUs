package Model;

import java.util.Date;
import java.util.GregorianCalendar;

public class Acquisto {
    public static int lastId = 0;

    int id;
    Date data;
    float importo;
    int idCliente;

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

    public int getIdCliente() {
        return idCliente;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public void setImporto(float importo) {
        this.importo = importo;
    }
}