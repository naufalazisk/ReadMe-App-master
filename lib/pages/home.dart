import 'package:flutter/material.dart';
import 'package:project_kelompok_mobile/providers/authentication.dart';
import 'package:provider/provider.dart';

import '../providers/storyAdd.dart';
import '../pages/profile.dart';
import '../widgets/poster.dart';
import '../widgets/trending.dart';
import '../widgets/detail.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<StoryLists>(context, listen: false).initialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<Authentication>(context).imageUrl;
    final realData = Provider.of<StoryLists>(context);
    final realDataMain = realData.allStoryList;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        elevation: 2,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(5, 23, 10, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text("Home",
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
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
      body: Column(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Text(
                        "Trending",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Montserrat"),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                      child: SizedBox(
                          height: 180,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                ChangeNotifierProvider.value(
                              value: realDataMain.reversed.toList()[index],
                              child: const Trending(),
                            ),
                            itemCount: realDataMain.length,
                          )),
                    ),
                    Container(
                      color: Color.fromARGB(255, 245, 230, 230),
                      height: 270,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  child: Text(
                                    "Editor's picks",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Montserrat"),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(left: 20, bottom: 15),
                                  child: Text(
                                    "Editor's handpicks favorites",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Montserrat"),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 20, bottom: 10),
                                  child: SizedBox(
                                      height: 180,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            ChangeNotifierProvider.value(
                                          value: realDataMain[index],
                                          child: const Poster(),
                                        ),
                                        itemCount: realDataMain.length,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                                  child: Text(
                                    "hey, Look as the category?",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Montserrat"),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(left: 20, bottom: 15),
                                  child: Text(
                                    "provide you the category detail here",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Montserrat"),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 20, bottom: 10),
                                  child: SizedBox(
                                      height: 180,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            ChangeNotifierProvider.value(
                                          value: realDataMain[index],
                                          child: const Detail(),
                                        ),
                                        itemCount: realDataMain.length,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
