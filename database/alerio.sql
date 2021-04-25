create schema alerio;
use alerio;
create table cliente
(
	email varchar(40) primary key,
    nome varchar(50) not null,
    cognome varchar(50) not null,
    pwd varchar(15) unique null,
    genere char not null check(genere in ('F','M')),/*F per femmina, M per maschio*/
    registrato boolean not null
    );

create table prodotto
(
	codice varchar(15) primary key,
    prezzo_attuale double not null,
    data_di_aggiunta date not null,
    collezione varchar(40) unique not null,
    categoria varchar(40) unique not null,
    colore varchar(30) unique not null,
    informazioni varchar(100) unique not null,
    taglia char unique not null check(taglia in ('S', 'M', 'L')), 
    in_vendita boolean not null
);

create table wish_list
(
	email_cliente varchar(40),
    codice_prodotto varchar(15),
    primary key(email_cliente,  codice_prodotto),
    foreign key (email_cliente) references cliente(email)
		on update cascade
        on delete cascade,
	foreign key (codice_prodotto) references prodotto(codice)
		on update cascade
        on delete cascade
);

create table informazioni_di_consegna
(
	codice varchar(15) primary key,
    telefono varchar(20) not null,
    nominativo varchar(30) unique not null,
    citta varchar(40) unique not null,
    cap char(5),
    numero_civico int not null,
    via varchar(60) not null
);

create table registra
(
	email_cliente varchar(40),
    codice_consegna varchar(15),
    primary key(email_cliente, codice_consegna),
    foreign key (email_cliente) references cliente(email)
		on update cascade
        on delete cascade,
	foreign key (codice_consegna) references informazioni_di_consegna(codice)
		on update cascade
        on delete cascade
);

create table carta_di_credito
(
	numero_carta varchar(16) primary key,
	data_scadenza date unique not null,
    nominativo varchar(40) unique not null
);

create table utilizzo_carta
(
	email_cliente varchar(40),
    numero_carta varchar(16),
    primary key(email_cliente, numero_carta),
    foreign key (email_cliente) references cliente(email)
		on update cascade
        on delete cascade,
	foreign key (numero_carta) references carta_di_credito(numero_carta)
		on update cascade
        on delete cascade
);

create table ordine
(
	codice varchar(15),
    email_cliente varchar(40),
    data_di_acquisto date not null,
    iva double not null,
    costo_totale double unique not null,
    tipo_utente char unique not null check(tipo_utente in ('R', 'G')), /*R per registrato,G per guest*/
    numero_carta varchar(16) unique not null,
    codice_consegna varchar(15),
    primary key(codice, email_cliente),
    foreign key(email_cliente) references cliente(email)
		on update cascade
        on delete cascade,
	foreign key (numero_carta) references carta_di_credito(numero_carta)
		on update cascade
        on delete cascade,
	foreign key (codice_consegna) references informazioni_di_consegna(codice)
		on update cascade
        on delete cascade
);

create table composizione
(
	codice_prodotto varchar(15),
    codice_ordine varchar(15),
    quantita int unique not null,
    prezzo double unique not null,
    primary key(codice_prodotto, codice_ordine),
    foreign key (codice_prodotto) references prodotto(codice)
		on update cascade
        on delete cascade,
	foreign key (codice_ordine) references ordine(codice)
		on update cascade
        on delete cascade
);

create table codice_sconto
(
	codice varchar(10) primary key,
    valore double unique not null,
    prezzo_minimo double unique not null,
    riutilizzbile boolean not null,
    scadenza date unique
);

create table sconto
(
	codice_ordine varchar(15),
    codice_sconto varchar(10),
    primary key(codice_ordine, codice_sconto),
    foreign key (codice_ordine) references ordine(codice)
		on update cascade
        on delete cascade,
	foreign key (codice_sconto) references codice_sconto(codice)
		on update cascade
        on delete cascade
);



















    
    