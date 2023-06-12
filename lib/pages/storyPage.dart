import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// tampilan ketia baca cerita

class StoryPage extends StatelessWidget {
  StoryPage(
      {super.key,
      required this.title,
      required this.part,
      required this.content});

  String title;
  String part;
  String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 2,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 35,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.fromLTRB(35, 10, 0, 10),
          child: Container(
            width: 200,
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Text(
                part,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: "Monserrat",
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              content,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: "Monserrat",
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
