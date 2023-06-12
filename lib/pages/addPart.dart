import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/storyAdd.dart';

class AddPart extends StatelessWidget {
  static const routeName = "/add-story";
  final TextEditingController partController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final String title;
  final String description;
  final String categories;
  final String image;

  AddPart(this.title, this.description, this.categories, this.image);

  @override
  Widget build(BuildContext context) {
    final stories = Provider.of<StoryLists>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 2,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text("Add Story",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700)),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.save,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              stories.addStoryList(
                title,
                description,
                categories,
                image,
                partController.text,
                contentController.text,
              );
              int count = 0;
              Navigator.of(context).popUntil((_) => count++ >= 2);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: "Part"),
                textInputAction: TextInputAction.newline,
                controller: partController,
              ),
              TextField(
                autocorrect: false,
                decoration: const InputDecoration(labelText: "Content"),
                maxLines: null,
                controller: contentController,
              ),
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
                    stories.addStoryList(
                      title,
                      description,
                      categories,
                      image,
                      partController.text,
                      contentController.text,
                    );
                    int count = 0;
                    Navigator.of(context).popUntil((_) => count++ >= 2);
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// Ini digunakan untuk membuat cerita setelah memasukkan deskripsi dll

// class AddPart extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         toolbarHeight: 70,
//         elevation: 2,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//             size: 35,
//           ),
//         ),
//         title: Padding(
//           padding: const EdgeInsets.fromLTRB(0, 23, 10, 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               Padding(
//                 padding: EdgeInsets.fromLTRB(100, 10, 0, 10),
//                 child: Text("Part 1",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontFamily: "Montserrat",
//                         fontWeight: FontWeight.w700)),
//               ),
//             ],
//           ),
//         ),
//         actions: const <Widget>[
//           Padding(
//             padding: EdgeInsets.fromLTRB(0, 25, 15, 0),
//             child: InkWell(
//               // onTap: () => Navigator.push(context,
//               //     MaterialPageRoute(builder: (context) => TitlePage())),
//               child: Text(
//                 "Publish",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 17,
//                   fontFamily: "Montserrat",
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//       body: Container(
//         width: 500,
//         child: Column(
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                   color: Colors.white,
//                   border: Border(
//                     bottom: BorderSide(color: Colors.black),
//                   )),
//               child: const Padding(
//                 padding: EdgeInsets.only(top: 10, bottom: 20),
//                 child: SizedBox(
//                   width: 400,
//                   child: TextField(
//                     minLines: 1,
//                     maxLines: 5,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.black87),
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.only(top: 14, left: 13),
//                       hintText: 'Part Title',
//                       hintStyle: TextStyle(color: Colors.black38),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(top: 10),
//               child: SizedBox(
//                 width: 400,
//                 child: TextField(
//                   maxLines: null,
//                   textAlign: TextAlign.left,
//                   style: TextStyle(color: Colors.black87),
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.only(left: 13),
//                     hintText: 'Start writing your story',
//                     hintStyle: TextStyle(color: Colors.black38),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
