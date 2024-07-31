// ignore_for_file: always_specify_types
// ignore_for_file: camel_case_types
// ignore_for_file: non_constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint
import 'dart:ffi' as ffi;

/// Bindings for `src/resvg.h`.
///
/// Regenerate bindings with `dart run ffigen --config ffigen.yaml`.
///
class ReSvgBindings {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  ReSvgBindings(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  ReSvgBindings.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  /// @brief Creates an identity transform.
  resvg_transform resvg_transform_identity() {
    return _resvg_transform_identity();
  }

  late final _resvg_transform_identityPtr =
      _lookup<ffi.NativeFunction<resvg_transform Function()>>(
          'resvg_transform_identity');
  late final _resvg_transform_identity =
      _resvg_transform_identityPtr.asFunction<resvg_transform Function()>();

  /// @brief Initializes the library log.
  ///
  /// Use it if you want to see any warnings.
  ///
  /// Must be called only once.
  ///
  /// All warnings will be printed to the `stderr`.
  void resvg_init_log() {
    return _resvg_init_log();
  }

  late final _resvg_init_logPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function()>>('resvg_init_log');
  late final _resvg_init_log = _resvg_init_logPtr.asFunction<void Function()>();

  /// @brief Creates a new #resvg_options object.
  ///
  /// Should be destroyed via #resvg_options_destroy.
  ffi.Pointer<resvg_options> resvg_options_create() {
    return _resvg_options_create();
  }

  late final _resvg_options_createPtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<resvg_options> Function()>>(
          'resvg_options_create');
  late final _resvg_options_create = _resvg_options_createPtr
      .asFunction<ffi.Pointer<resvg_options> Function()>();

  /// @brief Sets a directory that will be used during relative paths resolving.
  ///
  /// Expected to be the same as the directory that contains the SVG file,
  /// but can be set to any.
  ///
  /// Must be UTF-8. Can be set to NULL.
  ///
  /// Default: NULL
  void resvg_options_set_resources_dir(
    ffi.Pointer<resvg_options> opt,
    ffi.Pointer<ffi.Char> path,
  ) {
    return _resvg_options_set_resources_dir(
      opt,
      path,
    );
  }

  late final _resvg_options_set_resources_dirPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<resvg_options>,
              ffi.Pointer<ffi.Char>)>>('resvg_options_set_resources_dir');
  late final _resvg_options_set_resources_dir =
      _resvg_options_set_resources_dirPtr.asFunction<
          void Function(ffi.Pointer<resvg_options>, ffi.Pointer<ffi.Char>)>();

  /// @brief Sets the target DPI.
  ///
  /// Impact units conversion.
  ///
  /// Default: 96
  void resvg_options_set_dpi(
    ffi.Pointer<resvg_options> opt,
    double dpi,
  ) {
    return _resvg_options_set_dpi(
      opt,
      dpi,
    );
  }

  late final _resvg_options_set_dpiPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Pointer<resvg_options>, ffi.Float)>>('resvg_options_set_dpi');
  late final _resvg_options_set_dpi = _resvg_options_set_dpiPtr
      .asFunction<void Function(ffi.Pointer<resvg_options>, double)>();

  /// @brief Sets the default font family.
  ///
  /// Will be used when no `font-family` attribute is set in the SVG.
  ///
  /// Must be UTF-8. NULL is not allowed.
  ///
  /// Default: Times New Roman
  void resvg_options_set_font_family(
    ffi.Pointer<resvg_options> opt,
    ffi.Pointer<ffi.Char> family,
  ) {
    return _resvg_options_set_font_family(
      opt,
      family,
    );
  }

  late final _resvg_options_set_font_familyPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<resvg_options>,
              ffi.Pointer<ffi.Char>)>>('resvg_options_set_font_family');
  late final _resvg_options_set_font_family =
      _resvg_options_set_font_familyPtr.asFunction<
          void Function(ffi.Pointer<resvg_options>, ffi.Pointer<ffi.Char>)>();

  /// @brief Sets the default font size.
  ///
  /// Will be used when no `font-size` attribute is set in the SVG.
  ///
  /// Default: 12
  void resvg_options_set_font_size(
    ffi.Pointer<resvg_options> opt,
    double size,
  ) {
    return _resvg_options_set_font_size(
      opt,
      size,
    );
  }

  late final _resvg_options_set_font_sizePtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<resvg_options>,
              ffi.Float)>>('resvg_options_set_font_size');
  late final _resvg_options_set_font_size = _resvg_options_set_font_sizePtr
      .asFunction<void Function(ffi.Pointer<resvg_options>, double)>();

  /// @brief Sets the `serif` font family.
  ///
  /// Must be UTF-8. NULL is not allowed.
  ///
  /// Has no effect when the `text` feature is not enabled.
  ///
  /// Default: Times New Roman
  void resvg_options_set_serif_family(
    ffi.Pointer<resvg_options> opt,
    ffi.Pointer<ffi.Char> family,
  ) {
    return _resvg_options_set_serif_family(
      opt,
      family,
    );
  }

  late final _resvg_options_set_serif_familyPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<resvg_options>,
              ffi.Pointer<ffi.Char>)>>('resvg_options_set_serif_family');
  late final _resvg_options_set_serif_family =
      _resvg_options_set_serif_familyPtr.asFunction<
          void Function(ffi.Pointer<resvg_options>, ffi.Pointer<ffi.Char>)>();

  /// @brief Sets the `sans-serif` font family.
  ///
  /// Must be UTF-8. NULL is not allowed.
  ///
  /// Has no effect when the `text` feature is not enabled.
  ///
  /// Default: Arial
  void resvg_options_set_sans_serif_family(
    ffi.Pointer<resvg_options> opt,
    ffi.Pointer<ffi.Char> family,
  ) {
    return _resvg_options_set_sans_serif_family(
      opt,
      family,
    );
  }

  late final _resvg_options_set_sans_serif_familyPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<resvg_options>,
              ffi.Pointer<ffi.Char>)>>('resvg_options_set_sans_serif_family');
  late final _resvg_options_set_sans_serif_family =
      _resvg_options_set_sans_serif_familyPtr.asFunction<
          void Function(ffi.Pointer<resvg_options>, ffi.Pointer<ffi.Char>)>();

  /// @brief Sets the `cursive` font family.
  ///
  /// Must be UTF-8. NULL is not allowed.
  ///
  /// Has no effect when the `text` feature is not enabled.
  ///
  /// Default: Comic Sans MS
  void resvg_options_set_cursive_family(
    ffi.Pointer<resvg_options> opt,
    ffi.Pointer<ffi.Char> family,
  ) {
    return _resvg_options_set_cursive_family(
      opt,
      family,
    );
  }

  late final _resvg_options_set_cursive_familyPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<resvg_options>,
              ffi.Pointer<ffi.Char>)>>('resvg_options_set_cursive_family');
  late final _resvg_options_set_cursive_family =
      _resvg_options_set_cursive_familyPtr.asFunction<
          void Function(ffi.Pointer<resvg_options>, ffi.Pointer<ffi.Char>)>();

  /// @brief Sets the `fantasy` font family.
  ///
  /// Must be UTF-8. NULL is not allowed.
  ///
  /// Has no effect when the `text` feature is not enabled.
  ///
  /// Default: Papyrus on macOS, Impact on other OS'es
  void resvg_options_set_fantasy_family(
    ffi.Pointer<resvg_options> opt,
    ffi.Pointer<ffi.Char> family,
  ) {
    return _resvg_options_set_fantasy_family(
      opt,
      family,
    );
  }

  late final _resvg_options_set_fantasy_familyPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<resvg_options>,
              ffi.Pointer<ffi.Char>)>>('resvg_options_set_fantasy_family');
  late final _resvg_options_set_fantasy_family =
      _resvg_options_set_fantasy_familyPtr.asFunction<
          void Function(ffi.Pointer<resvg_options>, ffi.Pointer<ffi.Char>)>();

  /// @brief Sets the `monospace` font family.
  ///
  /// Must be UTF-8. NULL is not allowed.
  ///
  /// Has no effect when the `text` feature is not enabled.
  ///
  /// Default: Courier New
  void resvg_options_set_monospace_family(
    ffi.Pointer<resvg_options> opt,
    ffi.Pointer<ffi.Char> family,
  ) {
    return _resvg_options_set_monospace_family(
      opt,
      family,
    );
  }

  late final _resvg_options_set_monospace_familyPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<resvg_options>,
              ffi.Pointer<ffi.Char>)>>('resvg_options_set_monospace_family');
  late final _resvg_options_set_monospace_family =
      _resvg_options_set_monospace_familyPtr.asFunction<
          void Function(ffi.Pointer<resvg_options>, ffi.Pointer<ffi.Char>)>();

  /// @brief Sets a comma-separated list of languages.
  ///
  /// Will be used to resolve a `systemLanguage` conditional attribute.
  ///
  /// Example: en,en-US.
  ///
  /// Must be UTF-8. Can be NULL.
  ///
  /// Default: en
  void resvg_options_set_languages(
    ffi.Pointer<resvg_options> opt,
    ffi.Pointer<ffi.Char> languages,
  ) {
    return _resvg_options_set_languages(
      opt,
      languages,
    );
  }

  late final _resvg_options_set_languagesPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<resvg_options>,
              ffi.Pointer<ffi.Char>)>>('resvg_options_set_languages');
  late final _resvg_options_set_languages =
      _resvg_options_set_languagesPtr.asFunction<
          void Function(ffi.Pointer<resvg_options>, ffi.Pointer<ffi.Char>)>();

  /// @brief Sets the default shape rendering method.
  ///
  /// Will be used when an SVG element's `shape-rendering` property is set to `auto`.
  ///
  /// Default: `RESVG_SHAPE_RENDERING_GEOMETRIC_PRECISION`
  void resvg_options_set_shape_rendering_mode(
    ffi.Pointer<resvg_options> opt,
    resvg_shape_rendering mode,
  ) {
    return _resvg_options_set_shape_rendering_mode(
      opt,
      mode.value,
    );
  }

  late final _resvg_options_set_shape_rendering_modePtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<resvg_options>,
              ffi.UnsignedInt)>>('resvg_options_set_shape_rendering_mode');
  late final _resvg_options_set_shape_rendering_mode =
      _resvg_options_set_shape_rendering_modePtr
          .asFunction<void Function(ffi.Pointer<resvg_options>, int)>();

  /// @brief Sets the default text rendering method.
  ///
  /// Will be used when an SVG element's `text-rendering` property is set to `auto`.
  ///
  /// Default: `RESVG_TEXT_RENDERING_OPTIMIZE_LEGIBILITY`
  void resvg_options_set_text_rendering_mode(
    ffi.Pointer<resvg_options> opt,
    resvg_text_rendering mode,
  ) {
    return _resvg_options_set_text_rendering_mode(
      opt,
      mode.value,
    );
  }

  late final _resvg_options_set_text_rendering_modePtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<resvg_options>,
              ffi.UnsignedInt)>>('resvg_options_set_text_rendering_mode');
  late final _resvg_options_set_text_rendering_mode =
      _resvg_options_set_text_rendering_modePtr
          .asFunction<void Function(ffi.Pointer<resvg_options>, int)>();

  /// @brief Sets the default image rendering method.
  ///
  /// Will be used when an SVG element's `image-rendering` property is set to `auto`.
  ///
  /// Default: `RESVG_IMAGE_RENDERING_OPTIMIZE_QUALITY`
  void resvg_options_set_image_rendering_mode(
    ffi.Pointer<resvg_options> opt,
    resvg_image_rendering mode,
  ) {
    return _resvg_options_set_image_rendering_mode(
      opt,
      mode.value,
    );
  }

  late final _resvg_options_set_image_rendering_modePtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<resvg_options>,
              ffi.UnsignedInt)>>('resvg_options_set_image_rendering_mode');
  late final _resvg_options_set_image_rendering_mode =
      _resvg_options_set_image_rendering_modePtr
          .asFunction<void Function(ffi.Pointer<resvg_options>, int)>();

  /// @brief Loads a font data into the internal fonts database.
  ///
  /// Prints a warning into the log when the data is not a valid TrueType font.
  ///
  /// Has no effect when the `text` feature is not enabled.
  void resvg_options_load_font_data(
    ffi.Pointer<resvg_options> opt,
    ffi.Pointer<ffi.Char> data,
    int len,
  ) {
    return _resvg_options_load_font_data(
      opt,
      data,
      len,
    );
  }

  late final _resvg_options_load_font_dataPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<resvg_options>, ffi.Pointer<ffi.Char>,
              ffi.UintPtr)>>('resvg_options_load_font_data');
  late final _resvg_options_load_font_data =
      _resvg_options_load_font_dataPtr.asFunction<
          void Function(
              ffi.Pointer<resvg_options>, ffi.Pointer<ffi.Char>, int)>();

  /// @brief Loads a font file into the internal fonts database.
  ///
  /// Prints a warning into the log when the data is not a valid TrueType font.
  ///
  /// Has no effect when the `text` feature is not enabled.
  ///
  /// @return #resvg_error with RESVG_OK, RESVG_ERROR_NOT_AN_UTF8_STR or RESVG_ERROR_FILE_OPEN_FAILED
  int resvg_options_load_font_file(
    ffi.Pointer<resvg_options> opt,
    ffi.Pointer<ffi.Char> file_path,
  ) {
    return _resvg_options_load_font_file(
      opt,
      file_path,
    );
  }

  late final _resvg_options_load_font_filePtr = _lookup<
      ffi.NativeFunction<
          ffi.Int32 Function(ffi.Pointer<resvg_options>,
              ffi.Pointer<ffi.Char>)>>('resvg_options_load_font_file');
  late final _resvg_options_load_font_file =
      _resvg_options_load_font_filePtr.asFunction<
          int Function(ffi.Pointer<resvg_options>, ffi.Pointer<ffi.Char>)>();

  /// @brief Loads system fonts into the internal fonts database.
  ///
  /// This method is very IO intensive.
  ///
  /// This method should be executed only once per #resvg_options.
  ///
  /// The system scanning is not perfect, so some fonts may be omitted.
  /// Please send a bug report in this case.
  ///
  /// Prints warnings into the log.
  ///
  /// Has no effect when the `text` feature is not enabled.
  void resvg_options_load_system_fonts(
    ffi.Pointer<resvg_options> opt,
  ) {
    return _resvg_options_load_system_fonts(
      opt,
    );
  }

  late final _resvg_options_load_system_fontsPtr = _lookup<
          ffi.NativeFunction<ffi.Void Function(ffi.Pointer<resvg_options>)>>(
      'resvg_options_load_system_fonts');
  late final _resvg_options_load_system_fonts =
      _resvg_options_load_system_fontsPtr
          .asFunction<void Function(ffi.Pointer<resvg_options>)>();

  /// @brief Destroys the #resvg_options.
  void resvg_options_destroy(
    ffi.Pointer<resvg_options> opt,
  ) {
    return _resvg_options_destroy(
      opt,
    );
  }

  late final _resvg_options_destroyPtr = _lookup<
          ffi.NativeFunction<ffi.Void Function(ffi.Pointer<resvg_options>)>>(
      'resvg_options_destroy');
  late final _resvg_options_destroy = _resvg_options_destroyPtr
      .asFunction<void Function(ffi.Pointer<resvg_options>)>();

  /// @brief Creates #resvg_render_tree from file.
  ///
  /// .svg and .svgz files are supported.
  ///
  /// See #resvg_is_image_empty for details.
  ///
  /// @param file_path UTF-8 file path.
  /// @param opt Rendering options. Must not be NULL.
  /// @param tree Parsed render tree. Should be destroyed via #resvg_tree_destroy.
  /// @return #resvg_error
  int resvg_parse_tree_from_file(
    ffi.Pointer<ffi.Char> file_path,
    ffi.Pointer<resvg_options> opt,
    ffi.Pointer<ffi.Pointer<resvg_render_tree>> tree,
  ) {
    return _resvg_parse_tree_from_file(
      file_path,
      opt,
      tree,
    );
  }

  late final _resvg_parse_tree_from_filePtr = _lookup<
          ffi.NativeFunction<
              ffi.Int32 Function(
                  ffi.Pointer<ffi.Char>,
                  ffi.Pointer<resvg_options>,
                  ffi.Pointer<ffi.Pointer<resvg_render_tree>>)>>(
      'resvg_parse_tree_from_file');
  late final _resvg_parse_tree_from_file =
      _resvg_parse_tree_from_filePtr.asFunction<
          int Function(ffi.Pointer<ffi.Char>, ffi.Pointer<resvg_options>,
              ffi.Pointer<ffi.Pointer<resvg_render_tree>>)>();

  /// @brief Creates #resvg_render_tree from data.
  ///
  /// See #resvg_is_image_empty for details.
  ///
  /// @param data SVG data. Can contain SVG string or gzip compressed data. Must not be NULL.
  /// @param len Data length.
  /// @param opt Rendering options. Must not be NULL.
  /// @param tree Parsed render tree. Should be destroyed via #resvg_tree_destroy.
  /// @return #resvg_error
  int resvg_parse_tree_from_data(
    ffi.Pointer<ffi.Char> data,
    int len,
    ffi.Pointer<resvg_options> opt,
    ffi.Pointer<ffi.Pointer<resvg_render_tree>> tree,
  ) {
    return _resvg_parse_tree_from_data(
      data,
      len,
      opt,
      tree,
    );
  }

  late final _resvg_parse_tree_from_dataPtr = _lookup<
          ffi.NativeFunction<
              ffi.Int32 Function(
                  ffi.Pointer<ffi.Char>,
                  ffi.UintPtr,
                  ffi.Pointer<resvg_options>,
                  ffi.Pointer<ffi.Pointer<resvg_render_tree>>)>>(
      'resvg_parse_tree_from_data');
  late final _resvg_parse_tree_from_data =
      _resvg_parse_tree_from_dataPtr.asFunction<
          int Function(ffi.Pointer<ffi.Char>, int, ffi.Pointer<resvg_options>,
              ffi.Pointer<ffi.Pointer<resvg_render_tree>>)>();

  /// @brief Checks that tree has any nodes.
  ///
  /// @param tree Render tree.
  /// @return Returns `true` if tree has no nodes.
  bool resvg_is_image_empty(
    ffi.Pointer<resvg_render_tree> tree,
  ) {
    return _resvg_is_image_empty(
      tree,
    );
  }

  late final _resvg_is_image_emptyPtr = _lookup<
          ffi
          .NativeFunction<ffi.Bool Function(ffi.Pointer<resvg_render_tree>)>>(
      'resvg_is_image_empty');
  late final _resvg_is_image_empty = _resvg_is_image_emptyPtr
      .asFunction<bool Function(ffi.Pointer<resvg_render_tree>)>();

  /// @brief Returns an image size.
  ///
  /// The size of a canvas that required to render this SVG.
  ///
  /// The `width` and `height` attributes in SVG.
  ///
  /// @param tree Render tree.
  /// @return Image size.
  resvg_size resvg_get_image_size(
    ffi.Pointer<resvg_render_tree> tree,
  ) {
    return _resvg_get_image_size(
      tree,
    );
  }

  late final _resvg_get_image_sizePtr = _lookup<
          ffi
          .NativeFunction<resvg_size Function(ffi.Pointer<resvg_render_tree>)>>(
      'resvg_get_image_size');
  late final _resvg_get_image_size = _resvg_get_image_sizePtr
      .asFunction<resvg_size Function(ffi.Pointer<resvg_render_tree>)>();

  /// @brief Returns an image bounding box.
  ///
  /// Can be smaller or bigger than a `viewbox`.
  ///
  /// @param tree Render tree.
  /// @param bbox Image's bounding box.
  /// @return `false` if an image has no elements.
  bool resvg_get_image_bbox(
    ffi.Pointer<resvg_render_tree> tree,
    ffi.Pointer<resvg_rect> bbox,
  ) {
    return _resvg_get_image_bbox(
      tree,
      bbox,
    );
  }

  late final _resvg_get_image_bboxPtr = _lookup<
      ffi.NativeFunction<
          ffi.Bool Function(ffi.Pointer<resvg_render_tree>,
              ffi.Pointer<resvg_rect>)>>('resvg_get_image_bbox');
  late final _resvg_get_image_bbox = _resvg_get_image_bboxPtr.asFunction<
      bool Function(ffi.Pointer<resvg_render_tree>, ffi.Pointer<resvg_rect>)>();

  /// @brief Returns `true` if a renderable node with such an ID exists.
  ///
  /// @param tree Render tree.
  /// @param id Node's ID. UTF-8 string. Must not be NULL.
  /// @return `true` if a node exists.
  /// @return `false` if a node doesn't exist or ID isn't a UTF-8 string.
  /// @return `false` if a node exists, but not renderable.
  bool resvg_node_exists(
    ffi.Pointer<resvg_render_tree> tree,
    ffi.Pointer<ffi.Char> id,
  ) {
    return _resvg_node_exists(
      tree,
      id,
    );
  }

  late final _resvg_node_existsPtr = _lookup<
      ffi.NativeFunction<
          ffi.Bool Function(ffi.Pointer<resvg_render_tree>,
              ffi.Pointer<ffi.Char>)>>('resvg_node_exists');
  late final _resvg_node_exists = _resvg_node_existsPtr.asFunction<
      bool Function(ffi.Pointer<resvg_render_tree>, ffi.Pointer<ffi.Char>)>();

  /// @brief Returns node's transform by ID.
  ///
  /// @param tree Render tree.
  /// @param id Node's ID. UTF-8 string. Must not be NULL.
  /// @param transform Node's transform.
  /// @return `true` if a node exists.
  /// @return `false` if a node doesn't exist or ID isn't a UTF-8 string.
  /// @return `false` if a node exists, but not renderable.
  bool resvg_get_node_transform(
    ffi.Pointer<resvg_render_tree> tree,
    ffi.Pointer<ffi.Char> id,
    ffi.Pointer<resvg_transform> transform,
  ) {
    return _resvg_get_node_transform(
      tree,
      id,
      transform,
    );
  }

  late final _resvg_get_node_transformPtr = _lookup<
      ffi.NativeFunction<
          ffi.Bool Function(
              ffi.Pointer<resvg_render_tree>,
              ffi.Pointer<ffi.Char>,
              ffi.Pointer<resvg_transform>)>>('resvg_get_node_transform');
  late final _resvg_get_node_transform =
      _resvg_get_node_transformPtr.asFunction<
          bool Function(ffi.Pointer<resvg_render_tree>, ffi.Pointer<ffi.Char>,
              ffi.Pointer<resvg_transform>)>();

  /// @brief Returns node's bounding box in canvas coordinates by ID.
  ///
  /// @param tree Render tree.
  /// @param id Node's ID. Must not be NULL.
  /// @param bbox Node's bounding box.
  /// @return `false` if a node with such an ID does not exist
  /// @return `false` if ID isn't a UTF-8 string.
  /// @return `false` if ID is an empty string
  bool resvg_get_node_bbox(
    ffi.Pointer<resvg_render_tree> tree,
    ffi.Pointer<ffi.Char> id,
    ffi.Pointer<resvg_rect> bbox,
  ) {
    return _resvg_get_node_bbox(
      tree,
      id,
      bbox,
    );
  }

  late final _resvg_get_node_bboxPtr = _lookup<
      ffi.NativeFunction<
          ffi.Bool Function(
              ffi.Pointer<resvg_render_tree>,
              ffi.Pointer<ffi.Char>,
              ffi.Pointer<resvg_rect>)>>('resvg_get_node_bbox');
  late final _resvg_get_node_bbox = _resvg_get_node_bboxPtr.asFunction<
      bool Function(ffi.Pointer<resvg_render_tree>, ffi.Pointer<ffi.Char>,
          ffi.Pointer<resvg_rect>)>();

  /// @brief Returns node's bounding box, including stroke, in canvas coordinates by ID.
  ///
  /// @param tree Render tree.
  /// @param id Node's ID. Must not be NULL.
  /// @param bbox Node's bounding box.
  /// @return `false` if a node with such an ID does not exist
  /// @return `false` if ID isn't a UTF-8 string.
  /// @return `false` if ID is an empty string
  bool resvg_get_node_stroke_bbox(
    ffi.Pointer<resvg_render_tree> tree,
    ffi.Pointer<ffi.Char> id,
    ffi.Pointer<resvg_rect> bbox,
  ) {
    return _resvg_get_node_stroke_bbox(
      tree,
      id,
      bbox,
    );
  }

  late final _resvg_get_node_stroke_bboxPtr = _lookup<
      ffi.NativeFunction<
          ffi.Bool Function(
              ffi.Pointer<resvg_render_tree>,
              ffi.Pointer<ffi.Char>,
              ffi.Pointer<resvg_rect>)>>('resvg_get_node_stroke_bbox');
  late final _resvg_get_node_stroke_bbox =
      _resvg_get_node_stroke_bboxPtr.asFunction<
          bool Function(ffi.Pointer<resvg_render_tree>, ffi.Pointer<ffi.Char>,
              ffi.Pointer<resvg_rect>)>();

  /// @brief Destroys the #resvg_render_tree.
  void resvg_tree_destroy(
    ffi.Pointer<resvg_render_tree> tree,
  ) {
    return _resvg_tree_destroy(
      tree,
    );
  }

  late final _resvg_tree_destroyPtr = _lookup<
          ffi
          .NativeFunction<ffi.Void Function(ffi.Pointer<resvg_render_tree>)>>(
      'resvg_tree_destroy');
  late final _resvg_tree_destroy = _resvg_tree_destroyPtr
      .asFunction<void Function(ffi.Pointer<resvg_render_tree>)>();

  /// @brief Renders the #resvg_render_tree onto the pixmap.
  ///
  /// @param tree A render tree.
  /// @param transform A root SVG transform. Can be used to position SVG inside the `pixmap`.
  /// @param width Pixmap width.
  /// @param height Pixmap height.
  /// @param pixmap Pixmap data. Should have width*height*4 size and contain
  /// premultiplied RGBA8888 pixels.
  void resvg_render(
    ffi.Pointer<resvg_render_tree> tree,
    resvg_transform transform,
    int width,
    int height,
    ffi.Pointer<ffi.Char> pixmap,
  ) {
    return _resvg_render(
      tree,
      transform,
      width,
      height,
      pixmap,
    );
  }

  late final _resvg_renderPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<resvg_render_tree>, resvg_transform,
              ffi.Uint32, ffi.Uint32, ffi.Pointer<ffi.Char>)>>('resvg_render');
  late final _resvg_render = _resvg_renderPtr.asFunction<
      void Function(ffi.Pointer<resvg_render_tree>, resvg_transform, int, int,
          ffi.Pointer<ffi.Char>)>();

  /// @brief Renders a Node by ID onto the image.
  ///
  /// @param tree A render tree.
  /// @param id Node's ID. Must not be NULL.
  /// @param transform A root SVG transform. Can be used to position SVG inside the `pixmap`.
  /// @param width Pixmap width.
  /// @param height Pixmap height.
  /// @param pixmap Pixmap data. Should have width*height*4 size and contain
  /// premultiplied RGBA8888 pixels.
  /// @return `false` when `id` is not a non-empty UTF-8 string.
  /// @return `false` when the selected `id` is not present.
  /// @return `false` when an element has a zero bbox.
  bool resvg_render_node(
    ffi.Pointer<resvg_render_tree> tree,
    ffi.Pointer<ffi.Char> id,
    resvg_transform transform,
    int width,
    int height,
    ffi.Pointer<ffi.Char> pixmap,
  ) {
    return _resvg_render_node(
      tree,
      id,
      transform,
      width,
      height,
      pixmap,
    );
  }

  late final _resvg_render_nodePtr = _lookup<
      ffi.NativeFunction<
          ffi.Bool Function(
              ffi.Pointer<resvg_render_tree>,
              ffi.Pointer<ffi.Char>,
              resvg_transform,
              ffi.Uint32,
              ffi.Uint32,
              ffi.Pointer<ffi.Char>)>>('resvg_render_node');
  late final _resvg_render_node = _resvg_render_nodePtr.asFunction<
      bool Function(ffi.Pointer<resvg_render_tree>, ffi.Pointer<ffi.Char>,
          resvg_transform, int, int, ffi.Pointer<ffi.Char>)>();
}

/// @brief List of possible errors.
enum resvg_error {
  /// Everything is ok.
  RESVG_OK(0),

  /// Only UTF-8 content are supported.
  RESVG_ERROR_NOT_AN_UTF8_STR(1),

  /// Failed to open the provided file.
  RESVG_ERROR_FILE_OPEN_FAILED(2),

  /// Compressed SVG must use the GZip algorithm.
  RESVG_ERROR_MALFORMED_GZIP(3),

  /// We do not allow SVG with more than 1_000_000 elements for security reasons.
  RESVG_ERROR_ELEMENTS_LIMIT_REACHED(4),

  /// SVG doesn't have a valid size.
  ///
  /// Occurs when width and/or height are <= 0.
  ///
  /// Also occurs if width, height and viewBox are not set.
  RESVG_ERROR_INVALID_SIZE(5),

  /// Failed to parse an SVG data.
  RESVG_ERROR_PARSING_FAILED(6);

  final int value;
  const resvg_error(this.value);

  static resvg_error fromValue(int value) => switch (value) {
        0 => RESVG_OK,
        1 => RESVG_ERROR_NOT_AN_UTF8_STR,
        2 => RESVG_ERROR_FILE_OPEN_FAILED,
        3 => RESVG_ERROR_MALFORMED_GZIP,
        4 => RESVG_ERROR_ELEMENTS_LIMIT_REACHED,
        5 => RESVG_ERROR_INVALID_SIZE,
        6 => RESVG_ERROR_PARSING_FAILED,
        _ => throw ArgumentError("Unknown value for resvg_error: $value"),
      };
}

/// @brief A image rendering method.
enum resvg_image_rendering {
  RESVG_IMAGE_RENDERING_OPTIMIZE_QUALITY(0),
  RESVG_IMAGE_RENDERING_OPTIMIZE_SPEED(1);

  final int value;
  const resvg_image_rendering(this.value);

  static resvg_image_rendering fromValue(int value) => switch (value) {
        0 => RESVG_IMAGE_RENDERING_OPTIMIZE_QUALITY,
        1 => RESVG_IMAGE_RENDERING_OPTIMIZE_SPEED,
        _ => throw ArgumentError(
            "Unknown value for resvg_image_rendering: $value"),
      };
}

/// @brief A shape rendering method.
enum resvg_shape_rendering {
  RESVG_SHAPE_RENDERING_OPTIMIZE_SPEED(0),
  RESVG_SHAPE_RENDERING_CRISP_EDGES(1),
  RESVG_SHAPE_RENDERING_GEOMETRIC_PRECISION(2);

  final int value;
  const resvg_shape_rendering(this.value);

  static resvg_shape_rendering fromValue(int value) => switch (value) {
        0 => RESVG_SHAPE_RENDERING_OPTIMIZE_SPEED,
        1 => RESVG_SHAPE_RENDERING_CRISP_EDGES,
        2 => RESVG_SHAPE_RENDERING_GEOMETRIC_PRECISION,
        _ => throw ArgumentError(
            "Unknown value for resvg_shape_rendering: $value"),
      };
}

/// @brief A text rendering method.
enum resvg_text_rendering {
  RESVG_TEXT_RENDERING_OPTIMIZE_SPEED(0),
  RESVG_TEXT_RENDERING_OPTIMIZE_LEGIBILITY(1),
  RESVG_TEXT_RENDERING_GEOMETRIC_PRECISION(2);

  final int value;
  const resvg_text_rendering(this.value);

  static resvg_text_rendering fromValue(int value) => switch (value) {
        0 => RESVG_TEXT_RENDERING_OPTIMIZE_SPEED,
        1 => RESVG_TEXT_RENDERING_OPTIMIZE_LEGIBILITY,
        2 => RESVG_TEXT_RENDERING_GEOMETRIC_PRECISION,
        _ =>
          throw ArgumentError("Unknown value for resvg_text_rendering: $value"),
      };
}

final class resvg_options extends ffi.Opaque {}

final class resvg_render_tree extends ffi.Opaque {}

/// @brief A 2D transform representation.
final class resvg_transform extends ffi.Struct {
  @ffi.Float()
  external double a;

  @ffi.Float()
  external double b;

  @ffi.Float()
  external double c;

  @ffi.Float()
  external double d;

  @ffi.Float()
  external double e;

  @ffi.Float()
  external double f;
}

/// @brief A size representation.
final class resvg_size extends ffi.Struct {
  @ffi.Float()
  external double width;

  @ffi.Float()
  external double height;
}

/// @brief A rectangle representation.
final class resvg_rect extends ffi.Struct {
  @ffi.Float()
  external double x;

  @ffi.Float()
  external double y;

  @ffi.Float()
  external double width;

  @ffi.Float()
  external double height;
}

const int RESVG_MAJOR_VERSION = 0;

const int RESVG_MINOR_VERSION = 42;

const int RESVG_PATCH_VERSION = 0;

const String RESVG_VERSION = '0.42.0';
