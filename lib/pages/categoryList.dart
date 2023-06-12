import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:faker/faker.dart';

import '../providers/storyAdd.dart';
import '../widgets/category.dart';

// udah dipindah ke widgets kategori
class CategoryList extends StatelessWidget {
  var faker = Faker();

  CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<StoryLists>(context);
    final dataMain = data.allStoryList;

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
          padding: const EdgeInsets.fromLTRB(0, 23, 10, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(100, 10, 0, 10),
                child: Text("Horror",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 20),
                    child: Text("All Stories",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat")),
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) =>
                          ChangeNotifierProvider.value(
                              value: dataMain[index], child: const Category()),
                      itemCount: data.jumlahStoryList,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
