import ballerina/http;
import ballerina/io;
import ballerina/stringutils;

service NLP on new http:Listener(9090) {
    resource function Answer1(http:Caller caller, http:Request request) {

        final var policeCar = "パトカー";
        final var taxi = "タクシー";
        string[] text = [];

        foreach var x in stringutils:split(policeCar, "").enumerate() {
            text.push(x[1]);
            text.push(taxi[x[0]]);
        }

        final error? result = caller->respond("".'join(...text));
        if(result is error) {
            io:println("Error in responding: ", result);
        }
    }
}