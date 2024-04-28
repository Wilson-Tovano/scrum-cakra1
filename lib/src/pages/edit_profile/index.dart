import 'package:cakra_asset_management/src/themed_layout.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool _obscureText = true; // Initially hide the text

  void togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Akun'),
      ),
      body: ThemedLayout(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/contact-placeholder.jpg"),
                  ),
                ),
              ),
              const Text(
                "Andy Lau",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Icon(Icons.person),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // Background color of the container
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary, // Border color
                                  width: 1.0, // Border width
                                ),
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: 'Nama baru', // Hint text
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Icon(Icons.email),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // Background color of the container
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary, // Border color
                                  width: 1.0, // Border width
                                ),
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: 'Email baru', // Hint text
                                  border: InputBorder
                                      .none, // Removes the default underline border
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Icon(Icons.lock),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  width: 1.0,
                                ),
                              ),
                              child: TextField(
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  hintText: 'Kata sandi lama',
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.grey,
                                    ),
                                    onPressed: togglePasswordVisibility,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  width: 1.0,
                                ),
                              ),
                              child: TextField(
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  hintText: 'Kata sandi baru',
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.grey,
                                    ),
                                    onPressed: togglePasswordVisibility,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  width: 1.0,
                                ),
                              ),
                              child: TextField(
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  hintText: 'Ulangi kata sandi baru',
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.grey,
                                    ),
                                    onPressed: togglePasswordVisibility,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 180,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius:
                        BorderRadius.circular(10), // Adjust the value as needed
                  ),
                  child: const Center(
                    child: Text(
                      "Simpan Perubahan",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
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
