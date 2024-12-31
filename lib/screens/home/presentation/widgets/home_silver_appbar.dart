import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firebase_starter/common/widgets/custom_cached_netwoking.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc_firebase_starter/screens/dashboard/presentation/views/dashboard_screen.dart';
import 'package:flutter_bloc_firebase_starter/utils/constants/strings.dart';
import 'package:flutter_bloc_firebase_starter/utils/extensions/build_context_extensions.dart';
import 'package:flutter_bloc_firebase_starter/utils/helpers/snackbars.dart';
import 'package:flutter_bloc_firebase_starter/utils/routes/asset_routes.dart';
import 'package:flutter_bloc_firebase_starter/utils/themes/spacing.dart';

class HomeSilverAppBar extends StatelessWidget {
  const HomeSilverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: true,
      automaticallyImplyLeading: false,
      toolbarHeight: kToolbarHeight + 30,
      backgroundColor: context.colorScheme.surface,
      scrolledUnderElevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => drawerKey.currentState!.openDrawer(),
                child: Container(
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
                    height: AppSpacing.xxxlg,
                    width: AppSpacing.xxxlg,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is AuthUserAuthenticated) {
                          return CustomCachedNetworkImage(
                            imageUrl: state.user.userAvatar ?? "",
                            placeHolderImage:
                                AssetRoutes.imageRouteDefaultAvtarImage,
                            height: AppSpacing.xxxlg,
                            width: AppSpacing.xxxlg,
                            fit: BoxFit.cover,
                          );
                        }
                        return const CustomCachedNetworkImage(
                          imageUrl: "",
                          placeHolderImage:
                              AssetRoutes.imageRouteDefaultAvtarImage,
                          height: AppSpacing.xxxlg,
                          width: AppSpacing.xxxlg,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: AppSpacing.lg,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome 👋",
                      style: context.textTheme.headlineSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: AppSpacing.sm,
                    ),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is AuthUserAuthenticated) {
                          return Text(
                            "${state.user.userName}",
                            style: context.textTheme.bodyLarge,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          );
                        }
                        return Text(
                          Strings.defaultUserName,
                          style: context.textTheme.bodyLarge,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        );
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: AppSpacing.xxs,
              ),
              IconButton(
                onPressed: () {
                  CustomSnackbar.showToastMessage(
                    message: "Hey this is for notification",
                  );
                },
                icon: const Badge(
                  child: Icon(
                    Icons.notifications_rounded,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
