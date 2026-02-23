import 'package:chat_app/feature/chat/domain/models/chat_dto.dart';

abstract class ChatRemoteDataSource {
  Future<List<ChatDto>> getChats();
  Future<ChatDto> getChatById(String chatId);
}
