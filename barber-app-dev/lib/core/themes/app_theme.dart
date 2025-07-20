import 'package:flutter/material.dart';

import 'index.dart';

abstract final class AppColors {
  const AppColors._();

  // Base colors
  static const Color neutral = CoolGray.shade900;
  static const Color neutralBlueGray = BlueGray.shade900;
  static const Color primary = PrimaryBrand.shade900; // brand
  static const Color secondary = Secondary.shade900;
  static const Color accent = Accent.shade900;
  static const Color red = Red.shade900; // warning/fail
  static const Color yellow = Yellow.shade900;
  static const Color blue = Blue.shade900;
  static const Color tealGreen = TealGreen.shade900; // success
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color unSelect = CoolGray.shade200;

  // Cool Gray

  static const Color coolGray400 = CoolGray.shade400;
  static const Color coolGray300 = CoolGray.shade300;
  static const Color coolGray200 = CoolGray.shade200;
  static const Color coolGray100 = CoolGray.shade100;
  static const Color coolGray50 = CoolGray.shade50;
  static const Color coolGray900 = CoolGray.shade900;
  static const Color coolGray800 = CoolGray.shade800;
  static const Color coolGray700 = CoolGray.shade700;
  static const Color coolGray600 = CoolGray.shade600;
  static const Color coolGray500 = CoolGray.shade500;

  // Blue Gray
  static const Color blueGray400 = BlueGray.shade400;
  static const Color blueGray300 = BlueGray.shade300;
  static const Color blueGray200 = BlueGray.shade200;
  static const Color blueGray100 = BlueGray.shade100;
  static const Color blueGray50 = BlueGray.shade50;
  static const Color blueGray900 = BlueGray.shade900;
  static const Color blueGray800 = BlueGray.shade800;
  static const Color blueGray700 = BlueGray.shade700;
  static const Color blueGray600 = BlueGray.shade600;
  static const Color blueGray500 = BlueGray.shade500;


  // Primary Brand
  static const Color primaryBrand400 = PrimaryBrand.shade400;
  static const Color primaryBrand300 = PrimaryBrand.shade300;
  static const Color primaryBrand200 = PrimaryBrand.shade200;
  static const Color primaryBrand100 = PrimaryBrand.shade100;
  static const Color primaryBrand50 = PrimaryBrand.shade50;
  static const Color primaryBrand900 = PrimaryBrand.shade900;
  static const Color primaryBrand800 = PrimaryBrand.shade800;
  static const Color primaryBrand700 = PrimaryBrand.shade700;
  static const Color primaryBrand600 = PrimaryBrand.shade600;
  static const Color primaryBrand500 = PrimaryBrand.shade500;

  // Secondary
  static const Color secondary400 = Secondary.shade400;
  static const Color secondary300 = Secondary.shade300;
  static const Color secondary200 = Secondary.shade200;
  static const Color secondary100 = Secondary.shade100;
  static const Color secondary50 = Secondary.shade50;
  static const Color secondary900 = Secondary.shade900;
  static const Color secondary800 = Secondary.shade800;
  static const Color secondary700 = Secondary.shade700;
  static const Color secondary600 = Secondary.shade600;
  static const Color secondary500 = Secondary.shade500;

  // Accent
  static const Color accent400 = Accent.shade400;
  static const Color accent300 = Accent.shade300;
  static const Color accent200 = Accent.shade200;
  static const Color accent100 = Accent.shade100;
  static const Color accent50 = Accent.shade50;
  static const Color accent900 = Accent.shade900;
  static const Color accent800 = Accent.shade800;
  static const Color accent700 = Accent.shade700;
  static const Color accent600 = Accent.shade600;
  static const Color accent500 = Accent.shade500;

  // Red
  static const Color red400 = Red.shade400;
  static const Color red300 = Red.shade300;
  static const Color red200 = Red.shade200;
  static const Color red100 = Red.shade100;
  static const Color red50 = Red.shade50;
  static const Color red900 = Red.shade900;
  static const Color red800 = Red.shade800;
  static const Color red700 = Red.shade700;
  static const Color red600 = Red.shade600;
  static const Color red500 = Red.shade500;

  // Yellow
  static const Color yellow400 = Yellow.shade400;
  static const Color yellow300 = Yellow.shade300;
  static const Color yellow200 = Yellow.shade200;
  static const Color yellow100 = Yellow.shade100;
  static const Color yellow50 = Yellow.shade50;
  static const Color yellow900 = Yellow.shade900;
  static const Color yellow800 = Yellow.shade800;
  static const Color yellow700 = Yellow.shade700;
  static const Color yellow600 = Yellow.shade600;
  static const Color yellow500 = Yellow.shade500;

  // Blue
  static const Color blue400 = Blue.shade400;
  static const Color blue300 = Blue.shade300;
  static const Color blue200 = Blue.shade200;
  static const Color blue100 = Blue.shade100;
  static const Color blue50 = Blue.shade50;
  static const Color blue900 = Blue.shade900;
  static const Color blue800 = Blue.shade800;
  static const Color blue700 = Blue.shade700;
  static const Color blue600 = Blue.shade600;
  static const Color blue500 = Blue.shade500;

  // Teal Green
  static const Color tealGreen400 = TealGreen.shade400;
  static const Color tealGreen300 = TealGreen.shade300;
  static const Color tealGreen200 = TealGreen.shade200;
  static const Color tealGreen100 = TealGreen.shade100;
  static const Color tealGreen50 = TealGreen.shade50;
  static const Color tealGreen900 = TealGreen.shade900;
  static const Color tealGreen800 = TealGreen.shade800;
  static const Color tealGreen700 = TealGreen.shade700;
  static const Color tealGreen600 = TealGreen.shade600;
  static const Color tealGreen500 = TealGreen.shade500;









}
// Color palettes
 abstract final class CoolGray {
   const CoolGray._();

   static const Color shade50 = Color(0xFFF9FAFB);
  static const Color shade100 = Color(0xFFF4F4F5);
  static const Color shade200 = Color(0xFFE5E7EB);
  static const Color shade300 = Color(0xFFD1D5DB);
  static const Color shade400 = Color(0xFF9CA3AF);
  static const Color shade500 = Color(0xFF6B7280);
  static const Color shade600 = Color(0xFF4B5563);
  static const Color shade700 = Color(0xFF374151);
  static const Color shade800 = Color(0xFF1F2937);
  static const Color shade900 = Color(0xFF111827);
}

 abstract final class BlueGray {
  static const Color shade50 = Color(0xFFF8FAFC);
  static const Color shade100 = Color(0xFFEBF0F5);
  static const Color shade200 = Color(0xFFE2E8F0);
  static const Color shade300 = Color(0xFFCBD5E1);
  static const Color shade400 = Color(0xFF94A3B8);
  static const Color shade500 = Color(0xFF64748B);
  static const Color shade600 = Color(0xFF475569);
  static const Color shade700 = Color(0xFF334155);
  static const Color shade800 = Color(0xFF1E293B);
  static const Color shade900 = Color(0xFF0F172A);
}

 abstract final class PrimaryBrand {
  static const Color shade50 = Color(0xFFEDEFFB);
  static const Color shade100 = Color(0xFFD7D6E0);
  static const Color shade200 = Color(0xFFC3C1D0);
  static const Color shade300 = Color(0xFFAFACC0);
  static const Color shade400 = Color(0xFF9A97B0);
  static const Color shade500 = Color(0xFF8683A1);
  static const Color shade600 = Color(0xFF726E91);
  static const Color shade700 = Color(0xFF5E5981);
  static const Color shade800 = Color(0xFF4A4572);
  static const Color shade900 = Color(0xFF363062);
}

 abstract final class Secondary {
  static const Color shade50 = Color(0xFFFEF4E8);
  static const Color shade100 = Color(0xFFFEEAD1);
  static const Color shade200 = Color(0xFFFDDFB9);
  static const Color shade300 = Color(0xFFFDD4A2);
  static const Color shade400 = Color(0xFFFCC98B);
  static const Color shade500 = Color(0xFFFBBF74);
  static const Color shade600 = Color(0xFFFBB45D);
  static const Color shade700 = Color(0xFFFAA945);
  static const Color shade800 = Color(0xFFFA9F2E);
  static const Color shade900 = Color(0xFFF99417);
}

 abstract final class Accent {
  static const Color shade50 = Color(0xFFFFEDF7);
  static const Color shade100 = Color(0xFFFFDBEE);
  static const Color shade200 = Color(0xFFFFC9E6);
  static const Color shade300 = Color(0xFFFFB7DD);
  static const Color shade400 = Color(0xFFFFA5D5);
  static const Color shade500 = Color(0xFFFF92CD);
  static const Color shade600 = Color(0xFFFF80C4);
  static const Color shade700 = Color(0xFFFF6EBC);
  static const Color shade800 = Color(0xFFFF5CB3);
  static const Color shade900 = Color(0xFFFF4AAB);
}

 abstract final class Red {
  static const Color shade50 = Color(0xFFFFF1F2);
  static const Color shade100 = Color(0xFFFFE4E6);
  static const Color shade200 = Color(0xFFFECDD3);
  static const Color shade300 = Color(0xFFFDA4AF);
  static const Color shade400 = Color(0xFFFB7185);
  static const Color shade500 = Color(0xFFF43F5E);
  static const Color shade600 = Color(0xFFE11D48);
  static const Color shade700 = Color(0xFFBE123C);
  static const Color shade800 = Color(0xFF9F1239);
  static const Color shade900 = Color(0xFF881337);
}

 abstract final class Yellow {
  static const Color shade50 = Color(0xFFFEFCE8);
  static const Color shade100 = Color(0xFFFEF9C3);
  static const Color shade200 = Color(0xFFFEF08A);
  static const Color shade300 = Color(0xFFFDE047);
  static const Color shade400 = Color(0xFFFACC15);
  static const Color shade500 = Color(0xFFEAB308);
  static const Color shade600 = Color(0xFFCA8A04);
  static const Color shade700 = Color(0xFFA16207);
  static const Color shade800 = Color(0xFF854D0E);
  static const Color shade900 = Color(0xFF713F12);
}

 abstract final class Blue {
  static const Color shade50 = Color(0xFFF0F9FF);
  static const Color shade100 = Color(0xFFE0F2FE);
  static const Color shade200 = Color(0xFFBAE6FD);
  static const Color shade300 = Color(0xFF7DD3FC);
  static const Color shade400 = Color(0xFF38BDF8);
  static const Color shade500 = Color(0xFF0EA5E9);
  static const Color shade600 = Color(0xFF0284C7);
  static const Color shade700 = Color(0xFF0369A1);
  static const Color shade800 = Color(0xFF075985);
  static const Color shade900 = Color(0xFF0C4A6E);
}
 abstract final class TealGreen {
  static const Color shade50 = Color(0xFFF0FDFA);
  static const Color shade100 = Color(0xFFCCFBF1);
  static const Color shade200 = Color(0xFF99F6E4);
  static const Color shade300 = Color(0xFF5EEAD4);
  static const Color shade400 = Color(0xFF2DD4BF);
  static const Color shade500 = Color(0xFF14B8A6);
  static const Color shade600 = Color(0xFF0D9488);
  static const Color shade700 = Color(0xFF0F766E);
  static const Color shade800 = Color(0xFF115E59);
  static const Color shade900 = Color(0xFF134E4A);
}

extension CustomColorScheme on ColorScheme {

  Color get neutral => AppColors.neutral;
  Color get neutralBlueGray => AppColors.neutralBlueGray;
  Color get primary => AppColors.primary;
  Color get secondary => AppColors.secondary;
  Color get accent => AppColors.accent;
  Color get red => AppColors.red;
  Color get yellow => AppColors.yellow;
  Color get blue => AppColors.blue;
  Color get tealGreen => AppColors.tealGreen;
  Color get white => AppColors.white;
  Color get black => AppColors.black;
  Color get unSelected => AppColors.unSelect;
  Color get coolGray400 => AppColors.coolGray400;
  Color get coolGray300 => AppColors.coolGray300;
  Color get coolGray200 => AppColors.coolGray200;
  Color get coolGray100 => AppColors.coolGray100;
  Color get coolGray50 => AppColors.coolGray50;
  Color get coolGray900 => AppColors.coolGray900;
  Color get coolGray800 => AppColors.coolGray800;
  Color get coolGray700 => AppColors.coolGray700;
  Color get coolGray600 => AppColors.coolGray600;
  Color get coolGray500 => AppColors.coolGray500;

  Color get blueGray400 => AppColors.blueGray400;
  Color get blueGray300 => AppColors.blueGray300;
  Color get blueGray200 => AppColors.blueGray200;
  Color get blueGray100 => AppColors.blueGray100;
  Color get blueGray50 => AppColors.blueGray50;
  Color get blueGray900 => AppColors.blueGray900;
  Color get blueGray800 => AppColors.blueGray800;
  Color get blueGray700 => AppColors.blueGray700;
  Color get blueGray600 => AppColors.blueGray600;
  Color get blueGray500 => AppColors.blueGray500;

  Color get primaryBrand400 => AppColors.primaryBrand400;
  Color get primaryBrand300 => AppColors.primaryBrand300;
  Color get primaryBrand200 => AppColors.primaryBrand200;
  Color get primaryBrand100 => AppColors.primaryBrand100;
  Color get primaryBrand50 => AppColors.primaryBrand50;
  Color get primaryBrand900 => AppColors.primaryBrand900;
  Color get primaryBrand800 => AppColors.primaryBrand800;
  Color get primaryBrand700 => AppColors.primaryBrand700;
  Color get primaryBrand600 => AppColors.primaryBrand600;
  Color get primaryBrand500 => AppColors.primaryBrand500;

  Color get secondary400 => AppColors.secondary400;
  Color get secondary300 => AppColors.secondary300;
  Color get secondary200 => AppColors.secondary200;
  Color get secondary100 => AppColors.secondary100;
  Color get secondary50 => AppColors.secondary50;
  Color get secondary900 => AppColors.secondary900;
  Color get secondary800 => AppColors.secondary800;
  Color get secondary700 => AppColors.secondary700;
  Color get secondary600 => AppColors.secondary600;
  Color get secondary500 => AppColors.secondary500;

  Color get accent400 => AppColors.accent400;
  Color get accent300 => AppColors.accent300;
  Color get accent200 => AppColors.accent200;
  Color get accent100 => AppColors.accent100;
  Color get accent50 => AppColors.accent50;
  Color get accent900 => AppColors.accent900;
  Color get accent800 => AppColors.accent800;
  Color get accent700 => AppColors.accent700;
  Color get accent600 => AppColors.accent600;
  Color get accent500 => AppColors.accent500;

  Color get red400 => AppColors.red400;
  Color get red300 => AppColors.red300;
  Color get red200 => AppColors.red200;
  Color get red100 => AppColors.red100;
  Color get red50 => AppColors.red50;
  Color get red900 => AppColors.red900;
  Color get red800 => AppColors.red800;
  Color get red700 => AppColors.red700;
  Color get red600 => AppColors.red600;
  Color get red500 => AppColors.red500;

  Color get yellow400 => AppColors.yellow400;
  Color get yellow300 => AppColors.yellow300;
  Color get yellow200 => AppColors.yellow200;
  Color get yellow100 => AppColors.yellow100;
  Color get yellow50 => AppColors.yellow50;
  Color get yellow900 => AppColors.yellow900;
  Color get yellow800 => AppColors.yellow800;
  Color get yellow700 => AppColors.yellow700;
  Color get yellow600 => AppColors.yellow600;
  Color get yellow500 => AppColors.yellow500;

  Color get blue400 => AppColors.blue400;
  Color get blue300 => AppColors.blue300;
  Color get blue200 => AppColors.blue200;
  Color get blue100 => AppColors.blue100;
  Color get blue50 => AppColors.blue50;
  Color get blue900 => AppColors.blue900;
  Color get blue800 => AppColors.blue800;
  Color get blue700 => AppColors.blue700;
  Color get blue600 => AppColors.blue600;
  Color get blue500 => AppColors.blue500;

  Color get tealGreen400 => AppColors.tealGreen400;
  Color get tealGreen300 => AppColors.tealGreen300;
  Color get tealGreen200 => AppColors.tealGreen200;
  Color get tealGreen100 => AppColors.tealGreen100;
  Color get tealGreen50 => AppColors.tealGreen50;
  Color get tealGreen900 => AppColors.tealGreen900;
  Color get tealGreen800 => AppColors.tealGreen800;
  Color get tealGreen700 => AppColors.tealGreen700;
  Color get tealGreen600 => AppColors.tealGreen600;
  Color get tealGreen500 => AppColors.tealGreen500;





}

final lightThemeData = ThemeData(
  fontFamily: 'PlusJakartaSans',
  brightness: Brightness.light,
  primaryColor: AppColors.primary,

  hintColor: CoolGray.shade500,
  iconTheme: const IconThemeData(color: AppColors.neutralBlueGray),
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.white,
    surfaceTint: Colors.transparent,

  ),
  scaffoldBackgroundColor: AppColors.white,
  cardColor: AppColors.white,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontFamily: 'PlusJakartaSans',

      color: AppColors.black,
      fontSize: 18,

      fontWeight: FontWeight.bold,
    ),
    backgroundColor: AppColors.white,
    foregroundColor: AppColors.neutralBlueGray,
    iconTheme: IconThemeData(color: AppColors.black),
    elevation: 0,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.primary,
    disabledColor: AppColors.neutralBlueGray,

  ),
  inputDecorationTheme: const InputDecorationTheme(

    contentPadding: AppSpacing.zero,

    border: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 0,
        strokeAlign: 0,
        style: BorderStyle.none,


      ),
    ),

  ),
  textTheme: _buildTextTheme(AppColors.black),
  outlinedButtonTheme: buildOutlinedButtonThemeData(
    bgDisabled: AppColors.neutralBlueGray,
    bgEnabled: AppColors.neutral,
    fgDisabled: AppColors.white,
    fgEnabled: AppColors.white,
  ),

  elevatedButtonTheme: buildElevatedButtonThemeData(
    onPrimary: AppColors.white,
    primary: AppColors.primary,
  ),
  switchTheme: getSwitchThemeData(AppColors.primary),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.white,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.blueGray400,
 /*   selectedIconTheme: IconThemeData(color: AppColors.primary,),
    unselectedIconTheme: IconThemeData(color: AppColors.blueGray400,),
    selectedLabelStyle: TextStyle(color: AppColors.primary),
    unselectedLabelStyle: TextStyle(color: AppColors.blueGray400),*/
  ),



);

// final darkThemeData = ThemeData(
//   fontFamily: 'PlusJakartaSans',
//   brightness: Brightness.dark,
//   primaryColor: AppColors.primaryRed,
//   hintColor: AppColors.greyMedium,
//   iconTheme: const IconThemeData(color: AppColors.pureWhite),
//   colorScheme: const ColorScheme.dark(
//     primary: AppColors.primaryRed,
//     secondary: AppColors.greyMedium,
//     background: AppColors.greyBackground,
//     surfaceTint: Colors.transparent,
//   ),
//   scaffoldBackgroundColor: AppColors.greyBackground,
//   cardColor: AppColors.greyBackground,
//   appBarTheme: const AppBarTheme(
//     backgroundColor: AppColors.greyBackground,
//     foregroundColor: AppColors.pureWhite,
//     iconTheme: IconThemeData(color: AppColors.pureWhite),
//     elevation: 0,
//   ),
//   buttonTheme: const ButtonThemeData(
//     buttonColor: AppColors.primaryRed,
//     disabledColor: AppColors.buttonDisabled,
//   ),
//   textTheme: _buildTextTheme(AppColors.pureWhite),
//   outlinedButtonTheme: buildOutlinedButtonThemeData(
//     bgDisabled: AppColors.buttonDisabled,
//     bgEnabled: AppColors.primaryRed,
//     fgDisabled: AppColors.pureWhite,
//     fgEnabled: AppColors.pureWhite,
//   ),
//   elevatedButtonTheme: buildElevatedButtonThemeData(
//     onPrimary: AppColors.pureWhite,
//     primary: AppColors.primaryRed,
//   ),
//   switchTheme: getSwitchThemeData(AppColors.greenSuccess),
//   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//     backgroundColor: AppColors.greyBackground,
//     selectedItemColor: AppColors.pureWhite,
//     unselectedItemColor: AppColors.brownLight,
//   ),
// );

TextTheme _buildTextTheme(Color textColor) {
  return TextTheme(
    displaySmall: TextStyle(
      color: textColor,
      fontSize: 36,
      height: 0,

      fontWeight: FontWeight.bold,
      fontFamily: 'PlusJakartaSans',
    ),

    // Display 1 (large)
    headlineLarge: TextStyle(
      color: textColor,
      fontSize: 32,
      fontWeight: FontWeight.w600,
      fontFamily: 'PlusJakartaSans',
    ),

    // Display 2 (medium)
    headlineMedium: TextStyle(
      color: textColor,
      fontSize: 28,
      fontWeight: FontWeight.w600,
      fontFamily: 'PlusJakartaSans',
    ),

    // Headline 1 (small)
    headlineSmall: TextStyle(
      color: textColor,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: 'PlusJakartaSans',
    ),
    titleLarge: TextStyle(
      color: textColor,
      fontSize: 22,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w600,
    ),
    // headline 3
    titleMedium: TextStyle(
      color: textColor,
      fontFamily: 'PlusJakartaSans',
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      color: textColor,
      fontFamily: 'PlusJakartaSans',
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    // Body 2
    bodyLarge: TextStyle(
      fontFamily: 'PlusJakartaSans',
      color: textColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'PlusJakartaSans',
      color: textColor,
      fontSize: 14,

      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: textColor.withOpacity(0.75),
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    // Body 3
    labelLarge: TextStyle(
      fontFamily: 'PlusJakartaSans',
      color: textColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontFamily: 'PlusJakartaSans',
      color: textColor,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontFamily: 'PlusJakartaSans',
      color: textColor,
      fontSize: 11,
      fontWeight: FontWeight.w500,
    ),

  );
}

OutlinedButtonThemeData buildOutlinedButtonThemeData({
  required Color bgDisabled,
  required Color bgEnabled,
  required Color fgDisabled,
  required Color fgEnabled,
}) {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ).copyWith(
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return bgDisabled;
          }
          return bgEnabled;
        },
      ),
      foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return fgDisabled;
          }
          return fgEnabled;
        },
      ),
    ),
  );
}

ElevatedButtonThemeData buildElevatedButtonThemeData({
  required Color onPrimary,
  required Color primary,
  double elevation = 2,
}) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: onPrimary,
      backgroundColor: primary,
      elevation: elevation,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}

SwitchThemeData getSwitchThemeData(Color activeColor) {
  return SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
        /*if (states.contains(MaterialState.disabled)) {
          return activeColor;
        }
        if (states.contains(MaterialState.selected)) {
          return activeColor;
        }*/
        return activeColor;
      },
    ),
    trackColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
        /*if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return activeColor;
        }*/
        return AppColors.white;
      },
    ),
    trackOutlineColor: WidgetStateProperty.all(AppColors.primary),
    // Ensure there's a border on the track as shown in the image
    overlayColor: WidgetStateProperty.all(Colors.transparent),
    splashRadius: 16,
      thumbIcon: WidgetStateProperty.all(
        const Icon(
          null,
        ),
      ),

  );
}
