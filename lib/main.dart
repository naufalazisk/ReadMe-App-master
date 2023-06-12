import 'package:flutter/material.dart';
import 'package:project_kelompok_mobile/navbar.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import '../providers/storyAdd.dart';
import '../pages/signIn.dart';
import '../pages/signUp.dart';
import '../providers/authentication.dart';
import '../providers/favorites.dart';
import '../wrapper.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Authentication()),
        ChangeNotifierProxyProvider<Authentication, StoryLists>(
            create: (context) => StoryLists(),
            update: (context, authentication, storylists) => storylists!
              ..updateData(authentication.uid, authentication.displayName)),
        //ChangeNotifierProvider(create: (context) => StoryLists()),
        ChangeNotifierProvider(create: (context) => Favorites())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // theme: ThemeData(
        //   primarySwatch: Colors.purple,
        // ),
        initialRoute: '/',
        routes: {
          '/': (context) => const Wrapper(),
          '/login': (context) => signIn(),
          '/register': (context) => signUp(),
          '/home': (context) => navbar(),
        },
        // homeep: navbar()
      ),
    );
  }
}
