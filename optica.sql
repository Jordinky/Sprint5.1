create database optica

use optica

CREATE TABLE proveidor (
    id_proveidor INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    carrer VARCHAR(255) NOT NULL,
    numero VARCHAR(50),
    pis VARCHAR(50),
    porta VARCHAR(50),
    ciutat VARCHAR(255) NOT NULL,
    codi_postal VARCHAR(20),
    pais VARCHAR(100) NOT NULL,
    telefon VARCHAR(20),
    fax VARCHAR(20),
    nif VARCHAR(20) NOT NULL
);

CREATE TABLE ulleres (
    id_ulleres INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(255) NOT NULL,
    graduacio_vidre_esquerre DECIMAL(5, 2),
    graduacio_vidre_dret DECIMAL(5, 2),
    tipus_muntura ENUM('flotant', 'pasta', 'metàl·lica'),
    color_muntura VARCHAR(50),
    color_vidre_esquerre VARCHAR(50),
    color_vidre_dret VARCHAR(50),
    preu DECIMAL(10, 2),
    id_proveidor INT,
    FOREIGN KEY (id_proveidor) REFERENCES proveidor(id_proveidor)
);

CREATE TABLE client (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    carrer VARCHAR(255),
    numero VARCHAR(50),
    pis VARCHAR(50),
    porta VARCHAR(50),
    ciutat VARCHAR(255),
    codi_postal VARCHAR(20),
    pais VARCHAR(100),
    telefon VARCHAR(20),
    email VARCHAR(255),
    data_registre DATE,
    recomanat_per INT,
    FOREIGN KEY (recomanat_per) REFERENCES client(id_client)
);

CREATE TABLE empleat (
    id_empleat INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    cognom VARCHAR(255),
    telefon VARCHAR(20),
    email VARCHAR(255)
);

CREATE TABLE venda (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT,
    id_empleat INT,
    id_ulleres INT,
    data_venda DATE,
    quantitat INT,
    preu_total DECIMAL(10, 2),
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_empleat) REFERENCES empleat(id_empleat),
    FOREIGN KEY (id_ulleres) REFERENCES ulleres(id_ulleres)
);
INSERT INTO proveidor (nom, carrer, numero, pis, porta, ciutat, codi_postal, pais, telefon, fax, nif)
VALUES
('Proveïdor A', 'Carrer Gran', '123', '3', '1', 'Barcelona', '08001', 'Spain', '932000001', '932000100', 'A12345678'),
('Proveïdor B', 'Carrer Major', '56', '2', '2', 'Madrid', '28013', 'Spain', '915000002', '915000200', 'B23456789'),
('Proveïdor C', 'Avinguda Catalunya', '78', '1', '1', 'Valencia', '46001', 'Spain', '963000003', '963000300', 'C34567890'),
('Proveïdor D', 'Carrer de les Flors', '45', '4', '2', 'Sevilla', '41003', 'Spain', '954000004', '954000400', 'D45678901'),
('Proveïdor E', 'Passeig de Gràcia', '89', '5', '3', 'Barcelona', '08008', 'Spain', '932000005', '932000500', 'E56789012'),
('Proveïdor F', 'Carrer de la Pau', '34', '2', '1', 'Bilbao', '48001', 'Spain', '944000006', '944000600', 'F67890123'),
('Proveïdor G', 'Carrer Nou', '67', '3', '2', 'Alicante', '03001', 'Spain', '965000007', '965000700', 'G78901234'),
('Proveïdor H', 'Carrer del Mar', '12', '1', '1', 'Málaga', '29001', 'Spain', '952000008', '952000800', 'H89012345'),
('Proveïdor I', 'Carrer del Sol', '89', '2', '1', 'Zaragoza', '50001', 'Spain', '976000009', '976000900', 'I90123456'),
('Proveïdor J', 'Carrer Ample', '45', '4', '3', 'Granada', '18001', 'Spain', '958000010', '958001000', 'J01234567'),
('Proveïdor K', 'Carrer de la Llum', '56', '1', '1', 'Tarragona', '43001', 'Spain', '977000011', '977001100', 'K12345678'),
('Proveïdor L', 'Rambla Nova', '78', '2', '2', 'Lleida', '25001', 'Spain', '973000012', '973001200', 'L23456789'),
('Proveïdor M', 'Carrer de l\'Arc', '12', '3', '1', 'Girona', '17001', 'Spain', '972000013', '972001300', 'M34567890'),
('Proveïdor N', 'Avinguda del Parc', '45', '4', '2', 'Palma', '07001', 'Spain', '971000014', '971001400', 'N45678901'),
('Proveïdor O', 'Carrer de les Fonts', '67', '1', '1', 'Toledo', '45001', 'Spain', '925000015', '925001500', 'O56789012'),
('Proveïdor P', 'Carrer del Castell', '34', '2', '2', 'Salamanca', '37001', 'Spain', '923000016', '923001600', 'P67890123'),
('Proveïdor Q', 'Carrer de la Riera', '56', '3', '3', 'Santander', '39001', 'Spain', '942000017', '942001700', 'Q78901234'),
('Proveïdor R', 'Avinguda de l\'Estació', '89', '4', '1', 'Valladolid', '47001', 'Spain', '983000018', '983001800', 'R89012345'),
('Proveïdor S', 'Carrer de la Rosa', '12', '1', '2', 'Oviedo', '33001', 'Spain', '985000019', '985001900', 'S90123456'),
('Proveïdor T', 'Carrer del Riu', '45', '2', '3', 'Cáceres', '10001', 'Spain', '927000020', '927002000', 'T01234567');
INSERT INTO ulleres (marca, graduacio_vidre_esquerre, graduacio_vidre_dret, tipus_muntura, color_muntura, color_vidre_esquerre, color_vidre_dret, preu, id_proveidor)
VALUES
('Ray-Ban', 1.25, 1.50, 'metàl·lica', 'negre', 'transparent', 'transparent', 150.50, 1),
('Oakley', 0.75, 1.00, 'pasta', 'blau', 'blau', 'blau', 200.00, 2),
('Persol', 1.50, 1.75, 'flotant', 'gris', 'verd', 'verd', 250.25, 3),
('Maui Jim', 1.00, 1.00, 'pasta', 'marró', 'marró', 'marró', 175.99, 4),
('Carrera', 0.50, 0.75, 'metàl·lica', 'blanc', 'negre', 'negre', 180.75, 5),
('Ray-Ban', 1.75, 2.00, 'flotant', 'daurat', 'transparent', 'transparent', 220.30, 1),
('Oakley', 1.25, 1.50, 'pasta', 'vermell', 'groc', 'groc', 210.00, 2),
('Persol', 1.00, 1.25, 'flotant', 'negre', 'blau', 'blau', 230.10, 3),
('Maui Jim', 0.75, 1.00, 'pasta', 'blau', 'blau', 'blau', 240.50, 4),
('Carrera', 0.50, 0.50, 'metàl·lica', 'verd', 'verd', 'verd', 170.75, 5),
('Ray-Ban', 0.75, 1.00, 'pasta', 'gris', 'gris', 'gris', 260.99, 1),
('Oakley', 1.50, 1.75, 'metàl·lica', 'negre', 'groc', 'groc', 300.20, 2),
('Persol', 1.00, 1.50, 'flotant', 'blau', 'blau', 'blau', 280.45, 3),
('Maui Jim', 1.25, 1.50, 'pasta', 'vermell', 'vermell', 'vermell', 190.99, 4),
('Carrera', 0.50, 0.75, 'metàl·lica', 'daurat', 'groc', 'groc', 250.00, 5),
('Ray-Ban', 1.75, 2.00, 'pasta', 'negre', 'blau', 'blau', 210.99, 1),
('Oakley', 1.00, 1.25, 'metàl·lica', 'blanc', 'transparent', 'transparent', 220.00, 2),
('Persol', 0.75, 1.00, 'flotant', 'negre', 'negre', 'negre', 230.10, 3),
('Maui Jim', 1.50, 1.50, 'pasta', 'blau', 'blau', 'blau', 175.25, 4),
('Carrera', 1.00, 1.00, 'metàl·lica', 'marró', 'marró', 'marró', 200.75, 5);
INSERT INTO client (nom, carrer, numero, pis, porta, ciutat, codi_postal, pais, telefon, email, data_registre, recomanat_per)
VALUES
('Anna Lopez', 'Carrer Sant Joan', '34', '2', '1', 'Barcelona', '08002', 'Spain', '932111111', 'anna@example.com', '2023-01-15', NULL),
('Joan Garcia', 'Carrer Major', '45', '1', '2', 'Madrid', '28014', 'Spain', '915222222', 'joan@example.com', '2023-01-20', 1),
('Laura Torres', 'Carrer de la Pau', '56', '3', '1', 'Valencia', '46002', 'Spain', '963333333', 'laura@example.com', '2023-02-01', 2),
('Marta Roca', 'Carrer del Sol', '78', '4', '2', 'Sevilla', '41004', 'Spain', '954444444', 'marta@example.com', '2023-02-05', 1),
('David Ruiz', 'Passeig de Gràcia', '89', '5', '3', 'Barcelona', '08009', 'Spain', '932555555', 'david@example.com', '2023-03-10', 3),
('Pere Vidal', 'Carrer Gran', '12', '2', '1', 'Bilbao', '48002', 'Spain', '944666666', 'pere@example.com', '2023-03-12', NULL),
('Jordi Ferrer', 'Carrer del Mar', '45', '1', '2', 'Alicante', '03002', 'Spain', '965777777', 'jordi@example.com', '2023-04-01', 5),
('Laura Gomez', 'Carrer Ample', '67', '3', '1', 'Málaga', '29002', 'Spain', '952888888', 'laura@example.com', '2023-04-15', 6),
('Carlos Pujol', 'Carrer Nou', '34', '4', '3', 'Zaragoza', '50002', 'Spain', '976999999', 'carlos@example.com', '2023-05-01', NULL),
('Maria Casals', 'Carrer del Castell', '12', '1', '1', 'Granada', '18002', 'Spain', '958111111', 'maria@example.com', '2023-05-12', 8),
('Eva Soler', 'Carrer de les Flors', '45', '2', '2', 'Tarragona', '43002', 'Spain', '977222222', 'eva@example.com', '2023-06-10', 9),
('Xavier Puig', 'Carrer Major', '56', '3', '1', 'Lleida', '25002', 'Spain', '973333333', 'xavier@example.com', '2023-06-20', NULL),
('Maria Costa', 'Carrer de l\'Arc', '67', '1', '3', 'Girona', '17002', 'Spain', '972444444', 'maria@example.com', '2023-07-01', 11),
('Raul Serra', 'Carrer del Riu', '78', '4', '2', 'Toledo', '45002', 'Spain', '925555555', 'raul@example.com', '2023-07-15', 12),
('Joan Font', 'Carrer de les Fonts', '34', '2', '1', 'Salamanca', '37002', 'Spain', '923666666', 'joan@example.com', '2023-08-01', NULL),
('Marta Oliver', 'Carrer de la Riera', '45', '3', '3', 'Santander', '39002', 'Spain', '942777777', 'marta@example.com', '2023-08-10', 14),
('Laura Serra', 'Avinguda de l\'Estació', '12', '1', '2', 'Valladolid', '47002', 'Spain', '983888888', 'laura@example.com', '2023-09-01', 16),
('Pere Casals', 'Carrer del Mar', '67', '2', '1', 'Oviedo', '33002', 'Spain', '985999999', 'pere@example.com', '2023-09-12', 18),
('David Roca', 'Carrer de la Rosa', '34', '3', '1', 'Cáceres', '10002', 'Spain', '927000000', 'david@example.com', '2023-10-01', 19),
('Anna Vidal', 'Carrer del Riu', '12', '4', '3', 'Málaga', '29003', 'Spain', '952123456', 'anna@example.com', '2023-10-15', NULL);
INSERT INTO empleat (nom, cognom, telefon, email)
VALUES
('Pere', 'Martinez', '932100001', 'pere.martinez@example.com'),
('Anna', 'Lopez', '915100002', 'anna.lopez@example.com'),
('Joan', 'Garcia', '963100003', 'joan.garcia@example.com'),
('Laura', 'Torres', '954100004', 'laura.torres@example.com'),
('David', 'Roca', '932100005', 'david.roca@example.com'),
('Marta', 'Costa', '944100006', 'marta.costa@example.com'),
('Xavier', 'Soler', '965100007', 'xavier.soler@example.com'),
('Maria', 'Casals', '952100008', 'maria.casals@example.com'),
('Carlos', 'Vidal', '976100009', 'carlos.vidal@example.com'),
('Eva', 'Pujol', '958100010', 'eva.pujol@example.com'),
('Raul', 'Font', '977100011', 'raul.font@example.com'),
('Jordi', 'Serra', '973100012', 'jordi.serra@example.com'),
('Laura', 'Oliver', '972100013', 'laura.oliver@example.com'),
('Marta', 'Ferrer', '971100014', 'marta.ferrer@example.com'),
('Joan', 'Gomez', '925100015', 'joan.gomez@example.com'),
('Anna', 'Roca', '923100016', 'anna.roca@example.com'),
('David', 'Lopez', '942100017', 'david.lopez@example.com'),
('Xavier', 'Torres', '983100018', 'xavier.torres@example.com'),
('Pere', 'Vidal', '985100019', 'pere.vidal@example.com'),
('Marta', 'Roca', '927100020', 'marta.roca@example.com');
INSERT INTO venda (id_client, id_empleat, id_ulleres, data_venda, quantitat, preu_total)
VALUES
(1, 1, 1, '2023-03-01', 1, 150.50),
(2, 2, 2, '2023-03-05', 1, 200.00),
(3, 3, 3, '2023-03-10', 1, 250.25),
(4, 4, 4, '2023-03-15', 1, 175.99),
(5, 5, 5, '2023-03-20', 1, 180.75),
(6, 1, 6, '2023-03-25', 1, 220.30),
(7, 2, 7, '2023-03-30', 1, 210.00),
(8, 3, 8, '2023-04-01', 1, 230.10),
(9, 4, 9, '2023-04-05', 1, 240.50),
(10, 5, 10, '2023-04-10', 1, 170.75),
(11, 1, 11, '2023-04-15', 1, 260.99),
(12, 2, 12, '2023-04-20', 1, 300.20),
(13, 3, 13, '2023-04-25', 1, 280.45),
(14, 4, 14, '2023-05-01', 1, 190.99),
(15, 5, 15, '2023-05-05', 1, 250.00),
(16, 1, 16, '2023-05-10', 1, 210.99),
(17, 2, 17, '2023-05-15', 1, 220.00),
(18, 3, 18, '2023-05-20', 1, 230.10),
(19, 4, 19, '2023-05-25', 1, 175.25),
(20, 5, 20, '2023-06-01', 1, 200.75);


//Consultes de proba
//Llista el total de compres d’un client/a.
select count(id_venda) from venda where id_client = 3
Llista les diferents ulleres que ha venut un empleat durant un any.
select id_ulleres from venda where id_empleat = 1 and data_venda between '2023-01-01' and '2023-12-31'
Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
select id_proveidor from proveidor where id_proveidor in (select id_proveidor from ulleres where id_ulleres in (select id_ulleres from venda)) 
