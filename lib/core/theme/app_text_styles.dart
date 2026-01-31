import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // Headings
  static const TextStyle heading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.3,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  // App Bar
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const TextStyle appBarSubtitle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: Colors.white70,
  );

  // Chat List
  static const TextStyle chatName = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle chatLastMessage = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle chatTime = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle unreadCount = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  // Messages
  static const TextStyle messageText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    height: 1.3,
  );

  static const TextStyle messageTime = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle messageSender = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );

  // Status
  static const TextStyle statusName = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle statusTime = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  // Calls
  static const TextStyle callName = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle callInfo = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  // Input
  static const TextStyle inputText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle inputHint = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  // Body text
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  // Labels
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );

  // Date chip
  static const TextStyle dateChip = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  // Link
  static TextStyle link = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: AppColors.linkBlue,
    decoration: TextDecoration.underline,
  );
}
