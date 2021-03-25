import Foundation

public struct ParameterValue: Codable {
    public var gadgetParameterDescriptionName: String?
    public var intValue: Int?
    public var stringValue: String?
    public var boolValue: Bool?
    public var stringsList: [String]?
}
