import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite.dart';

import '../providers/favorites.dart';

// library or favs

class Library extends StatefulWidget {
  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<Favorites>(context);
    var dataMain = data.items;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 2,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(5, 23, 10, 20),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text("Library",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Flexible(
              child: Padding(
                padding: EdgeInsets.only(bottom: 10, top: 20),
                child: Text("All Stories",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat")),
              ),
            ),
            Expanded(
              flex: 10,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: dataMain[index],
                  child: Favorite(index: index),
                ),
                itemCount: dataMain.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class Library extends StatelessWidget {
//   final List<Poster> poster = [Poster(image: aot)];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         toolbarHeight: 70,
//         elevation: 2,
//         backgroundColor: Colors.white,
//         title: Padding(
//           padding: const EdgeInsets.fromLTRB(5, 23, 10, 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               Padding(
//                 padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
//                 child: Text("Library",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 25,
//                         fontFamily: "Montserrat",
//                         fontWeight: FontWeight.w700)),
//               )
//             ],
//           ),
//         ),
//       ),
//       body: GridView(
//         padding: EdgeInsets.all(15),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         children: poster,
//       ),
//       // body: SingleChildScrollView(
//       //   child: Column(
//       //     crossAxisAlignment: CrossAxisAlignment.start,
//       //     children: [
//       //       Padding(
//       //         padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
//       //         child: Column(
//       //           crossAxisAlignment: CrossAxisAlignment.start,
//       //           children: [
//       //             SizedBox(
//       //                 height: 220,
//       //                 child: Row(
//       //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //                   children: [
//       //                     Poster(image: aot),
//       //                     Poster(image: aot),
//       //                     Poster(image: aot)
//       //                   ],
//       //                 )),
//       //             SizedBox(
//       //                 height: 220,
//       //                 child: Row(
//       //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //                   children: [
//       //                     Poster(image: aot),
//       //                     Poster(image: aot),
//       //                     Poster(image: aot)
//       //                   ],
//       //                 )),
//       //             SizedBox(
//       //                 height: 220,
//       //                 child: Row(
//       //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //                   children: [
//       //                     Poster(image: aot),
//       //                     Poster(image: aot),
//       //                     Poster(image: aot)
//       //                   ],
//       //                 )),
//       //             SizedBox(
//       //                 height: 220,
//       //                 child: Row(
//       //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //                   children: [
//       //                     Poster(image: aot),
//       //                     Poster(image: aot),
//       //                     Poster(image: aot)
//       //                   ],
//       //                 )),
//       //           ],
//       //         ),
//       //       ),
//       //     ],
//       //   ),
//       // ),
//     );
//   }
// }

// class Poster extends StatelessWidget {
//   final String image;

//   Poster({
//     required this.image,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 2.5, right: 2.5),
//       child: InkWell(
//         onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => TitlePage()),
//         ),
//         child: Container(
//           // width: 120,
//           // height: 600,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 width: 120,
//                 height: 180,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(5),
//                   child: Image(
//                     image: AssetImage(image),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               // ClipRRect(
//               //   borderRadius: BorderRadius.circular(5),
//               //   // child: Image(
//               //   //   image: AssetImage(image),
//               //   //   fit: BoxFit.cover,
//               //   // ),
//               // ),
//               const Padding(
//                 padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
//                 child: Text("Tittle story",
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 13,
//                         fontWeight: FontWeight.w500,
//                         fontFamily: "Montserrat")),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// //Images Poster
// String aot = "images/image 1.png";
