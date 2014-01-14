/*
 * ServiceThingTest.vala
 *
 * The Ambition Web Framework
 * http://www.ambitionframework.org
 *
 * Copyright 2012-2013 Sensical, Inc.
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

void main (string[] args) {
	Test.init( ref args );
	add_tests();
	SerializeJsonTest.add_tests();
	DeserializeJsonTest.add_tests();
	Test.run();
}

public static void add_tests() {
	Test.add_func("/ambition/plugin/servicething", () => {
		var plugin = new Ambition.PluginSupport.ServiceThingPlugin();
		assert( plugin != null );
		plugin.register_plugin();
	});
	Test.add_func("/ambition/plugin/servicething/parse_accept", () => {
		var service = new Ambition.Filter.Service(null);
		assert( service != null );
		assert( Ambition.Filter.Service.serializers != null );

		string accept_header_1 = "text/*;q=0.3, text/html;q=0.7, text/html;level=1, text/html;level=2;q=0.4, */*;q=0.5";
		string result = Ambition.Filter.Service.parse_accept_header(accept_header_1);
		assert( result != null );
		assert( result == "text/html" );

		string accept_header_2 = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8,application/json";
		result = Ambition.Filter.Service.parse_accept_header(accept_header_2);
		assert( result != null );
		assert( result == "text/html" );

		string accept_header_3 = "application/json,text/html,application/xhtml+xml,application/xml;q=0.9";
		result = Ambition.Filter.Service.parse_accept_header(accept_header_3);
		assert( result != null );
		assert( result == "application/json" );

		string accept_header_4 = "application/json;q=0.8,text/html;q=0.5,application/xhtml+xml,application/xml;q=0.9";
		result = Ambition.Filter.Service.parse_accept_header(accept_header_4);
		assert( result != null );
		assert( result == "application/xml" );

		string accept_header_5 = "application/jsv;q=0.8,text/plain;q=0.5,application/xhtml+xml,application/filemaker;q=0.9";
		result = Ambition.Filter.Service.parse_accept_header(accept_header_5);
		assert( result == null );
	});
	Test.add_func("/ambition/plugin/servicething/parse_accept/default", () => {
		string? accept_header = null;
		var result = Ambition.Filter.Service.parse_accept_header(accept_header);
		assert( result == null );

		Ambition.ServiceThing.default_accept_type = "application/json";
		result = Ambition.Filter.Service.parse_accept_header(accept_header);
		assert( result != null );
		assert( result == "application/json" );
	});
}

