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
words = FOREACH cars_table GENERATE FLATTEN(TOKENIZE(fuel_type)) AS word;
grouped = GROUP words BY word;
wordcount = FOREACH grouped GENERATE group, COUNT(words);
STORE wordcount INTO 'output_wordcount';
