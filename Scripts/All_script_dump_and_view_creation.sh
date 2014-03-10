#!/bin/bash
  
  set -e
  
  echo $(date)":started All_script_dump_and_view_creation"
  
  pg_dump -U kettlede kettlede > /tmp/kettlede_from_local
  echo "dump kettlede_from_local done"
  
  pg_dump -U kettlecn shanghai > /tmp/shanghai_from_local
  echo "dump shanghai_from_local done"
  
  pg_dump -U kettlecn ccsh > /tmp/ccsh_from_local
  echo "dump ccsh_from_local done"
  
  pg_dump -U kettleus us > /tmp/us_from_local
  echo "dump us_from_local done"
  
  pg_dump -U kettle kettle > /tmp/france_from_local
  echo "dump france_from_local done"
  
  # We do the restoration as postgres (superuser) to be able to execute any instruction.
  cp /tmp/kettlede_from_local /tmp/kettlede_from_local_sed
  sed -i 's/public/kettlede/' /tmp/kettlede_from_local_sed
  echo "sed  kettlede_from_local done"
  psql All -U postgres -c 'DROP SCHEMA IF EXISTS kettlede CASCADE'
  psql All -U postgres -c 'CREATE SCHEMA kettlede'
  psql All -U postgres < /tmp/kettlede_from_local_sed
  echo "restore kettlede_from_local_sed done"
  
  cp /tmp/shanghai_from_local /tmp/shanghai_from_local_sed
  sed -i 's/public/shanghai/' /tmp/shanghai_from_local_sed
  echo "sed  shanghai_from_local ok"
  psql All -U postgres -c 'DROP SCHEMA IF EXISTS shanghai CASCADE'
  psql All -U postgres -c 'CREATE SCHEMA shanghai'
  psql All -U postgres < /tmp/shanghai_from_local_sed
  echo "restore shanghai_from_local_sed done"
  
  cp /tmp/ccsh_from_local /tmp/ccsh_from_local_sed
  sed -i 's/public/ccsh/' /tmp/ccsh_from_local_sed
  echo "sed  ccsh_from_local ok"
  psql All -U postgres -c 'DROP SCHEMA IF EXISTS ccsh CASCADE'
  psql All -U postgres -c 'CREATE SCHEMA ccsh'
  psql All -U postgres < /tmp/ccsh_from_local_sed
  echo "restore ccsh_from_local_sed done"
  
  cp /tmp/us_from_local /tmp/us_from_local_sed
  sed -i 's/public/us/' /tmp/us_from_local_sed
  echo "sed  us_from_local ok"
  psql All -U postgres -c 'DROP SCHEMA IF EXISTS us CASCADE'
  psql All -U postgres -c 'CREATE SCHEMA us'
  psql All -U postgres < /tmp/us_from_local_sed
  echo "restore us_from_local_sed done"
  
  cp /tmp/france_from_local /tmp/france_from_local_sed
  sed -i 's/public/france/' /tmp/france_from_local_sed
  echo "sed  france_from_local ok"
  psql All -U postgres -c 'DROP SCHEMA IF EXISTS france CASCADE'
  psql All -U postgres -c 'CREATE SCHEMA france'
  psql All -U postgres < /tmp/france_from_local_sed
  echo "restore france_from_local_sed done"
  
  #We recreate the views that have been deleted by the drop cascade
  /home/guillaume/kettle_4.4.0/kitchen.sh /file:"/home/guillaume/apache-tomcat-7.0.41/webapps/citelstats/Reports/Kettle_Extraction/All/create_views.kjb"
  
  echo $(date)":finished All_script_dump_and_view_creation"
  
  set +e