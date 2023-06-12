import 'package:flutter/material.dart';
import 'package:project_kelompok_mobile/widgets/edit.dart';
import 'package:provider/provider.dart';
import '../providers/storyAdd.dart';

class EditList extends StatefulWidget {
  const EditList({super.key});

  @override
  State<EditList> createState() => _EditListState();
}

class _EditListState extends State<EditList> {
  // bool isInit = true;
  // @override
  // void didChangeDependencies() {
  //   if (isInit) {
  //     Provider.of<StoryLists>(context).initialData();
  //   }
  //   isInit = false;
  //   super.didChangeDependencies();
  // }
  @override
  void initState() {
    Provider.of<StoryLists>(context, listen: false).userStory();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<StoryLists>(context);
    final dataMain = data.userStoryList;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        elevation: 2,
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
        title: const Padding(
          padding: EdgeInsets.fromLTRB(60, 10, 0, 10),
          child: Text("Modify Story",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: (dataMain.length == 0)
                  ? const Center(
                      child: Text(
                        "No Story Added",
                        style: TextStyle(fontSize: 15, fontFamily: "Monserrat"),
                      ),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) =>
                          ChangeNotifierProvider.value(
                              value: dataMain[index],
                              child: EditWidget(index: index)),
                      itemCount: dataMain.length,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
