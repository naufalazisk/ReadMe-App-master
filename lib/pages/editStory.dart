import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/storyAdd.dart';

class EditStory extends StatelessWidget {
  String id;
  static const routeName = "/edit-story";

  EditStory(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<StoryLists>(context, listen: false);
    final stories = data.allStoryList;
    var selectedStory = stories.firstWhere((element) => element.id == id);
    final TextEditingController judulController =
        TextEditingController(text: selectedStory.title);
    final TextEditingController ringkasanController =
        TextEditingController(text: selectedStory.description);
    final TextEditingController kategoriController =
        TextEditingController(text: selectedStory.categories);
    final TextEditingController imageController =
        TextEditingController(text: selectedStory.imageUrl);
    final TextEditingController partController =
        TextEditingController(text: selectedStory.part);
    final TextEditingController contentController =
        TextEditingController(text: selectedStory.content);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 2,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text("Edit Story",
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
            size: 25,
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
              Provider.of<StoryLists>(context, listen: false).editStoryList(
                  id,
                  judulController.text,
                  ringkasanController.text,
                  imageController.text,
                  partController.text,
                  kategoriController.text,
                  contentController.text);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  autocorrect: false,
                  autofocus: true,
                  decoration: const InputDecoration(labelText: "Nama Cerita"),
                  textInputAction: TextInputAction.next,
                  controller: judulController,
                ),
                TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(labelText: "Ringkasan"),
                  textInputAction: TextInputAction.next,
                  controller: ringkasanController,
                ),
                TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(labelText: "Kategori"),
                  textInputAction: TextInputAction.next,
                  controller: kategoriController,
                ),
                TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(labelText: "Part"),
                  textInputAction: TextInputAction.next,
                  controller: partController,
                ),
                TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(labelText: "Content"),
                  maxLines: null,
                  controller: contentController,
                ),
                TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(labelText: "Image URL"),
                  textInputAction: TextInputAction.done,
                  controller: imageController,
                  onEditingComplete: () {},
                ),
                const SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: () {
                      Provider.of<StoryLists>(context, listen: false)
                          .editStoryList(
                              id,
                              judulController.text,
                              ringkasanController.text,
                              imageController.text,
                              partController.text,
                              kategoriController.text,
                              contentController.text);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Edit Story",
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
      ),
    );
  }
}
