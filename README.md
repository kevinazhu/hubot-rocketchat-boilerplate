# hubot-rocketchat-rss

Rocket.Chat bot for RSS Feeds and more.

Utilizes modified/fixed versions of [Hubot Mongodb Brain][hubot-mongodb-brain] 
and [Hubot RSS Reader][hubot-rss-reader]

## Quick Start

```
git clone https://github.com/kevinazhu/hubot-rocketchat-rss
cd hubot-rocketchat-rss
yarn
```

Create a _.env_ file with content:
```
export ROCKETCHAT_URL=myserver.com
export ROCKETCHAT_USER=mybotuser
export ROCKETCHAT_PASSWORD=mypassword
export ROCKETCHAT_ROOM=general
export ROCKETCHAT_USESSL=true

export HUBOT_RSS_INTERVAL=600
export HUBOT_RSS_HEADER=:sushi:
export HUBOT_RSS_LIMIT_ON_ADD=5
export HUBOT_RSS_ADMIN_USERS="user1,user2"

export MONGODB_URL=mongodb://localhost:27017
export MONGODB_DBNAME=hubot-brain
export MONGODB_SAVE_INTERVAL=60
```

Adjust the content to fit your server and user credentials. Make sure `mybotuser` has **BOT role** on the server, if you don't know what that means, ask your server administrator to set it up for you.

Then run the bot:
```
source .env && ./bin/hubot
```


## Communicating with the Bot

### Test Commands

On the server, login as a regular user (not the BOT user), go to GENERAL, and try:
```
mybotuser what time is it
```

OR

```
mybotuser rc version
```

### RSS Commands

Add an rss feed with
```
mybotuser rss add RSS_URL
```

This will make the bot print the last 5 entries, and then begin to monitor that RSS feed.

For a full list of commands, check out the [Hubot RSS Reader][hubot-rss-reader] external script.

## Docker

You can also run this bot in a docker container.
Simply create the above .env file and then run
```
docker-compose up
```

## Running in Production

There are executables for different environments that all run the Hubot binary.

Before running make sure your production environment has the required 
environment variables for the adapter, url, user, name and pass. Or you can add
them after the launch command as switches, like `-a rocketchat`.

- `bin/hubot` unix binary
- `bin/hubot.cmd` in windows
- `Procfile` for Heroku

Env variables should be populated on the server before launching
(see [configuration](#configuration)). The launcher will also install npm
dependencies on every run, in case it's booting in a fresh container (this isn't
required when working locally).

More information on [deployment configs][deployment] here.

## Script Development

### Adding Scripts

Scripts can be added to the `./scripts` folder, or by installing node packages
and listing their names in the `external-scripts.json` array. There's an example
of each in this repo, but neither is required.

### Example Scripts

Two scripts are packaged with the boilerplate, as a demo for manual tests.
Each of the following will respond in a public channel if the bot username is
prefixed, or without the bot's name if in a DM.

- `what time is it` or `what's the time` - Tells you the time
- `rc version` - Gives you version info for Rocket.Chat and Hubot (two messages)


[hubot-mongodb-brain]: https://github.com/kevinazhu/hubot-mongodb-brain-kzhu
[hubot-rss-reader]: https://github.com/kevinazhu/hubot-rss-kzhu
[deployment]: https://hubot.github.com/docs/deploying/