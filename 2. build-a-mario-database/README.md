

# Postgres

```bash
# Se connecter à la base de données
psql -U username -d database_name

# Créer une base de données
CREATE DATABASE database_name;

# Supprimer une base de données
DROP DATABASE database_name;

# Voir les tables
\l

# Inspecter une table particuliere
\d table_name

```
# SQL
```sql

-- Créer une table sql:
CREATE TABLE characters(
  character_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  favorite_color VARCHAR(30) NOT NULL,
  homeland VARCHAR(30) NOT NULL,
    PRIMARY KEY (character_id)
)

CREATE TABLE characters(character_id  SERIAL PRIMARY KEY, name VARCHAR(60) NOT NULL, favorite_color VARCHAR(30) NOT NULL, homeland VARCHAR(60));

-- Ajouter une ligne sql:
INSERT INTO 'second_table' ('id', 'username') VALUES (NULL, 'Mario');

-- ajouter une colonne sql:
ALTER TABLE 'ps_product' ADD 'id_shop' INT(30) NOT NULL DEFAULT '1' AFTER 'id_product';

-- Ajouter une colonne à une table avec des contraintes
ALTER TABLE characters ADD COLUMN name VARCHAR(30) NOT NULL;

-- Voir les lignes:
 SELECT * FROM second_table;

-- Ajouter plusieurs lignes: 
INSERT INTO characters(name, homeland, favorite_color) VALUES('Peach', 'Mushroom Kingdom', 'Pink');
INSERT INTO 'characters' ('name', 'homeland', 'favorite_color') VALUES ('Toadstool' , 'Mushroom Kingdom', 'Red'), ('Bowser', 'Mushroom Kingdom', 'Green');

 -- Supprimer une ligne
DELETE FROM second_table WHERE username='Mario';

-- Mettre à jour une ligne
-- ici on met à jour la couleur préférée de Daisy via son nom
UPDATE characters SET favorite_color='orange' WHERE name='Daisy';

-- Supprimer une colonne
ALTER TABLE 'ps_product' DROP 'id_shop';

-- Renommer une base de données
ALTER DATABASE 'first_database' RENAME TO 'mario_database';

-- Ordre de tri
SELECT * FROM characters ORDER BY id ASC;


-- Ajout d'une PRIMARY KEY
ALTER TABLE characters ADD PRIMARY KEY (character_id);


-- Ajout d'une FOREIGN KEY
-- ici on ajoute une clé étrangère character_id à la table more_info qui fait référence à la colonne character_id de la table characters
ALTER TABLE more_info ADD COLUMN character_id INT REFERENCES characters(character_id);

-- Ajouter la contrainte unique
-- ici dans le cadre d'une relation 1:1, on ajoute une contrainte unique à la colonne character_id de la table more_info pour s'assurer qu'il n'y a pas de doublons
ALTER TABLE more_info ADD UNIQUE(character_id);
ALTER TABLE more_info ALTER COLUMN character_id SET NOT NULL;

-- Inserer une enregistrement d'une relation 1:1 avec sa clé étrangère
-- ici on met à jour la colonne character_id de la table more_info pour qu'elle fasse référence à la colonne character_id de la table characters
INSERT INTO more_info(birthday, height, weight, character_id) VALUES('1981-07-09', 155, 64.5, 1);

-- Rechercher via SELECT
SELECT * FROM characters WHERE name='Mario';
SELECT * FROM users WHERE id=100 or id=250 LIMIT 2;
UPDATE more_info SET weight=59.1 WHERE character_id=7;

-- Renommer une colonne
ALTER TABLE more_info RENAME COLUMN height TO height_in_cm;
ALTER TABLE more_info RENAME COLUMN weight TO weight_in_kg;


-- Creation d'une table avec ses colonnes a la volée
CREATE TABLE sounds(sound_id SERIAL PRIMARY KEY);
CREATE TABLE actions(action_id SERIAL PRIMARY KEY);
-- Ajout d'une colonne à une table avec une contrainte
ALTER TABLE sounds ADD COLUMN filename VARCHAR(40) NOT NULL UNIQUE;

-- Ajout d'une colonne foreign key
ALTER TABLE sounds ADD COLUMN character_id INT REFERENCES characters(character_id);


-- Dans le cadre d'une n:n many to many relation, on crée une table de jonction
-- Le nom de la table de jonction est generalement la concatenation des noms des tables en relation
-- On commence par la table principale  ex: character_actions

CREATE TABLE character_actions(
  character_id INT REFERENCES characters(character_id),
  action_id INT REFERENCES actions(action_id),
  PRIMARY KEY (character_id, action_id)
);

-- ou encore en découpé, commande par commande..
ALTER TABLE character_actions ADD COLUMN character_id INT NOT NULL;
ALTER TABLE character_actions ADD FOREIGN KEY(character_id) REFERENCES characters(character_id);

ALTER TABLE character_actions ADD COLUMN action_id INT NOT NULL;
ALTER TABLE character_actions ADD FOREIGN KEY(action_id) REFERENCES actions(action_id);

ALTER TABLE character_actions ADD PRIMARY KEY(character_id, action_id);

-- Insertion exemple...
INSERT INTO character_actions(character_id, action_id) VALUES(7,1);

-- Affichage du contenu d'une table et JOIN d'une autre table pour enrichir les informations

SELECT * FROM more_info;
SELECT * FROM table_1 FULL JOIN table_2 ON table_1.primary_key_column = table_2.foreign_key_column;
SELECT * FROM characters FULL JOIN more_info ON characters.character_id = more_info.character_id;
SELECT * FROM characters FULL JOIN sounds ON characters.character_id = sounds.character_id;


SELECT * FROM character_actions
FULL JOIN characters ON character_actions.character_id = characters.character_id
FULL JOIN more_info ON character_actions.character_id = more_info.character_id;
```
