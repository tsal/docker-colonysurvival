# Colony Survival Dedicated Server

## Usage

Pre-built
```bash
docker pull tsal/colonysurvival:latest
# as of the time of writing this, I couldn't get anonymous initial install to work :(
# TODO: eliminate the need to have interactivity with docker
docker run -v /data -ti -p 27000-27030:27000:27030 --name mycsgame tsal/colonysurvival:latest +server.name "my server name" +server.world "MyWorld" +server.ip 0.0.0.0 +server.networktype SteamOnline
# Your first run will ask for your steam username and will authenticate (hence -ti); afterwards, the entrypoint script will use "anonymous" for updates
...
[2017-11-25_23-07-37][Log]:[Initializing] Initialized generator
[2017-11-25_23-07-37][Log]:Mod: AfterItemTypesDefined
[2017-11-25_23-07-38][Log]:Mod: AfterWorldLoad
[2017-11-25_23-07-38][Log]:Initialized ServerManager
[2017-11-25_23-07-38][Log]:Initializing networking of type: SteamLAN
[2017-11-25_23-07-38][Log]:Mod: AfterNetworkSetup
[2017-11-25_23-07-39][Log]:[SteamAPI] Connected to steam servers with public IP = 1.23.45.67

# Docker detach
^P^Q
```

The reason we specify `-v /data` is to allow re-use of the installation and world if you want to force an update or spawn it with different configuration.  Example:

```
docker run -ti -p 27000-27030:27000:27030 --name mycsgamelocal --volumes-from mycsgame tsal/colonysurvival:latest +server.name "my newserver name" +server.world "MyWorld2" +server.ip 0.0.0.0 +server.networktype LAN
```