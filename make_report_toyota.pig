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
    
filtered = FILTER cars_table BY NOT (make MATCHES 'toyota');
STORE filtered INTO 'output_toyota';
