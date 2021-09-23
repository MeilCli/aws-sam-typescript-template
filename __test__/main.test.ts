import { APIGatewayProxyResult } from "aws-lambda";
import { createAPIGatewayProxyEvent } from "./helper.test";
import { helloWorldHandler } from "../src/main";

test("helloWorldHandler", async () => {
    const event = createAPIGatewayProxyEvent("", {});
    const result = await helloWorldHandler(event);
    const expectedResult: APIGatewayProxyResult = {
        statusCode: 200,
        body: "hello world sam typescript template!",
    };
    expect(result).toEqual(expectedResult);
});
