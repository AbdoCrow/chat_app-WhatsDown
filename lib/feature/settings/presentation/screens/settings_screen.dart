import 'package:flutter/material.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/feature/profile/presentation/screens/my_profile_screen.dart';
import 'package:chat_app/feature/settings/presentation/widgets/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          // Profile section
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const MyProfileScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.grey[200],
                    child: const Icon(
                      Icons.person,
                      size: 36,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Abdalrahman Essam',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Hey there! I am using What\'sDown',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.qr_code,
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1),
          // Settings options
          SettingsTile(
            icon: Icons.key,
            iconBackgroundColor: Colors.amber,
            title: 'Account',
            subtitle: 'Security notifications, change number',
            onTap: () => _showSettingsDetail(context, 'Account'),
          ),
          SettingsTile(
            icon: Icons.lock,
            iconBackgroundColor: Colors.cyan,
            title: 'Privacy',
            subtitle: 'Block contacts, disappearing messages',
            onTap: () => _showSettingsDetail(context, 'Privacy'),
          ),
          SettingsTile(
            icon: Icons.emoji_emotions,
            iconBackgroundColor: Colors.orange,
            title: 'Avatar',
            subtitle: 'Create, edit, profile photo',
            onTap: () => _showSettingsDetail(context, 'Avatar'),
          ),
          SettingsTile(
            icon: Icons.chat,
            iconBackgroundColor: AppColors.secondary,
            title: 'Chats',
            subtitle: 'Theme, wallpapers, chat history',
            onTap: () => _showSettingsDetail(context, 'Chats'),
          ),
          SettingsTile(
            icon: Icons.notifications,
            iconBackgroundColor: Colors.red,
            title: 'Notifications',
            subtitle: 'Message, group & call tones',
            onTap: () => _showSettingsDetail(context, 'Notifications'),
          ),
          SettingsTile(
            icon: Icons.data_usage,
            iconBackgroundColor: Colors.green,
            title: 'Storage and data',
            subtitle: 'Network usage, auto-download',
            onTap: () => _showSettingsDetail(context, 'Storage and data'),
          ),
          SettingsTile(
            icon: Icons.language,
            iconBackgroundColor: Colors.purple,
            title: 'App language',
            subtitle: 'English (device\'s language)',
            onTap: () => _showLanguagePicker(context),
          ),
          SettingsTile(
            icon: Icons.help_outline,
            iconBackgroundColor: Colors.blue,
            title: 'Help',
            subtitle: 'Help center, contact us, privacy policy',
            onTap: () => _showSettingsDetail(context, 'Help'),
          ),
          SettingsTile(
            icon: Icons.group,
            iconBackgroundColor: Colors.teal,
            title: 'Invite a friend',
            onTap: () {},
          ),
          const SizedBox(height: 20),
          // App info
          Center(
            child: Column(
              children: [
                Text(
                  'from',
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.chat_bubble, color: Colors.grey[600], size: 16),
                    const SizedBox(width: 4),
                    Text(
                      "What'sDown",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  void _showSettingsDetail(BuildContext context, String title) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => _SettingsDetailScreen(title: title)),
    );
  }

  void _showLanguagePicker(BuildContext context) {
    //YET To make the localization it's simple
    final languages = [
      'English',
      'Español',
      'Français',
      'Deutsch',
      'Italiano',
      'Português',
      '日本語',
      '한국어',
      '中文',
      'العربية',
    ];

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'App language',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(languages[index]),
                    trailing: index == 0
                        ? const Icon(Icons.check, color: AppColors.secondary)
                        : null,
                    onTap: () => Navigator.pop(context),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SettingsDetailScreen extends StatelessWidget {
  final String title;

  const _SettingsDetailScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(title, style: const TextStyle(color: Colors.white)),
      ),
      body: _buildSettingsContent(),
    );
  }

  Widget _buildSettingsContent() {
    switch (title) {
      case 'Account':
        return ListView(
          children: [
            _DetailTile(icon: Icons.security, title: 'Security notifications'),
            _DetailTile(icon: Icons.key, title: 'Passkeys'),
            _DetailTile(
              icon: Icons.verified_user,
              title: 'Two-step verification',
            ),
            _DetailTile(icon: Icons.swap_horiz, title: 'Change number'),
            _DetailTile(icon: Icons.description, title: 'Request account info'),
            _DetailTile(icon: Icons.devices, title: 'Add account'),
            _DetailTile(
              icon: Icons.delete,
              title: 'Delete my account',
              isDestructive: true,
            ),
          ],
        );
      case 'Privacy':
        return ListView(
          children: [
            _DetailTile(icon: Icons.visibility, title: 'Last seen and online'),
            _DetailTile(icon: Icons.photo, title: 'Profile photo'),
            _DetailTile(icon: Icons.info, title: 'About'),
            _DetailTile(icon: Icons.group, title: 'Groups'),
            _DetailTile(icon: Icons.check_circle, title: 'Read receipts'),
            const Divider(),
            _DetailTile(icon: Icons.timer, title: 'Disappearing messages'),
            const Divider(),
            _DetailTile(icon: Icons.lock, title: 'App lock'),
            _DetailTile(icon: Icons.chat_bubble, title: 'Chat lock'),
            const Divider(),
            _DetailTile(icon: Icons.block, title: 'Blocked contacts'),
          ],
        );
      case 'Chats':
        return ListView(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Display',
                style: TextStyle(
                  color: AppColors.lightTextSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            _DetailTile(icon: Icons.brightness_6, title: 'Theme'),
            _DetailTile(icon: Icons.wallpaper, title: 'Wallpaper'),
            const Divider(),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Chat settings',
                style: TextStyle(
                  color: AppColors.lightTextSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            _SwitchTile(title: 'Enter is send', value: false),
            _SwitchTile(title: 'Media visibility', value: true),
            _DetailTile(icon: Icons.text_fields, title: 'Font size'),
            const Divider(),
            _DetailTile(icon: Icons.backup, title: 'Chat backup'),
            _DetailTile(icon: Icons.history, title: 'Chat history'),
          ],
        );
      case 'Notifications':
        return ListView(
          children: [
            _SwitchTile(title: 'Conversation tones', value: true),
            const Divider(),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Messages',
                style: TextStyle(
                  color: AppColors.lightTextSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            _DetailTile(icon: Icons.notifications, title: 'Notification tone'),
            _DetailTile(icon: Icons.vibration, title: 'Vibrate'),
            _SwitchTile(title: 'High priority notifications', value: true),
            const Divider(),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Groups',
                style: TextStyle(
                  color: AppColors.lightTextSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            _DetailTile(icon: Icons.notifications, title: 'Notification tone'),
            _DetailTile(icon: Icons.vibration, title: 'Vibrate'),
            const Divider(),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Calls',
                style: TextStyle(
                  color: AppColors.lightTextSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            _DetailTile(icon: Icons.ring_volume, title: 'Ringtone'),
            _DetailTile(icon: Icons.vibration, title: 'Vibrate'),
          ],
        );
      case 'Storage and data':
        return ListView(
          children: [
            _DetailTile(icon: Icons.storage, title: 'Manage storage'),
            _DetailTile(icon: Icons.cell_tower, title: 'Network usage'),
            const Divider(),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Media auto-download',
                style: TextStyle(
                  color: AppColors.lightTextSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            _DetailTile(icon: Icons.wifi, title: 'When using Wi-Fi'),
            _DetailTile(
              icon: Icons.signal_cellular_alt,
              title: 'When using mobile data',
            ),
            _DetailTile(icon: Icons.signal_cellular_off, title: 'When roaming'),
          ],
        );
      case 'Help':
        return ListView(
          children: [
            _DetailTile(icon: Icons.help_center, title: 'Help Center'),
            _DetailTile(icon: Icons.email, title: 'Contact us'),
            _DetailTile(
              icon: Icons.description,
              title: 'Terms and Privacy Policy',
            ),
            _DetailTile(icon: Icons.info, title: 'App info'),
          ],
        );
      default:
        return const Center(child: Text('Settings content'));
    }
  }
}

class _DetailTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isDestructive;

  const _DetailTile({
    required this.icon,
    required this.title,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDestructive ? Colors.red : AppColors.lightIcon,
      ),
      title: Text(
        title,
        style: TextStyle(color: isDestructive ? Colors.red : null),
      ),
      onTap: () {},
    );
  }
}

class _SwitchTile extends StatefulWidget {
  final String title;
  final bool value;

  const _SwitchTile({required this.title, required this.value});

  @override
  State<_SwitchTile> createState() => _SwitchTileState();
}

class _SwitchTileState extends State<_SwitchTile> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.title),
      value: _value,
      activeColor: AppColors.secondary,
      onChanged: (value) {
        setState(() {
          _value = value;
        });
      },
    );
  }
}
