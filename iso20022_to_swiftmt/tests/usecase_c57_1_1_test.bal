// Copyright (c) 2025, WSO2 LLC. (https://www.wso2.com).
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
    groups: ["toSwiftMtMessage", "c57_1_1"],
    dataProvider: dataGen5711
}
isolated function testC5711(xml mx, string mt) returns error? {
    record{} rec = check toSwiftMtMessage(mx);
    test:assertEquals((check swiftmt:toFinMessage(rec)).toString(), mt, msg = "Use case c.57.1.1 result incorrect");
}

function dataGen5711() returns map<[xml, string]>|error {
    map<[xml, string]> dataSet = {
        "c57": [check io:fileReadXml("./tests/c_57_1_1/CBPR+ c.57.1.1 camt.057-AtoB.xml"), finMessage_5711_c57_A_B]
    };
    return dataSet;
}

string finMessage_5711_c57_A_B = "{1:F01KREDBEBBXXXX0000000000}{2:O2100800201130RABOBE22XXXX00000000002011300800N}{4:\r\n" +
    ":20:camt57bizmsgidr1\r\n" +
    ":25:RAB02564185-365\r\n" +
    ":30:201201\r\n" +
    ":21:NTFCTNITEM01 \r\n" +
    ":32B:EUR2000000,\r\n" +
    ":50F:/NOTPROVIDED\r\n" +
    "1/ABC Ltd\r\n" +
    "2/10 Broad Street\r\n" +
    "3/GB/London\r\n" +
    ":56A:CBPXBE99\r\n" +
    "-}";
