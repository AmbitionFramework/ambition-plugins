# GRedis

## What is it for?

The GRedis plugin provides <a href="http://www.redis.com/">Redis</a>/<a href="http://github.com/nmelnick/gredis">GRedis</a> integration for Ambition. This includes the ability to use Redis as storage for sessions.

## Installation and Configuration

The GRedis plugin can be installed using the usual Ambition plugin tool. The plugin will link with your application.

To change the configuration of the CouchDB plugin, edit your application's configuration file in the `config/` directory. The plugin will default to a Redis installation on localhost.

    redis.host = localhost
    redis.port = 6397

## Using Redis for session storage

Configure the session storable.

    session.storable = StorableGRedis
