namespace Ambition.PluginSupport.ServiceThing {
	/**
	 * Represents a default error message and status code.
	 */
	public class ErrorMessage : Object {
		public enum ErrorType {
			MISSING_PARAMETER = 101,
			BAD_REQUEST = 400,
			UNAUTHENTICATED = 401,
			FORBIDDEN = 403,
			NOT_FOUND = 404,
			METHOD_NOT_ALLOWED = 405,
			UNSUPPORTED_MEDIA_TYPE = 415,
			ERROR = 500
		}

		public int code { get; set; }
		public string message { get; set; }

		public ErrorMessage( ErrorType error_type, string? message ) {
			this.code = (int) error_type;
			this.message = message;
		}
	}
}