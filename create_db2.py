import sqlite3

# Connexion à la base de données SQLite
connection = sqlite3.connect('database.db')

# Charger et exécuter le schéma
with open('schema2.sql') as f:
    connection.executescript(f.read())

cur = connection.cursor()

# Insertion de données dans la table Livres
cur.execute("INSERT INTO Livres (titre, auteur, genre, annee_publication, disponible) VALUES (?, ?, ?, ?, ?)", 
            ('Le Petit Prince', 'Antoine de Saint-Exupéry', 'Conte philosophique', 1943, 1))
cur.execute("INSERT INTO Livres (titre, auteur, genre, annee_publication, disponible) VALUES (?, ?, ?, ?, ?)", 
            ('1984', 'George Orwell', 'Science-fiction', 1949, 1))
cur.execute("INSERT INTO Livres (titre, auteur, genre, annee_publication, disponible) VALUES (?, ?, ?, ?, ?)", 
            ('L\'Étranger', 'Albert Camus', 'Roman', 1942, 1))
cur.execute("INSERT INTO Livres (titre, auteur, genre, annee_publication, disponible) VALUES (?, ?, ?, ?, ?)", 
            ('Le Comte de Monte-Cristo', 'Alexandre Dumas', 'Aventure', 1844, 1))

# Insertion de données dans la table Utilisateurs
cur.execute("INSERT INTO Utilisateurs (nom, prenom, email, date_inscription, statut) VALUES (?, ?, ?, ?, ?)",
            ('DUPONT', 'Emilie', 'emilie.dupont@email.com', '2025-01-10', 'actif'))
cur.execute("INSERT INTO Utilisateurs (nom, prenom, email, date_inscription, statut) VALUES (?, ?, ?, ?, ?)",
            ('MARTIN', 'Amandine', 'amandine.martin@email.com', '2025-01-12', 'actif'))
cur.execute("INSERT INTO Utilisateurs (nom, prenom, email, date_inscription, statut) VALUES (?, ?, ?, ?, ?)",
            ('LEFEVRE', 'Thomas', 'thomas.lefevre@email.com', '2025-01-14', 'actif'))

# Insertion de données dans la table Emprunts
cur.execute("INSERT INTO Emprunts (id_livre, id_utilisateur, date_emprunt, date_retour) VALUES (?, ?, ?, ?)",
            (1, 1, '2025-01-15', '2025-02-15'))  # Emilie emprunte "Le Petit Prince"
cur.execute("INSERT INTO Emprunts (id_livre, id_utilisateur, date_emprunt, date_retour) VALUES (?, ?, ?, ?)",
            (2, 2, '2025-01-15', '2025-02-15'))  # Amandine emprunte "1984"

# Insertion de données dans la table Stocks
cur.execute("INSERT INTO Stocks (id_livre, quantite) VALUES (?, ?)", (1, 5))  # 5 copies de "Le Petit Prince"
cur.execute("INSERT INTO Stocks (id_livre, quantite) VALUES (?, ?)", (2, 3))  # 3 copies de "1984"
cur.execute("INSERT INTO Stocks (id_livre, quantite) VALUES (?, ?)", (3, 4))  # 4 copies de "L'Étranger"

# Validation des changements dans la base de données
connection.commit()

# Fermeture de la connexion
connection.close()
