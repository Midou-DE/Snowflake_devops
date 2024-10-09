USE DATABASE TEST_ADK;
USE SCHEMA ELOQUANT;

CREATE OR REPLACE TASK add_numbers_task
  WAREHOUSE = QUICKSTART_WH  -- Specify the warehouse to run the task
  SCHEDULE = 'USING CRON 0 * * * * UTC'  -- Run the task every hour
  AS
  INSERT INTO udf_results (num1, num2, result)
  SELECT uniform(1, 10, random())  as num1, uniform(1, 10, random()) as num2 ,add_two_numbers(num1,num2);


ALTER TASK add_numbers_task RESUME;