USE DATABASE TEST_ADK;

USE SCHEMA TOOLKIT;

CALL CREATE_MASKING_POLICYdev(
    'ELOQUANT_FIRST_NAME',
    'STRING',
    'FIRST_NAME',
    'High',
    'ACCOUNTADMIN',
    '***'
);

ALTER TABLE ELOQUANT
  MODIFY COLUMN FIRST_NAME
  SET MASKING POLICY ELOQUANT_FIRST_NAME;

    