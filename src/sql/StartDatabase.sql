BEGIN;

\i /host_files/src/sql/RestartDatabase.sql

\i /host_files/src/sql/LogiPhysModel.sql

\i /host_files/src/sql/PopulateData.sql

\i /host_files/src/sql/CreateViews.sql
COMMIT; 
