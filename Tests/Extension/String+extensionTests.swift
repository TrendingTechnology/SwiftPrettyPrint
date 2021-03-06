//
// String+extensionTests.swift
// SwiftPrettyPrint
//
// Created by Yusuke Hosonuma on 2020/02/27.
// Copyright (c) 2020 Yusuke Hosonuma.
//

@testable import SwiftPrettyPrint
import XCTest
import SwiftParamTest

class String_extensionTests: XCTestCase {
    override func setUp() {}

    override func tearDown() {}

    func testIndentTail() {
        let text = """
        Apple
        Orange
        Banana
        """
        
        assert(to: uncurry(String.indentTail), with: assertEqualLines) {
            // Single-line
            args(("Apple", 4), expect: "Apple")
            
            // Multi-line
            args((text, 2), expect: """
                                    Apple
                                      Orange
                                      Banana
                                    """)
            args((text, 4), expect: """
                                    Apple
                                        Orange
                                        Banana
                                    """)
        }
    }
}
