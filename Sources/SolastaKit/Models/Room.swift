import Foundation

public struct Room: Codable {
    public var position: Position?
    public var orientation: Double?
    public var altitude: Double?
    public var roomBlueprintName: String?
    public var userProps: [Prop]?
    public var userGadgets: [Gadget]?
}
