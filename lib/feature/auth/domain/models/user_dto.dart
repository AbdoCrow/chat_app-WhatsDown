//here I will parse the data from raw json to DTO
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:chat_app/feature/auth/domain/entities/user_entity.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const UserDto._(); // private constructor
  //I will use freezed to make the dto logic with my constraint
  //using build runner

  const factory UserDto({
    String? id,
    String? email,
    @JsonKey(name: 'userName')
    String? username, // Server returns 'userName', map to username
    String? token, //this will be used for authentication in future requests
    String? profilePictureUrl,
    bool? online,
    String? role,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  UserEntity toEntity() {
    return UserEntity(
      id: id ?? '',
      email: email ?? '',
      username: username ?? '',
    );
  }
}
