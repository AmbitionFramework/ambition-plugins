
void main (string[] args) {
	Test.init( ref args );
	add_tests();
	Test.run();
}

public static void add_tests() {
	Test.add_func("/ambition/plugin/couchbase", () => {
		var plugin = new Ambition.PluginSupport.CouchbasePlugin();
		assert( plugin != null );
		plugin.register_plugin();
	});
	if ( allow_live_tests() ) {
	} else {
		stdout.printf( "%s\n", "Skipping live tests. Enable with COUCHBASE_LIVE_TESTS=1." );
	}
}

public static bool allow_live_tests() {
	string? live = Environment.get_variable("COUCHBASE_LIVE_TESTS");
	return ( live != null && live == "1" );
}
