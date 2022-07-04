/*
 * TextCaptchaPlugin.vala
 *
 * The Ambition Web Framework
 * http://www.ambitionframework.org
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

public static Type init_plugin() {
	// Register types for dynamic loading
	var type = typeof(Ambition.Helper.TextCaptcha);
	if ( type > 0 ) {}

	return typeof(Ambition.PluginSupport.TextCaptchaPlugin);
}

namespace Ambition.PluginSupport {
	public class TextCaptchaPlugin : Object,IPlugin {
		public string name { get { return "TextCaptcha"; } }

		public void register_plugin() {}
	}
}
