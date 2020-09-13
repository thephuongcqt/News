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
    
    var image: UIImage? {
        let rect = CGRect(origin: .zero, size: CGSize(width: 1.0, height: 1.0))
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()

        context?.setFillColor(cgColor)
        context?.fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
}

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        setBackgroundImage(color.image, for: state)
    }
}

extension UIViewController {
    var safeAreaBottomInset: CGFloat {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0.0
        } else {
            return 0.0
        }
    }
}

extension UIScrollView {
    func isNearBottomEdge(edgeOffset: CGFloat = 50.0) -> Bool {
        contentOffset.y + frame.size.height + edgeOffset > contentSize.height
    }
}
