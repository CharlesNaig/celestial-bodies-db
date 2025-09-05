-- Verification script to check all requirements
\c universe;

-- List all tables
\dt

-- Check table structures
\d galaxy
\d star
\d planet
\d moon
\d asteroid

-- Count rows in each table
SELECT 'Galaxy count:' as table_name, COUNT(*) as row_count FROM galaxy
UNION ALL
SELECT 'Star count:', COUNT(*) FROM star
UNION ALL
SELECT 'Planet count:', COUNT(*) FROM planet
UNION ALL
SELECT 'Moon count:', COUNT(*) FROM moon
UNION ALL
SELECT 'Asteroid count:', COUNT(*) FROM asteroid;

-- Check foreign key relationships
SELECT 
    'Stars with galaxy references:' as check_name,
    COUNT(*) as count
FROM star s
JOIN galaxy g ON s.galaxy_id = g.galaxy_id
UNION ALL
SELECT 
    'Planets with star references:',
    COUNT(*)
FROM planet p
JOIN star s ON p.star_id = s.star_id
UNION ALL
SELECT 
    'Moons with planet references:',
    COUNT(*)
FROM moon m
JOIN planet p ON m.planet_id = p.planet_id;
