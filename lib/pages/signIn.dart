import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../pages/signUp.dart';
import '../providers/authentication.dart';

class signIn extends StatefulWidget {
  signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool _isHidden = true;
  bool isRememberMe = false;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final authService = Provider.of<Authentication>(context);

    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0x66D6C9C9),
                    Color(0x99D6C9C9),
                    Color(0xccD6C9C9),
                    Color(0xffD6C9C9),
                  ])),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 50),
                    buildEmail(),
                    const SizedBox(height: 20),
                    buildPassword(),
                    buildForgotPassBtn(),
                    buildRememberCb(),
                    buildLoginBtn(context),
                    buildSignUpBtn(context),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                )
              ]),
          height: 60,
          child: TextField(
            controller: emailController,
            style: const TextStyle(color: Colors.black87),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14, left: 14),
                suffixIcon: Icon(
                  Icons.email,
                  color: Color(0xff0D6C9C9),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Password',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                )
              ]),
          height: 60,
          child: TextField(
            controller: passwordController,
            obscureText: _isHidden,
            style: const TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 14, left: 14),
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _toggleVisibility();
                    });
                  },
                  child: Icon(
                    _isHidden
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    color: Colors.amber,
                    size: 18,
                  ),
                ),
                hintText: 'Password',
                hintStyle: const TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildForgotPassBtn() {
    return Container(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 0),
          child: TextButton(
            onPressed: () {
              print("Forgot Password Pressed");
            },
            child: const Text(
              "Forgot Password?",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ));
  }

  Widget buildRememberCb() {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: isRememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value ?? false;
                });
              },
            ),
          ),
          const Text(
            'Remember me',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget buildLoginBtn(BuildContext context) {
    final authService = Provider.of<Authentication>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      height: 125,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ElevatedButton(
          onPressed: () async {
            await authService.signInWithEmailAndPassword(
                emailController.text, passwordController.text);
            // authService.tempData();
            // authService.getUserDetail();
            // print('Login Pressed');
            // Navigator.of(context).push(
            //   PageRouteBuilder(
            //     pageBuilder: (context, animation, secondaryAnimation) =>
            //         navbar(),
            //     transitionsBuilder:
            //         (context, animation, secondaryAnimation, child) {
            //       return FadeTransition(
            //         opacity: animation,
            //         child: child,
            //       );
            //     },
            //     transitionDuration: Duration(milliseconds: 700),
            //   ),
            // );
          },
          child: const Text('LOGIN'),
          style: ElevatedButton.styleFrom(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            primary: Colors.white,
            onPrimary: const Color(0xffD6C9C9),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSignUpBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Sign Up Pressed');
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => signUp(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 700),
          ),
        );
      },
      child: RichText(
        text: const TextSpan(children: [
          TextSpan(
            text: 'Don\'t have an Account? ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
    );
  }
}
