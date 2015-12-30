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

extension CBPeripheralState: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        var stateText = ""

        switch self {
        case .Disconnected:
            stateText = "Disconnected"
        case .Connecting:
            stateText = "Connecting"
        case .Connected:
            stateText = "Connected"
        case .Disconnecting:
            stateText = "Disconnecting"
        }

        return stateText
    }
    public var debugDescription: String {
        return self.description
    }
}

extension CBCharacteristicWriteType: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        var stateText = ""

        switch self {
        case .WithResponse:
            stateText = "With Response"
        case .WithoutResponse:
            stateText = "Without Response"
        }

        return stateText
    }
    public var debugDescription: String {
        return self.description
    }
}

extension CBCharacteristic {
    func readValue() {
        // FIXME: Find some way to indicate whether or not this call did anything
        if self.properties.contains(CBCharacteristicProperties.Read) {
            self.service.peripheral.readValueForCharacteristic(self)
        }
    }
}

extension CBDescriptor {
    func readValue() {
        self.characteristic.service.peripheral.readValueForDescriptor(self)
    }
}

