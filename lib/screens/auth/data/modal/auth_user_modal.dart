import 'package:flutter_bloc_firebase_starter/screens/auth/domain/entity/auth_user_entity.dart';

class AuthUserModal extends AuthUserEntity {
  const AuthUserModal({
    required super.id,
    super.userName,
    super.email,
    super.phoneNumber,
    super.userAvatar,
    super.createdAt,
    super.lastSignIn,
  });

  @override
  AuthUserModal copyWith({
    String? id,
    String? userName,
    String? email,
    String? phoneNumber,
    String? userAvatar,
    DateTime? createdAt,
    DateTime? lastSignIn,
  }) {
    return AuthUserModal(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userAvatar: userAvatar ?? this.userAvatar,
      createdAt: createdAt ?? this.createdAt,
      lastSignIn: lastSignIn ?? this.lastSignIn,
    );
  }

  factory AuthUserModal.fromJson(Map<String, dynamic> json) => AuthUserModal(
        id: json['id'],
        userName: json['user_name'],
        email: json['email'],
        phoneNumber: json['phone_number'],
        userAvatar: json['user_avatar'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']).toLocal(),
        lastSignIn: json['last_signin'] == null
            ? null
            : DateTime.parse(json['last_signin']).toLocal(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_name': userName,
        'email': email,
        'phone_number': phoneNumber,
        'user_avatar': userAvatar,
        'created_at': createdAt?.toIso8601String(),
        'last_signin': lastSignIn?.toIso8601String(),
      };
}
