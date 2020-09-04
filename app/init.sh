#!/bin/sh

# Check if the initial admin "agora_admin" exists. 
count=$(mattermost user search agora_admin | grep -c "username: agora_admin")
if [ "$count" -ge 1 ]; then
  echo "agora_admin already exists"
else
  echo "create agora_admin"
  mattermost user create --system_admin --username agora_admin --password $AGORA_MATTERMOST_ADMIN_PASSWORD --email agora_admin@agora
fi


# Check if the team "agorateam" exists. 
count=$(mattermost team search agorateam | grep -c "agorateam:")
if [ "$count" -ge 1 ]; then
  echo "agorateam already exists"
else
  echo "create agorateam"
  mattermost team create --name agorateam --display_name "Agora Team"
fi

mattermost team add agorateam agora_admin


