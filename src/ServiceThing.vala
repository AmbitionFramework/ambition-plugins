namespace Ambition {
	public class ServiceThing : Object {
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