description "Richard Simmons. The greatest hubot of all time."
 
start on filesystem or runlevel [2345]
stop on runlevel [!2345]
respawn
respawn limit 5 60
 
script
# Start Hubot
exec bin/starthubot.sh
end script