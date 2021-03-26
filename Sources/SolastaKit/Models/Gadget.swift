import Foundation

public struct Gadget: Codable {
    public var uniqueName: String?
    public var localPosition: Position?
    public var orientation: Double?
    
    // TODO: this could probably be an enum -- leave for now
    public var gadgetBlueprintName: String?
    public var parameterValues: [ParameterValue]?
}
