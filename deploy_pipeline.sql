
execute immediate from 'Eloquant/deploy_eloquant.sql' using (environment => '{{environment}}');

execute immediate from 'Colugel/deploy_colugel.sql' using (environment => '{{environment}}');

execute immediate from 'Toolkit/deploy_toolkit.sql' using (environment => '{{environment}}');

execute immediate from 'Security/deploy_security.sql' using (environment => '{{environment}}');

execute immediate from 'Snowflake_DML/deploy_dml.sql' using (environment => '{{environment}}');

execute immediate from 'Snowflake_Monitoring/deploy_monitoring.sql' using (environment => '{{environment}}');
