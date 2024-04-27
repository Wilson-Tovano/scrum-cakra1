import 'package:cakra_asset_management/src/themed_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
// import 'package:cakra_asset_management/src/layout.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool _obscureText = true; // Initially hide the text

  void togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Data BMN'),
      ),
      body: ThemedLayout(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius:
                        BorderRadius.circular(60), // Adjust the value as needed
                  ),
                ),
              ),
              const Text(
                "Andy Lau",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:
                      24, // You can add more text decorations here, such as color, size, etc.
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: Icon(Icons.person),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    10), // Adjust the value as needed
                                // Background color of the container
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary, // Border color
                                  width: 1.0, // Border width
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Nama baru', // Hint text
                                  border: InputBorder
                                      .none, // Removes the default underline border
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal:
                                          10), // Optional: Adjusts the padding
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
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: Icon(Icons.email),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    10), // Adjust the value as needed
                                // Background color of the container
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary, // Border color
                                  width: 1.0, // Border width
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Email baru', // Hint text
                                  border: InputBorder
                                      .none, // Removes the default underline border
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal:
                                          10), // Optional: Adjusts the padding
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
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        children: [
                          Expanded(
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
                                obscureText: true, // Hide text by default
                                decoration: InputDecoration(
                                  hintText: 'Kata sandi lama',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
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
                      padding: EdgeInsetsDirectional.symmetric(
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
                                obscureText: true, // Hide text by default
                                decoration: InputDecoration(
                                  hintText: 'Kata sandi baru',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
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
                      padding: EdgeInsetsDirectional.symmetric(
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
                                obscureText: true, // Hide text by default
                                decoration: InputDecoration(
                                  hintText: 'Ulangi kata sandi baru',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
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
              SizedBox(
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
                  child: Center(
                    child: Text(
                      "Simpan Perubahan",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize:
                            16, // You can add more text decorations here, such as color, size, etc.
                      ),
                      textAlign:
                          TextAlign.center, // Align text to center horizontally
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
