BEGIN;

\i /hostfiles/RestartDatabase.sql

\i /hostfiles/LogiPhysModel.sql

\i /hostfiles/PopulateData.sql

\i /hostfiles/CreateViews.sql
COMMIT; 
