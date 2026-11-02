-- Question 4: priority score for public charging investment, top 20 provinces

-- The three indicators
WITH indicators AS (
    SELECT
        province,
        region,
        public_stations / cars * 10000 AS stations_per_10k_cars,
        no_parking_share_2021,
        new_cars_2026_jan_sep / population_2025 * 1000 AS new_cars_per_1000_people
    FROM provinces
),

-- Percentile rank of each indicator (0 = lowest priority, 1 = highest), like PERCENTRANK in Excel.
-- Fewer stations per car means a bigger gap, so that indicator is sorted in descending order.
ranks AS (
    SELECT
        *,
        PERCENT_RANK() OVER (ORDER BY stations_per_10k_cars DESC) AS rank_gap,
        PERCENT_RANK() OVER (ORDER BY no_parking_share_2021) AS rank_no_parking,
        PERCENT_RANK() OVER (ORDER BY new_cars_per_1000_people) AS rank_new_cars
    FROM indicators
)

-- RANK gives provinces with the same score the same place; rounding removes floating point noise
SELECT
    RANK() OVER (ORDER BY ROUND(rank_gap + rank_no_parking + rank_new_cars, 9) DESC) AS priority_rank,
    province,
    region,
    ROUND((rank_gap + rank_no_parking + rank_new_cars) / 3, 2) AS priority_score
FROM ranks
ORDER BY priority_rank, province
LIMIT 20;
