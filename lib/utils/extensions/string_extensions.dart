import 'package:flutter_bloc_firebase_starter/utils/constants/app_constant.dart';

extension NullabeStringExtension on String? {
  bool get isNullOrEmpty => (this == null || this!.isEmpty);

  String get defaultValueOnNull => isNullOrEmpty ? AppConstant.nullData : this!;
}

extension StringExtensions on String {
  String get capitalize {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String get limitToFirst20Letters {
    return length > 20 ? substring(0, 20) : this;
  }

  String limitToFirstXLetters(int length) {
    return this.length > length ? substring(0, length) : this;
  }

  bool hasMoreContent(int length) {
    return this.length > (length);
  }
}

extension NullabeStringListExtension on List<String>? {
  bool get isNullOrEmpty => (this == null || this!.isEmpty);
}
