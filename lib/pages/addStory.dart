import 'package:flutter/material.dart';
import 'package:project_kelompok_mobile/pages/addPart.dart';

class AddStory extends StatelessWidget {
  static const routeName = "/add-story";
  final TextEditingController judulController = TextEditingController();
  final TextEditingController ringkasanController = TextEditingController();
  final TextEditingController kategoriController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              AddPart(
                judulController.text,
                ringkasanController.text,
                kategoriController.text,
                imageController.text,
              );
              Navigator.pop(context);
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
                decoration: const InputDecoration(labelText: "Nama Cerita"),
                textInputAction: TextInputAction.newline,
                controller: judulController,
              ),
              TextField(
                autocorrect: false,
                decoration: const InputDecoration(labelText: "Ringkasan"),
                textInputAction: TextInputAction.newline,
                controller: ringkasanController,
              ),
              TextField(
                autocorrect: false,
                decoration: const InputDecoration(labelText: "Kategori"),
                textInputAction: TextInputAction.newline,
                controller: kategoriController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: const InputDecoration(labelText: "Image URL"),
                textInputAction: TextInputAction.done,
                controller: imageController,
                onEditingComplete: () {
                  AddPart(
                    judulController.text,
                    ringkasanController.text,
                    kategoriController.text,
                    imageController.text,
                  );
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddPart(
                          judulController.text,
                          ringkasanController.text,
                          kategoriController.text,
                          imageController.text,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Continue",
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
