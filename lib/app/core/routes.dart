enum Routes {
  initial,
  login,
  createAccount,
  forgotPassword,
}

const routesMapping = {
  Routes.initial: "/",
  Routes.login: "/login/",
  Routes.createAccount: "/create-account/",
  Routes.forgotPassword: "forgot-password/",
};

extension RoutesExtension on Routes {
  String get name => routesMapping[this] ?? "/";
}
