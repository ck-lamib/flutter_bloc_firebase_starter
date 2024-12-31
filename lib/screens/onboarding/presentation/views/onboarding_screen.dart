import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc_firebase_starter/screens/app_setting/cubit/app_setting_cubit.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc_firebase_starter/screens/onboarding/data/model/onboarding_model.dart';
import 'package:flutter_bloc_firebase_starter/screens/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:flutter_bloc_firebase_starter/utils/extensions/build_context_extensions.dart';
import 'package:flutter_bloc_firebase_starter/utils/routes/asset_routes.dart';
import 'package:flutter_bloc_firebase_starter/utils/routes/routes.dart';
import 'package:flutter_bloc_firebase_starter/utils/themes/border_radius.dart';
import 'package:flutter_bloc_firebase_starter/utils/themes/spacing.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: OnBoardingView(),
    );
  }
}

class OnBoardingView extends StatelessWidget {
  final PageController _pageController = PageController();
  OnBoardingView({super.key});

  final List<OnboardingModel> items = [
    OnboardingModel(
      title: 'This is onboarding page 1',
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset.",
      imagePath: AssetRoutes.svgRouteOnBoardingImage,
    ),
    OnboardingModel(
      title: 'This is onboarding page 2',
      description: "I have used the svg image from undraw.co",
      imagePath: AssetRoutes.svgRouteOnBoardingImage,
    ),
    OnboardingModel(
      title: 'This is onboarding page 3',
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem.",
      imagePath: AssetRoutes.svgRouteOnBoardingImage,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xlg,
        ),
        child: SafeArea(
          child: PageView.builder(
            controller: _pageController,
            itemCount: items.length,
            onPageChanged: (value) {
              context.read<OnboardingCubit>().updateCurrentPage(value);
            },
            itemBuilder: (context, index) {
              return Center(
                child: Container(
                  margin: const EdgeInsets.all(
                    AppSpacing.md,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: context.screenSize.height * 0.35,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppBorderRadius.large),
                        ),
                        child: SvgPicture.asset(
                          items[index].imagePath,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xxxlg),
                      Text(
                        items[index].title,
                        style: context.textTheme.titleLarge,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Text(
                        items[index].description,
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(
          AppSpacing.md,
        ),
        padding: const EdgeInsets.all(
          AppSpacing.md,
        ),
        height: context.screenSize.height * 0.13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppBorderRadius.large),
          color: Theme.of(context).colorScheme.surfaceContainer,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () async {
                context.read<AppSettingCubit>().setOnBoardingValue(true);
                var authState = context.read<AuthBloc>().state;
                if (authState is AuthUserAuthenticated) {
                  context.goNamed(Routes.dashboard.name);
                } else {
                  context.goNamed(Routes.login.name);
                }
              },
              child: const Text(
                "Skip",
              ),
            ),
            Expanded(
              child: BlocBuilder<OnboardingCubit, int>(
                builder: (context, state) {
                  return DotsIndicator(
                    dotsCount: items.length,
                    position: state,
                    decorator: DotsDecorator(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(360),
                        side: BorderSide(
                          color: context.colorScheme.primary,
                        ),
                      ),
                      size: Size.square(context.screenSize.height * 0.017),
                      color: Colors.transparent,
                      activeSize: Size.square(
                        context.screenSize.height * 0.017,
                      ),
                      activeColor: context.colorScheme.primary,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: context.screenSize.height * 0.1,
              child: BlocBuilder<OnboardingCubit, int>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      Center(
                        child: SizedBox(
                          height: context.screenSize.height * 0.1,
                          width: context.screenSize.height * 0.1,
                          child: CircularProgressIndicator(
                            value: (state + 1) / items.length,
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.screenSize.height * 0.1,
                        width: context.screenSize.height * 0.1,
                        child: Center(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              fixedSize: const Size.fromHeight(65),
                              shape: const CircleBorder(),
                              backgroundColor: context.colorScheme.primary,
                              foregroundColor: context.colorScheme.onPrimary,
                              elevation: 0,
                            ),
                            onPressed: () async {
                              if ((state + 1) == items.length) {
                                context
                                    .read<AppSettingCubit>()
                                    .setOnBoardingValue(true);
                                var authState = context.read<AuthBloc>().state;
                                if (authState is AuthUserAuthenticated) {
                                  context.goNamed(Routes.dashboard.name);
                                } else {
                                  context.goNamed(Routes.login.name);
                                }
                              } else {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.ease,
                                );
                              }
                            },
                            child: Icon(
                              Icons.arrow_forward,
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainer,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
