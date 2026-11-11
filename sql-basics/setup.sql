CREATE OR REPLACE TABLE f_vehicles AS
SELECT * FROM read_csv('f_vehicles.csv', types={'order_no_15':'VARCHAR','order_type':'VARCHAR','ivs_order_status':'VARCHAR','f2date_actual':'DATE'});

CREATE OR REPLACE TABLE te_orders_history AS
SELECT * FROM read_csv('orders_history.csv', types={'order_no_15':'VARCHAR','ivs_order_status':'VARCHAR','event_ts':'TIMESTAMP'});
