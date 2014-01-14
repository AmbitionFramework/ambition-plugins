namespace Ambition {
	public class ServiceThing : Object {
		/**
		 * If the caller does not provide a valid accept type, you can default
		 * to an accept type.
		 */
		public static string? default_accept_type { get; set; }

		/**
		 * Get a deserialized request object from the data provided by the
		 * caller. This will expect that a valid content type is being used.
		 * Example:
		 *   public Object example_request( State state ) {
		 *     SomeThing something = ServiceThing.get_request_object<SomeThing>(state);
		 *   }
		 * @param state Current state
		 */
		public static T? get_request_object<T> ( State state ) {
			T? incoming = null;
			var content_type = state.request.content_type;
			var deserializers = Ambition.Filter.Service.deserializers;
			if ( deserializers.has_key(content_type) ) {
				incoming = deserializers[content_type].deserialize( (string) state.request.request_body, typeof(T) );
			}
			return incoming;
		}
	}
}