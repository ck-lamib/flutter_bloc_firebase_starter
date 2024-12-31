import 'package:flutter/material.dart';
import 'package:flutter_bloc_firebase_starter/utils/extensions/build_context_extensions.dart';

//form wrapper class to reduce form code duplication
class FormWrapper extends StatelessWidget {
  const FormWrapper({
    super.key,
    required this.child,
    required this.formKey,
  });

  final Widget child;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.closeKeyboard(),
      child: Form(
        key: formKey,
        child: child,
      ),
    );
  }
}
