import 'package:flutter/material.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/feature/chat/presentation/widgets/message_status_icon.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final String? imageUrl;
  final bool isOnline;
  final bool isTyping;
  final bool isMuted;
  final bool isPinned;
  final String? messageStatus;
  final bool isGroup;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const ChatTile({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.time,
    this.unreadCount = 0,
    this.imageUrl,
    this.isOnline = false,
    this.isTyping = false,
    this.isMuted = false,
    this.isPinned = false,
    this.messageStatus,
    this.isGroup = false,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Avatar
            Stack(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: AppColors.primary.withOpacity(0.2),
                  backgroundImage: imageUrl != null
                      ? NetworkImage(imageUrl!)
                      : null,
                  child: imageUrl == null
                      ? isGroup
                            ? const Icon(Icons.group, color: AppColors.primary)
                            : Text(
                                name.isNotEmpty ? name[0].toUpperCase() : '?',
                                style: const TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                      : null,
                ),
                if (isOnline && !isGroup)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: AppColors.online,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            // Chat info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and time row
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 12,
                          color: unreadCount > 0
                              ? AppColors.secondary
                              : AppColors.lightTextSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Last message and unread count row
                  Row(
                    children: [
                      // Message status icon (for sent messages)
                      if (messageStatus != null && !isTyping)
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: MessageStatusIcon(status: messageStatus!),
                        ),
                      Expanded(
                        child: isTyping
                            ? const Text(
                                'typing...',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.secondary,
                                  fontStyle: FontStyle.italic,
                                ),
                              )
                            : Text(
                                lastMessage,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: unreadCount > 0
                                      ? AppColors.lightTextPrimary
                                      : AppColors.lightTextSecondary,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                      ),
                      // Muted icon
                      if (isMuted)
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Icon(
                            Icons.volume_off,
                            size: 16,
                            color: Colors.grey[500],
                          ),
                        ),
                      // Pin icon
                      if (isPinned)
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Transform.rotate(
                            angle: 0.7,
                            child: Icon(
                              Icons.push_pin,
                              size: 16,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                      // Unread badge
                      if (unreadCount > 0)
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: isMuted
                                ? Colors.grey[500]
                                : AppColors.unreadBadge,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            unreadCount > 99 ? '99+' : unreadCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
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
    );
  }
}
