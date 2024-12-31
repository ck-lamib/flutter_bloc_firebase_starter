import 'package:flutter/material.dart';
import 'package:flutter_bloc_firebase_starter/screens/drawer/presentation/views/drawer_widget.dart';
import 'package:flutter_bloc_firebase_starter/utils/constants/strings.dart';
import 'package:flutter_bloc_firebase_starter/utils/extensions/build_context_extensions.dart';
import 'package:flutter_bloc_firebase_starter/utils/themes/spacing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:flutter_bloc_firebase_starter/common/widgets/custom_cached_netwoking.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc_firebase_starter/utils/routes/asset_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileView();
  }
}

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final InAppReview inAppReview = InAppReview.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("Setting Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.lg,
        ),
        child: ListView(
          children: [
            ProfileUserInfo(),
            const SizedBox(
              height: 10,
            ),
            Card(
              elevation: 3,
              child: Column(
                children: DrawerItemList.getItems(context, inAppReview),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.colorScheme.secondaryFixedDim,
                    width: 1,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  height: AppSpacing.xxxlg * 2,
                  width: AppSpacing.xxxlg * 2,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CustomCachedNetworkImage(
                    imageUrl: (state is AuthUserAuthenticated)
                        ? state.user.userAvatar ?? ""
                        : "",
                    placeHolderImage: AssetRoutes.imageRouteDefaultAvtarImage,
                    height: AppSpacing.xxxlg * 2,
                    width: AppSpacing.xxxlg * 2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                (state is AuthUserAuthenticated)
                    ? state.user.userName ?? Strings.defaultUserName
                    : Strings.defaultUserName,
                style: context.textTheme.titleMedium,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                (state is AuthUserAuthenticated)
                    ? state.user.email ?? Strings.defaultUserEmail
                    : Strings.defaultUserEmail,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
