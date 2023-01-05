import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF00687C),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFB0ECFF),
  onPrimaryContainer: Color(0xFF001F27),
  secondary: Color(0xFF1160A4),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFD2E4FF),
  onSecondaryContainer: Color(0xFF001C38),
  tertiary: Color(0xFF1860A5),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFD3E3FF),
  onTertiaryContainer: Color(0xFF001C39),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFF6FEFF),
  onBackground: Color(0xFF001F24),
  surface: Color(0xFFF6FEFF),
  onSurface: Color(0xFF001F24),
  surfaceVariant: Color(0xFFDBE4E7),
  onSurfaceVariant: Color(0xFF40484B),
  outline: Color(0xFF70787C),
  onInverseSurface: Color(0xFFD0F8FF),
  inverseSurface: Color(0xFF00363D),
  inversePrimary: Color(0xFF58D6F7),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF00687C),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF58D6F7),
  onPrimary: Color(0xFF003641),
  primaryContainer: Color(0xFF004E5E),
  onPrimaryContainer: Color(0xFFB0ECFF),
  secondary: Color(0xFFA1C9FF),
  onSecondary: Color(0xFF00325B),
  secondaryContainer: Color(0xFF004880),
  onSecondaryContainer: Color(0xFFD2E4FF),
  tertiary: Color(0xFFA3C9FF),
  onTertiary: Color(0xFF00315C),
  tertiaryContainer: Color(0xFF004882),
  onTertiaryContainer: Color(0xFFD3E3FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF001F24),
  onBackground: Color(0xFF97F0FF),
  surface: Color(0xFF001F24),
  onSurface: Color(0xFF97F0FF),
  surfaceVariant: Color(0xFF40484B),
  onSurfaceVariant: Color(0xFFBFC8CB),
  outline: Color(0xFF899296),
  onInverseSurface: Color(0xFF001F24),
  inverseSurface: Color(0xFF97F0FF),
  inversePrimary: Color(0xFF00687C),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF58D6F7),
);

// ----------------------------------------
// Theme colors: Light
// ----------------------------------------
// Text:
// ----------------------------------------
class TextColors {
  static Color get textButton => const Color.fromRGBO(28, 27, 31, 1);
  static Color get text => const Color.fromRGBO(7, 32, 39, 1);
  static Color get secondary => const Color.fromRGBO(100, 116, 139, 1);
  static Color get inverse => const Color.fromRGBO(255, 255, 255, 1);
  static Color get primary => const Color.fromRGBO(61, 182, 212, 1);
  static Color get highlighted => const Color.fromRGBO(43, 127, 148, 1);
  static Color get success => const Color.fromRGBO(34, 197, 94, 1);
  static Color get info => const Color.fromRGBO(54, 160, 166, 1);
  static Color get warning => const Color.fromRGBO(245, 158, 11, 1);
  static Color get help => const Color.fromRGBO(43, 127, 148, 1);
  static Color get danger => const Color.fromRGBO(239, 68, 68, 1);
}

class TextStyles {
  //* Fonts
  static TextStyle get headline1 => const TextStyle(
        fontFamily: 'inter',
        color: Colors.black,
        fontSize: 48,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get headline2 => const TextStyle(
        fontFamily: 'inter',
        color: Colors.black,
        fontSize: 36,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get headline3 => const TextStyle(
        fontFamily: 'inter',
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get headline4 => const TextStyle(
        fontFamily: 'inter',
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get headline5 => const TextStyle(
        fontFamily: 'inter',
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get headline6 => const TextStyle(
        fontFamily: 'inter',
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get subTitle1 => const TextStyle(
        fontFamily: 'inter',
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get subTitle2 => const TextStyle(
        fontFamily: 'inter',
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get caption => const TextStyle(
        fontFamily: 'inter',
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get body1 => const TextStyle(
        fontFamily: 'inter',
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get body2 => const TextStyle(
        fontFamily: 'inter',
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get overline => const TextStyle(
        fontFamily: 'inter',
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      );
}

// ----------------------------------------
// Utility:
// ----------------------------------------
class UtilityColors {
  static Color get primary => const Color.fromRGBO(61, 182, 212, 1);
  static Color get primaryActive => const Color.fromRGBO(43, 127, 148, 1);
  static Color get primaryTransparent => const Color.fromRGBO(216, 240, 246, 1);
  static Color get error => const Color.fromRGBO(239, 68, 68, 1);
  static Color get timelineLines => const Color.fromRGBO(203, 213, 225, 1);
}

// ----------------------------------------
// Surfaces:
// ----------------------------------------
class SurfaceColors {
  static Color get header => const Color.fromRGBO(255, 255, 255, 1);
  static Color get content => const Color.fromRGBO(255, 255, 255, 1);
  static Color get border => const Color.fromRGBO(226, 232, 240, 1);
  static Color get light50 => const Color.fromRGBO(248, 250, 252, 1);
  static Color get light200 => const Color.fromRGBO(226, 232, 240, 1);
  static Color get primary => const Color.fromRGBO(61, 182, 212, 1);
}

// ----------------------------------------
// Forms:
// ----------------------------------------
class FormColors {
  static Color get background => const Color.fromRGBO(255, 255, 255, 1);
  static Color get border => const Color.fromRGBO(203, 213, 225, 1);
  static Color get hoverBorder => const Color.fromRGBO(226, 232, 240, 1);
  static Color get focusBorder => const Color.fromRGBO(61, 182, 212, 1);
  static Color get filledBackground => const Color.fromRGBO(255, 255, 255, 1);
}

// ----------------------------------------
// Buttons:
// ----------------------------------------
class ButtonColors {
  static Color get primaryBackground => const Color.fromRGBO(61, 192, 212, 1);
  static Color get primaryTransparent => const Color.fromRGBO(249, 249, 250, 1);
  static Color get primaryActive => const Color.fromRGBO(51, 65, 85, 1);
  static Color get primaryText => const Color.fromRGBO(226, 232, 240, 1);

  static Color get secondaryBackground =>
      const Color.fromRGBO(100, 116, 139, 1);
  static Color get secondaryTransparent =>
      const Color.fromRGBO(249, 249, 250, 1);
  static Color get secondaryActive => const Color.fromRGBO(51, 65, 85, 1);
  static Color get secondaryText => const Color.fromRGBO(226, 232, 240, 1);
  static Color get successBackground => const Color.fromRGBO(34, 197, 94, 1);
  static Color get successTransparent => const Color.fromRGBO(246, 253, 249, 1);
  static Color get successActive => const Color.fromRGBO(21, 128, 61, 1);
  static Color get successText => const Color.fromRGBO(226, 232, 240, 1);
  static Color get infoBackground => const Color.fromRGBO(54, 160, 186, 1);
  static Color get infoTransparent => const Color.fromRGBO(245, 251, 254, 1);
  static Color get infoActive => const Color.fromRGBO(3, 105, 161, 1);
  static Color get infoText => const Color.fromRGBO(226, 232, 240, 1);
  static Color get warningBackground => const Color.fromRGBO(245, 158, 11, 1);
  static Color get warningTransparent => const Color.fromRGBO(255, 251, 245, 1);
  static Color get warningActive => const Color.fromRGBO(180, 83, 9, 1);
  static Color get warningText => const Color.fromRGBO(30, 41, 59, 1);
  static Color get helpBackground => const Color.fromRGBO(43, 127, 148, 1);
  static Color get helpTransparent => const Color.fromRGBO(249, 249, 254, 1);
  static Color get helpActive => const Color.fromRGBO(34, 101, 117, 1);
  static Color get helpText => const Color.fromRGBO(226, 232, 240, 1);
  static Color get dangerBackground => const Color.fromRGBO(239, 68, 68, 1);
  static Color get dangerTransparent => const Color.fromRGBO(254, 248, 248, 1);
  static Color get dangerActive => const Color.fromRGBO(185, 28, 28, 1);
  static Color get dangerText => const Color.fromRGBO(226, 232, 240, 1);
}

// ----------------------------------------
// Messages:
// ----------------------------------------
class MessageColors {
  static Color get info => const Color.fromRGBO(186, 230, 253, 1);
  static Color get success => const Color.fromRGBO(187, 247, 208, 1);
  static Color get warning => const Color.fromRGBO(253, 230, 138, 1);
  static Color get error => const Color.fromRGBO(254, 202, 202, 1);
}

// class TFTTheme implements ThemeData {
//   static TFTTheme? _instance;
//   static TFTTheme get instance {
//     _instance ??= TFTTheme();
//     return _instance!;
//   }


//   //* Control padding
//   EdgeInsets defaultPadding = const EdgeInsets.all(8);
//   EdgeInsets get edges => const EdgeInsets.symmetric(
//         horizontal: 12,
//         vertical: 8,
//       );
//   Padding get padding => Padding(
//         padding: edges,
//       );

//   static Size screenSize(context) => MediaQuery.of(context).size;
//   static double screenHeight(context) => MediaQuery.of(context).size.height;
//   static double screenWidth(context) => MediaQuery.of(context).size.width;

//   Color getColor(Set<MaterialState> states) {
//     const Set<MaterialState> interactiveStates = <MaterialState>{
//       MaterialState.pressed,
//       MaterialState.hovered,
//       MaterialState.focused,
//     };
//     if (states.any(interactiveStates.contains)) {
//       return SurfaceColors.primary;
//     }
//     return SurfaceColors.border;
//   }

//   IconThemeData get mainIconTheme => IconThemeData(
//     opacity:1, 
//     shadows:const [],
//         color: TextColors.inverse,
//         size: 18,
//       );

//   IconThemeData get controlIconTheme => IconThemeData(
//     opacity:1, 
//     shadows:const [],
//         color: TextColors.inverse,
//         size: 18,
//       );

//   TextStyle get mainTextStyle => TextStyles.body1;

//   TextTheme get mainTextTheme => TextTheme(
//     // displayLarge:TextStyles.body1.copyWith(fontSize: 48),
//     // displayMedium:TextStyles.body1.copyWith(fontSize: 30),
//     // displaySmall:TextStyles.body1.copyWith(fontSize: 20),
//     // headlineLarge:TextStyles.headline1,
//     // headlineMedium:TextStyles.headline3,
//     // headlineSmall:TextStyles.headline5,
//     // titleLarge:TextStyles.headline2,
//     // titleMedium:TextStyles.headline4,
//     // titleSmall:TextStyles.headline6,
//     // bodyLarge:TextStyles.body1.copyWith(fontSize: 20),
//     // bodyMedium:TextStyles.body1.copyWith(fontSize: 18),
//     // bodySmall:TextStyles.body1,
//     // labelLarge:TextStyles.subTitle1.copyWith(fontSize: 24),
//     // labelMedium:TextStyles.subTitle1.copyWith(fontSize: 20),
//     // labelSmall:TextStyles.subTitle1.copyWith(fontSize: 18),
//     headline1:TextStyles.headline1,
//     headline2:TextStyles.headline2,
//     headline3:TextStyles.headline3,
//     headline4:TextStyles.headline4,
//     headline5:TextStyles.headline5,
//     headline6:TextStyles.headline6,
//     subtitle1:TextStyles.subTitle1,
//     subtitle2:TextStyles.subTitle2,
//     bodyText1:TextStyles.body1,
//     bodyText2:TextStyles.body2,
//     caption:TextStyles.caption,
//     overline: TextStyles.overline,
//       );

//   @override
//   String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
//     return super.toString();
//   }

//   @override
//   AppBarTheme get appBarTheme => AppBarTheme(
//     color: ButtonColors.secondaryTransparent,
//     backgroundColor:ButtonColors.secondaryBackground,
//     foregroundColor:ButtonColors.secondaryText,
//     elevation:10,
//     scrolledUnderElevation:10,
//     shadowColor: ButtonColors.secondaryBackground,
//     surfaceTintColor: ButtonColors.secondaryActive,
//     centerTitle:true,
//     titleTextStyle: TextStyles.headline5.copyWith(fontWeight: FontWeight.w500),
//     systemOverlayStyle: SystemUiOverlayStyle.light,
//       );

//   @override
//   bool get applyElevationOverlayColor => false;

//   @override
//   Color get backgroundColor => SurfaceColors.primary;

//   @override
//   MaterialBannerThemeData get bannerTheme =>  MaterialBannerThemeData(
//     backgroundColor: SurfaceColors.content,
//     contentTextStyle: TextStyles.body1,
//     elevation:10,
//     padding: defaultPadding,
//     leadingPadding:defaultPadding,
//   );

//   @override
//   Color get bottomAppBarColor => SurfaceColors.content;

//   @override
//   BottomAppBarTheme get bottomAppBarTheme =>  BottomAppBarTheme(
//     color: SurfaceColors.content,
//     elevation:10,
//     shape: const CircularNotchedRectangle(),
//   );

//   @override
//   BottomNavigationBarThemeData get bottomNavigationBarTheme =>
//        BottomNavigationBarThemeData(
//     backgroundColor: SurfaceColors.content,
//     elevation: 10,
//     // selectedIconTheme:,
//     // unselectedIconTheme:,
//     // selectedItemColor:,
//     // unselectedItemColor:,
//     // selectedLabelStyle:,
//     // unselectedLabelStyle:,
//     // showSelectedLabels:,
//     // showUnselectedLabels:,
//     type:BottomNavigationBarType.fixed,
//     enableFeedback:true,
//     landscapeLayout:BottomNavigationBarLandscapeLayout.spread,
//     // mouseCursor:,
//       );

//   @override
//   BottomSheetThemeData get bottomSheetTheme => BottomSheetThemeData(
//     backgroundColor: SurfaceColors.content,
//     elevation: 10,
//     modalBackgroundColor: SurfaceColors.content,
//     modalElevation:10,
//     // shape: ,
//     clipBehavior:Clip.antiAlias,
//     // constraints:,
//   );

//   @override
//   Brightness get brightness => Brightness.light;

//   @override
//   ButtonBarThemeData get buttonBarTheme => ButtonBarThemeData(
//     alignment:MainAxisAlignment.center,
//     mainAxisSize:MainAxisSize.max,
//     buttonTextTheme:ButtonTextTheme.normal,
//     buttonMinWidth:50,
//     buttonHeight:30,
//     buttonPadding:defaultPadding,
//     buttonAlignedDropdown:true,
//     layoutBehavior: ButtonBarLayoutBehavior.constrained,
//     overflowDirection: VerticalDirection.up,
//   );

//   @override
//   ButtonThemeData get buttonTheme => ButtonThemeData(
//     textTheme: ButtonTextTheme.normal,
//     minWidth: 88.0,
//     height: 36.0,
//     padding:defaultPadding,
//     // shape:,
//     layoutBehavior: ButtonBarLayoutBehavior.padded,
//     alignedDropdown: false,
//     buttonColor: ButtonColors.primaryBackground,
//     disabledColor: ButtonColors.primaryTransparent,
//     focusColor: ButtonColors.primaryActive,
//     hoverColor: ButtonColors.primaryActive,
//     highlightColor: ButtonColors.primaryActive,
//     splashColor: ButtonColors.primaryTransparent,
//     colorScheme: const ColorScheme.light(),
//     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//       );

//   @override
//   Color get canvasColor => SurfaceColors.primary;

//   @override
//   Color get cardColor => SurfaceColors.primary;

//   @override
//   CardTheme get cardTheme => CardTheme(
//     clipBehavior: Clip.antiAlias,
//     color: SurfaceColors.content,
//     shadowColor: SurfaceColors.light50,
//     surfaceTintColor: SurfaceColors.light50,
//     elevation: 10,
//     margin: defaultPadding,
//     // shape: ,
//   );

//   @override
//   CheckboxThemeData get checkboxTheme => CheckboxThemeData(
//     // mouseCursor:,
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//     // shape:,
//     // side:,
//         checkColor: MaterialStateProperty.resolveWith((states) =>
//             states.contains(MaterialState.disabled)
//                 ? SurfaceColors.primary
//                 : SurfaceColors.primary),
//         fillColor: MaterialStateProperty.resolveWith(getColor),
//         overlayColor: MaterialStateProperty.resolveWith(getColor),
//         splashRadius: 15,
//         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//       );

//   @override
//   ChipThemeData get chipTheme => ChipThemeData(
//     backgroundColor: SurfaceColors.primary,
//     deleteIconColor: TextColors.inverse,
//     disabledColor: SurfaceColors.light50,
//     selectedColor: SurfaceColors.primary,
//     secondarySelectedColor:,
//     shadowColor:,
//     surfaceTintColor:,
//     selectedShadowColor:,
//     showCheckmark:,
//     checkmarkColor:,
//     labelPadding:,
//     padding:,
//     side:,
//     shape:,
//     labelStyle:,
//     secondaryLabelStyle:,
//     brightness:,
//     elevation:,
//     pressElevation:,
//     iconTheme:,
//   );

//   @override
//   ColorScheme get colorScheme => ColorScheme.light(
//     brightness : Brightness.light,
//     primary : const Color(0xff6200ee),
//     onPrimary : Colors.white,
//     primaryContainer: SurfaceColors.content,
//     onPrimaryContainer: TextColors.primary,
//     secondary : const Color(0xff03dac6),
//     onSecondary : Colors.black,
//     secondaryContainer:,
//     onSecondaryContainer:,
//     tertiary:,
//     onTertiary:,
//     tertiaryContainer:,
//     onTertiaryContainer:,
//     error: const Color(0xffb00020),
//     onError: Colors.white,
//     errorContainer:,
//     onErrorContainer:,
//     background: Colors.white,
//     onBackground: Colors.black,
//     surface: Colors.white,
//     onSurface: Colors.black,
//     surfaceVariant:,
//     onSurfaceVariant:,
//     outline:,
//     shadow:,
//     inverseSurface:,
//     onInverseSurface:,
//     inversePrimary:,
//     surfaceTint:,
//       );

//   Map<Object, ThemeExtension<dynamic>> _themeExtensionIterableToMap(
//       Iterable<ThemeExtension<dynamic>> extensionsIterable) {
//     return Map<Object, ThemeExtension<dynamic>>.unmodifiable(<Object,
//         ThemeExtension<dynamic>>{
//       // Strangely, the cast is necessary for tests to run.
//       for (final ThemeExtension<dynamic> extension in extensionsIterable)
//         extension.type: extension as ThemeExtension<ThemeExtension<dynamic>>
//     });
//   }

//   @override
//   ThemeData copyWith({
//     // GENERAL CONFIGURATION
//     bool? applyElevationOverlayColor,
//     NoDefaultCupertinoThemeData? cupertinoOverrideTheme,
//     Iterable<ThemeExtension<dynamic>>? extensions,
//     InputDecorationTheme? inputDecorationTheme,
//     MaterialTapTargetSize? materialTapTargetSize,
//     PageTransitionsTheme? pageTransitionsTheme,
//     TargetPlatform? platform,
//     ScrollbarThemeData? scrollbarTheme,
//     InteractiveInkFeatureFactory? splashFactory,
//     VisualDensity? visualDensity,
//     bool? useMaterial3,
//     // COLOR
//     // [colorScheme] is the preferred way to configure colors. The other color
//     // properties will gradually be phased out, see
//     // https://github.com/flutter/flutter/issues/91772.
//     ColorScheme? colorScheme,
//     Brightness? brightness,
//     Color? primaryColor,
//     Color? primaryColorLight,
//     Color? primaryColorDark,
//     Color? focusColor,
//     Color? hoverColor,
//     Color? shadowColor,
//     Color? canvasColor,
//     Color? scaffoldBackgroundColor,
//     Color? bottomAppBarColor,
//     Color? cardColor,
//     Color? dividerColor,
//     Color? highlightColor,
//     Color? splashColor,
//     Color? selectedRowColor,
//     Color? unselectedWidgetColor,
//     Color? disabledColor,
//     Color? secondaryHeaderColor,
//     Color? backgroundColor,
//     Color? dialogBackgroundColor,
//     Color? indicatorColor,
//     Color? hintColor,
//     Color? errorColor,
//     Color? toggleableActiveColor,
//     // TYPOGRAPHY & ICONOGRAPHY
//     Typography? typography,
//     TextTheme? textTheme,
//     TextTheme? primaryTextTheme,
//     IconThemeData? iconTheme,
//     IconThemeData? primaryIconTheme,
//     // COMPONENT THEMES
//     AppBarTheme? appBarTheme,
//     MaterialBannerThemeData? bannerTheme,
//     BottomAppBarTheme? bottomAppBarTheme,
//     BottomNavigationBarThemeData? bottomNavigationBarTheme,
//     BottomSheetThemeData? bottomSheetTheme,
//     ButtonBarThemeData? buttonBarTheme,
//     ButtonThemeData? buttonTheme,
//     CardTheme? cardTheme,
//     CheckboxThemeData? checkboxTheme,
//     ChipThemeData? chipTheme,
//     DataTableThemeData? dataTableTheme,
//     DialogTheme? dialogTheme,
//     DividerThemeData? dividerTheme,
//     DrawerThemeData? drawerTheme,
//     ElevatedButtonThemeData? elevatedButtonTheme,
//     FloatingActionButtonThemeData? floatingActionButtonTheme,
//     ListTileThemeData? listTileTheme,
//     NavigationBarThemeData? navigationBarTheme,
//     NavigationRailThemeData? navigationRailTheme,
//     OutlinedButtonThemeData? outlinedButtonTheme,
//     PopupMenuThemeData? popupMenuTheme,
//     ProgressIndicatorThemeData? progressIndicatorTheme,
//     RadioThemeData? radioTheme,
//     SliderThemeData? sliderTheme,
//     SnackBarThemeData? snackBarTheme,
//     SwitchThemeData? switchTheme,
//     TabBarTheme? tabBarTheme,
//     TextButtonThemeData? textButtonTheme,
//     TextSelectionThemeData? textSelectionTheme,
//     TimePickerThemeData? timePickerTheme,
//     ToggleButtonsThemeData? toggleButtonsTheme,
//     TooltipThemeData? tooltipTheme,
//     ExpansionTileThemeData? expansionTileTheme,
//   }) {
//     cupertinoOverrideTheme = cupertinoOverrideTheme?.noDefault();
//     return ThemeData.raw(
//       // GENERAL CONFIGURATION
//       applyElevationOverlayColor:
//           applyElevationOverlayColor ?? this.applyElevationOverlayColor,
//       cupertinoOverrideTheme:
//           cupertinoOverrideTheme ?? this.cupertinoOverrideTheme,
//       extensions: (extensions != null)
//           ? _themeExtensionIterableToMap(extensions)
//           : this.extensions,
//       inputDecorationTheme: inputDecorationTheme ?? this.inputDecorationTheme,
//       materialTapTargetSize:
//           materialTapTargetSize ?? this.materialTapTargetSize,
//       pageTransitionsTheme: pageTransitionsTheme ?? this.pageTransitionsTheme,
//       platform: platform ?? this.platform,
//       scrollbarTheme: scrollbarTheme ?? this.scrollbarTheme,
//       splashFactory: splashFactory ?? this.splashFactory,
//       visualDensity: visualDensity ?? this.visualDensity,
//       useMaterial3: useMaterial3 ?? this.useMaterial3,
//       primaryColor: primaryColor ?? this.primaryColor,
//       primaryColorLight: primaryColorLight ?? this.primaryColorLight,
//       primaryColorDark: primaryColorDark ?? this.primaryColorDark,
//       focusColor: focusColor ?? this.focusColor,
//       hoverColor: hoverColor ?? this.hoverColor,
//       shadowColor: shadowColor ?? this.shadowColor,
//       canvasColor: canvasColor ?? this.canvasColor,
//       scaffoldBackgroundColor:
//           scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
//       bottomAppBarColor: bottomAppBarColor ?? this.bottomAppBarColor,
//       cardColor: cardColor ?? this.cardColor,
//       dividerColor: dividerColor ?? this.dividerColor,
//       highlightColor: highlightColor ?? this.highlightColor,
//       splashColor: splashColor ?? this.splashColor,
//       selectedRowColor: selectedRowColor ?? this.selectedRowColor,
//       unselectedWidgetColor:
//           unselectedWidgetColor ?? this.unselectedWidgetColor,
//       disabledColor: disabledColor ?? this.disabledColor,
//       secondaryHeaderColor: secondaryHeaderColor ?? this.secondaryHeaderColor,
//       backgroundColor: backgroundColor ?? this.backgroundColor,
//       dialogBackgroundColor:
//           dialogBackgroundColor ?? this.dialogBackgroundColor,
//       indicatorColor: indicatorColor ?? this.indicatorColor,
//       hintColor: hintColor ?? this.hintColor,
//       errorColor: errorColor ?? this.errorColor,
//       toggleableActiveColor:
//           toggleableActiveColor ?? this.toggleableActiveColor,
//       // TYPOGRAPHY & ICONOGRAPHY
//       typography: typography ?? this.typography,
//       textTheme: textTheme ?? this.textTheme,
//       primaryTextTheme: primaryTextTheme ?? this.primaryTextTheme,
//       iconTheme: iconTheme ?? this.iconTheme,
//       primaryIconTheme: primaryIconTheme ?? this.primaryIconTheme,
//       // COMPONENT THEMES
//       appBarTheme: appBarTheme ?? this.appBarTheme,
//       bannerTheme: bannerTheme ?? this.bannerTheme,
//       bottomAppBarTheme: bottomAppBarTheme ?? this.bottomAppBarTheme,
//       bottomNavigationBarTheme:
//           bottomNavigationBarTheme ?? this.bottomNavigationBarTheme,
//       bottomSheetTheme: bottomSheetTheme ?? this.bottomSheetTheme,
//       buttonBarTheme: buttonBarTheme ?? this.buttonBarTheme,
//       buttonTheme: buttonTheme ?? this.buttonTheme,
//       cardTheme: cardTheme ?? this.cardTheme,
//       checkboxTheme: checkboxTheme ?? this.checkboxTheme,
//       chipTheme: chipTheme ?? this.chipTheme,
//       dataTableTheme: dataTableTheme ?? this.dataTableTheme,
//       dialogTheme: dialogTheme ?? this.dialogTheme,
//       dividerTheme: dividerTheme ?? this.dividerTheme,
//       drawerTheme: drawerTheme ?? this.drawerTheme,
//       elevatedButtonTheme: elevatedButtonTheme ?? this.elevatedButtonTheme,
//       floatingActionButtonTheme:
//           floatingActionButtonTheme ?? this.floatingActionButtonTheme,
//       colorScheme:
//           (colorScheme ?? this.colorScheme).copyWith(brightness: brightness),
//       listTileTheme: listTileTheme ?? this.listTileTheme,
//       navigationBarTheme: navigationBarTheme ?? this.navigationBarTheme,
//       navigationRailTheme: navigationRailTheme ?? this.navigationRailTheme,
//       outlinedButtonTheme: outlinedButtonTheme ?? this.outlinedButtonTheme,
//       popupMenuTheme: popupMenuTheme ?? this.popupMenuTheme,
//       progressIndicatorTheme:
//           progressIndicatorTheme ?? this.progressIndicatorTheme,
//       radioTheme: radioTheme ?? this.radioTheme,
//       sliderTheme: sliderTheme ?? this.sliderTheme,
//       snackBarTheme: snackBarTheme ?? this.snackBarTheme,
//       switchTheme: switchTheme ?? this.switchTheme,
//       tabBarTheme: tabBarTheme ?? this.tabBarTheme,
//       textButtonTheme: textButtonTheme ?? this.textButtonTheme,
//       textSelectionTheme: textSelectionTheme ?? this.textSelectionTheme,
//       timePickerTheme: timePickerTheme ?? this.timePickerTheme,
//       toggleButtonsTheme: toggleButtonsTheme ?? this.toggleButtonsTheme,
//       tooltipTheme: tooltipTheme ?? this.tooltipTheme,
//       expansionTileTheme: expansionTileTheme ?? this.expansionTileTheme,
//     );
//   }

//   @override
//   NoDefaultCupertinoThemeData? get cupertinoOverrideTheme =>
//       const NoDefaultCupertinoThemeData();

//   @override
//   DataTableThemeData get dataTableTheme => const DataTableThemeData(
//     decoration:,
//     dataRowColor:,
//     dataRowHeight:,
//     dataTextStyle:,
//     headingRowColor:,
//     headingRowHeight:,
//     headingTextStyle:,
//     horizontalMargin:,
//     columnSpacing:,
//     dividerThickness:,
//     checkboxHorizontalMargin:,
//   );

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {}

//   @override
//   Color get dialogBackgroundColor => SurfaceColors.primary;

//   @override
//   DialogTheme get dialogTheme => const DialogTheme(
//     backgroundColor:,
//     iconColor:,
//     titleTextStyle:,
//     contentTextStyle:,
//         alignment: Alignment.center,
//         elevation: 10,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(2),
//           ),
//         ),
//         actionsPadding: EdgeInsets.all(5),
//       );

//   @override
//   Color get disabledColor => disabled;

//   @override
//   Color get dividerColor => divider;

//   @override
//   DividerThemeData get dividerTheme => const DividerThemeData(
//     color:,
//     space:,
//     thickness:,
//     indent:,
//     endIndent:,
//   );

//   @override
//   DrawerThemeData get drawerTheme => const DrawerThemeData(
//     backgroundColor:,
//     scrimColor:,
//     elevation:,
//     shape:,
//     width:,
//   );

//   @override
//   ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//     disabledForegroundColor:,
//     disabledBackgroundColor:,
//     shadowColor:,
//     surfaceTintColor:,
//     elevation:,
//     padding:,
//     fixedSize:,
//     maximumSize:,
//     side:,
//     enabledMouseCursor:,
//     disabledMouseCursor:,
//     visualDensity:,
//     tapTargetSize:,
//     animationDuration:,
//     enableFeedback:,
//     alignment:,
//     splashFactory:,

//           foregroundColor: background,
//           backgroundColor: primary,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(2),
//           ),
//           textStyle: mainTextStyle,
//           minimumSize: const Size(100, 40),
//         ),
//       );

//   @override
//   Color get errorColor => error;

//   @override
//   ExpansionTileThemeData get expansionTileTheme =>
//       const ExpansionTileThemeData(
//     backgroundColor:,
//     collapsedBackgroundColor:,
//     tilePadding:,
//     expandedAlignment:,
//     childrenPadding:,
//     iconColor:,
//     collapsedIconColor:,
//     textColor:,
//     collapsedTextColor:,
//       );

//   @override
//   T? extension<T>() {
//     throw UnimplementedError();
//   }

//   @override
//   Map<Object, ThemeExtension> get extensions => <Object, ThemeExtension>{};

//   @override
//   FloatingActionButtonThemeData get floatingActionButtonTheme =>
//       const FloatingActionButtonThemeData();

//   @override
//   Color get focusColor => active;

//   @override
//   Color get highlightColor => active;

//   @override
//   Color get hintColor => inactive;

//   @override
//   Color get hoverColor => inactive;

//   @override
//   IconThemeData get iconTheme => IconThemeData(
//     color:, 
//     opacity:, 
//     size:, 
//     shadows:,
//       );

//   @override
//   Color get indicatorColor => indicator;

//   @override
//   InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
//     floatingLabelStyle:,
//     helperMaxLines:,
//     errorMaxLines:,
//     floatingLabelBehavior: FloatingLabelBehavior.auto,
//     floatingLabelAlignment: FloatingLabelAlignment.start,
//     isDense: false,
//     isCollapsed: false,
//     prefixStyle:,
//     suffixStyle:,
//     counterStyle:,
//     filled: false,
//     focusedErrorBorder:,
//     disabledBorder:,
//     enabledBorder:,
//     alignLabelWithHint: false,
//     constraints:,
//         hoverColor: hover,
//         iconColor: icon,
//         prefixIconColor: icon,
//         suffixIconColor: icon,
//         fillColor: background,
//         focusColor: active,
//         // isCollapsed: false,
//         // isDense: false,
//         labelStyle: mainTextStyle,
//         helperStyle: mainTextStyle,
//         errorStyle: mainTextStyle,
//         // errorMaxLines: 1,
//         hintStyle: mainTextStyle,
//         contentPadding: edges,
//         focusedBorder: const OutlineInputBorder().copyWith(
//           borderRadius: BorderRadius.circular(2),
//           borderSide: BorderSide(
//             color: active,
//             width: 1,
//           ),
//         ),
//         errorBorder: const OutlineInputBorder().copyWith(
//           borderRadius: BorderRadius.circular(2),
//           borderSide: BorderSide(
//             color: error,
//             width: 1,
//           ),
//         ),
//         border: const OutlineInputBorder().copyWith(
//           borderRadius: const BorderRadius.all(
//             Radius.circular(2),
//           ),
//         ),
//       );

//   @override
//   ListTileThemeData get listTileTheme => const ListTileThemeData(
//     dense:,
//     shape:,
//     style:,
//     selectedColor:,
//     iconColor:,
//     textColor:,
//     contentPadding:,
//     tileColor:,
//     selectedTileColor:,
//     horizontalTitleGap:,
//     minVerticalPadding:,
//     minLeadingWidth:,
//     enableFeedback:,
//     mouseCursor:,
//     visualDensity:,
//   );

//   @override
//   MaterialTapTargetSize get materialTapTargetSize =>
//       MaterialTapTargetSize.shrinkWrap;

//   @override
//   NavigationBarThemeData get navigationBarTheme =>
//       const NavigationBarThemeData(
//     height:,
//     backgroundColor:,
//     surfaceTintColor:,
//     elevation:,
//     indicatorColor:,
//     indicatorShape:,
//     labelTextStyle:,
//     iconTheme:,
//     labelBehavior:,
//       );

//   @override
//   NavigationRailThemeData get navigationRailTheme =>
//       NavigationRailThemeData(
//     backgroundColor:,
//     elevation:,
//     unselectedLabelTextStyle:,
//     selectedLabelTextStyle:,
//     unselectedIconTheme:,
//     selectedIconTheme:,
//     groupAlignment:,
//     labelType:,
//     useIndicator:,
//     indicatorColor:,
//     minWidth:,
//     minExtendedWidth:,
//       );

//   @override
//   OutlinedButtonThemeData get outlinedButtonTheme =>
//       OutlinedButtonThemeData(
//         style: ButtonStyle(
//     textStyle:,
//     backgroundColor:,
//     foregroundColor:,
//     overlayColor:,
//     shadowColor:,
//     surfaceTintColor:,
//     elevation:,
//     padding:,
//     minimumSize:,
//     fixedSize:,
//     maximumSize:,
//     side:,
//     shape:,
//     mouseCursor:,
//     visualDensity:,
//     tapTargetSize:,
//     animationDuration:,
//     enableFeedback:,
//     alignment:,
//     splashFactory:,
//       ));

//   @override
//   PageTransitionsTheme get pageTransitionsTheme =>
//       const PageTransitionsTheme(builders: {
//         TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
//         TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
//         TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
//         TargetPlatform.fuchsia: FadeUpwardsPageTransitionsBuilder(),
//         TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
//         TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
//       });

//   @override
//   TargetPlatform get platform => TargetPlatform.android;

//   @override
//   PopupMenuThemeData get popupMenuTheme => const PopupMenuThemeData(
//     color:,
//     shape:,
//     elevation:,
//     textStyle:,
//     enableFeedback:,
//     mouseCursor:,
//   );

//   @override
//   Color get primaryColor => primary;

//   @override
//   Color get primaryColorDark => primary;

//   @override
//   Color get primaryColorLight => primary;

//   @override
//   IconThemeData get primaryIconTheme => IconThemeData(
//         color:, 
//         opacity:, 
//         size:, 
//         shadows:,
//       );

//   @override
//   TextTheme get primaryTextTheme => mainTextTheme;

//   @override
//   ProgressIndicatorThemeData get progressIndicatorTheme =>
//       const ProgressIndicatorThemeData(
//     color:,
//     linearTrackColor:,
//     linearMinHeight:,
//     circularTrackColor:,
//     refreshBackgroundColor:,
//       );

//   @override
//   RadioThemeData get radioTheme => const RadioThemeData(
//     mouseCursor:,
//     fillColor:,
//     overlayColor:,
//     splashRadius:,
//     materialTapTargetSize:,
//     visualDensity:,
//   );

//   @override
//   Color get scaffoldBackgroundColor => background;

//   @override
//   ScrollbarThemeData get scrollbarTheme => const ScrollbarThemeData(
//     thumbVisibility:,
//     thickness:,
//     trackVisibility:,
//     radius:,
//     thumbColor:,
//     trackColor:,
//     trackBorderColor:,
//     crossAxisMargin:,
//     mainAxisMargin:,
//     minThumbLength:,
//     interactive:,
//   );

//   @override
//   Color get secondaryHeaderColor => background;

//   @override
//   Color get selectedRowColor => selected;

//   @override
//   Color get shadowColor => inactive;

//   @override
//   SliderThemeData get sliderTheme => const SliderThemeData(
//     trackHeight:,
//     activeTrackColor:,
//     inactiveTrackColor:,
//     disabledActiveTrackColor:,
//     disabledInactiveTrackColor:,
//     activeTickMarkColor:,
//     inactiveTickMarkColor:,
//     disabledActiveTickMarkColor:,
//     disabledInactiveTickMarkColor:,
//     thumbColor:,
//     overlappingShapeStrokeColor:,
//     disabledThumbColor:,
//     overlayColor:,
//     valueIndicatorColor:,
//     overlayShape:,
//     tickMarkShape:,
//     thumbShape:,
//     trackShape:,
//     valueIndicatorShape:,
//     rangeTickMarkShape:,
//     rangeThumbShape:,
//     rangeTrackShape:,
//     rangeValueIndicatorShape:,
//     showValueIndicator:,
//     valueIndicatorTextStyle:,
//     minThumbSeparation:,
//     thumbSelector:,
//     mouseCursor:,
//   );

//   @override
//   SnackBarThemeData get snackBarTheme => SnackBarThemeData(
//     disabledActionTextColor:,
//     shape:,
//     behavior:,
//       backgroundColor: background,
//       actionTextColor: active,
//       elevation: 10,
//       contentTextStyle: textTheme.bodySmall);

//   @override
//   Color get splashColor => background;

//   @override
//   InteractiveInkFeatureFactory get splashFactory => InkRipple.splashFactory;

//   @override
//   SwitchThemeData get switchTheme => const SwitchThemeData(
//     thumbColor:,
//     trackColor:,
//     materialTapTargetSize:,
//     mouseCursor:,
//     overlayColor:,
//     splashRadius:,
//   );

//   @override
//   TabBarTheme get tabBarTheme => const TabBarTheme(
//     indicator:,
//     indicatorSize:,
//     labelColor:,
//     labelPadding:,
//     labelStyle:,
//     unselectedLabelColor:,
//     unselectedLabelStyle:,
//     overlayColor:,
//     splashFactory:,
//     mouseCursor:,
//   );

//   @override
//   TextButtonThemeData get textButtonTheme => TextButtonThemeData(
//         style: TextButton.styleFrom(
//     backgroundColor:,
//     disabledForegroundColor:,
//     disabledBackgroundColor:,
//     shadowColor:,
//     surfaceTintColor:,
//     elevation:,
//     padding:,
//     fixedSize:,
//     maximumSize:,
//     side:,
//     enabledMouseCursor:,
//     disabledMouseCursor:,
//     visualDensity:,
//     tapTargetSize:,
//     animationDuration:,
//     enableFeedback:,
//     alignment:,
//     splashFactory:,
//           foregroundColor: primary,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(2),
//           ),
//           textStyle: mainTextStyle,
//           minimumSize: const Size(100, 40),
//         ),
//       );

//   @override
//   TextSelectionThemeData get textSelectionTheme =>
//       const TextSelectionThemeData(
//     cursorColor:,
//     selectionColor:,
//     selectionHandleColor:,
//       );

//   @override
//   TextTheme get textTheme => mainTextTheme;

//   @override
//   TimePickerThemeData get timePickerTheme => const TimePickerThemeData(
//     backgroundColor:,
//     hourMinuteTextColor:,
//     hourMinuteColor:,
//     dayPeriodTextColor:,
//     dayPeriodColor:,
//     dialHandColor:,
//     dialBackgroundColor:,
//     dialTextColor:,
//     entryModeIconColor:,
//     hourMinuteTextStyle:,
//     dayPeriodTextStyle:,
//     helpTextStyle:,
//     shape:,
//     hourMinuteShape:,
//     dayPeriodShape:,
//     dayPeriodBorderSide:,
//     inputDecorationTheme:,
//   );

//   @override
//   DiagnosticsNode toDiagnosticsNode(
//       {String? name, DiagnosticsTreeStyle? style}) {
//     throw UnimplementedError();
//   }

//   @override
//   String toStringShort() {
//     return "System Theme";
//   }

//   @override
//   ToggleButtonsThemeData get toggleButtonsTheme =>
//       const ToggleButtonsThemeData(
//     textStyle:,
//     constraints:,
//     color:,
//     selectedColor:,
//     disabledColor:,
//     fillColor:,
//     focusColor:,
//     highlightColor:,
//     hoverColor:,
//     splashColor:,
//     borderColor:,
//     selectedBorderColor:,
//     disabledBorderColor:,
//     borderRadius:,
//     borderWidth:,
//       );

//   @override
//   Color get toggleableActiveColor => active;

//   @override
//   TooltipThemeData get tooltipTheme => const TooltipThemeData(
//     height:,
//     padding:,
//     margin:,
//     verticalOffset:,
//     preferBelow:,
//     excludeFromSemantics:,
//     decoration:,
//     textStyle:,
//     textAlign:,
//     waitDuration:,
//     showDuration:,
//     triggerMode:,
//     enableFeedback:,
//   );

//   @override
//   Typography get typography => Typography.material2021(
//     platform: platform,
//     black:,
//     white:,
//     englishLike:,
//     dense:,
//     tall:,
// );

//   @override
//   Color get unselectedWidgetColor => background;

//   @override
//   bool get useMaterial3 => true;

//   @override
//   VisualDensity get visualDensity => VisualDensity.adaptivePlatformDensity;

//   @override
//   Color get accentColor => throw UnimplementedError();

//   @override
//   Brightness get accentColorBrightness => Brightness.light;

//   @override
//   IconThemeData get accentIconTheme => IconThemeData(
//     color:, 
//     opacity:, 
//     size:, 
//     shadows:,
//   );

//   @override
//   TextTheme get accentTextTheme => throw UnimplementedError();

//   @override
//   AndroidOverscrollIndicator? get androidOverscrollIndicator =>
//       AndroidOverscrollIndicator.stretch;

//   @override
//   Color get buttonColor => throw UnimplementedError();

//   @override
//   bool get fixTextFieldOutlineLabel => true;

//   @override
//   Brightness get primaryColorBrightness => Brightness.light;
// }
