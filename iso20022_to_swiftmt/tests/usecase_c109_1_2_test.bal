// Copyright (c) 2024, WSO2 LLC. (https://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/io;
import ballerina/test;
import ballerinax/financial.swift.mt as swiftmt;

@test:Config {
    groups: ["toSwiftMtMessage", "c109_1_2"],
    dataProvider: dataGen10912
}
isolated function testC10912(xml mx, string mt) returns error? {
    record{} rec = check toSwiftMtMessage(mx);
    test:assertEquals((check swiftmt:toFinMessage(rec)).toString(), mt, msg = "Use case c.109.1.2 result incorrect");
}

function dataGen10912() returns map<[xml, string]>|error {
    // Other tests of Use Case c.109.1.2 need to be added
    map<[xml, string]> dataSet = {
        "B_A": [check io:fileReadXml("./tests/c_109_1_2/CBPR+ c.109.1.2 camt.053-BtoA.xml"), finMessage_10912_B_A],
        "A_B": [check io:fileReadXml("./tests/c_109_1_2/CBPR+ c.109.1.2 camt.107-AtoB.xml"), finMessage_10912_A_B],
        "c108A_B": [check io:fileReadXml("./tests/c_109_1_2/CBPR+ c.109.1.2 camt.108-AtoB.xml"), finMessage_10912_c108A_B],
        "c109B_A": [check io:fileReadXml("./tests/c_109_1_2/CBPR+ c.109.1.2 camt.109-BtoA.xml"), finMessage_10912_c109B_A]
    };
    return dataSet;
}

string finMessage_10912_B_A = "{1:F01MYMBGB2LXXXX0000000000}{2:O9401600221020RBSSGBKCXXXX00000000002210201600N}{4:\r\n" +
    ":20:Stmnt-100-01\r\n" +
    ":25:9875687\r\n" +
    ":28C:1001/1\r\n" +
    ":60F:D221020GBP6544,\r\n" +
    ":61:221020D25250,NTRFNONREF\r\n" +
    ":62F:D221020GBP31794,\r\n" +
    "-}";

string finMessage_10912_A_B = "{1:F01RBSSGBKCXXXX0000000000}{2:O1100905221020MYMBGB2LXXXX00000000002210200905N}{4:\r\n" +
    ":20:camt107bzmsgidr1\r\n" +
    ":21:102145\r\n" +
    ":30:221020\r\n" +
    ":32B:GBP25250,\r\n" +
    ":50F:/60779854\r\n" +
    "1/Debtor Co\r\n" +
    "2/High Street\r\n" +
    "3/GB/Epping\r\n" +
    ":59F:1/Ardent Finance\r\n" +
    "2/Main Street\r\n" +
    "3/GB/London\r\n" +
    "-}";

string finMessage_10912_c108A_B = "{1:F01RBSSGBKCXXXX0000000000}{2:O1111005221020MYMBGB2LXXXX00000000002210201005N}{4:\r\n" +
    ":20:camt108bzmsgidr1\r\n" +
    ":21:102145\r\n" +
    ":30:221020\r\n" +
    ":32B:GBP25250,\r\n" +
    ":59:1/Ardent Finance\r\n" +
    "2/Main Street\r\n" +
    "3/GB/London\r\n" +
    ":75:/RequestedByCustomer/\r\n" +
    "-}";

string finMessage_10912_c109B_A = "{1:F01MYMBGB2LXXXX0000000000}{2:O1121005221020RBSSGBKCXXXX00000000002210201005N}{4:\r\n" +
    ":20:camt109bzmsgidr1\r\n" +
    ":21:102145\r\n" +
    ":30:221020\r\n" +
    ":32B:GBP25250,\r\n" +
    ":59:1/Ardent Finance\r\n" +
    "2/Main Street\r\n" +
    "3/GB/London\r\n" +
    ":76:/Rejected/CLEA\r\n" +
    "-}";
