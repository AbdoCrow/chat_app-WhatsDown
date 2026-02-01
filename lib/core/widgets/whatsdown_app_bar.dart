import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';

class WhatsDownAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const WhatsDownAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.bottom,
    this.showBackButton = false,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: onBackPressed ?? () => context.pop(),
            )
          : leading,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: actions,
      bottom: bottom,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}

class ChatRoomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final String? subtitle;
  final String? imageUrl;
  final bool isOnline;
  final VoidCallback? onBackPressed;
  final VoidCallback? onProfileTap;
  final VoidCallback? onVideoCall;
  final VoidCallback? onVoiceCall;
  final List<PopupMenuEntry<String>>? menuItems;
  final Function(String)? onMenuSelected;

  const ChatRoomAppBar({
    super.key,
    required this.name,
    this.subtitle,
    this.imageUrl,
    this.isOnline = false,
    this.onBackPressed,
    this.onProfileTap,
    this.onVideoCall,
    this.onVoiceCall,
    this.menuItems,
    this.onMenuSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      leadingWidth: 30,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: onBackPressed ?? () => context.pop(),
        padding: EdgeInsets.zero,
      ),
      title: InkWell(
        onTap: onProfileTap,
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white24,
              backgroundImage: imageUrl != null
                  ? NetworkImage(imageUrl!)
                  : null,
              child: imageUrl == null
                  ? Text(
                      name.isNotEmpty ? name[0].toUpperCase() : '?',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.videocam, color: Colors.white),
          onPressed: onVideoCall,
        ),
        IconButton(
          icon: const Icon(Icons.call, color: Colors.white),
          onPressed: onVoiceCall,
        ),
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onSelected: onMenuSelected,
          itemBuilder: (context) =>
              menuItems ??
              [
                const PopupMenuItem(
                  value: 'view_contact',
                  child: Text('View contact'),
                ),
                const PopupMenuItem(
                  value: 'media',
                  child: Text('Media, links, and docs'),
                ),
                const PopupMenuItem(value: 'search', child: Text('Search')),
                const PopupMenuItem(
                  value: 'mute',
                  child: Text('Mute notifications'),
                ),
                const PopupMenuItem(
                  value: 'wallpaper',
                  child: Text('Wallpaper'),
                ),
                const PopupMenuItem(value: 'more', child: Text('More')),
              ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
