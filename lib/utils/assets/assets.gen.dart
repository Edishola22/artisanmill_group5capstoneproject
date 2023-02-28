/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/about.svg
  SvgGenImage get about => const SvgGenImage('assets/icons/about.svg');

  /// File path: assets/icons/apple.svg
  SvgGenImage get apple => const SvgGenImage('assets/icons/apple.svg');

  /// File path: assets/icons/calendar_icon.svg
  SvgGenImage get calendarIcon =>
      const SvgGenImage('assets/icons/calendar_icon.svg');

  /// File path: assets/icons/chat_icon.svg
  SvgGenImage get chatIcon => const SvgGenImage('assets/icons/chat_icon.svg');

  /// File path: assets/icons/facebook.svg
  SvgGenImage get facebook => const SvgGenImage('assets/icons/facebook.svg');

  /// File path: assets/icons/google.svg
  SvgGenImage get google => const SvgGenImage('assets/icons/google.svg');

  /// File path: assets/icons/hamburger_icon.svg
  SvgGenImage get hamburgerIcon =>
      const SvgGenImage('assets/icons/hamburger_icon.svg');

  /// File path: assets/icons/help.svg
  SvgGenImage get help => const SvgGenImage('assets/icons/help.svg');

  /// File path: assets/icons/home_icon.svg
  SvgGenImage get homeIcon => const SvgGenImage('assets/icons/home_icon.svg');

  /// File path: assets/icons/profile_icon.svg
  SvgGenImage get profileIcon =>
      const SvgGenImage('assets/icons/profile_icon.svg');

  /// File path: assets/icons/search_icon.svg
  SvgGenImage get searchIcon =>
      const SvgGenImage('assets/icons/search_icon.svg');

  /// File path: assets/icons/security.svg
  SvgGenImage get security => const SvgGenImage('assets/icons/security.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        about,
        apple,
        calendarIcon,
        chatIcon,
        facebook,
        google,
        hamburgerIcon,
        help,
        homeIcon,
        profileIcon,
        searchIcon,
        security
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/artisan_avatar.png
  AssetGenImage get artisanAvatar =>
      const AssetGenImage('assets/images/artisan_avatar.png');

  /// File path: assets/images/cleaning.png
  AssetGenImage get cleaning =>
      const AssetGenImage('assets/images/cleaning.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/qualified_artisans.png
  AssetGenImage get qualifiedArtisans =>
      const AssetGenImage('assets/images/qualified_artisans.png');

  /// File path: assets/images/service_providers.png
  AssetGenImage get serviceProviders =>
      const AssetGenImage('assets/images/service_providers.png');

  /// File path: assets/images/user_avatar.png
  AssetGenImage get userAvatar =>
      const AssetGenImage('assets/images/user_avatar.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        artisanAvatar,
        cleaning,
        logo,
        qualifiedArtisans,
        serviceProviders,
        userAvatar
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated Clip? clipBehavior,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
