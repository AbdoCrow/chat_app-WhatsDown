import 'package:flutter/material.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/widgets/whatsdown_app_bar.dart';
import 'package:chat_app/feature/chat/presentation/widgets/message_bubble.dart';
import 'package:chat_app/feature/chat/presentation/widgets/message_input_bar.dart';
import 'package:chat_app/feature/chat/presentation/widgets/date_chip.dart';

class ChatRoomScreen extends StatefulWidget {
  final String name;
  final String? imageUrl;
  final bool isGroup;

  const ChatRoomScreen({
    super.key,
    required this.name,
    this.imageUrl,
    this.isGroup = false,
  });

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [..._mockMessages];

  @override
  void dispose() {
    _scrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'text': text,
        'time': _getCurrentTime(),
        'isMe': true,
        'status': 'sent',
        'date': 'TODAY',
      });
    });

    _messageController.clear();

    // Scroll to bottom
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    final hour = now.hour > 12 ? now.hour - 12 : now.hour;
    final period = now.hour >= 12 ? 'PM' : 'AM';
    return '${hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')} $period';
  }

  void _showAttachmentOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _AttachmentOption(
                    icon: Icons.insert_drive_file,
                    label: 'Document',
                    color: Colors.indigo,
                    onTap: () => Navigator.pop(context),
                  ),
                  _AttachmentOption(
                    icon: Icons.camera_alt,
                    label: 'Camera',
                    color: Colors.pink,
                    onTap: () => Navigator.pop(context),
                  ),
                  _AttachmentOption(
                    icon: Icons.photo,
                    label: 'Gallery',
                    color: Colors.purple,
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _AttachmentOption(
                    icon: Icons.headphones,
                    label: 'Audio',
                    color: Colors.orange,
                    onTap: () => Navigator.pop(context),
                  ),
                  _AttachmentOption(
                    icon: Icons.location_on,
                    label: 'Location',
                    color: Colors.green,
                    onTap: () => Navigator.pop(context),
                  ),
                  _AttachmentOption(
                    icon: Icons.person,
                    label: 'Contact',
                    color: Colors.blue,
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _AttachmentOption(
                    icon: Icons.poll,
                    label: 'Poll',
                    color: AppColors.secondary,
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 70), // Spacer
                  const SizedBox(width: 70), // Spacer
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatRoomAppBar(
        name: widget.name,
        subtitle: widget.isGroup ? '8 participants' : 'online',
        imageUrl: widget.imageUrl,
        isOnline: !widget.isGroup,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/chat_bg.png'),
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
          color: AppColors.lightChatBackground,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  final showDateChip =
                      index == 0 ||
                      _messages[index - 1]['date'] != message['date'];

                  return Column(
                    children: [
                      if (showDateChip) DateChip(date: message['date']),
                      MessageBubble(
                        message: message['text'],
                        time: message['time'],
                        isMe: message['isMe'],
                        status: message['status'],
                        isFirstInGroup:
                            index == 0 ||
                            _messages[index - 1]['isMe'] != message['isMe'],
                        senderName: widget.isGroup && !message['isMe']
                            ? message['sender']
                            : null,
                        senderColor: widget.isGroup && !message['isMe']
                            ? _getSenderColor(message['sender'] ?? '')
                            : null,
                        replyTo: message['replyTo'],
                        isForwarded: message['isForwarded'] ?? false,
                      ),
                    ],
                  );
                },
              ),
            ),
            MessageInputBar(
              controller: _messageController,
              onSend: _sendMessage,
              onAttachmentPressed: _showAttachmentOptions,
            ),
          ],
        ),
      ),
    );
  }

  Color _getSenderColor(String name) {
    final colors = [
      Colors.purple,
      Colors.teal,
      Colors.orange,
      Colors.blue,
      Colors.pink,
      Colors.green,
    ];
    return colors[name.length % colors.length];
  }
}

class _AttachmentOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _AttachmentOption({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Icon(icon, color: Colors.white, size: 26),
          ),
          const SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
        ],
      ),
    );
  }
}

// Mock messages data
const List<Map<String, dynamic>> _mockMessages = [
  {
    'text': 'ربنا يستر',
    'time': '11:11 PM',
    'isMe': false,
    'status': null,
    'date': 'TODAY',
    'sender': 'Ziad Abdalraaof',
  },
  {
    'text': 'انا مش فاكر حاجة من فلاتر',
    'time': '11:11 PM',
    'isMe': false,
    'status': null,
    'date': 'TODAY',
    'sender': 'Ziad Abdalraaof',
  },
  {
    'text': 'غير row',
    'time': '11:11 PM',
    'isMe': false,
    'status': null,
    'date': 'TODAY',
    'sender': 'Ziad Abdalraaof',
  },
  {
    'text': 'Column',
    'time': '11:11 PM',
    'isMe': false,
    'status': null,
    'date': 'TODAY',
    'sender': 'Ziad Abdalraaof',
  },
  {
    'text': 'و منحطش row جوه row',
    'time': '11:11 PM',
    'isMe': false,
    'status': null,
    'date': 'TODAY',
    'sender': 'Ziad Abdalraaof',
  },
  {
    'text': 'يسلام عليك',
    'time': '11:14 PM',
    'isMe': true,
    'status': 'read',
    'date': 'TODAY',
  },
  {
    'text': 'راجع علي\nRiver_pod\nGo_router\nيا ملك',
    'time': '11:14 PM',
    'isMe': true,
    'status': 'read',
    'date': 'TODAY',
  },
  {
    'text': 'اوف riverpod',
    'time': '11:14 PM',
    'isMe': false,
    'status': null,
    'date': 'TODAY',
    'sender': 'Ziad Abdalraaof',
  },
  {
    'text': 'مبحبش الكلام ده يعم',
    'time': '11:14 PM',
    'isMe': false,
    'status': null,
    'date': 'TODAY',
    'sender': 'Ziad Abdalraaof',
  },
];
