CREATE DATABASE pizzeria;
USE pizzeria;

CREATE TABLE Client (
    id INT NOT NULL PRIMARY KEY,
    nom CHAR(50) NOT NULL,
    cognoms CHAR(50) NOT NULL,
    adreça CHAR(50) NOT NULL,
    codi_postal INT(6) NOT NULL,
    localitat CHAR(50) NOT NULL,
    provincia CHAR(50) NOT NULL
);

CREATE TABLE Categoria (
    id INT NOT NULL PRIMARY KEY,
    nom CHAR(30) NOT NULL
);

CREATE TABLE Productes (
    id INT NOT NULL PRIMARY KEY,
    nom CHAR(30) NOT NULL,
    descripcio CHAR(100) NOT NULL,
    imatge CHAR(200) NOT NULL,
    preu FLOAT(2) NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id)
);

CREATE TABLE Botiga (
    id INT NOT NULL PRIMARY KEY,
    adreça CHAR(80) NOT NULL,
    codi_postal INT(6) NOT NULL,
    localitat CHAR(20) NOT NULL,
    provincia CHAR(20) NOT NULL
);

CREATE TABLE Empleat (
    id INT NOT NULL PRIMARY KEY,
    nom CHAR(20) NOT NULL,
    cognoms CHAR(50) NOT NULL,
    nif CHAR(20) NOT NULL,
    telefon INT(9) NOT NULL,
    carrec CHAR(20) NOT NULL,
    botiga_id INT NOT NULL,
    FOREIGN KEY (botiga_id) REFERENCES Botiga(id)
);

CREATE TABLE Carret_compra (
    id INT NOT NULL PRIMARY KEY
);

CREATE TABLE Comanda (
    id INT NOT NULL PRIMARY KEY,
    client_id INT NOT NULL,
    data DATE NOT NULL,
    tipus_entrega CHAR NOT NULL,
    productes INT NOT NULL,
    quantitat INT(1) NOT NULL,
    repartidor_id INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Client(id),
    FOREIGN KEY (productes) REFERENCES Carret_compra(id),
    FOREIGN KEY (repartidor_id) REFERENCES Empleat(id)
);

CREATE TABLE detail_carret_compra (
    id INT NOT NULL PRIMARY KEY,
    id_carret INT NOT NULL,
    id_producte INT NOT NULL,
    FOREIGN KEY (id_carret) REFERENCES Carret_compra(id),
    FOREIGN KEY (id_producte) REFERENCES Productes(id)
);

