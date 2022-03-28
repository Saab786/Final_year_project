// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors, avoid_returning_null_for_void

import 'package:b_track_driver/ViewProfile.dart';
import 'package:b_track_driver/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:b_track_driver/login.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      decoration: BoxDecoration(
        color: Color(0xfffb713c),
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
                    child: Image(
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-fff2lftqIE077pFAKU1Mhbcj8YFvBbMvpA&usqp=CAU'),
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                )),
              ),
              decoration: BoxDecoration(
                color: Color(0xfffb713c),
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
            leading: Icon(Icons.arrow_circle_up_rounded),
            title: Text(
              'Upgrade',
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
