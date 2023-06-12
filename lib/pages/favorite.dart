import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favorites.dart';

class Favorite extends StatelessWidget {
  int index;
  Favorite({required this.index});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Favorites>(context, listen: false);
    return Dismissible(
      key: ValueKey(data.items.values.toList()[index].id),
      onDismissed: (direction) {
        Provider.of<Favorites>(context, listen: false)
            .removeFavs(data.items.values.toList()[index].id);
      },
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => TitlePage(data.id, data.title,
          //             data.description, data.writer, data.category, data.image)));
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 5),
          child: Container(
            width: 500,
            height: 130,
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(
                    image:
                        NetworkImage(data.items.values.toList()[index].image),
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
                          width: 250,
                          child: Text(data.items.values.toList()[index].title,
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
                        child: Text(data.items.values.toList()[index].writer,
                            style: const TextStyle(
                                color: Colors.pink,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Montserrat")),
                      ),
                      SizedBox(
                        width: 250,
                        child: Text(
                          data.items.values.toList()[index].description,
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              height: 13,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.black),
                              child: Center(
                                  child: Text(
                                data.items.values.toList()[index].category,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Montserrat"),
                              )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
