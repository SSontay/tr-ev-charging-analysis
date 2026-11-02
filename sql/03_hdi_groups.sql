-- Question 3: five development groups by Province Human Development Index (2022)

-- NTILE(5) sorts the provinces by HDI and splits them into five groups of (almost) equal size
WITH grouped AS (
    SELECT
        *,
        NTILE(5) OVER (ORDER BY hdi_2022) AS hdi_group
    FROM provinces
)

SELECT
    hdi_group,
    COUNT(*) AS provinces,
    ROUND(SUM(cars) / SUM(population_2025) * 1000, 1) AS cars_per_1000_people,
    ROUND(SUM(public_stations) / SUM(population_2025) * 100000, 1) AS stations_per_100k_people,
    ROUND(SUM(public_stations) / SUM(cars) * 10000, 1) AS stations_per_10k_cars
FROM grouped
GROUP BY hdi_group
ORDER BY hdi_group;
