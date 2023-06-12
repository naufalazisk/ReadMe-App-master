import 'package:flutter/material.dart';

class onSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 2,
        backgroundColor: const Color(0xffD6C9C9),
        title: Padding(
          padding: EdgeInsets.fromLTRB(90, 20, 0, 10),
          child: Text(
            "Search",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
        // kurang tulisan cancel navigator.pop ke write
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Container(
            margin: const EdgeInsets.only(left: 25, bottom: 20, right: 25),
            alignment: FractionalOffset.topCenter,
            height: 55,
            width: 360,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const TextField(
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 13),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.black38),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
