package Model;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
public class Cliente {
    private String nome;
    private String cognome;
    private String email;
    private String pswd;
    private String regione;
    private String provincia;
    private String indirizzo_via;
    private int codice_Postale;
    private int n_Civico;
    private double totale_Carrello;
    private boolean adminValue;


    public Cliente() {
    }


    //------------------------------------------------Getter----------------------------------------------------------//

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

    public String getRegione() {
        return regione;
    }

    public String getProvincia() {
        return provincia;
    }

    public String getIndirizzo_Via() {
        return indirizzo_via;
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

    public boolean isAdmin() {
        return adminValue;
    }


    //------------------------------------------------Setter----------------------------------------------------------//

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPswd(String password) { // password è inserita dall’utente
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-1");
            digest.reset();
            digest.update(password.getBytes(StandardCharsets.UTF_8));
            this.pswd = String.format("%040x", new BigInteger(1, digest.digest()));
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public void setRegione(String regione) {
        this.regione = regione;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public void setIndirizzo_Via(String indirizzo_via) {
        this.indirizzo_via = indirizzo_via;
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

    public void setAdminValue(boolean adminValue) {
        this.adminValue = adminValue;
    }
}
