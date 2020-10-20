import ballerina/http;
import ballerina/io;
import ballerina/lang.'string;

service NLP on new http:Listener(9090) {
    resource function Answer1(http:Caller caller, http:Request request) {

        final var text = 'string:fromBytes("stressed".toBytes().reverse());

        if(text is string) {
            final error? result = caller->respond(text);
            if(result is error) {
                io:println("Error in responding: ", result);
            }
        }
    }
}