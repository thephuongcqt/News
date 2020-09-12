// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSColor
  public typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  public typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Colors

// swiftlint:disable identifier_name line_length type_body_length
public struct ColorName {
  public let rgbaValue: UInt32
  public var color: Color { return Color(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#01d7e2"></span>
  /// Alpha: 100% <br/> (0x01d7e2ff)
  public static let aquaBlue = ColorName(rgbaValue: 0x01d7e2ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#76f8be"></span>
  /// Alpha: 100% <br/> (0x76f8beff)
  public static let aquamarine = ColorName(rgbaValue: 0x76f8beff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#000000"></span>
  /// Alpha: 100% <br/> (0x000000ff)
  public static let black = ColorName(rgbaValue: 0x000000ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#272727"></span>
  /// Alpha: 100% <br/> (0x272727ff)
  public static let black1 = ColorName(rgbaValue: 0x272727ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#050505"></span>
  /// Alpha: 100% <br/> (0x050505ff)
  public static let black2 = ColorName(rgbaValue: 0x050505ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#161616"></span>
  /// Alpha: 100% <br/> (0x161616ff)
  public static let black3 = ColorName(rgbaValue: 0x161616ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#007aff"></span>
  /// Alpha: 100% <br/> (0x007affff)
  public static let blueLink = ColorName(rgbaValue: 0x007affff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#31f5b7"></span>
  /// Alpha: 100% <br/> (0x31f5b7ff)
  public static let brightTurquoise = ColorName(rgbaValue: 0x31f5b7ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f5f5f5"></span>
  /// Alpha: 100% <br/> (0xf5f5f5ff)
  public static let culturedPearl = ColorName(rgbaValue: 0xf5f5f5ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#e09365"></span>
  /// Alpha: 100% <br/> (0xe09365ff)
  public static let dustyOrange = ColorName(rgbaValue: 0xe09365ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#4d4d4d"></span>
  /// Alpha: 100% <br/> (0x4d4d4dff)
  public static let greyishBrown = ColorName(rgbaValue: 0x4d4d4dff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fbff17"></span>
  /// Alpha: 100% <br/> (0xfbff17ff)
  public static let laserLemon = ColorName(rgbaValue: 0xfbff17ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#b2c0c8"></span>
  /// Alpha: 100% <br/> (0xb2c0c8ff)
  public static let loblolly = ColorName(rgbaValue: 0xb2c0c8ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#272727"></span>
  /// Alpha: 100% <br/> (0x272727ff)
  public static let mineShaft = ColorName(rgbaValue: 0x272727ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f9f9f9"></span>
  /// Alpha: 100% <br/> (0xf9f9f9ff)
  public static let neutral1 = ColorName(rgbaValue: 0xf9f9f9ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f0f0f3"></span>
  /// Alpha: 100% <br/> (0xf0f0f3ff)
  public static let neutral2 = ColorName(rgbaValue: 0xf0f0f3ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f2f2f7"></span>
  /// Alpha: 100% <br/> (0xf2f2f7ff)
  public static let neutral3 = ColorName(rgbaValue: 0xf2f2f7ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f26540"></span>
  /// Alpha: 100% <br/> (0xf26540ff)
  public static let rose = ColorName(rgbaValue: 0xf26540ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f2bf30"></span>
  /// Alpha: 100% <br/> (0xf2bf30ff)
  public static let saffron1 = ColorName(rgbaValue: 0xf2bf30ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffde85"></span>
  /// Alpha: 100% <br/> (0xffde85ff)
  public static let salomie = ColorName(rgbaValue: 0xffde85ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#e3864f"></span>
  /// Alpha: 100% <br/> (0xe3864fff)
  public static let sasquatchSocks2 = ColorName(rgbaValue: 0xe3864fff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#309c87"></span>
  /// Alpha: 100% <br/> (0x309c87ff)
  public static let sea = ColorName(rgbaValue: 0x309c87ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#00ffcf"></span>
  /// Alpha: 29% <br/> (0x00ffcf4b)
  public static let sunglow1 = ColorName(rgbaValue: 0x00ffcf4b)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#eea800"></span>
  /// Alpha: 100% <br/> (0xeea800ff)
  public static let webOrange = ColorName(rgbaValue: 0xeea800ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f4a300"></span>
  /// Alpha: 100% <br/> (0xf4a300ff)
  public static let webOrange1 = ColorName(rgbaValue: 0xf4a300ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffffff"></span>
  /// Alpha: 100% <br/> (0xffffffff)
  public static let white = ColorName(rgbaValue: 0xffffffff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fbff17"></span>
  /// Alpha: 100% <br/> (0xfbff17ff)
  public static let yellow = ColorName(rgbaValue: 0xfbff17ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fed00a"></span>
  /// Alpha: 100% <br/> (0xfed00aff)
  public static let yellow2 = ColorName(rgbaValue: 0xfed00aff)
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal extension Color {
  convenience init(rgbaValue: UInt32) {
    let components = RGBAComponents(rgbaValue: rgbaValue).normalized
    self.init(red: components[0], green: components[1], blue: components[2], alpha: components[3])
  }
}

private struct RGBAComponents {
  let rgbaValue: UInt32

  private var shifts: [UInt32] {
    [
      rgbaValue >> 24, // red
      rgbaValue >> 16, // green
      rgbaValue >> 8,  // blue
      rgbaValue        // alpha
    ]
  }

  private var components: [CGFloat] {
    shifts.map {
      CGFloat($0 & 0xff)
    }
  }

  var normalized: [CGFloat] {
    components.map { $0 / 255.0 }
  }
}

public extension Color {
  convenience init(named color: ColorName) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
