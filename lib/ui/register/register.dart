import 'package:app_maintain/other/color.dart';
import 'package:app_maintain/ui/login/login.dart';
import 'package:app_maintain/ui/welcome/welcome.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  bool isVisiblePassword = false;
  bool isVisibleConfirmPassword = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainAppWhite,
      appBar: AppBar(
        backgroundColor: mainAppWhite,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WelcomePage()));
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 24,
              color: greyLightColor,
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
              _buildFormRegister(),
              _buildSplitDivider(),
              _buildSocialRegister(),
              _buildHaveAccount(context),
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
        'REGISTER',
        style: TextStyle(
            color: blueDark, fontWeight: FontWeight.bold, fontSize: 36),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildFormRegister() {
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
              height: 24,
            ),
            _buildConfirmPasswordField(),
            const SizedBox(
              height: 40,
            ),
            _buildButtonRegister(),
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
            cursorColor: blueDark,
            style: TextStyle(color: blueDark),
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
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isVisiblePassword = !isVisiblePassword;
                  });
                },
                icon: Icon(
                  isVisiblePassword ? Icons.visibility : Icons.visibility_off,
                  color: blueDark,
                ),
              ),
            ),
            style: TextStyle(color: blueDark),
            cursorColor: blueDark,
            obscureText: !isVisiblePassword,
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Confirm Password',
          style: TextStyle(color: orangeLight, fontSize: 18),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: TextFormField(
            controller: confirmPassword,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password is required';
              } else if (password.text != confirmPassword.text) {
                return "Passwords don't match";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: '●●●●●●●●●●●●●',
              hintStyle: TextStyle(color: greyLightColor, fontSize: 14),
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
                    isVisibleConfirmPassword = !isVisibleConfirmPassword;
                  });
                },
                icon: Icon(
                  isVisibleConfirmPassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: blueDark,
                ),
              ),
            ),
            cursorColor: blueDark,
            style: TextStyle(color: blueDark),
            obscureText: !isVisibleConfirmPassword,
          ),
        ),
      ],
    );
  }

  Widget _buildButtonRegister() {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              //register
            }
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
            'Register',
            style: TextStyle(
                color: mainAppWhite, fontWeight: FontWeight.bold, fontSize: 16),
          )),
    );
  }

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

  Widget _buildSocialRegister() {
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
              'Register with Google',
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
              'Register with Facebook',
              style: TextStyle(color: blueDark),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHaveAccount(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 24),
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: "Already have an account? ",
          style: TextStyle(
            color: greyColorForText,
            fontSize: 12,
          ),
          children: [
            TextSpan(
              text: "Login",
              style: TextStyle(
                color: blueDark,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _goToLoginPage(context);
                },
            )
          ],
        ),
      ),
    );
  }

  // void _goToLoginPage(BuildContext context) {
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => const LoginPage()));
  // }

  void _goToLoginPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
