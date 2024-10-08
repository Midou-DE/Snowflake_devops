USE DATABASE TEST_ADK;

USE SCHEMA TOOLKIT;


CREATE OR REPLACE PROCEDURE grants_privilege_to_role(
    json_input_list ARRAY
)
RETURNS STRING
LANGUAGE PYTHON
RUNTIME_VERSION = '3.8'
PACKAGES = ('snowflake-snowpark-python')
HANDLER = 'grants_privilege_to_role'
AS
$$
def grants_privilege_to_role(json_input_list):
    import json # Convert Snowflake VARIANT to Python dictionary
    import snowflake.snowpark as snowpark

   
    #create a snowpark session
    session = snowpark.Session.builder.getOrCreate()
   
    # Loop through roles and privileges
    result = []
    for item in json_input_list:
        for privilege in item['privileges']:
            grant_privelege = f"GRANT {privilege} ON {item['object_type']} {item['object_name']} TO ROLE {item['role']};"
            session.sql(grant_privelege).collect()
            result.append(grant_privelege)

    return  result
   
$$;
