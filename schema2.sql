-- Table des livres
CREATE TABLE IF NOT EXISTS Livres (
    id_livre INTEGER PRIMARY KEY AUTOINCREMENT,
    titre TEXT NOT NULL,
    auteur TEXT,
    genre TEXT,
    annee_publication INTEGER,
    disponible BOOLEAN DEFAULT 1
);

-- Table des utilisateurs
CREATE TABLE IF NOT EXISTS Utilisateurs (
    id_utilisateur INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL,
    prenom TEXT,
    email TEXT UNIQUE NOT NULL,
    date_inscription DATE,
    statut TEXT CHECK(statut IN ('actif', 'inactif')) DEFAULT 'actif'
);

-- Table des emprunts
CREATE TABLE IF NOT EXISTS Emprunts (
    id_emprunt INTEGER PRIMARY KEY AUTOINCREMENT,
    id_livre INTEGER,
    id_utilisateur INTEGER,
    date_emprunt DATE NOT NULL,
    date_retour DATE,
    FOREIGN KEY (id_livre) REFERENCES Livres(id_livre) ON DELETE CASCADE,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs(id_utilisateur) ON DELETE CASCADE,
    UNIQUE(id_livre, id_utilisateur)
);

-- Table des stocks
CREATE TABLE IF NOT EXISTS Stocks (
    id_stock INTEGER PRIMARY KEY AUTOINCREMENT,
    id_livre INTEGER,
    quantite INTEGER NOT NULL,
    FOREIGN KEY (id_livre) REFERENCES Livres(id_livre) ON DELETE CASCADE
);
