import 'package:flutter/material.dart';
import 'package:project_kelompok_mobile/models/story_model.dart';
import 'package:provider/provider.dart';
import '../pages/titlePage.dart';

class Poster extends StatelessWidget {
  const Poster({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<StoryList>(context);

    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TitlePage(
                        data.id,
                        data.title,
                        data.description,
                        data.writer,
                        data.categories,
                        data.imageUrl,
                        data.content,
                        data.part,
                      )));
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 2.5, right: 2.5),
          child: Container(
            width: 120,
            height: 180,
            color: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                image: NetworkImage(data.imageUrl),
                width: 120,
                height: 180,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ));
  }
}
