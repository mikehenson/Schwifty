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

// https://developer.bluetooth.org/gatt/services/Pages/ServicesHome.aspx
enum BTKnownGATTServices: String {
    case AlertNotificationService = "1811"
    case AutomationIO             = "1815"
    case BatteryService           = "180F"
    case BloodPressure            = "1810"
    case BodyComposition          = "181B"
    case BondManagement           = "181E"
    case ContinuousGlucoseMonitoring = "181F"
    case CurrentTimeService       = "1805"
    case CyclingPower             = "1818"
    case CyclingSpeedAndCadence   = "1816"
    case DeviceInformation        = "180A"
    case EnvironmentalSensing     = "181A"
    case GenericAccess            = "1800"
    case GenericAttribute         = "1801"
    case Glucose                  = "1808"
    case HealthThermometer        = "1809"
    case HeartRate                = "180D"
    case HTTPProxy                = "1823"
    case HumanInterfaceDevice     = "1812"
    case ImmediateAlert           = "1802"
    case IndoorPositioning        = "1821"
    case InternetProtocolSupport  = "1820"
    case LinkLoss                 = "1803"
    case LocationAndNavigation    = "1819"
    case NextDSTChangeService     = "1807"
    case ObjectTransfer           = "1825"
    case PhoneAlertStatusService  = "180E"
    case PulseOximeter            = "1822"
    case ReferenceTimeUpdateService = "1806"
    case RunningSpeedAndCadence   = "1814"
    case ScanParameters           = "1813"
    case TransportDiscovery       = "1824"
    case TxPower                  = "1804"
    case UserData                 = "181C"
    case WeightScale              = "181D"
}

// https://developer.bluetooth.org/gatt/characteristics/Pages/CharacteristicsHome.aspx
enum BTKnownGATTCharacteristics: String {
    case AerobicHeartRateLowerLimit = "2A7E"
    case AerobicHeartRateUpperLimit = "2A84"
    case AerobicThreshold           = "2A7F"
    case Age                        = "2A80"
    case Aggregate                  = "2A5A"
    case AlertCategoryID            = "2A43"
    case AlertCategoryIDBitMask     = "2A42"
    case AlertLevel                 = "2A06"
    case AlertNotificationControlPoint = "2A44"
    case AlertStatus                = "2A3F"
    case Altitude                   = "2AB3"
    case AnaerobicHeartRateLowerLimit = "2A81"
    case AnaerobicHeartRateUpperLimit = "2A82"
    case AnaerobicThreshold         = "2A83"
    case Analog                     = "2A58"
    case ApparantWindDirection      = "2A73"
    case ApparantWindSpeed          = "2a72"
    case Appearance                 = "2A01"
    case BarometricPressureTrend    = "2AA3"
    case BatteryLevel               = "2A19"
    case BloodPressureFeature       = "2A49"
    case BloodPressureMeasurement   = "2A35"
    case BodyCompositionFeature     = "2A9B"
    case BodyCompositionMeasurement = "2A9C"
    case BodySensorLocation         = "2A38"
    case BondManagementControlPoint = "2AA4"
    case BondManagementFeature      = "2AA5"
    case BootKeyboardInputReport    = "2A22"
    case BootKeyboardOutputReport   = "2A32"
    case BootMouseInputReport       = "2A33"
    case CentralAddressResolution   = "2AA6"
    case CGMFeature                 = "2AA8"
    case CGMMeasurement             = "2AA7"
    case CGMSessionRunTime          = "2AAB"
    case CGMSessionStartTime        = "2AAA"
    case CGMSpecificOpsControlPoint = "2AAC"
    case CGMStatus                  = "2AA9"
    case CSCFeature                 = "2A5C"
    case CSCMeasurement             = "2A5B"
    case CurrentTime                = "2A2B"
    case CyclingPowerControlPoint   = "2A66"
    case CyclingPowerFeature        = "2A65"
    case CyclingPowerMeasurement    = "2A63"
    case CyclingPowerVector         = "2A64"
    case DatabaseChangeIncrement    = "2A99"
    case DateOfBirth                = "2A85"
    case DateOfThresholdAssignment  = "2A86"
    case DateTime                   = "2A08"
    case DayDateTime                = "2A0A"
    case DayOfWeek                  = "2A09"
    case DescriptorValueChanged     = "2A7D"
    case DeviceName                 = "2A00"
    case DewPoint                   = "2A7B"
    case Digital                    = "2A56"
    case DSTOffset                  = "2A0D"
    case Elevation                  = "2A6C"
    case EmailAddress               = "2A87"
    case ExactTime256               = "2A0C"
    case FatBurnHeartRateLowerLimit = "2A88"
    case FatBurnHeartRateUpperLimit = "2A89"
    case FirmwareRevisionString     = "2A26"
    case FirstName                  = "2A8A"
    case FiveZoneHeartRateLimits    = "2A8B"
    case FloorNumber                = "2AB2"
    case Gender                     = "2A8C"
    case GlucoseFeature             = "2A51"
    case GlucoseMeasurement         = "2A18"
    case GlucoseMeasurementContext  = "2A34"
    case GustFactor                 = "2A74"
    case HardwareRevisionString     = "2A27"
    case HeartRateControlPoint      = "2A39"
    case HeartRateMax               = "2A8D"
    case HeartRateMeasurement       = "2A37"
    case HeatIndex                  = "2A7A"
    case Height                     = "2A8E"
    case HIDControlPoint            = "2A4C"
    case HIDInformation             = "2A4A"
    case HipCircumference           = "2A8F"
    case HTTPControlPoint           = "2ABA"
    case HTTPEntityBody             = "2AB9"
    case HTTPHeaders                = "2AB7"
    case HTTPStatusCode             = "2AB8"
    case HTTPSSecurity              = "2ABB"
    case Humidity                   = "2A6F"
    case IEEERegulatoryCertDataList = "2A2A"
    case IndoorPositioningConfiguration = "2AAD"
    case IntermediateCuffPressure   = "2A36"
    case IntermediateTemperature    = "2A1E"
    case Irradiance                 = "2A77"
    case Language                   = "2AA2"
    case LastName                   = "2A90"
    case Latitude                   = "2AAE"
    case LNControlPoint             = "2A6B"
    case LNFeature                  = "2A6A"
    case LocalEastCoordinate        = "2AB1"
    case LocalNorthCoordinate       = "2AB0"
    case LocalTimeInformation       = "2A0F"
    case LocationAndSpeed           = "2A67"
    case LocationName               = "2AB5"
    case Longitude                  = "2AAF"
    case MagneticDeclination        = "2A2C"
    case MagneticFluxDensity2D      = "2AA0"
    case MagneticFluxDensity3D      = "2AA1"
    case ManufacturerNameString     = "2A29"
    case MaximumRecommendedHeartRate = "2A91"
    case MeasurementInterval        = "2A21"
    case ModelNumberString          = "2A24"
    case Navigation                 = "2A68"
    case NewAlert                   = "2A46"
    case ObjectActionControlPoint   = "2AC5"
    case ObjectChanged              = "2AC8"
    case ObjectFirstCreated         = "2AC1"
    case ObjectID                   = "2AC3"
    case ObjectLastModified         = "2AC2"
    case ObjectListControlPoint     = "2AC6"
    case ObjectListFilter           = "2AC7"
    case ObjectName                 = "2ABE"
    case ObjectProperties           = "2AC4"
    case ObjectSize                 = "2AC0"
    case ObjectType                 = "2ABF"
    case OTSFeature                 = "2ABD"
    case PeripheralPreferredConnectionParameters = "2A04"
    case PeripheralPrivacyFlag      = "2A02"
    case PLXContinuousMeasurement   = "2A5F"
    case PLXFeatures                = "2A60"
    case PLXSpotCheckMeasurement    = "2A5E"
    case PnPID                      = "2A50"
    case PollenConcentration        = "2A75"
    case PositionQuality            = "2A69"
    case Pressure                   = "2A6D"
    case ProtocolMode               = "2A4E"
    case Rainfall                   = "2A78"
    case ReconnectionAddress        = "2A03"
    case RecordAccessControlPoint   = "2A52"
    case ReferenceTimeInformation   = "2A14"
    case Report                     = "2A4D"
    case ReportMap                  = "2A4B"
    case RestingHeartRate           = "2A92"
    case RingerControlPoint         = "2A40"
    case RingerSetting              = "2A41"
    case RSCFeature                 = "2A54"
    case RSCMeasurement             = "2A53"
    case SCControlPoint             = "2A55"
    case ScanIntervalWindow         = "2A4F"
    case ScanRefresh                = "2A31"
    case SensorLocation             = "2A5D"
    case SerialNumberString         = "2A25"
    case ServiceChanged             = "2A05"
    case SoftwareRevisionString     = "2A28"
    case SportTypeForAerobicAndAnaerobicThresholds = "2A93"
    case SupportedNewAlertCategory  = "2A47"
    case SupportedUnreadAlertCategory = "2A48"
    case SystemID                   = "2A23"
    case TDSControlPoint            = "2ABC"
    case Temperature                = "2A6E"
    case TemperatureMeasurement     = "2A1C"
    case TemperatureType            = "2A1D"
    case ThreeZoneHeartRateLimits   = "2A94"
    case TimeAccuracy               = "2A12"
    case TimeSource                 = "2A13"
    case TimeUpdateControlPoint     = "2A16"
    case TimeUpdateState            = "2A17"
    case TimeWithDST                = "2A11"
    case TimeZone                   = "2A0E"
    case TrueWindDirection          = "2A71"
    case TrueWindSpeed              = "2A70"
    case TwoZoneHeartRateLimit      = "2A95"
    case TxPowerLevel               = "2A07"
    case Uncertainty                = "2AB4"
    case UnreadAlertStatus          = "2A45"
    case URI                        = "2AB6"
    case UserControlPoint           = "2A9F"
    case UserIndex                  = "2A9A"
    case UVIndex                    = "2A76"
    case VO2Max                     = "2A96"
    case WaistCircumference         = "2A97"
    case Weight                     = "2A98"
    case WeightMeasurement          = "2A9D"
    case WeightScaleFeature         = "2A9E"
    case WindChill                  = "2A79"
}

// https://developer.bluetooth.org/gatt/services/Pages/ServicesHome.aspx
enum BTKnownGATTDescriptors: String {
    case CharacteristicExtendedProperties   = "2900"
    case CharacteristicUserDescription      = "2901"
    case ClientCharacteristicConfiguration  = "2902"
    case ServerCharacteristicConfiguration  = "2903"
    case CharacteristicPresentationFormat   = "2904"
    case CharacteristicAggregateFormat      = "2905"
    case ValidRange                         = "2906"
    case ExternalReportReference            = "2907"
    case ReportReference                    = "2908"
    case NumberOfDigitals                   = "2909"
    case ValueTriggerSetting                = "290A"
    case EnvironmentalSensingConfiguration  = "290B"
    case EnvironmentalSensingMeasurement    = "290C"
    case EnvironmentalSensingTriggerSetting = "290D"
    case TimeTriggerSetting                 = "290E"
}

