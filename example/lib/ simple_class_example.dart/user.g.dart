// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// VexanaSerializableGenerator
// **************************************************************************

mixin _$UserSerialized implements INetworkModel<User> {
  String? get username;
  String? get accessToken;
  String? get refreshToken;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'username': username,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  @override
  User fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
