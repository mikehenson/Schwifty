//
// CoreBluetooth.swift
//
// Created by Mike Henson on 12/22/2015.
// Copyright © 2015 Mike Henson. All rights reserved.
//

import CoreBluetooth

extension CBError: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        var stateText = ""
        switch self {
        case .Unknown:
            stateText = "Unknown"
        case .InvalidParameters:
            stateText = "Invalid Parameters"
        case .InvalidHandle:
            stateText = "Invalid Handle"
        case .NotConnected:
            stateText = "Not Connected"
        case .OutOfSpace:
            stateText = "Out of Space"
        case .OperationCancelled:
            stateText = "Operation Cancelled"
        case .ConnectionTimeout:
            stateText = "Connection Timeout"
        case .PeripheralDisconnected:
            stateText = "Peripheral Disconnected"
        case .UUIDNotAllowed:
            stateText = "UUID Not Allowed"
        case .AlreadyAdvertising:
            stateText = "Already Advertising"
        case .ConnectionFailed:
            stateText = "Connection Failed"
        case .ConnectionLimitReached:
            stateText = "Connection Limit Reached"
        }
        return stateText
    }
    public var debugDescription: String {
        return self.description
    }
}

extension CBATTError: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        var stateText = ""
        switch self {
        case .Success:
            stateText = "Success"
        case .InvalidHandle:
            stateText = "Invalid Handle"
        case .ReadNotPermitted:
            stateText = "Read Not Permitted"
        case .WriteNotPermitted:
            stateText = "Write Not Permitted"
        case .InvalidPdu:
            stateText = "Invalid Pdu"
        case .InsufficientAuthentication:
            stateText = "Insufficient Authentication"
        case .RequestNotSupported:
            stateText = "Request Not Supported"
        case .InvalidOffset:
            stateText = "Invalid Offset"
        case .InsufficientAuthorization:
            stateText = "Insufficient Authorization"
        case .PrepareQueueFull:
            stateText = "Prepare Queue Full"
        case .AttributeNotFound:
            stateText = "Attribute Not Found"
        case .AttributeNotLong:
            stateText = "Attribute Not Long"
        case .InsufficientEncryptionKeySize:
            stateText = "Insufficient Encryption Key Size"
        case .InvalidAttributeValueLength:
            stateText = "Invalid Attribute Value Length"
        case .UnlikelyError:
            stateText = "Unlikely Error"
        case .InsufficientEncryption:
            stateText = "Insufficient Encryption"
        case .UnsupportedGroupType:
            stateText = "Unsupported Group Type"
        case .InsufficientResources:
            stateText = "Insufficient Resources"
        }
        return stateText
    }
    public var debugDescription: String {
        return self.description
    }
}

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

