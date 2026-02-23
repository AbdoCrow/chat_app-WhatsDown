// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatDto _$ChatDtoFromJson(Map<String, dynamic> json) {
  return _ChatDto.fromJson(json);
}

/// @nodoc
mixin _$ChatDto {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_message')
  String? get lastMessage => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  bool? get isOnline => throw _privateConstructorUsedError;
  bool? get isTyping => throw _privateConstructorUsedError;
  bool? get isMuted => throw _privateConstructorUsedError;
  bool? get isPinned => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_group')
  bool? get isGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'unread_count')
  int? get unreadCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'message_status')
  String? get messageStatus => throw _privateConstructorUsedError;

  /// Serializes this ChatDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatDtoCopyWith<ChatDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatDtoCopyWith<$Res> {
  factory $ChatDtoCopyWith(ChatDto value, $Res Function(ChatDto) then) =
      _$ChatDtoCopyWithImpl<$Res, ChatDto>;
  @useResult
  $Res call({
    String? id,
    String? name,
    @JsonKey(name: 'last_message') String? lastMessage,
    String? time,
    @JsonKey(name: 'image_url') String? imageUrl,
    bool? isOnline,
    bool? isTyping,
    bool? isMuted,
    bool? isPinned,
    @JsonKey(name: 'is_group') bool? isGroup,
    @JsonKey(name: 'unread_count') int? unreadCount,
    @JsonKey(name: 'message_status') String? messageStatus,
  });
}

/// @nodoc
class _$ChatDtoCopyWithImpl<$Res, $Val extends ChatDto>
    implements $ChatDtoCopyWith<$Res> {
  _$ChatDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lastMessage = freezed,
    Object? time = freezed,
    Object? imageUrl = freezed,
    Object? isOnline = freezed,
    Object? isTyping = freezed,
    Object? isMuted = freezed,
    Object? isPinned = freezed,
    Object? isGroup = freezed,
    Object? unreadCount = freezed,
    Object? messageStatus = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastMessage: freezed == lastMessage
                ? _value.lastMessage
                : lastMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            time: freezed == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            isOnline: freezed == isOnline
                ? _value.isOnline
                : isOnline // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isTyping: freezed == isTyping
                ? _value.isTyping
                : isTyping // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isMuted: freezed == isMuted
                ? _value.isMuted
                : isMuted // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isPinned: freezed == isPinned
                ? _value.isPinned
                : isPinned // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isGroup: freezed == isGroup
                ? _value.isGroup
                : isGroup // ignore: cast_nullable_to_non_nullable
                      as bool?,
            unreadCount: freezed == unreadCount
                ? _value.unreadCount
                : unreadCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            messageStatus: freezed == messageStatus
                ? _value.messageStatus
                : messageStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatDtoImplCopyWith<$Res> implements $ChatDtoCopyWith<$Res> {
  factory _$$ChatDtoImplCopyWith(
    _$ChatDtoImpl value,
    $Res Function(_$ChatDtoImpl) then,
  ) = __$$ChatDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? name,
    @JsonKey(name: 'last_message') String? lastMessage,
    String? time,
    @JsonKey(name: 'image_url') String? imageUrl,
    bool? isOnline,
    bool? isTyping,
    bool? isMuted,
    bool? isPinned,
    @JsonKey(name: 'is_group') bool? isGroup,
    @JsonKey(name: 'unread_count') int? unreadCount,
    @JsonKey(name: 'message_status') String? messageStatus,
  });
}

/// @nodoc
class __$$ChatDtoImplCopyWithImpl<$Res>
    extends _$ChatDtoCopyWithImpl<$Res, _$ChatDtoImpl>
    implements _$$ChatDtoImplCopyWith<$Res> {
  __$$ChatDtoImplCopyWithImpl(
    _$ChatDtoImpl _value,
    $Res Function(_$ChatDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lastMessage = freezed,
    Object? time = freezed,
    Object? imageUrl = freezed,
    Object? isOnline = freezed,
    Object? isTyping = freezed,
    Object? isMuted = freezed,
    Object? isPinned = freezed,
    Object? isGroup = freezed,
    Object? unreadCount = freezed,
    Object? messageStatus = freezed,
  }) {
    return _then(
      _$ChatDtoImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastMessage: freezed == lastMessage
            ? _value.lastMessage
            : lastMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        time: freezed == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        isOnline: freezed == isOnline
            ? _value.isOnline
            : isOnline // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isTyping: freezed == isTyping
            ? _value.isTyping
            : isTyping // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isMuted: freezed == isMuted
            ? _value.isMuted
            : isMuted // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isPinned: freezed == isPinned
            ? _value.isPinned
            : isPinned // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isGroup: freezed == isGroup
            ? _value.isGroup
            : isGroup // ignore: cast_nullable_to_non_nullable
                  as bool?,
        unreadCount: freezed == unreadCount
            ? _value.unreadCount
            : unreadCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        messageStatus: freezed == messageStatus
            ? _value.messageStatus
            : messageStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatDtoImpl extends _ChatDto {
  const _$ChatDtoImpl({
    this.id,
    this.name,
    @JsonKey(name: 'last_message') this.lastMessage,
    this.time,
    @JsonKey(name: 'image_url') this.imageUrl,
    this.isOnline,
    this.isTyping,
    this.isMuted,
    this.isPinned,
    @JsonKey(name: 'is_group') this.isGroup,
    @JsonKey(name: 'unread_count') this.unreadCount,
    @JsonKey(name: 'message_status') this.messageStatus,
  }) : super._();

  factory _$ChatDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatDtoImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'last_message')
  final String? lastMessage;
  @override
  final String? time;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  final bool? isOnline;
  @override
  final bool? isTyping;
  @override
  final bool? isMuted;
  @override
  final bool? isPinned;
  @override
  @JsonKey(name: 'is_group')
  final bool? isGroup;
  @override
  @JsonKey(name: 'unread_count')
  final int? unreadCount;
  @override
  @JsonKey(name: 'message_status')
  final String? messageStatus;

  @override
  String toString() {
    return 'ChatDto(id: $id, name: $name, lastMessage: $lastMessage, time: $time, imageUrl: $imageUrl, isOnline: $isOnline, isTyping: $isTyping, isMuted: $isMuted, isPinned: $isPinned, isGroup: $isGroup, unreadCount: $unreadCount, messageStatus: $messageStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.isTyping, isTyping) ||
                other.isTyping == isTyping) &&
            (identical(other.isMuted, isMuted) || other.isMuted == isMuted) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.isGroup, isGroup) || other.isGroup == isGroup) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.messageStatus, messageStatus) ||
                other.messageStatus == messageStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    lastMessage,
    time,
    imageUrl,
    isOnline,
    isTyping,
    isMuted,
    isPinned,
    isGroup,
    unreadCount,
    messageStatus,
  );

  /// Create a copy of ChatDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatDtoImplCopyWith<_$ChatDtoImpl> get copyWith =>
      __$$ChatDtoImplCopyWithImpl<_$ChatDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatDtoImplToJson(this);
  }
}

abstract class _ChatDto extends ChatDto {
  const factory _ChatDto({
    final String? id,
    final String? name,
    @JsonKey(name: 'last_message') final String? lastMessage,
    final String? time,
    @JsonKey(name: 'image_url') final String? imageUrl,
    final bool? isOnline,
    final bool? isTyping,
    final bool? isMuted,
    final bool? isPinned,
    @JsonKey(name: 'is_group') final bool? isGroup,
    @JsonKey(name: 'unread_count') final int? unreadCount,
    @JsonKey(name: 'message_status') final String? messageStatus,
  }) = _$ChatDtoImpl;
  const _ChatDto._() : super._();

  factory _ChatDto.fromJson(Map<String, dynamic> json) = _$ChatDtoImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'last_message')
  String? get lastMessage;
  @override
  String? get time;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  bool? get isOnline;
  @override
  bool? get isTyping;
  @override
  bool? get isMuted;
  @override
  bool? get isPinned;
  @override
  @JsonKey(name: 'is_group')
  bool? get isGroup;
  @override
  @JsonKey(name: 'unread_count')
  int? get unreadCount;
  @override
  @JsonKey(name: 'message_status')
  String? get messageStatus;

  /// Create a copy of ChatDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatDtoImplCopyWith<_$ChatDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
