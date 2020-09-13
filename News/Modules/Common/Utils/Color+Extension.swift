//
//  Color+Extension.swift
//  News
//
//  Created by Nguyen The Phuong on 9/13/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import Foundation
import UIKit

extension Color {
    @inlinable
    public func alpha(_ value: CGFloat) -> UIKit.UIColor {
        return self.withAlphaComponent(value)
    }
}
