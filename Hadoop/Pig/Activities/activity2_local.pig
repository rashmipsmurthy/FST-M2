-- Load the CSV file
salesTable = LOAD '/root/input.txt' USING PigStorage(' ') AS (lines:chararray,Price:chararray,Payment_Type:chararray,Name:chararray,City:chararray,State:chararray,Country:chararray);
--Group data using the country column
GroupByCountry = GROUP salesTable BY lines;
-- Generate result format
CountByCountry = FOREACH GroupByCountry GENERATE CONCAT((chararray)$0, CONCAT(':', (chararray)COUNT($1)));
-- Save result in HDFS folder
STORE CountByCountry INTO '/root/activity2localOutput' USING PigStorage('\t');
