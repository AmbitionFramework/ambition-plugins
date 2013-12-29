# Couchbase

## What is it for?

The Couchbase plugin provides <a href="http://www.couchbase.com/">Couchbase</a>/<a href="http://gcouchbase.ambitionframework.org">GCouchbase</a>a> integration for Ambition. This includes the ability to use Couchbase as storage for sessions.

## Installation and Configuration

The Couchbase plugin can be installed using the usual Ambition plugin tool. The plugin will link with your application.

To change the configuration of the CouchDB plugin, edit your application's configuration file in the `config/` directory. The plugin will default to a Couchbase installation on localhost, with the default bucket.

    couchbase.url = http://localhost:8091/pools
    couchbase.bucket = sample
    couchbase.password = samplepass

Optionally, for session storage, the name of the session bucket can be changed by altering _couchbase.session.bucket_ to the new name. The default is `default`.

## Using Couchbase for session storage

Configure the session storable.

    session.storable = StorableCouchbase
