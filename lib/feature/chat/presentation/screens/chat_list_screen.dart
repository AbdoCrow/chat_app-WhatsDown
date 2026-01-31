import 'package:flutter/material.dart';
import 'package:chat_app/feature/chat/presentation/widgets/chat_tile.dart';
import 'package:chat_app/feature/chat/presentation/screens/chat_room_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _mockChats.length,
      itemBuilder: (context, index) {
        final chat = _mockChats[index];
        return ChatTile(
          name: chat['name']!,
          lastMessage: chat['lastMessage']!,
          time: chat['time']!,
          unreadCount: int.parse(chat['unreadCount']!),
          imageUrl: chat['imageUrl'],
          isOnline: chat['isOnline'] == 'true',
          isTyping: chat['isTyping'] == 'true',
          isMuted: chat['isMuted'] == 'true',
          isPinned: chat['isPinned'] == 'true',
          messageStatus: chat['messageStatus'],
          isGroup: chat['isGroup'] == 'true',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ChatRoomScreen(
                  name: chat['name']!,
                  imageUrl: chat['imageUrl'],
                  isGroup: chat['isGroup'] == 'true',
                ),
              ),
            );
          },
        );
      },
    );
  }
}

// Mock chat data
const List<Map<String, String?>> _mockChats = [
  {
    'name': 'Ziad Abdalraaof',
    'lastMessage': 'مبحبش الكلام ده يعم',
    'time': '11:14 PM',
    'unreadCount': '2',
    'imageUrl': null,
    'isOnline': 'true',
    'isTyping': 'false',
    'isMuted': 'false',
    'isPinned': 'false',
    'messageStatus': null,
    'isGroup': 'false',
  },
];
