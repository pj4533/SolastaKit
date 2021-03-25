import Foundation

public struct Gadget: Codable {
    public var uniqueName: String?
    public var localPosition: Position?
    public var orientation: Double?
    public var gadgetBlueprintName: String?
    public var parameterValues: [ParameterValue]?
}
