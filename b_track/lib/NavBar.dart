// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_returning_null_for_void, file_names

import 'package:b_track/registration.dart';
import 'package:b_track/ViewProfile.dart';
import 'package:b_track/resetpassword.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      decoration: BoxDecoration(
        color: Color(0xff343b71),
        borderRadius: BorderRadius.only(
          bottomRight: const Radius.circular(180.0),
          topRight: const Radius.circular(180.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5.0,
            spreadRadius: 7.0,
          )
        ],
      ),
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          ListTile(
            iconColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_rounded)),
          ),
          Center(
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.only(right: 80),
              accountName: Text(
                'Hello',
                style: style,
              ),
              accountEmail: Text(
                'example@gmail.com',
                style: style,
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/male.png",
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xff343b71),
              ),
            ),
          ),
          Divider(
            height: 20,
            thickness: 2,
            indent: 20,
            endIndent: 20,
            color: Colors.white,
          ),
          ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: Icon(Icons.person),
            title: Text(
              'My Profile',
              style: style,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: style,
            ),
            onTap: () {},
          ),
          ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: Icon(Icons.password_rounded),
            title: Text(
              'Change Password',
              style: style,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Resetpassword()));
            },
          ),
          ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: Icon(Icons.share),
            title: Text(
              'Share',
              style: style,
            ),
            onTap: () => null,
          ),
          ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: Icon(Icons.amp_stories_rounded),
            title: Text(
              'Version',
              style: style,
            ),
            onTap: () => null,
          ),
          Divider(
            height: 20,
            thickness: 2,
            indent: 20,
            endIndent: 20,
            color: Colors.white,
          ),
          ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            title: Text(
              'Exit',
              style: style,
            ),
            leading: Icon(Icons.exit_to_app),
            onTap: () => null,
          ),
        ],
      ),
    ));
  }
}
