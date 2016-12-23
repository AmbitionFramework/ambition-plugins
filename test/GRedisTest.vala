
void main (string[] args) {
	Test.init( ref args );
	add_tests();
	Test.run();
}

public static void add_tests() {
	Test.add_func("/ambition/plugin/gredis", () => {
		var plugin = new Ambition.PluginSupport.GRedisPlugin();
		assert( plugin != null );
		plugin.register_plugin();
	});
}
