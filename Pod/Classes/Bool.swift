//
// Bool.swift
//
// Created by Mike Henson on 12/9/2015.
// Copyright © 2015 Mike Henson. All rights reserved.
//

public extension Bool {
    public mutating func toggle() -> Bool {
        self = !self
        return self
    }
}
