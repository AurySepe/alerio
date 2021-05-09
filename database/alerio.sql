create schema alerio;
use alerio;
create table cliente
(
	email varchar(40) primary key,
    nome varchar(50),
    cognome varchar(50),
    pwd varchar(15),
    genere char check(genere in ('F','M')),/*F per femmina, M per maschio*/
    registrato boolean not null
    );

create table modello_prodotto
(
	codice int  primary key auto_increment,
    nome varchar(50) not null,
    data_di_aggiunta date not null,
    collezione varchar(40)  not null,
    categoria varchar(40)  not null,
    informazioni varchar(100)  not null
);

create table varianti_modello_per_colore
(
	codice int  primary key auto_increment,
    modello_prodotto int not null,
    colore varchar(30)  not null,
    in_vendita boolean not null,
    prezzo_attuale double,
    foreign key (modello_prodotto) references modello_prodotto(codice)
    on update cascade
    on delete cascade,
    unique(colore,modello_prodotto)
);

create table prodotto
(
	codice int  primary key auto_increment,
    varianti_modello_per_colore int not null,
	taglia char  not null check(taglia in ('S', 'M', 'L')),
    quantita int,
    foreign key (varianti_modello_per_colore) references varianti_modello_per_colore(codice)
    on update cascade
    on delete cascade,
    unique(taglia,varianti_modello_per_colore)

);

create table immagini
(
	codice int auto_increment primary key,
    img blob not null,
    posizione int not null check(posizione >= 1),
    varianti_modello_per_colore int not null,
    foreign key (varianti_modello_per_colore) references varianti_modello_per_colore(codice)
    on update cascade
    on delete cascade,
    unique(posizione,varianti_modello_per_colore)
);

create table wish_list
(
	cliente varchar(40),
    varianti_modello_per_colore int,
    primary key(cliente,  varianti_modello_per_colore),
    foreign key (cliente) references cliente(email)
		on update cascade
        on delete cascade,
	foreign key (varianti_modello_per_colore) references varianti_modello_per_colore(codice)
		on update cascade
        on delete cascade
);

create table informazioni_di_consegna
(
	codice int auto_increment primary key,
    telefono varchar(20) not null,
    nominativo varchar(30) not null,
    citta varchar(40) not null,
    cap char(5),
    numero_civico int not null,
    via varchar(60) not null
);

create table registra
(
	email_cliente varchar(40),
    codice_consegna int,
    primary key(email_cliente, codice_consegna),
    foreign key (email_cliente) references cliente(email)
		on update cascade
        on delete cascade,
	foreign key (codice_consegna) references informazioni_di_consegna(codice)
		on update cascade
        on delete no action
);

create table carta_di_credito
(
	numero_carta varchar(16) primary key,
	data_scadenza date not null,
    nominativo varchar(40) not null
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
        on delete no action
);

create table ordine
(
	codice int auto_increment primary key,
    email_cliente varchar(40),
    data_di_acquisto date not null,
    iva double not null,
    costo_totale double not null,
    tipo_utente char not null check(tipo_utente in ('R', 'G')), /*R per registrato,G per guest*/
    numero_carta varchar(16) not null,
    codice_consegna int,
    foreign key(email_cliente) references cliente(email)
		on update cascade
        on delete set null,
	foreign key (numero_carta) references carta_di_credito(numero_carta)
		on update cascade
        on delete no action,
	foreign key (codice_consegna) references informazioni_di_consegna(codice)
		on update cascade
        on delete no action
);

create table composizione
(
	codice_prodotto int,
    codice_ordine int,
    quantita int not null,
    prezzo double not null,
    primary key(codice_prodotto, codice_ordine),
    foreign key (codice_prodotto) references prodotto(codice)
		on update cascade
        on delete no action,
	foreign key (codice_ordine) references ordine(codice)
		on update cascade
        on delete cascade
);

create table codice_sconto
(
	codice varchar(10) primary key,
    valore double not null,
    prezzo_minimo double not null,
    riutilizzbile boolean not null,
    scadenza date
);

create table sconto
(
	codice_ordine int,
    codice_sconto varchar(10),
    primary key(codice_ordine, codice_sconto),
    foreign key (codice_ordine) references ordine(codice)
		on update cascade
        on delete cascade,
	foreign key (codice_sconto) references codice_sconto(codice)
		on update cascade
        on delete no action
);



















    
    