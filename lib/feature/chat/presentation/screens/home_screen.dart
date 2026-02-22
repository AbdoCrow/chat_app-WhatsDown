import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/feature/chat/presentation/screens/chat_list_screen.dart';
import 'package:chat_app/core/router/router.dart';
import 'package:chat_app/feature/status/presentation/screens/status_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showSearchBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: AppColors.primary,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        title: const Text('Search results will appear here'),
                        subtitle: Text(
                          'Start typing to search',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          "What'sDown",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: _showSearchBottomSheet,
          ),
          IconButton(
            icon: const Icon(Icons.bug_report, color: Colors.white),
            tooltip: 'Dummy Feature',
            onPressed: () {
              context.push('/dummy');
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if (value == 'settings') {
                context.goToSettings();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'new_group', child: Text('New group')),
              const PopupMenuItem(
                value: 'new_broadcast',
                child: Text('New broadcast'),
              ),
              const PopupMenuItem(
                value: 'linked_devices',
                child: Text('Linked devices'),
              ),
              const PopupMenuItem(
                value: 'starred_messages',
                child: Text('Starred messages'),
              ),
              const PopupMenuItem(value: 'settings', child: Text('Settings')),
            ],
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          tabs: const [
            Tab(text: 'CHATS'),
            Tab(text: 'STATUS'),
            Tab(text: 'CALLS'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ChatListScreen(),
          StatusScreen(),
          Center(child: Text('Calls')), //Replace with CallsScreen
        ],
      ),
      floatingActionButton: ListenableBuilder(
        listenable: _tabController,
        builder: (context, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Secondary FAB for Status tab (text status)
              if (_tabController.index == 1)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: FloatingActionButton.small(
                    heroTag: 'edit_status',
                    onPressed: () {},
                    backgroundColor: Colors.white,
                    child: Icon(Icons.edit, color: Colors.grey[700]),
                  ),
                ),
              // Main FAB
              FloatingActionButton(
                heroTag: 'main_fab',
                onPressed: () {
                  if (_tabController.index == 0) {
                    // Navigate to select contact for new chat
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const SelectContactScreen(),
                      ),
                    );
                  }
                },
                backgroundColor: AppColors.secondary,
                child: Icon(
                  _tabController.index == 0
                      ? Icons.chat
                      : _tabController.index == 1
                      ? Icons.camera_alt
                      : Icons.add_call,
                  color: Colors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Placeholder for navigation
class SelectContactScreen extends StatelessWidget {
  const SelectContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select contact',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '256 contacts',
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          // New group option
          ListTile(
            leading: Container(
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.group, color: Colors.white),
            ),
            title: const Text(
              'New group',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          // New contact option
          ListTile(
            leading: Container(
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person_add, color: Colors.white),
            ),
            title: const Text(
              'New contact',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(Icons.qr_code, color: AppColors.primary),
          ),
          // New community option
          ListTile(
            leading: Container(
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.groups, color: Colors.white),
            ),
            title: const Text(
              'New community',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Contacts on What\'sDown',
              style: TextStyle(
                color: AppColors.lightTextSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // Mock contacts
          ..._mockContacts.map(
            (contact) => ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.primary.withOpacity(0.2),
                child: Text(
                  contact['name']![0],
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              title: Text(
                contact['name']!,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                contact['status']!,
                style: TextStyle(color: Colors.grey[600], fontSize: 13),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                context.pop();
                context.goToChatRoom(name: contact['name']!);
              },
            ),
          ),
        ],
      ),
    );
  }
}

const List<Map<String, String>> _mockContacts = [
  {'name': 'Ziad Abdalraaof', 'status': 'Hey there! I am using What\'sDown'},
  {'name': 'Bob Smith', 'status': 'Busy at work 💼'},
  {'name': 'Carol White', 'status': 'Available'},
  {'name': 'David Brown', 'status': 'At the gym 💪'},
  {'name': 'Eva Martinez', 'status': 'Can\'t talk, What\'sDown only'},
  {'name': 'Frank Wilson', 'status': 'On vacation 🏖️'},
  {'name': 'Grace Lee', 'status': 'In a meeting'},
  {'name': 'Henry Taylor', 'status': 'Sleeping 😴'},
  {'name': 'Ivy Chen', 'status': 'Happy and grateful ❤️'},
  {'name': 'Jack Anderson', 'status': 'Living my best life'},
];
