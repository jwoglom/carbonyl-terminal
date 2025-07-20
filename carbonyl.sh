#!/bin/bash
# Carbonyl Terminal 1.0
export START_PAGE=${1:-"https://start.duckduckgo.com/"}
export USER_HOST=carbonyl-ssh.service.consul

if [[ "$USER_HOST" == "" ]]; then
	echo "Provide USER_HOST"
	exit 1
fi

if ! echo "$USER_HOST" | grep -q '@'; then
	USER_HOST="carbonyl@$USER_HOST"
fi

RSA_KEY="-----BEGIN OPENSSH PRIVATE KEY-----\n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\n-----END OPENSSH PRIVATE KEY-----"

# Create the RSA key file with proper permissions
if [[ ! -f /tmp/carbonyl_rsa ]]; then
	echo -e "$RSA_KEY" > /tmp/carbonyl_rsa
	chmod 600 /tmp/carbonyl_rsa
fi
export MOSH_TITLE_NOPREFIX=1

SSH_CMD="ssh -C -i /tmp/carbonyl_rsa -p 2222 -o StrictHostKeyChecking=no -o SendEnv=START_PAGE -o SendEnv=TMUX -o SendEnv=CARBONYL_ARGS"
echo "Connecting to Carbonyl..."
echo "USER_HOST=$USER_HOST"
echo "START_PAGE=$START_PAGE"
if [ -z "$NOMOSH" ]; then
	echo "Trying mosh connection..."
	mosh -p 60000:60010 --ssh="$SSH_CMD" $USER_HOST
else
	echo "Using SSH..."
	$SSH_CMD $USER_HOST
fi