import ballerina/http;
import ballerina/io;
import ballerina/stringutils;

service NLP on new http:Listener(9090) {
    resource function Answer1(http:Caller caller, http:Request request) {

        final var sentence = "Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics.";

        var words = from var chars in stringutils:split(sentence, " ")
            select stringutils:replaceAll(chars, "[,.]", "");

        final var counts = words.map(x => x.length());

        final error? result = caller->respond(counts);
        if(result is error) {
            io:println("Error in responding: ", result);
        }
    }
}
