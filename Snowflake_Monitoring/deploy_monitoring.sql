
execute immediate from 'deploy/create_schema.sql' using (environment => '{{environment}}');

execute immediate from 'deploy/create_table_alerte.sql' using (environment => '{{environment}}');

execute immediate from 'deploy/create_table_wh_monitoring.sql' using (environment => '{{environment}}');