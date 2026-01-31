import 'package:flutter/material.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/feature/chat/presentation/widgets/message_status_icon.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isMe;
  final String? status;
  final bool isFirstInGroup;
  final String? senderName;
  final Color? senderColor;
  final String? replyTo;
  final bool isForwarded;
  final VoidCallback? onLongPress;

  const MessageBubble({
    super.key,
    required this.message,
    required this.time,
    required this.isMe,
    this.status,
    this.isFirstInGroup = true,
    this.senderName,
    this.senderColor,
    this.replyTo,
    this.isForwarded = false,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onLongPress: onLongPress,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          margin: EdgeInsets.only(
            top: isFirstInGroup ? 8 : 2,
            bottom: 2,
            left: isMe ? 60 : 0,
            right: isMe ? 0 : 60,
          ),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: senderName != null ? 6 : 8,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: isMe
                      ? AppColors.sentMessageLight
                      : AppColors.receivedMessageLight,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(isFirstInGroup && !isMe ? 0 : 12),
                    topRight: Radius.circular(isFirstInGroup && isMe ? 0 : 12),
                    bottomLeft: const Radius.circular(12),
                    bottomRight: const Radius.circular(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sender name (for group chats)
                    if (senderName != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          senderName!,
                          style: TextStyle(
                            color: senderColor ?? AppColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    // Forwarded label
                    if (isForwarded)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.reply,
                              size: 14,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Forwarded',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    // Reply preview
                    if (replyTo != null)
                      Container(
                        margin: const EdgeInsets.only(bottom: 6),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8),
                          border: Border(
                            left: BorderSide(
                              color: AppColors.primary,
                              width: 3,
                            ),
                          ),
                        ),
                        child: Text(
                          replyTo!,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 13,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    // Message text with time
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(
                            message,
                            style: const TextStyle(fontSize: 15, height: 1.3),
                          ),
                        ),
                        const SizedBox(width: 6),
                        // Time and status
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                time,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey[600],
                                ),
                              ),
                              if (isMe && status != null) ...[
                                const SizedBox(width: 3),
                                MessageStatusIcon(status: status!),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageMessageBubble extends StatelessWidget {
  final String imageUrl;
  final String time;
  final bool isMe;
  final String? status;
  final String? caption;
  final VoidCallback? onTap;

  const ImageMessageBubble({
    super.key,
    required this.imageUrl,
    required this.time,
    required this.isMe,
    this.status,
    this.caption,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.65,
          ),
          margin: const EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
            color: isMe
                ? AppColors.sentMessageLight
                : AppColors.receivedMessageLight,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image placeholder
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image, size: 48, color: Colors.grey),
                  ),
                ),
                // Caption and time
                if (caption != null)
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(caption!),
                  ),
                // Time overlay
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        time,
                        style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                      ),
                      if (isMe && status != null) ...[
                        const SizedBox(width: 3),
                        MessageStatusIcon(status: status!),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VoiceMessageBubble extends StatelessWidget {
  final String duration;
  final String time;
  final bool isMe;
  final String? status;
  final bool isPlaying;
  final double progress;
  final VoidCallback? onPlayPause;

  const VoiceMessageBubble({
    super.key,
    required this.duration,
    required this.time,
    required this.isMe,
    this.status,
    this.isPlaying = false,
    this.progress = 0,
    this.onPlayPause,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.65,
        ),
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isMe
              ? AppColors.sentMessageLight
              : AppColors.receivedMessageLight,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Play/Pause button
            GestureDetector(
              onTap: onPlayPause,
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Waveform and time
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Waveform placeholder
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: progress,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        duration,
                        style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            time,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
                            ),
                          ),
                          if (isMe && status != null) ...[
                            const SizedBox(width: 3),
                            MessageStatusIcon(status: status!),
                          ],
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
