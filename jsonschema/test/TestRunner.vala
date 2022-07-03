public static int main ( string[] args ) {
	Test.init( ref args );

	TestSuite.get_root().add_suite( new JSONSchemaTest.JSONSchemaPlugin().get_suite() );

	return Test.run();
}