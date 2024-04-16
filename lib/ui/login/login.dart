import 'package:app_maintain/other/color.dart';
import 'package:app_maintain/ui/register/register.dart';
import 'package:app_maintain/ui/welcome/welcome.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username = TextEditingController();
  final password = TextEditingController();
  bool isVisible = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainAppWhite,
      appBar: AppBar(
        backgroundColor: transparentColor,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WelcomePage()));
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 24,
              color: greyColorForText,
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              _buildTitle(),
              const SizedBox(
                height: 48,
              ),
              _buildFormLogin(context),
              _buildSplitDivider(),
              _buildSocialLogin(),
              _buildHaveNotAccount(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        'LOGIN',
        style: TextStyle(
            color: blueDark, fontWeight: FontWeight.bold, fontSize: 36),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildFormLogin(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUsernameField(),
            const SizedBox(
              height: 24,
            ),
            _buildPasswordField(),
            const SizedBox(
              height: 40,
            ),
            _buildButtonLogin(context),
          ],
        ),
      ),
    );
  }

  // in _buildFormLogin
  Widget _buildUsernameField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Username',
          style: TextStyle(color: orangeLight, fontSize: 18),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: TextFormField(
            controller: username,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Username is required';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Enter your Username',
              hintStyle: TextStyle(color: greyColorForText, fontSize: 14),
              fillColor: mainAppWhite,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: blueDark, width: 1.5),
                borderRadius: BorderRadius.circular(4),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: blueDark, width: 1.5),
                borderRadius: BorderRadius.circular(4),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: error, width: 1.5),
                borderRadius: BorderRadius.circular(4),
              ),
              errorStyle: TextStyle(
                color: error,
              ),
            ),
            style: TextStyle(color: blueDark),
            cursorColor: blueDark,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyle(color: orangeLight, fontSize: 18),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: TextFormField(
            controller: password,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: '●●●●●●●●●●●●●',
                hintStyle: TextStyle(color: greyColorForText, fontSize: 14),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: blueDark, width: 1.5),
                  borderRadius: BorderRadius.circular(4),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: blueDark, width: 1.5),
                  borderRadius: BorderRadius.circular(4),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: error, width: 1.5),
                  borderRadius: BorderRadius.circular(4),
                ),
                errorStyle: TextStyle(
                  color: error,
                ),
                fillColor: mainAppWhite,
                filled: true,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                    color: blueDark,
                  ),
                )),
            style: TextStyle(color: blueDark),
            obscureText: !isVisible,
            cursorColor: blueDark,
          ),
        ),
      ],
    );
  }

  Widget _buildButtonLogin(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              //login
            }
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const MainPageController()));
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
            style: TextStyle(
                color: mainAppWhite, fontWeight: FontWeight.bold, fontSize: 16),
          )),
    );
  }
  // end _buildFormLogin

  Widget _buildSplitDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              width: double.infinity,
              color: blueDark,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            'or',
            style: TextStyle(
                color: blueDark, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Container(
              height: 1,
              width: double.infinity,
              color: blueDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLogin() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          _buildSocialGoogleLogin(),
          const SizedBox(height: 24),
          _buildSocialFacebookLogin(),
        ],
      ),
    );
  }

  Widget _buildSocialGoogleLogin() {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return blueDarkO5;
              }
              return Colors.transparent;
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
              MaterialStateColor.resolveWith((states) => transparentColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/google.png',
              height: 24,
              width: 24,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              'Login with Google',
              style: TextStyle(color: blueDark),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialFacebookLogin() {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return blueDarkO5;
              }
              return Colors.transparent;
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
              MaterialStateColor.resolveWith((states) => transparentColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/facebook.png',
              height: 24,
              width: 24,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              'Login with Facebook',
              style: TextStyle(color: blueDark),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHaveNotAccount(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 24),
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: "Don't have an account? ",
          style: TextStyle(
            color: greyColorForText,
            fontSize: 12,
          ),
          children: [
            TextSpan(
              text: "Register",
              style: TextStyle(
                color: blueDark,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _goToRegisterPage(context);
                },
            )
          ],
        ),
      ),
    );
  }

  void _goToRegisterPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const RegisterPage()));
  }
}
