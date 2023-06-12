import 'package:flutter/material.dart';
import 'package:project_kelompok_mobile/models/story_model.dart';
import 'package:provider/provider.dart';
import '../pages/titlePage.dart';

class Detail extends StatelessWidget {
  const Detail({
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
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          width: 200,
          // height: 160,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image(
                  image: NetworkImage(data.imageUrl),
                  width: 80,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 0, 5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: SizedBox(
                        width: 80,
                        child: Text(data.title,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Montserrat"),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            maxLines: 1),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Container(
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black),
                          child: Center(
                            child: Text(
                              data.categories,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: "Montserrat"),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                              maxLines: 1,
                            ),
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(5, 2, 4, 0),
                        child: SizedBox(
                          width: 80,
                          child: Text(
                            data.description,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontFamily: "Montserrat"),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            maxLines: 3,
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
