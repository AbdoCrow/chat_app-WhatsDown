import 'package:chat_app/feature/chat/domain/datasources/chat_remote_datasource.dart';
import 'package:chat_app/feature/chat/domain/models/chat_dto.dart';

class ChatRemoteDataSourceMock implements ChatRemoteDataSource {
  static const List<Map<String, dynamic>> _mockChatsData = [
    {
      'id': '1',
      'name': 'Ziad Abdalraaof',
      'last_message': 'مبحبش الكلام ده يعم',
      'time': '11:14 PM',
      'image_url': null,
      'isOnline': true,
      'isTyping': false,
      'isMuted': false,
      'isPinned': false,
      'is_group': false,
      'unread_count': 2,
      'message_status': null,
    },
    {
      'id': '2',
      'name': 'Karim Tarek',
      'last_message': 'الريال الافضل في التاريخ',
      'time': '10:45 PM',
      'image_url': null,
      'isOnline': false,
      'isTyping': false,
      'isMuted': false,
      'isPinned': false,
      'is_group': false,
      'unread_count': 1,
      'message_status': 'sent',
    },
    {
      'id': '3',
      'name': 'abdo json',
      'last_message': 'انا الجيسون الاساس اللي فلاتر قايم عليه',
      'time': '9:30 PM',
      'image_url': null,
      'isOnline': true,
      'isTyping': true,
      'isMuted': false,
      'isPinned': false,
      'is_group': false,
      'unread_count': 0,
      'message_status': null,
    },
    {
      'id': '4',
      'name': 'Ahmed salah',
      'last_message': 'اه ياني',
      'time': '8:15 PM',
      'image_url': null,
      'isOnline': true,
      'isTyping': false,
      'isMuted': false,
      'isPinned': true,
      'is_group': true,
      'unread_count': 5,
      'message_status': null,
    },
    {
      'id': '5',
      'name': 'Youssef nasser',
      'last_message': 'تم تعبئة الكرش بنجاح',
      'time': '7:20 PM',
      'image_url': null,
      'isOnline': false,
      'isTyping': false,
      'isMuted': true,
      'isPinned': false,
      'is_group': false,
      'unread_count': 0,
      'message_status': 'delivered',
    },
    {
      'id': '6',
      'name': 'يوسف وائل',
      'last_message': 'اللي هيتأخر علي المينج هينقص',
      'time': '6:00 PM',
      'image_url': null,
      'isOnline': true,
      'isTyping': false,
      'isMuted': false,
      'isPinned': false,
      'is_group': true,
      'unread_count': 3,
      'message_status': null,
    },
    {
      'id': '7',
      'name': 'jil jil',
      'last_message': 'انا باحب عم عصام',
      'time': '5:45 PM',
      'image_url': null,
      'isOnline': true,
      'isTyping': false,
      'isMuted': false,
      'isPinned': false,
      'is_group': false,
      'unread_count': 0,
      'message_status': 'read',
    },
  ];

  @override
  Future<List<ChatDto>> getChats() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockChatsData.map((data) => ChatDto.fromJson(data)).toList();
  }

  @override
  Future<ChatDto> getChatById(String chatId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final data = _mockChatsData.firstWhere(
      (chat) => chat['id'] == chatId,
      orElse: () => _mockChatsData[0],
    );
    return ChatDto.fromJson(data);
  }
}
