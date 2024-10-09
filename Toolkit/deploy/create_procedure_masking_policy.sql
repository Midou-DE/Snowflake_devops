USE DATABASE TEST_ADK;

USE SCHEMA TOOLKIT;

CREATE OR REPLACE PROCEDURE CREATE_MASKING_POLICYdev(
    policy_name STRING,
    column_data_type STRING,
    tag_name STRING,
    tag_value STRING,
    excluded_role STRING,
    masked_value STRING,
    schame_value STRING
)
RETURNS STRING
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
BEGIN
    EXECUTE IMMEDIATE 'USE SCHEMA '|| schame_value|| ';';
    EXECUTE IMMEDIATE
    'CREATE OR REPLACE MASKING POLICY ' || policy_name || ' AS (VAL ' || column_data_type || ') RETURNS ' || column_data_type || ' ->
    CASE
        WHEN SYSTEM$GET_TAG_ON_CURRENT_COLUMN(''' || tag_name || ''') = ''' || tag_value || ''' 
        AND CURRENT_ROLE() NOT IN (''' || excluded_role || ''') THEN ''' || masked_value || '''
        ELSE VAL
    END';
    RETURN 'Masking policy ' || policy_name || ' created successfully.';
END;
$$;
