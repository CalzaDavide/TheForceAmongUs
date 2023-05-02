package Model;

public class Cliente {


    private static int lastID = 0;
    private int id;
    private String nome;
    private String cognome;
    private String email;
    private String password;
    private String indirizzo;
    private double saldo;

    public Cliente(String nome, String cognome, String email, String password, String indirizzo, double saldo) {
        this.id = lastID++;
        this.nome = nome;
        this.cognome = cognome;
        this.email = email;
        this.password = password;
        this.indirizzo = indirizzo;
        this.saldo = saldo;
    }


    //------------------------------------------------Getter----------------------------------------------------------//
    public static int getLastID() {
        return lastID;
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getCognome() {
        return cognome;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getIndirizzo() {
        return indirizzo;
    }

    public double getSaldo() {
        return saldo;
    }


    //------------------------------------------------Setter----------------------------------------------------------//
    public void setId(int id) {
        this.id = id;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setIndirizzo(String indirizzo) {
        this.indirizzo = indirizzo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

}
