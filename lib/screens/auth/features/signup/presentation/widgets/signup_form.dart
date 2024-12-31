import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firebase_starter/utils/constants/strings.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc_firebase_starter/common/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter_bloc_firebase_starter/common/widgets/textfield/custom_outline_password_textfield.dart';
import 'package:flutter_bloc_firebase_starter/common/widgets/textfield/custom_outline_textfield.dart';
import 'package:flutter_bloc_firebase_starter/common/widgets/form_wrapper.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/entity/auth_user_entity.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/features/signup/cubit/signup_cubit.dart';
import 'package:flutter_bloc_firebase_starter/utils/constants/app_constant.dart';
import 'package:flutter_bloc_firebase_starter/utils/constants/urls.dart';
import 'package:flutter_bloc_firebase_starter/utils/extensions/build_context_extensions.dart';
import 'package:flutter_bloc_firebase_starter/utils/helpers/enums.dart';
import 'package:flutter_bloc_firebase_starter/utils/helpers/snackbars.dart';
import 'package:flutter_bloc_firebase_starter/utils/helpers/url_helper.dart';
import 'package:flutter_bloc_firebase_starter/utils/helpers/validators.dart';
import 'package:flutter_bloc_firebase_starter/utils/routes/routes.dart';
import 'package:flutter_bloc_firebase_starter/utils/themes/spacing.dart';

class SignupForm extends HookWidget {
  SignupForm({
    super.key,
  });
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = useTextEditingController();
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController phoneController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();
    final TextEditingController confirmPasswordController =
        useTextEditingController();

    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.progressStatus == ProgressStatus.failure) {
          CustomSnackbar.showToastMessage(
            message: state.error ?? Strings.signInFailedMessage,
          );
        } else if (state.progressStatus == ProgressStatus.success) {
          Future.delayed(const Duration(milliseconds: 200), () {
            CustomSnackbar.showToastMessage(
              message: Strings.signInSuccessMessage,
            );
          });

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
                gapH40,
                RichText(
                  text: TextSpan(
                    text: "Create Your",
                    children: [
                      TextSpan(
                        text: " Profile",
                        style: context.textTheme.headlineLarge?.copyWith(
                          color: context.theme.colorScheme.primary,
                        ),
                      )
                    ],
                    style: context.textTheme.headlineLarge,
                  ),
                ),
                gapH12,
                Text(
                  "Hey 👋 !!! Please create account for Firebase Starter app to get started.",
                  style: context.textTheme.bodyMedium,
                ),
                gapH40,
                CustomOutlinedTextField(
                  labelText: Strings.userNameLabelText,
                  hint: Strings.userNameHintText,
                  controller: userNameController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                  prefixIcon: const Icon(
                    Icons.person_2_outlined,
                  ),
                  autofillHints: const [AutofillHints.name],
                  validator: Validators.checkFieldEmpty,
                ),
                gapH12,
                CustomOutlinedTextField(
                  labelText: Strings.emailLabelText,
                  hint: Strings.emailHintText,
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                  ),
                  autofillHints: const [AutofillHints.email],
                  validator: Validators.checkEmailField,
                ),
                gapH12,
                CustomOutlinedTextField(
                  labelText: Strings.phoneLabelText,
                  hint: Strings.phoneHintText,
                  controller: phoneController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.phone,
                  prefixIcon: const Icon(
                    Icons.phone,
                  ),
                  validator: Validators.checkPhoneField,
                ),
                gapH12,
                CustomOutlinedPasswordTextField(
                  labelText: Strings.passwordLabelText,
                  hint: Strings.passwordHintText,
                  controller: passwordController,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.newPassword],
                  validator: Validators.checkPasswordField,
                ),
                gapH12,
                CustomOutlinedPasswordTextField(
                  labelText: Strings.confirmPasswordLabelText,
                  hint: Strings.passwordHintText,
                  controller: confirmPasswordController,
                  textInputAction: TextInputAction.done,
                  autofillHints: const [AutofillHints.newPassword],
                  validator: (value) {
                    return Validators.checkConfirmPassword(
                        value, passwordController.text);
                  },
                ),
                const SizedBox(
                  height: AppSpacing.sm,
                ),
                gapH16,
                BlocBuilder<SignupCubit, SignupState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state.progressStatus == ProgressStatus.loading
                          ? () {}
                          : () {
                              if (formKey.currentState!.validate()) {
                                TextInput.finishAutofillContext();
                                context.closeKeyboard();

                                AuthUserEntity user = AuthUserEntity(
                                  id: "tempId",
                                  userName: userNameController.text,
                                  email: emailController.text,
                                  phoneNumber: phoneController.text,
                                );

                                context.read<SignupCubit>().createUser(
                                      user: user,
                                      password: passwordController.text,
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
                          : const Text("Continue"),
                    );
                  },
                ),
                gapH16,
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "By creating an account you agree to our ",
                      children: [
                        TextSpan(
                          text: " Terms of Service",
                          style: context.textTheme.labelMedium?.copyWith(
                            color: context.theme.colorScheme.primary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              String termsServiceUrl = Urls.termsService;
                              try {
                                UrlHelper().launch(termsServiceUrl);
                              } catch (e) {
                                CustomSnackbar.showToastMessage(
                                    message:
                                        "Sorry cannot open $termsServiceUrl");
                              }
                            },
                        ),
                        const TextSpan(
                          text: " and",
                        ),
                        TextSpan(
                          text: " Privacy Policy",
                          style: context.textTheme.labelMedium?.copyWith(
                            color: context.theme.colorScheme.primary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              String privacyPolicyUrl = Urls.privacyPolicy;
                              try {
                                UrlHelper().launch(privacyPolicyUrl);
                              } catch (e) {
                                CustomSnackbar.showToastMessage(
                                    message:
                                        "Sorry cannot open $privacyPolicyUrl");
                              }
                            },
                        ),
                      ],
                      style: context.textTheme.labelMedium,
                    ),
                  ),
                ),
                gapH40,
                const Divider(),
                gapH16,
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Have an account? ",
                      children: [
                        TextSpan(
                          text: " Log in",
                          style: context.textTheme.labelMedium?.copyWith(
                            color: context.theme.colorScheme.primary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.goNamed(Routes.login.name);
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
