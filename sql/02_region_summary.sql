-- Question 2: public charging stations per 10,000 cars and per 100,000 people, by İBBS-1 region
SELECT
    region,
    SUM(public_stations) AS public_stations,
    SUM(cars) AS cars,
    ROUND(SUM(public_stations) / SUM(cars) * 10000, 1) AS stations_per_10k_cars,
    ROUND(SUM(public_stations) / SUM(population_2025) * 100000, 1) AS stations_per_100k_people
FROM provinces
GROUP BY region
ORDER BY stations_per_10k_cars;
