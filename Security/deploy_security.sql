execute immediate from 'deploy/grant_role_priv_for_eloquant.sql' using (environment => '{{environment}}');

execute immediate from 'deploy/create_masking_policy_eloquant.sql' using (environment => '{{environment}}');