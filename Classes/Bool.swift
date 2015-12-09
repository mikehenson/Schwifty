//
// Bool.swift
//
// Created by Mike Henson on 12/9/2015.
// Copyright © 2015 Mike Henson. All rights reserved.
//

extension Bool {
    mutating func toggle() -> Bool {
        self = !self
        return self
    }
}

