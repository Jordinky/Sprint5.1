-- Crear la base de dades
CREATE DATABASE pizzeria;
USE pizzeria;

CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    cognoms VARCHAR(100) NOT NULL,
    adreça VARCHAR(255) NOT NULL,
    codi_postal VARCHAR(10) NOT NULL,
    localitat VARCHAR(100) NOT NULL,
    provincia VARCHAR(100) NOT NULL,
    telefon VARCHAR(15) NOT NULL
);


CREATE TABLE productes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    descripcio TEXT,
    imatge VARCHAR(255),
    preu DECIMAL(10, 2) NOT NULL,
    tipus ENUM('pizza', 'hamburguesa', 'beguda') NOT NULL
);


CREATE TABLE categories_pizza (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);


CREATE TABLE pizzas_categories (
    pizza_id INT,
    categoria_id INT,
    FOREIGN KEY (pizza_id) REFERENCES productes(id),
    FOREIGN KEY (categoria_id) REFERENCES categories_pizza(id)
);


CREATE TABLE botigues (
    id INT AUTO_INCREMENT PRIMARY KEY,
    adreça VARCHAR(255) NOT NULL,
    codi_postal VARCHAR(10) NOT NULL,
    localitat VARCHAR(100) NOT NULL,
    provincia VARCHAR(100) NOT NULL
);


CREATE TABLE empleats (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    cognoms VARCHAR(100) NOT NULL,
    nif VARCHAR(15) NOT NULL,
    telefon VARCHAR(15) NOT NULL,
    rol ENUM('cuiner', 'repartidor') NOT NULL,
    botiga_id INT,
    FOREIGN KEY (botiga_id) REFERENCES botigues(id)
);


CREATE TABLE comandes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    tipus_comanda ENUM('domicili', 'botiga') NOT NULL,
    preu_total DECIMAL(10, 2) NOT NULL,
    client_id INT,
    botiga_id INT,
    repartidor_id INT,
    data_hora_lliurament DATETIME,
    FOREIGN KEY (client_id) REFERENCES clients(id),
    FOREIGN KEY (botiga_id) REFERENCES botigues(id),
    FOREIGN KEY (repartidor_id) REFERENCES empleats(id)
);


CREATE TABLE detalls_comanda (
    comanda_id INT,
    producte_id INT,
    quantitat INT NOT NULL,
    FOREIGN KEY (comanda_id) REFERENCES comandes(id),
    FOREIGN KEY (producte_id) REFERENCES productes(id)
);

INSERT INTO clients (nom, cognoms, adreça, codi_postal, localitat, provincia, telefon) VALUES
('Joan', 'Martínez', 'Carrer Major 123', '08001', 'Barcelona', 'Barcelona', '600123456'),
('Maria', 'González', 'Avinguda Catalunya 45', '46001', 'València', 'València', '610987654'),
('Pere', 'López', 'Passeig de Gràcia 12', '07001', 'Palma', 'Illes Balears', '620456789');


INSERT INTO botigues (adreça, codi_postal, localitat, provincia) VALUES
('Carrer del Comerç 1', '08003', 'Barcelona', 'Barcelona'),
('Avinguda Blasco Ibáñez 14', '46010', 'València', 'València');


INSERT INTO empleats (nom, cognoms, nif, telefon, rol, botiga_id) VALUES
('Carles', 'Rodríguez', '12345678A', '630987654', 'cuiner', 1),
('Anna', 'Sánchez', '87654321B', '640987654', 'repartidor', 1),
('David', 'García', '11223344C', '650987654', 'cuiner', 2),
('Laura', 'Fernández', '99887766D', '660987654', 'repartidor', 2);


INSERT INTO categories_pizza (nom) VALUES
('Clàssica'),
('Especial');


INSERT INTO productes (nom, descripcio, imatge, preu, tipus) VALUES
('Pizza Margarita', 'Pizza amb formatge i tomàquet', 'margarita.jpg', 8.50, 'pizza'),
('Pizza Quatre Formatges', 'Pizza amb quatre tipus de formatge', 'quatre_formatges.jpg', 9.50, 'pizza'),
('Hamburguesa Clàssica', 'Hamburguesa de vedella amb enciam i tomàquet', 'hamburguesa_classica.jpg', 7.00, 'hamburguesa'),
('Beguda Cola', 'Beguda de cola 33cl', 'cola.jpg', 2.00, 'beguda');


INSERT INTO pizzas_categories (pizza_id, categoria_id) VALUES
(1, 1), -- Pizza Margarita a categoria Clàssica
(2, 2); -- Pizza Quatre Formatges a categoria Especial


INSERT INTO comandes (data_hora, tipus_comanda, preu_total, client_id, botiga_id, repartidor_id, data_hora_lliurament) VALUES
('2024-09-19 13:45:00', 'domicili', 18.00, 1, 1, 2, '2024-09-19 14:15:00'),
('2024-09-19 12:30:00', 'botiga', 15.50, 2, 2, NULL, NULL);

INSERT INTO detalls_comanda (comanda_id, producte_id, quantitat) VALUES
(1, 1, 1), -- 1 Pizza Margarita a la comanda 1
(1, 4, 2), -- 2 Begudes Cola a la comanda 1
(2, 2, 1), -- 1 Pizza Quatre Formatges a la comanda 2
(2, 3, 1); -- 1 Hamburguesa Clàssica a la comanda 2

//Llista quants productes de tipus “Begudes”. s'han venut en una determinada localitat.
SELECT b.localitat, SUM(dc.quantitat) AS total_begudes_vendudes
FROM comandes c
JOIN detalls_comanda dc ON c.id = dc.comanda_id
JOIN productes p ON dc.producte_id = p.id
JOIN botigues b ON c.botiga_id = b.id
WHERE p.tipus = 'beguda'
AND b.localitat = 'Barcelona' -- Canvia 'Barcelona' per la localitat desitjada
GROUP BY b.localitat;
//Llista quantes comandes ha efectuat un determinat empleat/da.
SELECT e.nom, e.cognoms, COUNT(c.id) AS total_comandes_gestionades
FROM comandes c
JOIN empleats e ON c.repartidor_id = e.id
WHERE e.nom = 'Anna' AND e.cognoms = 'Sánchez' -- Canvia pel nom i cognoms de l'empleat/da desitjat/da
GROUP BY e.nom, e.cognoms;

