import { APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";
import { text } from "./text";

export const helloWorldHandler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
    return { statusCode: 200, body: `hello world ${text}` };
};
