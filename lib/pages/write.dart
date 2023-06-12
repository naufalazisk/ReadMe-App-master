import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:project_kelompok_mobile/pages/editList.dart';
import 'package:provider/provider.dart';

import '../pages/profile.dart';
import '../providers/authentication.dart';
import 'addStory.dart';

class write extends StatelessWidget {
  var faker = Faker();

  write({super.key});
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<Authentication>(context).imageUrl;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          elevation: 2,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(8, 23, 10, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text("Write",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w700)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(userData),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
          child: Column(
            children: [
              InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddStory())),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20, top: 20),
                      child: Icon(
                        Icons.document_scanner_rounded,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20, top: 30, left: 5),
                      child: Text(
                        "Create new story ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Montserrat"),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const EditList())),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20, top: 20),
                      child: Icon(
                        Icons.edit_document,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20, top: 30, left: 5),
                      child: Text(
                        "Edit your story",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Montserrat"),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
