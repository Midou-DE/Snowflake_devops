
execute immediate from 'Eloquant/verify_eloquant.sql' using (environment => '{{environment}}');

execute immediate from 'Colugel/verify_colugel.sql' using (environment => '{{environment}}');

execute immediate from 'Toolkit/verify_security.sql' using (environment => '{{environment}}');
