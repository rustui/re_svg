import FlutterMacOS

public class ReSvgPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {

  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

  }

  public func dummy() {
    print(resvg_options_create)
    print(resvg_options_destroy)
    print(resvg_parse_tree_from_data)
    print(resvg_tree_destroy)
    print(resvg_get_image_size)
    print(resvg_transform_identity)
    print(resvg_render)
  }
}
