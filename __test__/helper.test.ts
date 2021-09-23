/* eslint-disable @typescript-eslint/no-explicit-any */
import { APIGatewayProxyEvent } from "aws-lambda";

test("createAPIGatewayProxyEvent", () => {
    createAPIGatewayProxyEvent("", {});
});

export interface Option {
    method?: string;
    path?: string;
    query?: { [name: string]: any };
    headers?: { [name: string]: any };
    pathParameters?: { [name: string]: any };
}

export function createAPIGatewayProxyEvent(message: string, option: Option): APIGatewayProxyEvent {
    return {
        httpMethod: option.method ?? "GET",
        body: message,
        path: option.path ?? "/",
        queryStringParameters: option.query ?? {},
        headers: option.headers ?? {},
        multiValueHeaders: {},
        multiValueQueryStringParameters: {},
        isBase64Encoded: false,
        pathParameters: option.pathParameters ?? {},
        stageVariables: {},
        requestContext: {
            accountId: "",
            apiId: "",
            authorizer: {},
            protocol: "",
            httpMethod: option.method ?? "GET",
            identity: {
                accessKey: "",
                accountId: "",
                apiKey: "",
                apiKeyId: "",
                caller: "",
                clientCert: {
                    clientCertPem: "",
                    serialNumber: "",
                    subjectDN: "",
                    issuerDN: "",
                    validity: {
                        notAfter: "",
                        notBefore: "",
                    },
                },
                cognitoAuthenticationProvider: "",
                cognitoAuthenticationType: "",
                cognitoIdentityId: "",
                cognitoIdentityPoolId: "",
                principalOrgId: "",
                sourceIp: "",
                user: "",
                userAgent: "",
                userArn: "",
            },
            path: option.path ?? "/",
            stage: "",
            requestId: "",
            requestTimeEpoch: 0,
            resourceId: "",
            resourcePath: "",
        },
        resource: "",
    };
}
