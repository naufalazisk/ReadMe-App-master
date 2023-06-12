import 'package:flutter/material.dart';
import 'package:project_kelompok_mobile/providers/authentication.dart';
import 'package:provider/provider.dart';
import '../pages/setting.dart';

import 'editList.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // User profile data
  String userDescription =
      "I spend my days crafting compelling content for a variety of clients, ranging from blog posts and articles to social media posts and marketing copy.";

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<Authentication>(context);
    String name = data.displayName;
    String picture = data.imageUrl;
    String email = data.email;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffD6C9C9),
        toolbarHeight: 70,
        title: Center(
          child: const Text(
            "Profile",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w700),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 35,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Setting()));
              },
              icon: const Icon(Icons.settings),
              color: Colors.white,
              iconSize: 35,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: NetworkImage(
                      picture,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  Text(
                    userDescription,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      "Your Works",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat"),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  // SizedBox(
                  //   height: 250,
                  //   child: ListView(
                  //     scrollDirection: Axis.horizontal,
                  //     children: [
                  //       InkWell(
                  //           onTap: () => Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => TitlePage())),
                  //           child: userStory()),
                  //       InkWell(
                  //           onTap: () => Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => TitlePage())),
                  //           child: userStory()),
                  //       InkWell(
                  //           onTap: () => Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => TitlePage())),
                  //           child: userStory()),
                  //       InkWell(
                  //           onTap: () => Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => TitlePage())),
                  //           child: userStory()),
                  //       InkWell(
                  //           onTap: () => Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => TitlePage())),
                  //           child: userStory()),
                  //       InkWell(
                  //           onTap: () => Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => TitlePage())),
                  //           child: userStory()),
                  //       InkWell(
                  //           onTap: () => Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => TitlePage())),
                  //           child: userStory()),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 194, 151, 151)),
                      overlayColor:
                          MaterialStateProperty.all(Colors.orangeAccent),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      "My Story",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditList())),
                    // Navigate to edit profile screen
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class userStory extends StatelessWidget {
//   const userStory({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 10),
//       child: Container(
//         width: 128,
//         height: 200,
//         color: Colors.transparent,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(5),
//               child: const Image(
//                 image: AssetImage('images/image 4.png'),
//                 width: 120,
//                 height: 180,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.fromLTRB(10, 10, 0, 5),
//               child: Text("Tittle story",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                       fontFamily: "Montserrat")),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
