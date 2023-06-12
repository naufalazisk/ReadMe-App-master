import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'categoryList.dart';
import '../pages/onSearch.dart';

class search extends StatelessWidget {
  var faker = Faker();

  search({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 50,
          elevation: 2,
          backgroundColor: const Color(0xffD6C9C9),
          title: Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: Center(
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
          ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => onSearch())),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 15.0, top: 4),
                      child: Text(
                        "Search for stories or people",
                        style: TextStyle(
                          fontFamily: 'LexendDeca',
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => {
                      Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            onSearch(),
                      ))
                    },
                    icon: const Icon(Icons.search),
                    color: Colors.grey,
                    padding: const EdgeInsets.only(top: 5),
                  )
                ],
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                    child: Text(
                      "Browse category",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat"),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CategoryList())),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Container(
                      //margin: const EdgeInsets.only(top: 5),
                      //alignment: FractionalOffset.topCenter,
                      width: 360,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xffD6C9C9),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: const Text(
                        "Drama",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 2,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CategoryList())),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Container(
                      // margin: const EdgeInsets.only(top: 5, left: 34),
                      // alignment: FractionalOffset.topCenter,
                      width: 360,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xffD6C9C9),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: const Text(
                        "Adventure",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 2,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CategoryList())),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Container(
                      // margin: const EdgeInsets.only(top: 5, left: 34),
                      // alignment: FractionalOffset.topCenter,
                      width: 360,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xffD6C9C9),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: const Text(
                        "Romance",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 2,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CategoryList())),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Container(
                      // margin: const EdgeInsets.only(top: 5, left: 34),
                      // alignment: FractionalOffset.topCenter,
                      width: 360,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xffD6C9C9),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: const Text(
                        "Comedy",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 2,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CategoryList())),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Container(
                      // margin: const EdgeInsets.only(top: 5, left: 34),
                      // alignment: FractionalOffset.topCenter,
                      width: 360,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xffD6C9C9),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: const Text(
                        "Horror",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 2,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CategoryList())),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Container(
                      // margin: const EdgeInsets.only(top: 5, left: 34),
                      // alignment: FractionalOffset.topCenter,
                      width: 360,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xffD6C9C9),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: const Text(
                        "Sci-fi",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 2,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CategoryList())),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Container(
                      // margin: const EdgeInsets.only(top: 5, left: 34),
                      // alignment: FractionalOffset.topCenter,
                      width: 360,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xffD6C9C9),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: const Text(
                        "Thriller",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 2,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CategoryList())),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Container(
                      // margin: const EdgeInsets.only(top: 5, left: 34),
                      // alignment: FractionalOffset.topCenter,
                      width: 360,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xffD6C9C9),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: const Text(
                        "Slice of Life",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 2,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
