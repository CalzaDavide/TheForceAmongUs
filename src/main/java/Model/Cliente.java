package Model;

public class Cliente {
    private static int lastID = 0;
    private int id;
    private String nome;
    private String cognome;
    private String email;
    private String pswd;
    private double saldo;
    private String indirizzo_Via;
    private int codice_Postale;
    private int n_Civico;
    private double totale_Carrello;


    public Cliente(String nome, String cognome, String email, String password, double saldo, String indirizzo_Via, int codice_Postale, int n_Civico) {
        this.id = lastID++;
        this.nome = nome;
        this.cognome = cognome;
        this.email = email;
        this.pswd = password;
        this.indirizzo_Via = indirizzo_Via;
        this.saldo = saldo;
        this.codice_Postale = codice_Postale;
        this.n_Civico = n_Civico;
        this.totale_Carrello = 0;
    }
    public Cliente() {
    }


    //------------------------------------------------Getter----------------------------------------------------------//
    public static int generateID(){
        return lastID++;
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

    public String getPswd() {
        return pswd;
    }

    public String getIndirizzo_Via() {
        return indirizzo_Via;
    }

    public double getSaldo() {
        return saldo;
    }

    public int getCodice_Postale() {
        return codice_Postale;
    }

    public int getN_Civico() {
        return n_Civico;
    }

    public double getTotale_Carrello() {
        return totale_Carrello;
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

    public void setPswd(String password) {
        this.pswd = password;
    }

    public void setIndirizzo_Via(String indirizzo) {
        this.indirizzo_Via = indirizzo_Via;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public void setCodice_Postale(int codice_Postale) {
        this.codice_Postale = codice_Postale;
    }

    public void setN_Civico(int n_Civico) {
        this.n_Civico = n_Civico;
    }

    public void setTotale_Carrello(double totale_Carrello) {
        this.totale_Carrello = totale_Carrello;
    }

}
