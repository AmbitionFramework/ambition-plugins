/*
 * Couchbase.vala
 *
 * The Ambition Web Framework
 * http://www.ambitionframework.org
 *
 * Copyright 2012-2014 Sensical, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

namespace Ambition.CouchbasePlugin {
	private static Couchbase.Client instance = null;

	/**
	 * Retrieve the currently active Couchbase instance, or creates if one
	 * does not exist.
	 */
	public static Couchbase.Client get_couchbase_instance() throws Couchbase.ClientError {
		if ( instance == null ) {
			string? host = Config.lookup("couchbase.url");
			string? bucket = Config.lookup("couchbase.bucket");
			string? password = Config.lookup("couchbase.password");
			instance = new Couchbase.Client( host, bucket, password );
		}
		return instance;
	}
}