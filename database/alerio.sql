create schema alerio;
use alerio;
create table cliente
(
	email varchar(40) primary key,
    nome varchar(50),
    cognome varchar(50),
    pwd varchar(15),
    genere char check(genere in ('F','M'))/*F per femmina, M per maschio*/
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
    cliente varchar(40),
    telefono varchar(20) not null,
    nominativo varchar(30) not null,
    citta varchar(40) not null,
    cap char(5),
    numero_civico int not null,
    via varchar(60) not null,
    foreign key (cliente) references cliente(email)
		on update cascade
        on delete cascade
);


create table carta_di_credito
(
	codice int primary key auto_increment,
	numero_carta varchar(16),
    cliente varchar(40),
	data_scadenza date not null,
    nominativo varchar(40) not null,
    foreign key (cliente) references cliente(email)
		on update cascade
        on delete cascade
);

create table ordine
(
	codice int auto_increment primary key,
    email_cliente varchar(40),
    data_di_acquisto date not null,
    iva double not null,
    costo_totale double not null,
    codice_carta int not null,
    codice_consegna int,
    foreign key(email_cliente) references cliente(email)
		on update cascade
        on delete set null,
	foreign key (codice_carta) references carta_di_credito(codice)
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



















    
    