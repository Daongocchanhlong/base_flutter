import 'package:base_src/global/app_theme.dart';
import 'package:flutter/material.dart';

class AppThemeBright extends AppTheme {
  @override
  ThemeData get theme => ThemeData(
      scaffoldBackgroundColor: black,
      backgroundColor: black,
      primaryColor: black,
      dialogBackgroundColor: black,
      fontFamily: 'Roboto-Regular',
      appBarTheme: _buildAppBarTheme,
      bottomAppBarTheme: _buildBottomAppBarTheme);

  // appbar
  AppBarTheme get _buildAppBarTheme => AppBarTheme(
        backgroundColor: black,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: black),
        // textTheme: TextTheme(),
        titleTextStyle:
            TextStyle(color: black, fontSize: 16, fontFamily: 'Roboto-Regular'),
      );

  // bottom appbar
  BottomAppBarTheme get _buildBottomAppBarTheme =>
      BottomAppBarTheme(elevation: 0, color: black);

  @override
  Color get red => const Color(0xFFC92155);

  @override
  Color get red10 => const Color(0xFFE50615);

  @override
  Color get white => Colors.white;

  @override
  Color get black => Colors.black;

  @override
  Color get transparent => Colors.transparent;

  @override
  Color get yellowBgr => const Color(0xFFf2e836);

  @override
  Color get orangeBgr => const Color(0xFFfd5e2f);

  @override
  Color get green => const Color(0xFF006400);
}
