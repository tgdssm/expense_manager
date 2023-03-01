enum Routes {
  initial,
  signin,
  createAccount,
  forgotPassword,
}

const routesMapping = {
  Routes.initial: "/",
  Routes.signin: "/signin/",
  Routes.createAccount: "/create-account/",
  Routes.forgotPassword: "forgot-password/",
};

extension RoutesExtension on Routes {
  String get name => routesMapping[this] ?? "/";
}
