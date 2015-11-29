# ServiceThing

## What is it for?

The ServiceThing plugin allows for the easy creation of services and RESTful
APIs using Ambition.

The plugin is currently limited to JSON requests and responses.

## Installation and Configuration

The ServiceThing plugin can be installed using the usual Ambition plugin tool.
The plugin will link with your application.

## Quick Example

In actions.conf:

    /service    GET   Service:Root.service
    /service    POST  Service:Root.change_service

In Root.vala:

    using Ambition.PluginSupport.ServiceThing;

    public Object service( State state ) {
        var to = new TestResponseObject();
        to.some_response = "Test";
        return to;
    }

    public Object change_service( State state ) {
        // Convert the serialized request into a usable object
        var req_object = ServiceThing.get_request_object<TestRequestObject>(state);

        // If there wasn't an issue, generate a response to serialize and return
        if ( req_object != null ) {
            var to = new TestResponseObject();
            to.some_response = req_object.some_value;
            return to;
        }

        // If there was, generate a generic bad request response
        return Helper.bad_request(state);
    }

Elsewhere:

    public class TestRequestObject : Object {
        public string some_value { get; set; }
    }
    public class TestResponseObject : Object {
        public string some_response { get; set; }
    }

Responses:

    $ curl -X GET --header "Accept: application/json" \
      http://localhost:8099/service
    {"some_response":"Test"}

    $ curl -X POST --header "Content-Type: application/json" \
      --header "Accept: application/json" http://localhost:8099/service \
      -d '{"some_value":"woo"}' 
    {"some_response":"woo"}
