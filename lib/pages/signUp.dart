import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/authentication.dart';

class signUp extends StatefulWidget {
  signUp({super.key});

  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  bool confirmPassword() {
    if (passwordController == confirmPasswordController) {
      return true;
    } else {
      return false;
    }
  }

  Widget buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Name',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Montserrat"),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                )
              ]),
          height: 60,
          child: TextField(
            controller: nameController,
            style: const TextStyle(
                color: Colors.black87, fontFamily: "Montserrat"),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.account_circle_rounded,
                  color: Color(0xff0D6C9C9),
                ),
                hintText: 'Name',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Montserrat"),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
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
            style: const TextStyle(
                color: Colors.black87, fontFamily: "Montserrat"),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff0D6C9C9),
                ),
                hintText: 'Email',
                hintStyle:
                    TextStyle(color: Colors.black38, fontFamily: "Montserrat")),
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
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Montserrat"),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
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
            obscureText: true,
            style: const TextStyle(
                color: Colors.black87, fontFamily: "Montserrat"),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff0D6C9C9),
                ),
                hintText: 'Password',
                hintStyle:
                    TextStyle(color: Colors.black38, fontFamily: "Montserrat")),
          ),
        )
      ],
    );
  }

  Widget buildConfirmPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Confirm Password',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Montserrat"),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                )
              ]),
          height: 60,
          child: TextField(
            controller: confirmPasswordController,
            obscureText: true,
            style: const TextStyle(
                color: Colors.black87, fontFamily: "Montserrat"),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff0D6C9C9),
                ),
                hintText: 'Enter Your Password Again',
                hintStyle:
                    TextStyle(color: Colors.black38, fontFamily: "Montserrat")),
          ),
        )
      ],
    );
  }

  Widget buildSignUpBtn() {
    final authService = Provider.of<Authentication>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      height: 110,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ElevatedButton(
          onPressed: () async {
            await authService.createUserWithEmailAndPassword(
                emailController.text,
                passwordController.text,
                nameController.text);
            if (confirmPassword() == true) {}
            Navigator.pushNamed(context, '/');
            // Navigator.of(context).push(
            //   PageRouteBuilder(
            //     pageBuilder: (context, animation, secondaryAnimation) =>
            //         signIn(),
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
          child: const Text('Sign Up'),
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
              fontFamily: "Montserrat",
            ),
          ),
        ),
      ),
    );
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
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 50),
                    buildName(),
                    const SizedBox(height: 20),
                    buildEmail(),
                    const SizedBox(height: 20),
                    buildPassword(),
                    const SizedBox(height: 20),
                    buildConfirmPassword(),
                    buildSignUpBtn(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
