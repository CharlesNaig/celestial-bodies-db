# Universe Database Project - Requirements Checklist

## ✅ All Requirements Met

### Database Structure
- ✅ Created database named `universe`
- ✅ Connected to database with `\c universe`
- ✅ Added tables: `galaxy`, `star`, `planet`, `moon`, and `asteroid` (5+ tables)

### Primary Keys
- ✅ Each table has a primary key that automatically increments (SERIAL)
- ✅ Primary keys follow naming convention: `table_name_id`
  - `galaxy_id`, `star_id`, `planet_id`, `moon_id`, `asteroid_id`

### Column Requirements
- ✅ Each table has a `name` column of type VARCHAR(50)
- ✅ Used INT data type for multiple non-primary/foreign key columns:
  - `temperature`, `diameter_km` in multiple tables
- ✅ Used NUMERIC data type:
  - `age_in_millions_of_years`, `mass_in_solar_units`, `distance_from_star`, `orbital_period_days`
- ✅ Used TEXT data type:
  - `description`, `composition`
- ✅ Used BOOLEAN data type on multiple columns:
  - `has_life`, `is_spherical`, `is_main_sequence`, `has_atmosphere`, `is_tidally_locked`, `is_potentially_hazardous`

### Foreign Key Relationships
- ✅ `star` table has foreign key `galaxy_id` referencing `galaxy(galaxy_id)`
- ✅ `planet` table has foreign key `star_id` referencing `star(star_id)`
- ✅ `moon` table has foreign key `planet_id` referencing `planet(planet_id)`
- ✅ Foreign key columns have same name as referenced columns

### Data Requirements
- ✅ Galaxy table: 6 rows
- ✅ Star table: 6 rows
- ✅ Planet table: 12 rows
- ✅ Moon table: 20 rows
- ✅ Asteroid table: 3 rows (additional table)

### Column Constraints
- ✅ At least 3 columns per table
- ✅ Galaxy, star, planet, moon tables have 5+ columns each
- ✅ At least 2 columns per table don't accept NULL values
- ✅ At least one column per table is UNIQUE (name columns)
- ✅ All `name` columns are VARCHAR type

### Additional Features
- ✅ Creative column names: `age_in_millions_of_years`, `mass_in_solar_units`, `distance_from_star`, `orbital_period_days`, `is_tidally_locked`, `is_potentially_hazardous`
- ✅ Realistic astronomical data for planets, moons, stars, and galaxies
- ✅ Database dump created: `universe.sql`

## Tables Created

1. **galaxy** (6 rows)
   - Columns: galaxy_id, name, description, age_in_millions_of_years, has_life, is_spherical

2. **star** (6 rows)
   - Columns: star_id, name, galaxy_id, temperature, mass_in_solar_units, is_main_sequence

3. **planet** (12 rows)
   - Columns: planet_id, name, star_id, distance_from_star, diameter_km, has_atmosphere, has_life

4. **moon** (20 rows)
   - Columns: moon_id, name, planet_id, diameter_km, orbital_period_days, is_tidally_locked

5. **asteroid** (3 rows)
   - Columns: asteroid_id, name, diameter_km, composition, is_potentially_hazardous

