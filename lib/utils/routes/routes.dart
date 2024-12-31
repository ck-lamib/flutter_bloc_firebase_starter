enum Routes {
  splash(
    name: "splash",
    path: "/",
  ),
  onBoarding(
    name: "onBoarding",
    path: "/onBoarding",
  ),
  themeMode(
    name: "themeMode",
    path: "/themeMode",
  ),
  login(
    name: "login",
    path: "/login",
  ),
  signup(
    name: "signup",
    path: "/signup",
  ),

  dashboard(
    name: "dashboard",
    path: "/dashboard",
  ),
  home(
    name: "home",
    path: "/home",
  ),
  profile(
    name: "profile",
    path: "/profile",
  ),
  aboutDeveloper(
    name: "aboutDeveloper",
    path: "/aboutDeveloper",
  );

  const Routes({
    required this.path,
    required this.name,
  });

  final String path;
  final String name;
}
