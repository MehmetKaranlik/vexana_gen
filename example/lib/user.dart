import 'package:vexana_gen/vexana_gen.dart';
part 'user.g.dart';

@Vexana()
class User with _$UserSerialized {
  @VexanaKey()
  final String? username;
  final String? accessToken;
  final String? refreshToken;

  User({
    this.username,
    this.accessToken,
    this.refreshToken,
  });
}
