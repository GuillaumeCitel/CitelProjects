#!/bin/bash
  
  set -e
  
  pg_dump -U kettlede --clean kettlede > /tmp/kettlede
  echo "dump kettlede done"
  
  pg_dump -U kettlecn --clean shanghai > /tmp/shanghai
  echo "dump shanghai done"
  
  pg_dump -U kettlecn --clean ccsh > /tmp/ccsh
  echo "dump ccsh done"
  
  pg_dump -U kettleus --clean us > /tmp/us
  echo "dump us done"
  
  pg_dump -U kettle --clean kettle > /tmp/france
  echo "dump france done"
  
  # We need to delete the view before restoration because otherwise, tables won't be deleted (--clean instrauctions won't work) and so records will be inserted twice
  /home/guillaume/kettle_4.4.0/kitchen.sh /file:"/home/guillaume/apache-tomcat-7.0.41/webapps/citelstats/Reports/Kettle_Extraction/All/delete_views.kjb"
  
  # We do the restoration as postgres (superuser) to be able to execute any instruction.
  
  sed -i 's/public/kettlede/' /tmp/kettlede
  echo "sed  kettlede done"
  psql -U postgres All < /tmp/kettlede
  echo "restore shanghai done"
  
  sed -i 's/public/shanghai/' /tmp/shanghai
  echo "sed  shanghai ok"
  psql -U postgres All < /tmp/shanghai
  echo "restore shanghai done"
  
  sed -i 's/public/ccsh/' /tmp/ccsh
  echo "sed  ccsh ok"
  psql -U postgres All < /tmp/ccsh
  echo "restore ccsh done"
  
  sed -i 's/public/us/' /tmp/us
  echo "sed  us ok"
  psql -U postgres All < /tmp/us
  echo "restore us done"
  
  sed -i 's/public/france/' /tmp/france
  echo "sed  france ok"
  psql -U postgres All < /tmp/france
  echo "restore france done"
  
  #We recreate the views
  /home/guillaume/kettle_4.4.0/kitchen.sh /file:"/home/guillaume/apache-tomcat-7.0.41/webapps/citelstats/Reports/Kettle_Extraction/All/create_views.kjb"
  
  set +e