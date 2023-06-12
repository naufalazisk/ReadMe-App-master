import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/editStory.dart';
import '../providers/storyAdd.dart';

// 1 widget pada edit

class EditWidget extends StatelessWidget {
  int index;
  EditWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    final provData = Provider.of<StoryLists>(context);
    final data = provData.allStoryList[index];

    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 5),
      child: Container(
        width: 400,
        height: 130,
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image(
                image: NetworkImage(data.imageUrl),
                width: 90,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 1),
                    child: SizedBox(
                      width: 200,
                      child: Text(data.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              height: 1.5,
                              fontFamily: "Montserrat")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Text(data.writer,
                        style: const TextStyle(
                            color: Colors.pink,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat")),
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      data.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black,
                          height: 1.5,
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Container(
                      width: 60,
                      height: 13,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.black),
                      child: Center(
                        child: Text(
                          data.categories,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Montserrat"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 20),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditStory(
                                    data.id,
                                  )));
                    },
                    child: const Icon(Icons.edit)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: InkWell(
                    onTap: () {
                      Provider.of<StoryLists>(context, listen: false)
                          .deleteStoryList(data.id)
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Story Deleted"),
                          ),
                        );
                      });
                    },
                    child: const Icon(Icons.delete)),
              )
            ])
          ],
        ),
      ),
    );
  }
}
