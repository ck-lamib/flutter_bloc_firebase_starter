import 'package:equatable/equatable.dart';

class AuthUserEntity extends Equatable {
  final String id;
  final String? userName;
  final String? email;
  final String? phoneNumber;
  final String? userAvatar;
  final DateTime? createdAt;
  final DateTime? lastSignIn;

  const AuthUserEntity({
    required this.id,
    this.userName,
    this.email,
    this.phoneNumber,
    this.userAvatar,
    this.createdAt,
    this.lastSignIn,
  });

  AuthUserEntity copyWith({
    String? id,
    String? userName,
    String? email,
    String? phoneNumber,
    String? userAvatar,
    DateTime? createdAt,
    DateTime? lastSignIn,
  }) {
    return AuthUserEntity(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userAvatar: userAvatar ?? this.userAvatar,
      createdAt: createdAt ?? this.createdAt,
      lastSignIn: lastSignIn ?? this.lastSignIn,
    );
  }

  @override
  List<Object?> get props =>
      [id, userName, email, phoneNumber, userAvatar, createdAt, lastSignIn];
}
