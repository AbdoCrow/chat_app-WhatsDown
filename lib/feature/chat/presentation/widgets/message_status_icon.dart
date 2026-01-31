import 'package:flutter/material.dart';
import 'package:chat_app/core/theme/app_colors.dart';

class MessageStatusIcon extends StatelessWidget {
  final String status;
  final double size;

  const MessageStatusIcon({super.key, required this.status, this.size = 16});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case 'sending':
        return Icon(Icons.access_time, size: size, color: AppColors.tickGrey);
      case 'sent':
        return Icon(Icons.check, size: size, color: AppColors.tickGrey);
      case 'delivered':
        return Icon(Icons.done_all, size: size, color: AppColors.tickGrey);
      case 'read':
        return Icon(Icons.done_all, size: size, color: AppColors.tickBlue);
      case 'failed':
        return Icon(Icons.error_outline, size: size, color: AppColors.errorRed);
      default:
        return const SizedBox.shrink();
    }
  }
}
