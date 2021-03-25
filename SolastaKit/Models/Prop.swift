import Foundation

public struct Prop: Codable {
    public var localPosition: Position?
    public var orientation: Double?
    public var propBlueprintName: String?
    public var parameterValues: [ParameterValue]?
}
