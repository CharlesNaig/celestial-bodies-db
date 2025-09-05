-- Create universe database
CREATE DATABASE universe;

-- Connect to universe database
\c universe;

-- Create galaxy table
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    age_in_millions_of_years NUMERIC(10,2),
    has_life BOOLEAN NOT NULL,
    is_spherical BOOLEAN NOT NULL
);

-- Create star table
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    temperature INT,
    mass_in_solar_units NUMERIC(8,2),
    is_main_sequence BOOLEAN NOT NULL
);

-- Create planet table
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    star_id INT NOT NULL REFERENCES star(star_id),
    distance_from_star NUMERIC(10,2),
    diameter_km INT,
    has_atmosphere BOOLEAN NOT NULL,
    has_life BOOLEAN NOT NULL
);

-- Create moon table
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    planet_id INT NOT NULL REFERENCES planet(planet_id),
    diameter_km INT,
    orbital_period_days NUMERIC(8,2),
    is_tidally_locked BOOLEAN NOT NULL
);

-- Create additional table to meet the "at least 5 tables" requirement
CREATE TABLE asteroid (
    asteroid_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    diameter_km INT NOT NULL,
    composition TEXT,
    is_potentially_hazardous BOOLEAN NOT NULL
);

-- Insert data into galaxy table (at least 6 rows)
INSERT INTO galaxy (name, description, age_in_millions_of_years, has_life, is_spherical) VALUES
('Milky Way', 'Our home galaxy, a barred spiral galaxy', 13600.00, true, false),
('Andromeda', 'Nearest major galaxy to the Milky Way', 10000.00, false, false),
('Triangulum', 'Third-largest galaxy in the Local Group', 12000.00, false, false),
('Large Magellanic Cloud', 'Satellite galaxy of the Milky Way', 13000.00, false, false),
('Small Magellanic Cloud', 'Smaller satellite galaxy of the Milky Way', 13000.00, false, false),
('Centaurus A', 'Peculiar galaxy with a supermassive black hole', 12000.00, false, false);

-- Insert data into star table (at least 6 rows)
INSERT INTO star (name, galaxy_id, temperature, mass_in_solar_units, is_main_sequence) VALUES
('Sun', 1, 5778, 1.00, true),
('Proxima Centauri', 1, 3042, 0.12, true),
('Alpha Centauri A', 1, 5790, 1.10, true),
('Alpha Centauri B', 1, 5260, 0.91, true),
('Sirius A', 1, 9940, 2.06, true),
('Betelgeuse', 1, 3500, 20.00, false);

-- Insert data into planet table (at least 12 rows)
INSERT INTO planet (name, star_id, distance_from_star, diameter_km, has_atmosphere, has_life) VALUES
('Mercury', 1, 57.9, 4879, false, false),
('Venus', 1, 108.2, 12104, true, false),
('Earth', 1, 149.6, 12756, true, true),
('Mars', 1, 227.9, 6792, true, false),
('Jupiter', 1, 778.5, 142984, true, false),
('Saturn', 1, 1432.0, 120536, true, false),
('Uranus', 1, 2867.0, 51118, true, false),
('Neptune', 1, 4515.0, 49528, true, false),
('Proxima Centauri b', 2, 7.5, 11000, false, false),
('Alpha Centauri Ab', 3, 120.0, 12000, false, false),
('Alpha Centauri Bb', 4, 90.0, 8000, false, false),
('Sirius Ab', 5, 200.0, 15000, false, false);

-- Insert data into moon table (at least 20 rows)
INSERT INTO moon (name, planet_id, diameter_km, orbital_period_days, is_tidally_locked) VALUES
('Luna', 3, 3475, 27.32, true),
('Phobos', 4, 22, 0.32, true),
('Deimos', 4, 12, 1.26, true),
('Io', 5, 3643, 1.77, true),
('Europa', 5, 3122, 3.55, true),
('Ganymede', 5, 5268, 7.15, true),
('Callisto', 5, 4821, 16.69, true),
('Titan', 6, 5150, 15.95, true),
('Enceladus', 6, 504, 1.37, true),
('Mimas', 6, 396, 0.94, true),
('Iapetus', 6, 1469, 79.33, true),
('Rhea', 6, 1527, 4.52, true),
('Dione', 6, 1123, 2.74, true),
('Tethys', 6, 1062, 1.89, true),
('Miranda', 7, 472, 1.41, true),
('Ariel', 7, 1158, 2.52, true),
('Umbriel', 7, 1169, 4.14, true),
('Titania', 7, 1578, 8.71, true),
('Oberon', 7, 1523, 13.46, true),
('Triton', 8, 2707, 5.88, true);

-- Insert data into asteroid table (at least 3 rows)
INSERT INTO asteroid (name, diameter_km, composition, is_potentially_hazardous) VALUES
('Ceres', 940, 'Rocky and icy', false),
('Vesta', 525, 'Rocky', false),
('Pallas', 512, 'Rocky', false);
