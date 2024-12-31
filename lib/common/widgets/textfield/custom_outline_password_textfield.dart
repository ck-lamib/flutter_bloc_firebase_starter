import 'package:flutter_bloc_firebase_starter/common/bloc/password_toggle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firebase_starter/utils/extensions/build_context_extensions.dart';
import 'package:flutter_bloc_firebase_starter/utils/themes/border_radius.dart';

class CustomOutlinedPasswordTextField extends StatelessWidget {
  final Function(String)? onValueChange;
  final FocusNode? focusNode;
  final String hint;
  final String? preIconPath;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType? textInputType;
  final Color? border;
  final Color? fillColor;
  final bool? readOnly;
  final bool? showError;
  final bool? autofocus;
  final String? labelText;
  final double borderRadius;
  final Function()? onTap;
  final Function(String)? onSubmitted;
  final int? maxCharacters;
  final TextCapitalization textCapitalization;
  final TextStyle? hintStyle;

  final VoidCallback? onEditing;
  // final EdgeInsets scrollPadding;
  final EdgeInsetsGeometry? contentPadding;
  final double? cursorHeight;
  final bool obscureText;
  final Iterable<String>? autofillHints;
  final int? maxLines;

  const CustomOutlinedPasswordTextField(
      {super.key,
      this.fillColor,
      required this.hint,
      this.preIconPath,
      this.onValueChange,
      this.controller,
      this.validator,
      required this.textInputAction,
      this.textInputType,
      this.border,
      this.readOnly = false,
      this.showError = true,
      this.textCapitalization = TextCapitalization.sentences,
      this.onTap,
      this.onSubmitted,
      this.autofocus = false,
      this.maxCharacters,
      this.focusNode,
      this.labelText,
      this.borderRadius = AppBorderRadius.medium,
      this.onEditing,
      this.hintStyle,
      this.contentPadding = const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      this.cursorHeight,
      this.obscureText = false,
      this.autofillHints,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordVisibilityCubit(),
      child: BlocBuilder<PasswordVisibilityCubit, PasswordVisibilityState>(
        builder: (context, state) {
          return TextFormField(
            focusNode: focusNode,
            maxLength: maxCharacters,
            autofocus: autofocus!,
            textCapitalization: textCapitalization,
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            onFieldSubmitted: onSubmitted,
            onTap: (onTap != null) ? onTap! : null,
            readOnly: (readOnly == null) ? false : readOnly!,
            keyboardType: textInputType,
            textInputAction: textInputAction,
            maxLines: maxLines,
            validator: (validator != null) ? validator : null,
            controller: (controller != null) ? controller : null,
            onEditingComplete: onEditing,
            cursorHeight: cursorHeight,
            autofillHints: autofillHints,
            onChanged: (text) {
              if (onValueChange != null) {
                onValueChange!(text);
              }
            },
            obscureText: !state.isPasswordVisible,
            obscuringCharacter: "*",
            decoration: InputDecoration(
              contentPadding: contentPadding,
              label: labelText != null
                  ? Text(
                      labelText ?? "",
                    )
                  : null,
              fillColor: fillColor,
              filled: false,
              prefixIcon: const Icon(
                Icons.password_outlined,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  state.isPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  context
                      .read<PasswordVisibilityCubit>()
                      .togglePasswordVisibility();
                },
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius),
                ),
                borderSide: BorderSide(
                  color: context.colorScheme.secondary,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius),
                ),
                borderSide: BorderSide(
                  color: context.colorScheme.onErrorContainer,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius),
                ),
                borderSide: BorderSide(
                  color: context.colorScheme.primaryFixedDim,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius),
                ),
                borderSide: BorderSide(
                  color: context.colorScheme.error,
                ),
              ),
              hintText: hint,
              hintStyle: hintStyle,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(),
          );
        },
      ),
    );
  }
}
