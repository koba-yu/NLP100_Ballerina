import ballerina/http;
import ballerina/io;
import ballerina/lang.'string;

service NLP on new http:Listener(9090) {
    resource function Answer(http:Caller caller, http:Request request) {

        var text = 'string:fromBytes("stressed".toBytes().reverse());

        if(text is string) {
            error? result = caller->respond(text);
            if(result is error) {
                io:println("Error in responding: ", result);
            }
        }
    }
}