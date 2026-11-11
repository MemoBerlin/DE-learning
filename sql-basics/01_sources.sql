-- Sektion 01: Grain Snapshot vs. History

-- Basics
-- Drei Spalten mit alias fuer die Tabelle auswaehlen
SELECT f.order_no_15, f.mf_order_no, f.vin FROM f_vehicles f;

-- Hier ist die ganze Tabelle
SELECT * FROM f_vehicles;

-- Grain ist hier eine Zeile pro Order
SELECT count(*) AS zeilen, count(DISTINCT order_no_15) AS orders FROM f_vehicles;
-- Beide 13

-- Grain ist hier eine Zeile pro Order-Event
SELECT count(*) AS zeilen, count(DISTINCT order_no_15) AS orders FROM te_orders_history;
-- 8 und 4

-- In der Aufgabe steht basically das (cdaf_latest_posm_datamodel_feature_data.f_vehicles):
SELECT count(*) AS zeilen, count(DISTINCT order_no_15) AS orders
FROM f_vehicles
WHERE eseries IN ('U25', 'F65', 'F66', 'F67', 'J01', 'J05');

-- Gibt es ein JOIN? Dann können Zeilen mehr werden.
-- Gibt es ein GROUP BY? Dann ist eine Zeile eine Gruppe.
-- Beides nein? Dann ist der Grain wie in der Quelltabelle, und WHERE entfernt nur Zeilen.

-- Bei Athena steht immer Datenbank.Tabelle. z.b: cdaf_latest_posm_datamodel_feature_data.f_vehicles

