// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      id: json['id'] as String?,
      email: json['email'] as String?,
      username: json['userName'] as String?,
      token: json['token'] as String?,
      profilePictureUrl: json['profilePictureUrl'] as String?,
      online: json['online'] as bool?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'userName': instance.username,
      'token': instance.token,
      'profilePictureUrl': instance.profilePictureUrl,
      'online': instance.online,
      'role': instance.role,
    };
