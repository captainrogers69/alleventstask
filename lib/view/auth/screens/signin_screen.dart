import 'package:alleventstask/components/k_dividers.dart';
import 'package:alleventstask/components/sizing_box.dart';
import 'package:alleventstask/components/textfields/login_textfield.dart';
import 'package:alleventstask/general_providers.dart';
import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:alleventstask/utils/constants/k_routes.dart';
import 'package:alleventstask/utils/constants/k_styles.dart';
import 'package:alleventstask/utils/wrappers/responsive_util.dart';
import 'package:alleventstask/view/auth/compos/auth_button.dart';
import 'package:alleventstask/view/auth/compos/auth_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInScreen extends HookConsumerWidget {
  static const String id = KRoutes.signInScreen;
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController password = useTextEditingController();
    final TextEditingController email = useTextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Responsive.width(context),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthLogo(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Sign In",
                  style: Kstyles.kHeadingTextStyle,
                ),
              ),
              const Sbh(h: 10),
              const Text(
                "Email",
                style: Kstyles.kSubHeadingStyle,
              ),
              LoginTextField(
                controller: email,
                hintText: "Enter your email",
                icon: Icons.person,
              ),
              const Sbh(h: 10),
              const Text(
                "Password",
                style: Kstyles.kSubHeadingStyle,
              ),
              LoginTextField(
                controller: password,
                hintText: "Enter your password",
                secureIt: true,
                icon: Icons.password,
              ),
              AuthButton(
                buttonName: "Log in Securely",
                fetching: ref.watch(authViewProvider).loggingIn,
                onTap: () async {
                  await ref
                      .read(authViewProvider)
                      .validateLogin(email: email, password: password);
                },
              ),
              const Sbh(h: 10),
              const OrDivider(title: "Or login with one of the following"),
              AuthButton(
                icon: FontAwesomeIcons.facebook,
                buttonName: "Login with Facebook",
                fetching: ref.watch(authViewProvider).facebookLoggingIn,
                onTap: () async {
                  await ref.read(authViewProvider).signInFacebook();
                },
              ),
              // const Sbh(h: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: Kstyles.kSmallTextStyle,
                  ),
                  const Sbw(w: 10),
                  InkWell(
                    onTap: () {
                      ref.read(navProvider).navigateTo(KRoutes.signUpScreen);
                    },
                    child: Text(
                      "Sign up",
                      style: Kstyles.kSmallTextStyle.copyWith(
                        decoration: TextDecoration.underline,
                        color: KColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
