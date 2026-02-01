import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:chat_app/core/theme/app_colors.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          // Profile picture section
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 64,
                  backgroundColor: Colors.grey[200],
                  child: const Icon(Icons.person, size: 64, color: Colors.grey),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: AppColors.secondary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Name section
          _ProfileTile(
            icon: Icons.person,
            title: 'Name',
            subtitle: 'Abdalrahman Essam',
            info:
                'This is not your username or pin. This name will be visible to your What\'sDown contacts.',
            onTap: () => _showEditDialog(context, 'Name', 'Abdalrahman Essam'),
          ),
          const Divider(indent: 72),
          // About section
          _ProfileTile(
            icon: Icons.info_outline,
            title: 'About',
            subtitle: 'walk with me BT4s',
            onTap: () => _showAboutOptions(context),
          ),
          const Divider(indent: 72),
          // Phone section
          _ProfileTile(
            icon: Icons.phone,
            title: 'Phone',
            subtitle: '+20 1120328170',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  void _showEditDialog(
    BuildContext context,
    String field,
    String currentValue,
  ) {
    final controller = TextEditingController(text: currentValue);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter your $field'),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(hintText: field),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showAboutOptions(BuildContext context) {
    final aboutOptions = [
      'Available',
      'Busy',
      'At school',
      'At the movies',
      'At work',
      'Battery about to die',
      'Can\'t talk, What\'sDown only',
      'In a meeting',
      'At the gym',
      'Sleeping',
      'Urgent calls only',
    ];

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Text(
                    'Select your About',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.pop(context);
                      _showEditDialog(
                        context,
                        'About',
                        'Hey there! I am using What\'sDown',
                      );
                    },
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: aboutOptions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(aboutOptions[index]),
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

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String? info;
  final VoidCallback? onTap;

  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.info,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.lightIcon, size: 24),
            const SizedBox(width: 32),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                  const SizedBox(height: 2),
                  Text(subtitle, style: const TextStyle(fontSize: 16)),
                  if (info != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      info!,
                      style: TextStyle(color: Colors.grey[500], fontSize: 13),
                    ),
                  ],
                ],
              ),
            ),
            if (onTap != null)
              Icon(Icons.edit, color: AppColors.secondary, size: 20),
          ],
        ),
      ),
    );
  }
}
