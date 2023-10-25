// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// VexanaSerializableGenerator
// **************************************************************************

mixin _$UserSerialized implements INetworkModel<User> {
  String? get username;
  String? get accessToken;
  String? get refreshToken;

  @override
  User fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'] as String?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'username': username,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}
