import 'package:dartz/dartz.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:chat_app/feature/chat/domain/entities/chat_entity.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<ChatEntity>>> getChats();
  Future<Either<Failure, ChatEntity>> getChatById(String chatId);
}
