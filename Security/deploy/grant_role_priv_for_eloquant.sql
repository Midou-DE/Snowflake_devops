USE DATABASE TEST_ADK;

USE SCHEMA TOOLKIT;

CALL GRANTS_PRIVILEGE_TO_ROLE(
[
    {'role':'DATA_ENGINEER','object_type': 'schema', 'object_name':'TEST_ADK.ELOQUANT', 'privileges': ['CREATE TABLE']},
    {'role':'DATA_VIS','object_type': 'schema','object_name':'TEST_ADK.ELOQUANT', 'privileges': ['USAGE','CREATE TASK', 'CREATE TAG']}
]
);

CALL GRANTS_PRIVILEGE_TO_ROLE(
[
    {'role':'DATA_ENGINEER','object_type': 'DATABASE', 'object_name':'TEST_ADK', 'privileges': ['USAGE']},
    {'role':'DATA_VIS','object_type': 'DATABASE','object_name':'TEST_ADK', 'privileges': ['USAGE']}
]
);