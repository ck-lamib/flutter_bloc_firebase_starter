import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firebase_starter/utils/constants/strings.dart';
import 'package:flutter_bloc_firebase_starter/utils/routes/asset_routes.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc_firebase_starter/common/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter_bloc_firebase_starter/common/widgets/textfield/custom_outline_password_textfield.dart';
import 'package:flutter_bloc_firebase_starter/common/widgets/textfield/custom_outline_textfield.dart';
import 'package:flutter_bloc_firebase_starter/common/widgets/form_wrapper.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/features/login/bloc/login_bloc.dart';
import 'package:flutter_bloc_firebase_starter/utils/constants/app_constant.dart';
import 'package:flutter_bloc_firebase_starter/utils/extensions/build_context_extensions.dart';
import 'package:flutter_bloc_firebase_starter/utils/helpers/enums.dart';
import 'package:flutter_bloc_firebase_starter/utils/helpers/snackbars.dart';
import 'package:flutter_bloc_firebase_starter/utils/helpers/validators.dart';
import 'package:flutter_bloc_firebase_starter/utils/routes/routes.dart';
import 'package:flutter_bloc_firebase_starter/utils/themes/spacing.dart';

class LoginForm extends HookWidget {
  LoginForm({
    super.key,
  });
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.progressStatus == ProgressStatus.failure) {
          CustomSnackbar.showToastMessage(
            message: state.error ?? Strings.logInFailedMessage,
          );
        } else if (state.progressStatus == ProgressStatus.success) {
          CustomSnackbar.showToastMessage(
            message: Strings.logInSuccessMessage,
          );
          return;
        } else if (state.gmailProgressStatus == ProgressStatus.failure) {
          CustomSnackbar.showToastMessage(
            message: state.error ?? Strings.logInFailedMessage,
          );
        } else if (state.gmailProgressStatus == ProgressStatus.success) {
          CustomSnackbar.showToastMessage(
            message: Strings.logInSuccessMessage,
          );
          return;
        }
      },
      child: AutofillGroup(
        onDisposeAction: AutofillContextAction.commit,
        child: FormWrapper(
          formKey: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    AppConstant.appName,
                    style: context.textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxlg),
                RichText(
                  text: TextSpan(
                    text: "Sign",
                    children: [
                      TextSpan(
                        text: " In",
                        style: context.textTheme.headlineLarge?.copyWith(
                          color: context.theme.colorScheme.primary,
                        ),
                      )
                    ],
                    style: context.textTheme.headlineLarge,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  "Welcome Back! Please use your existing Firebase Starter app credential to logged into the system.",
                  style: context.textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.xxlg),
                CustomOutlinedTextField(
                  labelText: Strings.emailLabelText,
                  hint: Strings.emailLabelText,
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                  ),
                  textCapitalization: TextCapitalization.none,
                  autofillHints: const [AutofillHints.email],
                  validator: Validators.checkEmailField,
                ),
                const SizedBox(height: AppSpacing.md),
                CustomOutlinedPasswordTextField(
                  labelText: Strings.passwordLabelText,
                  hint: Strings.passwordHintText,
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  autofillHints: const [AutofillHints.password],
                  validator: Validators.checkPasswordField,
                ),
                const SizedBox(
                  height: AppSpacing.sm,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // context.goNamed(Routes.forgetPassword.name);
                    },
                    child: const Text(
                      "Forget Password?",
                    ),
                  ),
                ),
                gapH16,
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state.progressStatus == ProgressStatus.loading
                          ? () {}
                          : () {
                              if (formKey.currentState!.validate()) {
                                TextInput.finishAutofillContext();
                                context.closeKeyboard();
                                context.read<LoginBloc>().add(
                                      LoginWithEmailPasswordSubmitted(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(
                          50,
                        ),
                      ),
                      child: state.progressStatus == ProgressStatus.loading
                          ? const CenteredCircularProgressIndicator()
                          : const Text("Login"),
                    );
                  },
                ),
                gapH16,
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Or",
                    textAlign: TextAlign.center,
                    style: context.textTheme.labelMedium,
                  ),
                ),
                gapH16,
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed:
                          state.gmailProgressStatus == ProgressStatus.loading
                              ? () {}
                              : () {
                                  context.read<LoginBloc>().add(
                                        LoginWithGoogleSubmitted(),
                                      );
                                },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(
                          50,
                        ),
                      ),
                      child: state.gmailProgressStatus == ProgressStatus.loading
                          ? const CenteredCircularProgressIndicator()
                          : Row(
                              spacing: AppSpacing.sm,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AssetRoutes.socialRouteGoogleImage,
                                  height: 20,
                                  width: 20,
                                ),
                                Text(
                                  "Continue with Google",
                                ),
                              ],
                            ),
                    );
                  },
                ),
                gapH16,
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      children: [
                        TextSpan(
                          text: " Create one",
                          style: context.textTheme.labelMedium?.copyWith(
                            color: context.theme.colorScheme.primary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.goNamed(Routes.signup.name);
                            },
                        )
                      ],
                      style: context.textTheme.labelMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
