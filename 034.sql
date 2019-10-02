/*Please add ; after each select statement*/
CREATE PROCEDURE placesOfInterest()
BEGIN
        SELECT 
                dataCountries.country, 
                SUM(CASE WHEN leisure_activity_type LIKE 'Adventure park'THEN total ELSE 0 END) as adventure_park,
                SUM(CASE WHEN leisure_activity_type LIKE 'Golf'THEN total ELSE 0 END) as golf,
                SUM(CASE WHEN leisure_activity_type LIKE 'River cruise'THEN total ELSE 0 END) as river_cruise,
                SUM(CASE WHEN leisure_activity_type LIKE 'Kart racing'THEN total ELSE 0 END) as kart_racing
        FROM (
                SELECT country, leisure_activity_type, SUM(number_of_places) as total
                FROM countryActivities 
                GROUP BY country, leisure_activity_type 
                ORDER BY country
        ) as dataCountries 
        GROUP BY dataCountries.country 
        ORDER BY dataCountries.country;
    
END