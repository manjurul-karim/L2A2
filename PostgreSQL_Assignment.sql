-- Active: 1747645887932@@localhost@5432@conservation_db@public

--* 1️⃣ Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'

INSERT INTO
    rangers (name, region)
VALUES ('Derek Fox', 'Coastal plains')

SELECT * from rangers

--* 2️⃣ Count unique species ever sighted.

SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;


--* 3️⃣ Find all sightings where the location includes "Pass".

SELECT * from sightings WHERE location LIKE '%Pass%';


--* 4️⃣ List each ranger's name and their total number of sightings.

select name, count(si.ranger_id) as total_sightings
from rangers as r
    JOIN sightings as si on r.ranger_id = si.ranger_id
GROUP BY
    r.name
ORDER BY r.name;

--* 5️⃣ List species that have never been sighted.

SELECT common_name
FROM species sp
    LEFT JOIN sightings si ON sp.species_id = si.species_id
WHERE
    si.species_id IS NULL;

--* 6️⃣ Show the most recent 2 sightings.

SELECT common_name, sighting_time, name
from
    species as sp
    JOIN sightings as si ON sp.species_id = si.species_id
    JOIN rangers as r on r.ranger_id = si.ranger_id
ORDER BY sighting_time DESC
LIMIT 2


--* 7️⃣ Update all species discovered before year 1800 to have status 'Historic'.

UPDATE species set conservation_status ='Historic' where EXTRACT(YEAR FROM discovery_date) < 1800;


SELECT * from species;


--* 8️⃣ Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.

SELECT 
    sighting_id,
    
    CASE
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM 
    sightings;


--* 9️⃣ Delete rangers who have never sighted any species

DELETE FROM rangers
WHERE ranger_id NOT IN (
    SELECT DISTINCT ranger_id FROM sightings
);

SELECT * from rangers