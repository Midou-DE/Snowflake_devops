
execute immediate from 'Eloquant/deploy_eloquant.sql' using (environment => '{{environment}}');

execute immediate from 'Colugel/deploy_colugel.sql' using (environment => '{{environment}}');
