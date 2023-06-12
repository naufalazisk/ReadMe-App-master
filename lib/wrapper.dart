import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/authentication.dart';
import '../models/user.dart';
import '../pages/signIn.dart';
import '../navbar.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<Authentication>(context);
    return StreamBuilder<UserAttributes?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<UserAttributes?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final UserAttributes? user = snapshot.data;
          return user == null ? signIn() : navbar();
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
