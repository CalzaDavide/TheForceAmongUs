drop database if exists Amongus;
create database Amongus;

use Amongus;

create table Cliente
(
    account_ID      int         NOT NULL AUTO_INCREMENT,
    Nome            varchar(20) NOT NULL,
    Cognome         varchar(20) NOT NULL,
    Pswd            varchar(20) NOT NULL,
    Email           varchar(30) NOT NULL,
    Saldo           double      NOT NULL,
    Indirizzo_Via   varchar(40) NOT NULL,
    Codice_Postale  int         NOT NULL,
    N_civico        int         NOT NULL,
    Totale_carrello double      NOT NULL,

    PRIMARY KEY (account_ID)
);

#possibile implementazione
#create table address
#(
#    address   varchar(40),
#    city      varchar(25),
#    country   varchar(25),
#   post_code int(5)
#);


create table Prodotto
(
    ID_prodotto        int         NOT NULL AUTO_INCREMENT,
    Nome               varchar(20) NOT NULL,
    Quantita           int         NOT NULL,
    percentuale_Sconto double      NOT NULL,
    Costo              double      NOT NULL,
    Espansione         varchar(20) NOT NULL,
    Tipologia          varchar(20) NOT NULL,

    PRIMARY KEY (ID_prodotto)
);

create table Ordine
(
    ID_ordine     int    NOT NULL AUTO_INCREMENT,
    Data_Acquisto date   NOT NULL,
    Importo       double NOT NULL,
    ID_Cliente    int    NOT NULL,
    ID_prodotto   int,

    FOREIGN KEY (ID_Cliente) references Cliente (account_ID),
    FOREIGN KEY (ID_prodotto) references Prodotto (ID_prodotto),

    PRIMARY KEY (ID_ordine)
);