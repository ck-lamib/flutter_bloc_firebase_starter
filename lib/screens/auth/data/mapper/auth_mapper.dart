import 'package:flutter_bloc_firebase_starter/screens/auth/data/modal/auth_user_modal.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/entity/auth_user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

extension AuthMapper on firebase_auth.User {
  AuthUserEntity toUserEntity() {
    return AuthUserEntity(
      id: uid,
      userName: displayName,
      email: email,
      phoneNumber: phoneNumber,
      userAvatar: photoURL,
      createdAt: metadata.creationTime,
      lastSignIn: metadata.lastSignInTime,
    );
  }
}

class AuthUserMapper {
  /// Convert `AuthUserModal` to `AuthUserEntity`
  static AuthUserEntity toEntity(AuthUserModal modal) {
    return AuthUserEntity(
      id: modal.id,
      userName: modal.userName,
      email: modal.email,
      phoneNumber: modal.phoneNumber,
      userAvatar: modal.userAvatar,
      createdAt: modal.createdAt,
      lastSignIn: modal.lastSignIn,
    );
  }

  /// Convert `AuthUserEntity` to `AuthUserModal`
  static AuthUserModal toModel(AuthUserEntity entity) {
    return AuthUserModal(
      id: entity.id,
      userName: entity.userName,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      userAvatar: entity.userAvatar,
      createdAt: entity.createdAt,
      lastSignIn: entity.lastSignIn,
    );
  }

  /// Convert JSON to `AuthUserModal`
  static AuthUserModal fromJson(Map<String, dynamic> json) {
    return AuthUserModal(
      id: json['id'],
      userName: json['user_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      userAvatar: json['user_avatar'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at']).toLocal(),
      lastSignIn: json['last_sigin'] == null
          ? null
          : DateTime.parse(json['last_sigin']).toLocal(),
    );
  }

  /// Convert `AuthUserModal` to JSON
  static Map<String, dynamic> toJson(AuthUserModal modal) {
    return {
      'id': modal.id,
      'user_name': modal.userName,
      'phone_number': modal.phoneNumber,
      'email': modal.email,
      'user_avatar': modal.userAvatar,
      'created_at': modal.createdAt?.toIso8601String(),
      'last_signin': modal.lastSignIn?.toIso8601String(),
    };
  }

  /// Convert JSON to [AuthUserEntity]
  static AuthUserEntity fromJsonToEntity(Map<String, dynamic> json) {
    return toEntity(AuthUserModal.fromJson(json));
  }

  /// Convert [AuthUserEntity] to JSON
  static Map<String, dynamic> toJsonFromEntity(AuthUserEntity entity) {
    return toModel(entity).toJson();
  }
}
