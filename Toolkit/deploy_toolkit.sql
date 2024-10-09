execute immediate from 'deploy/create_schema.sql' using (environment => '{{environment}}');

execute immediate from 'deploy/create_procedure_grants_priv.sql' using (environment => '{{environment}}');

execute immediate from 'deploy/create_procedure_masking_policy.sql' using (environment => '{{environment}}');