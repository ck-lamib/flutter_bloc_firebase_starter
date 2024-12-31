import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:flutter_bloc_firebase_starter/common/widgets/custom_cached_netwoking.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc_firebase_starter/screens/drawer/presentation/widgets/delete_account_drawer_tile.dart';
import 'package:flutter_bloc_firebase_starter/screens/drawer/presentation/widgets/drawer_divider.dart';
import 'package:flutter_bloc_firebase_starter/screens/drawer/presentation/widgets/drawers_tile.dart';
import 'package:flutter_bloc_firebase_starter/screens/drawer/presentation/widgets/logout_drawer_tile.dart';
import 'package:flutter_bloc_firebase_starter/screens/drawer/presentation/widgets/theme_mode_drawer_tile.dart';
import 'package:flutter_bloc_firebase_starter/screens/package_info/cubit/package_info_cubit.dart';
import 'package:flutter_bloc_firebase_starter/utils/constants/app_constant.dart';
import 'package:flutter_bloc_firebase_starter/utils/constants/urls.dart';
import 'package:flutter_bloc_firebase_starter/utils/extensions/build_context_extensions.dart';
import 'package:flutter_bloc_firebase_starter/utils/helpers/snackbars.dart';
import 'package:flutter_bloc_firebase_starter/utils/helpers/url_helper.dart';
import 'package:flutter_bloc_firebase_starter/utils/routes/asset_routes.dart';
import 'package:flutter_bloc_firebase_starter/utils/routes/routes.dart';
import 'package:flutter_bloc_firebase_starter/utils/themes/spacing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({
    super.key,
  });
  final InAppReview inAppReview = InAppReview.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSpacing.xlg,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: context.colorScheme.secondaryFixedDim,
                                  width: 1,
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  shape: BoxShape.circle,
                                ),
                                height: AppSpacing.xxxlg * 1.8,
                                width: AppSpacing.xxxlg * 1.8,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: CustomCachedNetworkImage(
                                  imageUrl: (state is AuthUserAuthenticated)
                                      ? state.user.userAvatar ?? ""
                                      : "",
                                  placeHolderImage:
                                      AssetRoutes.imageRouteDefaultAvtarImage,
                                  height: AppSpacing.xxxlg * 1.8,
                                  width: AppSpacing.xxxlg * 1.8,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: AppSpacing.md),
                            Text(
                              (state is AuthUserAuthenticated)
                                  ? state.user.userName ?? "Bimal Khatri"
                                  : "Bimal Khatri",
                              style: context.textTheme.titleMedium,
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              (state is AuthUserAuthenticated)
                                  ? state.user.email ??
                                      "khattribimal90@gmail.com"
                                  : "khattribimal90@gmail.com",
                              style: context.textTheme.bodySmall?.copyWith(
                                color: context.colorScheme.onSurface
                                    .withValues(alpha: 0.5),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ...DrawerItemList.getItems(context, inAppReview)
                  ],
                ),
              ),
              BlocBuilder<PackageInfoCubit, PackageInfoState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Version ${state.packageInfo?.version ?? "1.0.0"}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItemList {
  static List<Widget> getItems(BuildContext context, InAppReview inAppReview) {
    return [
      const DrawerDivider(),
      const ThemeModeSettingsTile(),
      const DrawerDivider(),
      DrawersTile(
        leading: const Icon(Icons.description_outlined),
        title: "Terms & conditions",
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          String termsServiceUrl = Urls.termsService;
          try {
            UrlHelper().launch(
              termsServiceUrl,
            );
          } catch (e) {
            CustomSnackbar.showToastMessage(
                message: "Sorry cannot open $termsServiceUrl");
          }
        },
      ),
      DrawersTile(
        leading: const Icon(Icons.policy_outlined),
        title: "Privacy Policy",
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          String privacyPolicyUrl = Urls.privacyPolicy;
          try {
            UrlHelper().launch(
              privacyPolicyUrl,
            );
          } catch (e) {
            CustomSnackbar.showToastMessage(
                message: "Sorry cannot open $privacyPolicyUrl");
          }
        },
      ),
      const DrawerDivider(),
      DrawersTile(
        leading: const Icon(Icons.message_outlined),
        title: "Send Feedback",
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          String contactEmail = Urls.contactEmail;
          try {
            UrlHelper().launch("mailto:${Urls.contactEmail}",
                mode: LaunchMode.externalApplication);
          } catch (e) {
            CustomSnackbar.showToastMessage(
                message: "Sorry cannot open $contactEmail");
          }
        },
      ),
      DrawersTile(
        leading: const Icon(Icons.person_outline),
        title: "Invite friend",
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () async {
          Uri inviteUrl = Uri.parse(Urls.appDynamicLink);
          await Share.shareUri(inviteUrl);
        },
      ),
      DrawersTile(
        leading: const Icon(Icons.star_outline),
        title: "Rate us",
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () async {
          if (await inAppReview.isAvailable()) {
            // inAppReview.requestReview();
            inAppReview.openStoreListing(
              appStoreId: AppConstant.appIosAppID,
            );
          }
        },
      ),
      const DrawerDivider(),
      DrawersTile(
        leading: const Icon(Icons.info_outline),
        title: "About Us",
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {},
      ),
      DrawersTile(
        leading: const Icon(Icons.webhook_rounded),
        title: "About Developer",
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          context.push(Routes.aboutDeveloper.path);
        },
      ),
      BlocBuilder<PackageInfoCubit, PackageInfoState>(
        builder: (context, state) {
          return DrawersTile(
            leading: const Icon(Icons.card_membership_rounded),
            title: "License",
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              showLicensePage(
                context: context,
                applicationLegalese: '© ${DateTime.now().year}',
                applicationName:
                    state.packageInfo?.appName ?? AppConstant.appName,
                applicationVersion: state.packageInfo?.version ?? '',
              );
            },
          );
        },
      ),
      const DrawerDivider(),
      const DeleteAccountDrawerTile(),
      const LogoutDrawerTile(),
    ];
  }
}
