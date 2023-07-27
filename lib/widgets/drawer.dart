import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/themes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageurl="https://instagram.fbom2-1.fna.fbcdn.net/v/t51.2885-19/354191749_1149516279773854_929637623487593417_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fbom2-1.fna.fbcdn.net&_nc_cat=110&_nc_ohc=yBfg0ORbnaUAX8-9ssL&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfCH559YVmHrGD62THRo3HbvXgEUw1xkonCKP5Zxi4iYjQ&oe=64C42B7D&_nc_sid=8b3546";
    return Drawer(
      child: Container(
        color: MyTheme.Color3,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: const Text("Omkar Mandave"),
                accountEmail: const Text("omandave2003@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageurl),),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
                ),
                title: Text(
                  "Home", 
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                    ),
                  ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
                ),
                title: Text(
                  "Profile", 
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                    ),
                  ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
                ),
                title: Text(
                  "Email Me", 
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
