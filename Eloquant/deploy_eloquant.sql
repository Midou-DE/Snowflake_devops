
execute immediate from 'deploy/create_table_3035.sql' using (environment => '{{environment}}');
execute immediate from 'deploy/create_table_popin.sql' using (environment => '{{environment}}');
execute immediate from 'deploy/create_table_devis.sql' using (environment => '{{environment}}');
execute immediate from 'deploy/create_table_udf_result.sql' using (environment => '{{environment}}');
