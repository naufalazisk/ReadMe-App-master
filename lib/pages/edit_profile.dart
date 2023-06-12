import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:project_kelompok_mobile/providers/authentication.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<Authentication>(context);
    final TextEditingController nameController =
        TextEditingController(text: data.displayName);
    final TextEditingController emailController =
        TextEditingController(text: data.email);
    final TextEditingController imageController =
        TextEditingController(text: data.imageUrl);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffD6C9C9),
        toolbarHeight: 75,
        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: const Text(
            "Edit Profile",
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
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Name",
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email cannot be empty";
                    }
                    if (!value.contains("@")) {
                      return "Invalid email format";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: imageController,
                  decoration: const InputDecoration(
                    labelText: "Profile Picture",
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<Authentication>(context, listen: false)
                        .updateUserData(nameController.text,
                            emailController.text, imageController.text)
                        .then((value) => Navigator.pop(context));
                  },
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
                    "Save Changes",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
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
