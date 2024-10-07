execute immediate USE ROLE ACCOUNTADMIN;
execute immediate from 'Eloquant/deploy_eloquant.sql' using (environment => '{{environment}}');
