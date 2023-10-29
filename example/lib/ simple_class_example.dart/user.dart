import 'package:vexana/vexana.dart';
import 'package:vexana_gen/vexana_gen.dart';
part 'user.g.dart';

@Vexana()
class User with _$UserSerialized {
  @override
  @VexanaKey()
  final String? username;
  @override
  final String? accessToken;
  @override
  final String? refreshToken;

  User({
    this.username,
    this.accessToken,
    this.refreshToken,
  });
}
