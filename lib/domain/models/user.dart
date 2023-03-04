import 'package:artisanmill_group5capstoneproject/data/models/user/user.dart';

class User {
  final String? id;
  final String? email;
  final String? phoneNumber;
  final String? name;
  final String? city;
  final String? state;
  final String? streetAddress;
  final String? imageUrl;

  User({
    this.id,
    this.email,
    this.phoneNumber,
    this.name,
    this.city,
    this.state,
    this.streetAddress,
    this.imageUrl,
  });
}
