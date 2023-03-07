import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';
import 'package:artisanmill_group5capstoneproject/data/models/user/user.dart';

class ChatUsers {
  final ArtisanDto? artisan;
  final UserDto? user;

  ChatUsers({
    required this.artisan,
    required this.user,
  });
}
