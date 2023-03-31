enum Routes {
  initial,
  signIn,
  createAccount,
  forgotPassword,
  income,
}

const routesMapping = {
  Routes.initial: "/",
  Routes.signIn: "/sign-in",
  Routes.createAccount: "/create-account",
  Routes.forgotPassword: "/forgot-password",
  Routes.income: "/income"
};

extension RoutesExtension on Routes {
  String get name => routesMapping[this] ?? "/";
}
