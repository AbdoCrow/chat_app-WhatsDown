import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:chat_app/feature/chat/domain/entities/chat_entity.dart';

part 'chat_dto.freezed.dart';
part 'chat_dto.g.dart';

@freezed
class ChatDto with _$ChatDto {
  const ChatDto._();

  const factory ChatDto({
    String? id,
    String? name,
    @JsonKey(name: 'last_message')
    String? lastMessage,
    String? time,
    @JsonKey(name: 'image_url')
    String? imageUrl,
    bool? isOnline,
    bool? isTyping,
    bool? isMuted,
    bool? isPinned,
    @JsonKey(name: 'is_group')
    bool? isGroup,
    @JsonKey(name: 'unread_count')
    int? unreadCount,
    @JsonKey(name: 'message_status')
    String? messageStatus,
  }) = _ChatDto;

  factory ChatDto.fromJson(Map<String, dynamic> json) =>
      _$ChatDtoFromJson(json);

  ChatEntity toEntity() {
    return ChatEntity(
      id: id ?? '',
      name: name ?? '',
      lastMessage: lastMessage ?? '',
      time: time ?? '',
      imageUrl: imageUrl,
      isOnline: isOnline ?? false,
      isTyping: isTyping ?? false,
      isMuted: isMuted ?? false,
      isPinned: isPinned ?? false,
      isGroup: isGroup ?? false,
      unreadCount: unreadCount ?? 0,
      messageStatus: messageStatus,
    );
  }
}
