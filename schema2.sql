-- Table des livres
CREATE TABLE Livres (
    id_livre INT PRIMARY KEY AUTO_INCREMENT,  -- Identifiant unique du livre
    titre VARCHAR(255) NOT NULL,              -- Titre du livre
    auteur VARCHAR(255),                      -- Auteur du livre
    genre VARCHAR(100),                       -- Genre du livre
    annee_publication INT,                    -- Année de publication
    disponible BOOLEAN DEFAULT TRUE           -- Indique si le livre est disponible (par défaut, disponible)
);

-- Table des utilisateurs
CREATE TABLE Utilisateurs (
    id_utilisateur INT PRIMARY KEY AUTO_INCREMENT,  -- Identifiant unique de l'utilisateur
    nom VARCHAR(255) NOT NULL,                      -- Nom de l'utilisateur
    prenom VARCHAR(255),                            -- Prénom de l'utilisateur
    email VARCHAR(255) UNIQUE NOT NULL,             -- Email de l'utilisateur, unique
    date_inscription DATE,                          -- Date d'inscription de l'utilisateur
    statut ENUM('actif', 'inactif') DEFAULT 'actif' -- Statut de l'utilisateur (actif ou inactif)
);

-- Table des emprunts
CREATE TABLE Emprunts (
    id_emprunt INT PRIMARY KEY AUTO_INCREMENT,  -- Identifiant unique de l'emprunt
    id_livre INT,                               -- Identifiant du livre emprunté
    id_utilisateur INT,                         -- Identifiant de l'utilisateur ayant emprunté le livre
    date_emprunt DATE NOT NULL,                  -- Date d'emprunt
    date_retour DATE,                            -- Date de retour prévue ou réelle
    FOREIGN KEY (id_livre) REFERENCES Livres(id_livre) ON DELETE CASCADE,  -- Clé étrangère vers la table des livres
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs(id_utilisateur) ON DELETE CASCADE,  -- Clé étrangère vers la table des utilisateurs
    CONSTRAINT chk_emprunt UNIQUE (id_livre, id_utilisateur)  -- Empêche un livre d'être emprunté par le même utilisateur plusieurs fois en même temps
);

-- Table des stocks (Gestion de la quantité de chaque livre)
CREATE TABLE Stocks (
    id_stock INT PRIMARY KEY AUTO_INCREMENT,   -- Identifiant unique du stock
    id_livre INT,                               -- Identifiant du livre
    quantite INT NOT NULL,                      -- Quantité disponible du livre
    FOREIGN KEY (id_livre) REFERENCES Livres(id_livre) ON DELETE CASCADE  -- Clé étrangère vers la table des livres
);

