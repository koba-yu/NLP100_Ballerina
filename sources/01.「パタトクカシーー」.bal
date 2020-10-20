import ballerina/http;
import ballerina/io;
import ballerina/stringutils;

service NLP on new http:Listener(9090) {
    resource function Answer1(http:Caller caller, http:Request request) {

        final var characters = stringutils:split("パタトクカシーー", "");

        var i = -1;
        final var text = "".'join(...characters.filter(function (string c) returns boolean {
            i = i + 1;
            return i % 2 == 0;
        }));

        error? result = caller->respond(text);
        if(result is error) {
            io:println("Error in responding: ", result);
        }
    }

    resource function Answer2(http:Caller caller, http:Request request) {
        final var characters = stringutils:split("パタトクカシーー", "")
            .enumerate()
            .filter(x => x[0] % 2 == 0)
            .map(x => x[1]);

        final error? result = caller->respond("".'join(...characters));
        if(result is error) {
            io:println("Error in responding: ", result);
        }
    }
}
