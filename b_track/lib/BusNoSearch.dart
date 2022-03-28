// ignore_for_file: file_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unnecessary_null_comparison, deprecated_member_use, prefer_collection_literals, prefer_const_constructors

import 'package:b_track/registration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'User.dart';
import 'Services.dart';

final style1 = GoogleFonts.rowdies(
    textStyle: TextStyle(
  color: Color(0xff343b71),
  fontSize: 15,
));

final style2 = GoogleFonts.roboto(
    textStyle: TextStyle(
  color: Color(0xff343b71),
  fontSize: 15,
));

class UserFilterDemo extends StatefulWidget {
  UserFilterDemo() : super();

  @override
  UserFilterDemoState createState() => UserFilterDemoState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class UserFilterDemoState extends State<UserFilterDemo> {
  // https://jsonplaceholder.typicode.com/users

  final _debouncer = Debouncer(milliseconds: 500);
  List<User> users = [];
  List<User> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    Services.getUsers().then((usersFromServer) {
      setState(() {
        users = usersFromServer;
        filteredUsers = users;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff343b71),
      body: Column(
        children: <Widget>[
          TextField(
            style: style,
            cursorColor: Colors.white,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(15.0),
                fillColor: Colors.white,
                hintText: 'Search Bus No here...',
                hintStyle: TextStyle(fontSize: 15, color: Colors.white)),
            onChanged: (string) {
              _debouncer.run(() {
                setState(() {
                  filteredUsers = users
                      .where((u) => (u.name
                              .toLowerCase()
                              .contains(string.toLowerCase()) ||
                          u.email.toLowerCase().contains(string.toLowerCase())))
                      .toList();
                });
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: filteredUsers.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.white,
                  child: Center(
                      child: ListTile(
                    title: Text(filteredUsers[index].name, style: style1),
                    subtitle: Text(
                      filteredUsers[index].email.toLowerCase(),
                      style: style2,
                    ),
                    onTap: () {},
                  )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
