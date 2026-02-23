// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatDtoImpl _$$ChatDtoImplFromJson(Map<String, dynamic> json) =>
    _$ChatDtoImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      lastMessage: json['last_message'] as String?,
      time: json['time'] as String?,
      imageUrl: json['image_url'] as String?,
      isOnline: json['isOnline'] as bool?,
      isTyping: json['isTyping'] as bool?,
      isMuted: json['isMuted'] as bool?,
      isPinned: json['isPinned'] as bool?,
      isGroup: json['is_group'] as bool?,
      unreadCount: (json['unread_count'] as num?)?.toInt(),
      messageStatus: json['message_status'] as String?,
    );

Map<String, dynamic> _$$ChatDtoImplToJson(_$ChatDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'last_message': instance.lastMessage,
      'time': instance.time,
      'image_url': instance.imageUrl,
      'isOnline': instance.isOnline,
      'isTyping': instance.isTyping,
      'isMuted': instance.isMuted,
      'isPinned': instance.isPinned,
      'is_group': instance.isGroup,
      'unread_count': instance.unreadCount,
      'message_status': instance.messageStatus,
    };
