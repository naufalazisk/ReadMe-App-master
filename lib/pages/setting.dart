import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/authentication.dart';
import 'edit_profile.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
              color: Color.fromARGB(255, 194, 151, 151), size: 30),
          toolbarHeight: 75,
          title: const Text(
            'Settings',
            style: TextStyle(
                color: Color.fromARGB(255, 194, 151, 151),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Column(children: [
          InkWell(
              child: const ListTile(
                leading: Icon(Icons.person,
                    color: Color.fromARGB(255, 194, 151, 151)),
                title: Text('Account',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        color: Color.fromARGB(255, 194, 151, 151))),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 194, 151, 151)),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfile()));
              }),
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => EditProfile(
          //             name: "John Doe", email: "johndoe@example.com")))),
          InkWell(
            child: ListTile(
              leading: const Icon(Icons.help,
                  color: Color.fromARGB(255, 194, 151, 151)),
              title: const Text('Help',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      color: Color.fromARGB(255, 194, 151, 151))),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Color.fromARGB(255, 194, 151, 151)),
              onTap: () {},
            ),
          ),
          InkWell(
            child: const ListTile(
                leading: Icon(Icons.logout,
                    color: Color.fromARGB(255, 194, 151, 151)),
                title: Text('Log Out',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        color: Color.fromARGB(255, 194, 151, 151))),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 194, 151, 151))),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      title: const Text('Log Out'),
                      content: const Text(
                        'Are you sure you want to log out?',
                        style: TextStyle(fontFamily: 'Montserrat'),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel',
                              style: TextStyle(fontFamily: 'Montserrat')),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<Authentication>(context, listen: false)
                                .signOut();
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => signIn()));
                          },
                          child: const Text('Log Out',
                              style: TextStyle(fontFamily: 'Montserrat')),
                        ),
                      ],
                    );
                  });
            },
          ),
          InkWell(
            child: const ListTile(
                leading:
                    Icon(Icons.info, color: Color.fromARGB(255, 194, 151, 151)),
                title: Text('About Us',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        color: Color.fromARGB(255, 194, 151, 151))),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 194, 151, 151))),
            onTap: () {},
          ),
        ]));
  }
}
