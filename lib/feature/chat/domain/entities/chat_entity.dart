import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_entity.freezed.dart';

@freezed
class ChatEntity with _$ChatEntity {
  const factory ChatEntity({
    required String id,
    required String name,
    required String lastMessage,
    required String time,
    String? imageUrl,
    required bool isOnline,
    required bool isTyping,
    required bool isMuted,
    required bool isPinned,
    required bool isGroup,
    required int unreadCount,
    String? messageStatus,
  }) = _ChatEntity;
}
