BEGIN;

\c template1
DROP DATABASE soundgood;
CREATE DATABASE soundgood;
\c soundgood

COMMIT;