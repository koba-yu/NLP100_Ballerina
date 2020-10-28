import ballerina/http;
import ballerina/io;
import ballerina/stringutils;

function getString(int? i, string text) returns string {
    if (i is int) { return text.substring(0, 1); }
    else { return text.substring(0, 2); }
}

service NLP on new http:Listener(9090) {

    resource function Answer1(http:Caller caller, http:Request request) {

        final var sentence = "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can.";
        final var indices = [1, 5, 6, 7, 8, 9, 15, 16, 19];

        var symbols = from var records in stringutils:split(sentence, " ").enumerate()
            select getString(indices.indexOf(records[0] + 1, 0), records[1]);

        final error? result = caller->respond(symbols);
        if(result is error) {
            io:println("Error in responding: ", result);
        }
    }
}
