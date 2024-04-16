import 'package:app_maintain/other/color.dart';
import 'package:app_maintain/ui/login/login.dart';
import 'package:app_maintain/ui/register/register.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainAppWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              _buildLogo(),
              const SizedBox(
                height: 100,
              ),
              _buildTitleAndContent(),
              const SizedBox(
                height: 24,
              ),
              _buildButtonLogin(context),
              const SizedBox(
                height: 24,
              ),
              _buildButtonRegister(context),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      'assets/images/logo.png',
      height: 320,
      width: 320,
      fit: BoxFit.contain,
    );
  }

  Widget _buildTitleAndContent() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            'Quản Lý Sửa Chữa',
            style: TextStyle(
                color: blueDark, fontWeight: FontWeight.bold, fontSize: 36),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Please login to your account or create new account to continue',
              style: TextStyle(color: orangeLight),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtonLogin(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ElevatedButton(
          onPressed: () {
            _goToLoginPage(context);
          },
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return mainAppWhite.withOpacity(0.2);
                  }
                  return transparentColor;
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return blueDark;
                },
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              surfaceTintColor:
                  MaterialStateColor.resolveWith((states) => transparentColor)),
          child: Text(
            'Login',
            style: TextStyle(color: mainAppWhite, fontWeight: FontWeight.bold),
          )),
    );
  }

  void _goToLoginPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  Widget _buildButtonRegister(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ElevatedButton(
        onPressed: () {
          _goToRegisterPage(context);
        },
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return blueDarkO5;
                }
                return transparentColor;
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                return mainAppWhite;
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(width: 2, color: blueDark),
              ),
            ),
            surfaceTintColor:
                MaterialStateColor.resolveWith((states) => transparentColor)),
        child: Text(
          'Create account',
          style: TextStyle(color: blueDark, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _goToRegisterPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const RegisterPage()));
  }
}
