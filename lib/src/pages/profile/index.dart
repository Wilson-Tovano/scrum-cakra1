import 'package:cakra_asset_management/src/pages/edit_profile/index.dart';
import 'package:cakra_asset_management/src/themed_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
// import 'package:cakra_asset_management/src/layout.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Data BMN'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons
                  .settings, // Replace 'Icons.add' with the icon you want to use
              color: Colors.white, // Customize the color if needed
            ),
            onPressed: () {
              // Add your action here
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfile(),
                  ),
                );
            },
          ),
        ],
      ),
      body: ThemedLayout(
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
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 180,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(
                              10), // Adjust the value as needed
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Icon(
                                Icons.chat,
                                size: 42,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                "whatsapp",
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize:
                                      16, // You can add more text decorations here, such as color, size, etc.
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "+62 895 3384 20642",
                        style: TextStyle(
                          fontSize:
                              16, // You can add more text decorations here, such as color, size, etc.
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 180,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(
                              10), // Adjust the value as needed
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Icon(
                                Icons.chat,
                                size: 42,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                "Instagram",
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize:
                                      16, // You can add more text decorations here, such as color, size, etc.
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "@andylauox",
                        style: TextStyle(
                          fontSize:
                              16, // You can add more text decorations here, such as color, size, etc.
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 180,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(
                              10), // Adjust the value as needed
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Icon(
                                Icons.message,
                                size: 42,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                "Tiktok",
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize:
                                      16, // You can add more text decorations here, such as color, size, etc.
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "@刘德华",
                        style: TextStyle(
                          fontSize:
                              16, // You can add more text decorations here, such as color, size, etc.
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
