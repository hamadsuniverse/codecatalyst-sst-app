import { Table, StackContext } from "sst/constructs";

export function DBStack({ stack }: StackContext) {
    
    // Create the table
    const table = new Table(stack, "Counter", {
        fields: {
        counter: "string",
        },
        primaryIndex: { partitionKey: "counter" },
    });

    return {table};
}
