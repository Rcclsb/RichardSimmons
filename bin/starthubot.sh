export HUBOT_SLACK_TOKEN=xoxb-6640409751-3qWhhpd5e5qwX1ZXd9YrMzh5 
export HUBOT_JIRA_URL="https://waybetter.atlassian.net"
export HUBOT_JIRA_USER="robot" 
export HUBOT_JIRA_USER_AGENT="RichardSimmons"
export HUBOT_JIRA_PASSWORD="" #Add robot Password
echo "Starting RichardSimmons..."
bin/hubot -a slack
echo "RichardSimmons has started."