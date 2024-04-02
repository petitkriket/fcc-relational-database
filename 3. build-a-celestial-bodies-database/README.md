# SQL Practice - Celestial Bodies Database

```sql

-- Create a database
CREATE DATABASE universe;

-- Create tables
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    contributor_id INT,
    name VARCHAR(100) NOT NULL,
    celestial_identifier VARCHAR(50) UNIQUE NOT NULL,
    distance_from_earth_parsecs NUMERIC(10, 2),
    diameter_parsecs NUMERIC(10, 2),
    mass_kg NUMERIC(10, 2),
    number_of_stars INT DEFAULT 0,
    number_of_planets INT DEFAULT 0,
    number_of_black_holes INT DEFAULT 0,
    number_of_nebulae INT DEFAULT 0,
    number_of_galaxies INT DEFAULT 0,
    central_black_hole_mass_solar_masses NUMERIC(20, 2),
    average_star_density_per_cubic_parsec NUMERIC(20, 2),
    mean_temperature_degrees NUMERIC(10, 2),
    shape TEXT,
    is_barred BOOLEAN DEFAULT FALSE,
    has_central_black_hole BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP,
    discovered_at DATE
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    galaxy_id INT NOT NULL,
    planet_id INTEGER NOT NULL,
    contributor_id INT,
    name VARCHAR(100) NOT NULL,
    celestial_identifier VARCHAR(50) UNIQUE NOT NULL,
    diameter_km NUMERIC(10, 2) NOT NULL,
    mass_kg NUMERIC(10, 2) NOT NULL,
    color VARCHAR(100),
    spectral_class VARCHAR(10),
    luminosity_watts NUMERIC(20, 2),
    temperature_degrees NUMERIC(10, 2),
    age_years NUMERIC(20, 2),
    distance_from_earth_parsecs NUMERIC(20, 2),
    number_of_planets INT DEFAULT 0,
    number_of_moons INT DEFAULT 0,
    type TEXT,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP,
    discovered_at DATE
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    star_id INTEGER  NOT NULL,
    moon_id INTEGER  NOT NULL,
    contributor_id INT,
    name VARCHAR(100) NOT NULL,
    celestial_identifier VARCHAR(50) UNIQUE NOT NULL,
    diameter_km NUMERIC(10, 2) NOT NULL,
    mass_kg NUMERIC(10, 2) NOT NULL,
    color VARCHAR(100),
    orbital_period_days NUMERIC(10, 2),
    distance_from_sun_km NUMERIC(20, 2),
    number_of_moons INT DEFAULT 0,
    atmosphere_composition TEXT,
    is_habitable BOOLEAN DEFAULT FALSE,
    is_inhabited BOOLEAN DEFAULT FALSE,
    population INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP,
    discovered_at DATE
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    planet_id INT NOT NULL,
    contributor_id INT,
    name VARCHAR(100) NOT NULL,
    celestial_identifier VARCHAR(50) UNIQUE NOT NULL,
    diameter_km NUMERIC(10, 2) NOT NULL,
    mass_kg NUMERIC(10, 2) NOT NULL,
    color VARCHAR(100),
    orbital_period_days NUMERIC(10, 2),
    distance_from_planet_km NUMERIC(20, 2),
    atmosphere_composition TEXT,
    is_habitable BOOLEAN DEFAULT FALSE,
    is_inhabited BOOLEAN DEFAULT FALSE,
    population INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP,
    discovered_at DATE
);

CREATE TABLE contributor (
    contributor_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    name VARCHAR(100),
    organization VARCHAR(100),
    occupation VARCHAR(100),
    nationality VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    death_date DATE,
    biography TEXT
);

-- Insert data..
INSERT INTO galaxy (name, celestial_identifier, distance_from_earth_parsecs, diameter_parsecs, mass_kg)
VALUES
('Milky Way', 'Milky Way', 100.00, 100.00, 100.00),
('Andromeda', 'Andromeda', 100.00, 100.00, 100.00),
('Triangulum', 'Triangulum', 100.00, 100.00, 100.00),
('Messier 81', 'Messier 81', 100.00, 100.00, 100.00),
('Messier 82', 'Messier 82', 100.00, 100.00, 100.00),
('Messier 83', 'Messier 83', 100.00, 100.00, 100.00),
('Messier 84', 'Messier 84', 100.00, 100.00, 100.00),
('Messier 85', 'Messier 85', 100.00, 100.00, 100.00),
('Messier 86', 'Messier 86', 100.00, 100.00, 100.00),
('Messier 87', 'Messier 87', 100.00, 100.00, 100.00);

INSERT INTO planet (name, celestial_identifier, diameter_km, mass_kg, distance_from_sun_km, star_id, moon_id, contributor_id)
VALUES
('Earth', 'Sol-3', 100.00, 100.00, 149600000, 1, 1, 1),
('Mars', 'Sol-4', 100.00, 100.00, 227900000, 1, 1, 1),
('Mercury', 'Sol-1', 100.00, 100.00, 57909175, 1, 1, 1),
('Venus', 'Sol-2', 100.00, 100.00, 108208930, 1, 1, 1),
('Jupiter', 'Sol-5', 100.00, 100.00, 778570000, 1, 1, 1),
('Saturn', 'Sol-6', 100.00, 100.00, 1433530000, 1, 1, 1),
('Uranus', 'Sol-7', 100.00, 100.00, 2872460000, 1, 1, 1),
('Neptune', 'Sol-8', 100.00, 100.00, 4495060000, 1, 1, 1),
('Pluto', 'Sol-9', 100.00, 100.00, 5906400000, 1, 1, 1),
('Ceres', 'Sol-10', 100.00, 100.00, 5906400000, 1, 1, 1),
('Cerez', 'Sol-11', 100.00, 100.00, 5906400000, 1, 1, 1),
('Kepler-22b', 'Kepler-22b', 100.00, 100.00, 211200000, 2, 1, 1);

INSERT INTO star (galaxy_id, planet_id, name, celestial_identifier, diameter_km, mass_kg, distance_from_earth_parsecs)
VALUES
(1, 1, 'Sun', 'Sol', 100.00, 100.00, 100.00),
(1, 1, 'Proxima Centauri', 'Proxima Centauri', 100.00, 100.00, 100.00),
(2, 1, 'Alpha Centauri A', 'Alpha Centauri A', 100.00, 100.00, 100.00),
(1, 1, 'Sirius', 'Sirius', 100.00, 100.00, 100.00),
(1, 1, 'Vega', 'Vega', 100.00, 100.00, 100.00),
(1, 1, 'Betelgeuse', 'Betelgeuse', 100.00, 100.00, 100.00),
(1, 1, 'Rigel', 'Rigel', 100.00, 100.00, 100.00),
(1, 1, 'Antares', 'Antares', 100.00, 100.00, 100.00),
(1, 1, 'Pollux', 'Pollux', 100.00, 100.00, 100.00),
(1, 1, 'Arcturus', 'Arcturus', 100.00, 100.00, 100.00),
(1, 1, 'Aldebaran', 'Aldebaran', 100.00, 100.00, 100.00),
(1, 1, 'Altair', 'Altair', 100.00, 100.00, 100.00),
(1, 1, 'Deneb', 'Deneb', 100.00, 100.00, 100.00);

INSERT INTO moon (moon_id, planet_id, name, celestial_identifier, diameter_km, mass_kg, distance_from_planet_km)
VALUES
(1, 1, 'Moon', 'Sol-3-1', 100.00, 100.00, 384400),
(2, 1, 'Phobos', 'Sol-4-1', 100.00, 100.00, 9376),
(3, 1, 'Kepler-22b-1', 'Kepler-22b-1', 100.00, 100.00, 100.00),
(4, 1, 'Venus-1', 'Sol-2-1', 100.00, 100.00, 100.00),
(5, 1, 'Jupiter-1', 'Sol-5-1', 100.00, 100.00, 100.00),
(6, 1, 'Saturn-1', 'Sol-6-1', 100.00, 100.00, 100.00),
(7, 1, 'Uranus-1', 'Sol-7-1', 100.00, 100.00, 100.00),
(8, 1, 'Neptune-1', 'Sol-8-1', 100.00, 100.00, 100.00),
(9, 1, 'Pluto-1', 'Sol-9-1', 100.00, 100.00, 100.00),
(10, 1, 'Ceres-1', 'Sol-10-1', 100.00, 100.00, 100.00),
(11, 1, 'Cerez-1', 'Sol-11-1', 100.00, 100.00, 100.00),
(12, 1, 'Kepler-22b-2', 'Kepler-22b-2', 100.00, 100.00, 100.00),
(13, 1, 'Moon-1', 'Moon-1', 100.00, 100.00, 100.00),
(14, 1, 'Moon-2', 'Moon-2', 100.00, 100.00, 100.00),
(15, 1, 'Moon-3', 'Moon-3', 100.00, 100.00, 100.00),
(16, 1, 'Moon-4', 'Moon-4', 100.00, 100.00, 100.00),
(17, 1, 'Moon-5', 'Moon-5', 100.00, 100.00, 100.00),
(18, 1, 'Moon-6', 'Moon-6', 100.00, 100.00, 100.00),
(19, 1, 'Moon-7', 'Moon-7', 100.00, 100.00, 100.00),
(20, 1, 'Moon-8', 'Moon-8', 100.00, 100.00, 100.00);

INSERT INTO contributor (contributor_id, full_name, organization, occupation, nationality, birth_date, death_date)
VALUES
(1, 'Carl Sagan', 'NASA', 'Astronomer', 'American', '1934-11-09', '1996-12-20'),
(2, 'Neil deGrasse Tyson', 'NASA', 'Astrophysicist', 'American', '1958-10-05', NULL),
(3, 'Stephen Hawking', 'NASA', 'Theoretical Physicist', 'British', '1942-01-08', '2018-03-14'),
(4, 'Albert Einstein', 'NASA', 'Theoretical Physicist', 'German', '1879-03-14', '1955-04-18'),
(5, 'Isaac Newton', 'NASA', 'Mathematician', 'British', '1643-01-04', '1727-03-31'),
(6, 'Galileo Galilei', 'NASA', 'Astronomer', 'Italian', '1564-02-15', '1642-01-08'),
(7, 'Johannes Kepler', 'NASA', 'Astronomer', 'German', '1571-12-27', '1630-11-15'),
(8, 'Edwin Hubble', 'NASA', 'Astronomer', 'American', '1889-11-20', '1953-09-28'),
(9, 'Vera Rubin', 'NASA', 'Astronomer', 'American', '1928-07-23', '2016-12-25'),
(10, 'Margaret Geller', 'NASA', 'Astrophysicist', 'American', '1947-06-08', NULL),
(11, 'Andrea Ghez', 'NASA', 'Astrophysicist', 'American', '1965-06-16', NULL),
(12, 'Katherine Johnson', 'NASA', 'Mathematician', 'American', '1918-08-26', '2020-02-24'),
(13, 'Mary Jackson', 'NASA', 'Engineer', 'American', '1921-04-09', '2005-02-11'),
(14, 'Dorothy Vaughan', 'NASA', 'Mathematician', 'American', '1910-09-20', '2008-11-10');


-- foreign keys and constraints
ALTER TABLE galaxy ADD FOREIGN KEY (contributor_id) REFERENCES contributor(contributor_id);
ALTER TABLE galaxy ADD UNIQUE (galaxy_id);

ALTER TABLE star ADD FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id);
ALTER TABLE star ADD FOREIGN KEY (planet_id) REFERENCES planet (planet_id);
ALTER TABLE star ADD UNIQUE (star_id);

ALTER TABLE planet ADD FOREIGN KEY (star_id) REFERENCES star (star_id);
ALTER TABLE planet ADD FOREIGN KEY (moon_id) REFERENCES moon (moon_id);
ALTER TABLE planet ADD UNIQUE (planet_id);

ALTER TABLE moon ADD FOREIGN KEY (planet_id) REFERENCES planet (planet_id);
ALTER TABLE moon ADD FOREIGN KEY (contributor_id) REFERENCES contributor (contributor_id);
ALTER TABLE moon ADD UNIQUE (moon_id);

ALTER TABLE contributor ADD PRIMARY KEY (contributor_id);
ALTER TABLE contributor ADD UNIQUE (contributor_id);
```