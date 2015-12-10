//
//  UIView.swift
//  Pods
//
// Created by Mike Henson on 12/9/2015.
// Copyright © 2015 Mike Henson. All rights reserved.
//

import UIKit

public extension UIView {
    convenience init(size:CGSize) {
        self.init(frame:CGRect(origin: CGPoint(x:0, y:0), size: size))
    }
    convenience init(sameSizeAsView:UIView) {
        self.init(size: sameSizeAsView.frame.size)
    }
}
