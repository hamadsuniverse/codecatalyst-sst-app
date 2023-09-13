import { Api, StackContext, use } from "sst/constructs";
import { DBStack } from "./DBStack";

export function ApiStack({ stack }: StackContext) {

    const {table} = use(DBStack);

    // Create the HTTP API
    const api = new Api(stack, "Api", {
        defaults: {
        function: {
            // Bind the table name to our API
            bind: [table],
        },
        },
        routes: {
        "POST /": "packages/functions/src/lambda.main",
        "GET /": "packages/functions/src/get-counter.main",
        },
    });

    return {api}
}
