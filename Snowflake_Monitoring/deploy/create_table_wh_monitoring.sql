USE DATABASE TEST_ADK;

USE SCHEMA MONITORING_LMG;

CREATE OR REPLACE TABLE warehouse_monitoring (
    warehouse_name STRING,
    total_credits_used NUMBER,
    --total_minutes_used NUMBER,
    monitoring_period_start TIMESTAMP,
    monitoring_period_end TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE TASK monitor_warehouse_usage
  WAREHOUSE = QUICKSTART_WH  -- Specify the warehouse to use for task execution
  SCHEDULE = 'USING CRON 0 * * * * UTC'  -- Run the task every hour
AS
  INSERT INTO warehouse_monitoring
  SELECT 
      WAREHOUSE_NAME,
      SUM(CREDITS_USED) AS TOTAL_CREDITS_USED,
      --SUM(SECONDS_USED) / 60 AS TOTAL_MINUTES_USED,
      MIN(START_TIME) AS MONITORING_PERIOD_START,
      MAX(END_TIME) AS MONITORING_PERIOD_END
  FROM 
      SNOWFLAKE.ACCOUNT_USAGE.WAREHOUSE_METERING_HISTORY
  WHERE 
      WAREHOUSE_NAME = 'QUICKSTART_WH'
      AND START_TIME >= DATEADD(HOUR, -1, CURRENT_TIMESTAMP())  -- Monitor last hour
  GROUP BY 
      WAREHOUSE_NAME;

ALTER TASK monitor_warehouse_usage RESUME;

-- if we use create or alter we must comment this ALTER TASK warehouse_credit_alert_task RESUME; ins the second deploy
-- even the first create task
