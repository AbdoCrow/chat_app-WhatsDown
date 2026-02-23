import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chat_app/feature/chat/presentation/widgets/chat_tile.dart';
import 'package:chat_app/feature/chat/presentation/screens/chat_room_screen.dart';
import 'package:chat_app/feature/chat/presentation/chat_controller.dart';

class ChatListScreen extends ConsumerWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatState = ref.watch(chatControllerProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchBar(ref: ref, query: chatState.query),
        ),
        Expanded(
          child: Builder(
            builder: (context) {
              if (chatState.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (chatState.error != null) {
                return Center(child: Text('Error: ${chatState.error}'));
              }

              final chats = chatState.filteredChats;
              if (chats.isEmpty) {
                return const Center(child: Text('No chats found'));
              }

              return ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return ChatTile(
                    name: chat.name,
                    lastMessage: chat.lastMessage,
                    time: chat.time,
                    unreadCount: chat.unreadCount,
                    imageUrl: chat.imageUrl,
                    isOnline: chat.isOnline,
                    isTyping: chat.isTyping,
                    isMuted: chat.isMuted,
                    isPinned: chat.isPinned,
                    messageStatus: chat.messageStatus,
                    isGroup: chat.isGroup,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ChatRoomScreen(
                            name: chat.name,
                            imageUrl: chat.imageUrl,
                            isGroup: chat.isGroup,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class SearchBar extends ConsumerStatefulWidget {
  final WidgetRef ref;
  final String query;

  const SearchBar({required this.ref, required this.query, super.key});

  @override
  ConsumerState<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<SearchBar> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.query);
  }

  @override
  void didUpdateWidget(SearchBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.query != oldWidget.query && widget.query.isEmpty) {
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Search chats...',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: widget.query.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                    ref.read(chatControllerProvider.notifier).clearQuery();
                  },
                )
              : null,
        ),
        onChanged: (value) {
          ref.read(chatControllerProvider.notifier).setQuery(value);
        },
      ),
    );
  }
}
