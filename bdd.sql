CREATE DATABASE gestion_educative;
CREATE TABLE Departement (
    id_departement INT PRIMARY KEY ,
    intitule TEXT NOT NULL,
    responsable INT, -- Référence à un Enseignant
    FOREIGN KEY (responsable) REFERENCES Enseignant(id_enseignant)
);

-- Création de la table Enseignant
CREATE TABLE Enseignant (
    id_enseignant INT PRIMARY KEY,
    nom TEXT NOT NULL,
    prenom TEXT NOT NULL,
    email TEXT NOT NULL,
    grade TEXT NOT NULL,
    departement INT, -- Référence à un Département
    FOREIGN KEY (departement) REFERENCES Departement(id_departement)
);

-- Création de la table Filiere
CREATE TABLE Filiere (
    id_filiere INT PRIMARY KEY ,
    intitule TEXT NOT NULL,
    responsable INT, -- Référence à un Enseignant
    departement INT, -- Référence à un Département
    FOREIGN KEY (responsable) REFERENCES Enseignant(id_enseignant),
    FOREIGN KEY (departement) REFERENCES Departement(id_departement)
);

-- Création de la table Module
CREATE TABLE Module (
    id_module INT PRIMARY KEY ,
    intitule TEXT NOT NULL,
    filiere INT, -- Référence à une Filiere
    professeur INT, -- Référence à un Enseignant
    FOREIGN KEY (filiere) REFERENCES Filiere(id_filiere),
    FOREIGN KEY (professeur) REFERENCES Enseignant(id_enseignant)
);

-- Création de la table Etudiant
CREATE TABLE Etudiant (
    id_etudiant INT PRIMARY KEY,
    nom TEXT NOT NULL,
    prenom TEXT NOT NULL,
    email TEXT NOT NULL,
    apogee INT NOT NULL,
    filiere INT, -- Référence à une Filiere
    FOREIGN KEY (filiere) REFERENCES Filiere(id_filiere)
);