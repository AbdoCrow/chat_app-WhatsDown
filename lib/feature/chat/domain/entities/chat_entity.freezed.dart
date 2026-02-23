// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ChatEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get lastMessage => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;
  bool get isTyping => throw _privateConstructorUsedError;
  bool get isMuted => throw _privateConstructorUsedError;
  bool get isPinned => throw _privateConstructorUsedError;
  bool get isGroup => throw _privateConstructorUsedError;
  int get unreadCount => throw _privateConstructorUsedError;
  String? get messageStatus => throw _privateConstructorUsedError;

  /// Create a copy of ChatEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatEntityCopyWith<ChatEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEntityCopyWith<$Res> {
  factory $ChatEntityCopyWith(
    ChatEntity value,
    $Res Function(ChatEntity) then,
  ) = _$ChatEntityCopyWithImpl<$Res, ChatEntity>;
  @useResult
  $Res call({
    String id,
    String name,
    String lastMessage,
    String time,
    String? imageUrl,
    bool isOnline,
    bool isTyping,
    bool isMuted,
    bool isPinned,
    bool isGroup,
    int unreadCount,
    String? messageStatus,
  });
}

/// @nodoc
class _$ChatEntityCopyWithImpl<$Res, $Val extends ChatEntity>
    implements $ChatEntityCopyWith<$Res> {
  _$ChatEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lastMessage = null,
    Object? time = null,
    Object? imageUrl = freezed,
    Object? isOnline = null,
    Object? isTyping = null,
    Object? isMuted = null,
    Object? isPinned = null,
    Object? isGroup = null,
    Object? unreadCount = null,
    Object? messageStatus = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            lastMessage: null == lastMessage
                ? _value.lastMessage
                : lastMessage // ignore: cast_nullable_to_non_nullable
                      as String,
            time: null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            isOnline: null == isOnline
                ? _value.isOnline
                : isOnline // ignore: cast_nullable_to_non_nullable
                      as bool,
            isTyping: null == isTyping
                ? _value.isTyping
                : isTyping // ignore: cast_nullable_to_non_nullable
                      as bool,
            isMuted: null == isMuted
                ? _value.isMuted
                : isMuted // ignore: cast_nullable_to_non_nullable
                      as bool,
            isPinned: null == isPinned
                ? _value.isPinned
                : isPinned // ignore: cast_nullable_to_non_nullable
                      as bool,
            isGroup: null == isGroup
                ? _value.isGroup
                : isGroup // ignore: cast_nullable_to_non_nullable
                      as bool,
            unreadCount: null == unreadCount
                ? _value.unreadCount
                : unreadCount // ignore: cast_nullable_to_non_nullable
                      as int,
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
abstract class _$$ChatEntityImplCopyWith<$Res>
    implements $ChatEntityCopyWith<$Res> {
  factory _$$ChatEntityImplCopyWith(
    _$ChatEntityImpl value,
    $Res Function(_$ChatEntityImpl) then,
  ) = __$$ChatEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String lastMessage,
    String time,
    String? imageUrl,
    bool isOnline,
    bool isTyping,
    bool isMuted,
    bool isPinned,
    bool isGroup,
    int unreadCount,
    String? messageStatus,
  });
}

/// @nodoc
class __$$ChatEntityImplCopyWithImpl<$Res>
    extends _$ChatEntityCopyWithImpl<$Res, _$ChatEntityImpl>
    implements _$$ChatEntityImplCopyWith<$Res> {
  __$$ChatEntityImplCopyWithImpl(
    _$ChatEntityImpl _value,
    $Res Function(_$ChatEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lastMessage = null,
    Object? time = null,
    Object? imageUrl = freezed,
    Object? isOnline = null,
    Object? isTyping = null,
    Object? isMuted = null,
    Object? isPinned = null,
    Object? isGroup = null,
    Object? unreadCount = null,
    Object? messageStatus = freezed,
  }) {
    return _then(
      _$ChatEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        lastMessage: null == lastMessage
            ? _value.lastMessage
            : lastMessage // ignore: cast_nullable_to_non_nullable
                  as String,
        time: null == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        isOnline: null == isOnline
            ? _value.isOnline
            : isOnline // ignore: cast_nullable_to_non_nullable
                  as bool,
        isTyping: null == isTyping
            ? _value.isTyping
            : isTyping // ignore: cast_nullable_to_non_nullable
                  as bool,
        isMuted: null == isMuted
            ? _value.isMuted
            : isMuted // ignore: cast_nullable_to_non_nullable
                  as bool,
        isPinned: null == isPinned
            ? _value.isPinned
            : isPinned // ignore: cast_nullable_to_non_nullable
                  as bool,
        isGroup: null == isGroup
            ? _value.isGroup
            : isGroup // ignore: cast_nullable_to_non_nullable
                  as bool,
        unreadCount: null == unreadCount
            ? _value.unreadCount
            : unreadCount // ignore: cast_nullable_to_non_nullable
                  as int,
        messageStatus: freezed == messageStatus
            ? _value.messageStatus
            : messageStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ChatEntityImpl implements _ChatEntity {
  const _$ChatEntityImpl({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    this.imageUrl,
    required this.isOnline,
    required this.isTyping,
    required this.isMuted,
    required this.isPinned,
    required this.isGroup,
    required this.unreadCount,
    this.messageStatus,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final String lastMessage;
  @override
  final String time;
  @override
  final String? imageUrl;
  @override
  final bool isOnline;
  @override
  final bool isTyping;
  @override
  final bool isMuted;
  @override
  final bool isPinned;
  @override
  final bool isGroup;
  @override
  final int unreadCount;
  @override
  final String? messageStatus;

  @override
  String toString() {
    return 'ChatEntity(id: $id, name: $name, lastMessage: $lastMessage, time: $time, imageUrl: $imageUrl, isOnline: $isOnline, isTyping: $isTyping, isMuted: $isMuted, isPinned: $isPinned, isGroup: $isGroup, unreadCount: $unreadCount, messageStatus: $messageStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatEntityImpl &&
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

  /// Create a copy of ChatEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatEntityImplCopyWith<_$ChatEntityImpl> get copyWith =>
      __$$ChatEntityImplCopyWithImpl<_$ChatEntityImpl>(this, _$identity);
}

abstract class _ChatEntity implements ChatEntity {
  const factory _ChatEntity({
    required final String id,
    required final String name,
    required final String lastMessage,
    required final String time,
    final String? imageUrl,
    required final bool isOnline,
    required final bool isTyping,
    required final bool isMuted,
    required final bool isPinned,
    required final bool isGroup,
    required final int unreadCount,
    final String? messageStatus,
  }) = _$ChatEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get lastMessage;
  @override
  String get time;
  @override
  String? get imageUrl;
  @override
  bool get isOnline;
  @override
  bool get isTyping;
  @override
  bool get isMuted;
  @override
  bool get isPinned;
  @override
  bool get isGroup;
  @override
  int get unreadCount;
  @override
  String? get messageStatus;

  /// Create a copy of ChatEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatEntityImplCopyWith<_$ChatEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
