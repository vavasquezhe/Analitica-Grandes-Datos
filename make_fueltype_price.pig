
-- carga de datos desde la carpeta local
cars_table = LOAD 'data/cars_subset.csv' USING PigStorage(',')
    AS (
            car_id:int,
            make:chararray,
            fuel_type:chararray,
            length:float,
            width:float,
            height:float,
            price:int

    );

specific_columns = FOREACH cars_table GENERATE make, fuel_type, price;
STORE specific_columns INTO 'output';
