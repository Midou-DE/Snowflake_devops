

execute immediate from 'deploy/create_udf_function_eloquant.sql' using (environment => '{{environment}}');
execute immediate from 'deploy/create_task_udf_eloquant.sql' using (environment => '{{environment}}');