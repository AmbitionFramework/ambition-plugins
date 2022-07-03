namespace Ambition.PluginSupport.ServiceThing {
	/**
	 * Helper provides default error message/status code combinations as methods
	 * to return from a controller.
	 */
	public class Helper : Object {
		public static Object quick_request( State state, ErrorMessage.ErrorType error_type, string? message = null ) {
			state.response.status = (int) error_type;
			return new ErrorMessage( error_type, message );
		}

		/**
		 * A generic bad request, which results in HTTP status code 400,
		 * "400 Bad Request".
		 */
		public static Object bad_request( State state, string? message = "Bad Request" ) {
			return quick_request( state, ErrorMessage.ErrorType.BAD_REQUEST, message );
		}

		/**
		 * Request has incorrect or missing authentication, which results in
		 * HTTP status code 401, "401 Unauthenticated".
		 */
		public static Object unauthenticated( State state, string? message = "Unauthenticated" ) {
			return quick_request( state, ErrorMessage.ErrorType.UNAUTHENTICATED, message );
		}

		/**
		 * Request has insufficient permission to access a resource, which
		 * results in HTTP status code 403, "403 Forbidden".
		 */
		public static Object forbidden( State state, string? message = "Forbidden" ) {
			return quick_request( state, ErrorMessage.ErrorType.FORBIDDEN, message );
		}

		/**
		 * Request is asking for a resource that does not exist at URL, which
		 * results in HTTP status code 404, "404 Not Found".
		 */
		public static Object not_found( State state, string? message = "Not Found" ) {
			return quick_request( state, ErrorMessage.ErrorType.NOT_FOUND, message );
		}

		/**
		 * Request is asking for a resource with an unsupported method, which
		 * results in HTTP status code 405, "405 Method Not Allowed".
		 */
		public static Object method_not_allowed( State state, string? message = "Method Not Allowed" ) {
			return quick_request( state, ErrorMessage.ErrorType.METHOD_NOT_ALLOWED, message );
		}

		/**
		 * Request is asking for a resource without an accepted parser, which
		 * results in HTTP status code 415, "415 Unsupported Media Type".
		 */
		public static Object unsupported_media_type( State state, string? message = "Unsupported Media Type" ) {
			return quick_request( state, ErrorMessage.ErrorType.UNSUPPORTED_MEDIA_TYPE, message );
		}

		/**
		 * Request failed internally, which results in HTTP status code 500,
		 * "500 Internal Server Error".
		 */
		public static Object failure( State state, string? message = "Server Error" ) {
			return quick_request( state, ErrorMessage.ErrorType.ERROR, message );
		}
	}
}
