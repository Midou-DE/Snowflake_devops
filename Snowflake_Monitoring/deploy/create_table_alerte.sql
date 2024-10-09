USE DATABASE TEST_ADK;

USE SCHEMA MONITORING_LMG;


CREATE OR ALTER TABLE warehouse_alerts (
    alert_id INTEGER AUTOINCREMENT,
    warehouse_name STRING,
    alert_message STRING,
    alert_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE TASK warehouse_credit_alert_task
  WAREHOUSE = QUICKSTART_WH
  SCHEDULE = 'USING CRON 5 * * * * UTC'  -- Run 5 minutes after the usage task
AS
  INSERT INTO warehouse_alerts (warehouse_name, alert_message)
  SELECT 
      WAREHOUSE_NAME,
      'High credit usage: ' || SUM(CREDITS_USED) || ' credits in the last hour' AS alert_message
  FROM 
      SNOWFLAKE.ACCOUNT_USAGE.WAREHOUSE_METERING_HISTORY
  WHERE 
      WAREHOUSE_NAME = 'QUICKSTART_WH'
      AND START_TIME >= DATEADD(HOUR, -1, CURRENT_TIMESTAMP())
  GROUP BY 
      WAREHOUSE_NAME
  HAVING 
      SUM(CREDITS_USED) > 5;  -- Set the credit threshold for alert

ALTER TASK warehouse_credit_alert_task RESUME;

-- if we use create or alter we must comment this ALTER TASK warehouse_credit_alert_task RESUME; ins the second deploy
-- even the first create task