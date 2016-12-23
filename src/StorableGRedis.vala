/*
 * StorableGRedis.vala
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

using Gee;
namespace Ambition.Session {
	/**
	 * Store sessions in a Redis instance.
	 */
	public class StorableGRedis : Object,IStorable {
		private GRedis.Connection instance;

		public StorableGRedis() throws GRedis.ConnectionError {
			instance = Ambition.GRedisPlugin.get_redis_instance();
		}

		public void store( string session_id, Interface i ) {
			var r_session = new GRedisSession();
			r_session.session_id = session_id;
			r_session.session_data = i.serialize();
			bool success = false;
			success = instance.set( session_id, r_session.session_data );
			if (!success) {
				Logger.error("Unable to save session to Redis.");
			}
		}

		public Interface? retrieve( string session_id ) {
			var data = instance.get(session_id);
			if ( data != null ) {
				return new Interface.from_serialized( session_id, data );
			}
			return null;
		}
	}
}