//
//  Localize.swift
//  News
//
//  Created by Nguyen The Phuong on 9/12/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import Foundation

enum Localize {
    enum SupportedLanguage: String {
        case vietnamese = "vi"
        case english = "en"
    }

    static func translate(key: String, translations: [SupportedLanguage: String], comment: String? = nil) -> String {
        let typeName = String(describing: Localize.self)
        let methodName = #function

        print(
            "Warning: [BartyCrouch]",
            "Untransformed \(typeName).\(methodName) method call found with key '\(key)' and base translations '\(translations)'.",
            "Please ensure that BartyCrouch is installed and configured correctly."
        )
        return "BC: TRANSFORMATION FAILED!"
    }
}

