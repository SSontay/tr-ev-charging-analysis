-- Question 2: electric cars per public charging socket, Türkiye, every month with socket data
SELECT
    month,
    cars_electric,
    sockets_total,
    sockets_dc,
    ROUND(cars_electric / sockets_total, 1) AS ev_per_socket,
    ROUND(cars_electric / sockets_dc, 1) AS ev_per_dc_socket
FROM national
WHERE sockets_total IS NOT NULL
ORDER BY month;
