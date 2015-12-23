//
// CoreBluetooth.swift
//
// Created by Mike Henson on 12/22/2015.
// Copyright © 2015 Mike Henson. All rights reserved.
//

extension CBCentralManagerState: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        var stateText = ""
        switch self {
        case .Unknown:
            stateText = "Unknown"
        case .Unsupported:
            stateText = "Unsupported"
        case .Unauthorized:
            stateText = "Unauthorized"
        case .Resetting:
            stateText = "Resetting"
        case .PoweredOn:
            stateText = "Powered On"
        case .PoweredOff:
            stateText = "Powered Off"
        }
        return stateText
    }
    public var debugDescription: String {
        return self.description
    }
}

