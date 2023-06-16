//
//  APIManagerTest.swift
//  SKBankInterviewTaskTests
//
//  Created by 張文煥 on 2023/6/16.
//

import XCTest
import OSLog

final class APIManagerTest: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    let logger = Logger()

    func testGetZooParkInfo() {
        
        let expect = expectation(description: "GetZooParkInfo")
        
        APIManager.getTaipeiZooParkInfo { result in
            switch result {
            case .success(let infos):
                guard let infos = infos else {
                    XCTFail("error: data is nil")
                    return
                }
                self.logger.debug("DEBUG info count: \(infos.count)")
                infos.forEach { info in
                    self.logger.log("zoo park info name: \(info.name)")
                }
                expect.fulfill()
            case .failure(let error):
                XCTFail("error: \(error.localizedDescription)")
            }
        }
        
        wait(for: [expect], timeout: 5)
        
    }

}
