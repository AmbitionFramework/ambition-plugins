/*
 * GRedis.vala
 *
 * The Ambition Web Framework
 * http://www.ambitionframework.org
 *
 * Copyright 2017 Sensical, Inc.
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

namespace Ambition.GRedisPlugin {
	private static GRedis.Connection instance = null;

	/**
	 * Retrieve the currently active GRedis instance, or creates if one
	 * does not exist.
	 */
	public static GRedis.Connection get_redis_instance() throws GRedis.ConnectionError {
		if ( instance == null ) {
			string? host = Config.lookup("redis.host");
			string? port = Config.lookup("redis.port");
			instance = new GRedis.Connection( host, int.parse(port) );
		}
		return instance;
	}
}