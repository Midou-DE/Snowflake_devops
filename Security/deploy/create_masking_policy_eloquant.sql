USE DATABASE TEST_ADK;

USE SCHEMA TOOLKIT;

CALL CREATE_MASKING_POLICYdev(
    'ELOQUANT_FIRST_NAME', -- THE POLICY NAME
    'STRING', -- TYPE OF THE COLUMN 
    'MONITORING_LMG.FIRST_NAME', --  THE TAG NAME 
    'High',  -- la valeur de tag
    'ACCOUNTADMIN', -- the role  ivew everything
    '***', --  the masking value 
    'ELOQUANT' --  the chema where themasking policy gonna be created
);

ALTER TABLE ELOQUANT.ELOQUANT_3035
  MODIFY COLUMN FIRST_NAME
  SET MASKING POLICY ELOQUANT.ELOQUANT_FIRST_NAME;

    