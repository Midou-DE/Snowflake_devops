execute immediate USE ROLE ACCOUNTADMIN;
execute immediate from 'deploy/create_table_3035.sql' using (environment => '{{environment}}');
execute immediate from 'deploy/create_table_popin.sql' using (environment => '{{environment}}');
