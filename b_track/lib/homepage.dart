// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names, avoid_types_as_parameter_names, unused_local_variable, avoid_init_to_null

import 'package:b_track/BusNoSearch.dart';
import 'package:b_track/NavBar.dart';
import 'package:b_track/registration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.grid_view_rounded),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => NavBar()));
          },
        ),
        title: Center(
          child: Image.asset(
            'assets/images/logo_name.png',
            height: 60,
            width: 200,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
            color: Colors.white,
          )
        ],
        backgroundColor: Color(0xff343b71),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
              ),
              Text(
                'Seach by Station Name:',
                style: style,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                child: TextFormField(
                  cursorColor: Colors.grey.shade800,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'From',
                    contentPadding: EdgeInsets.only(left: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.white)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: TextFormField(
                  cursorColor: Colors.grey.shade800,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'To',
                    contentPadding: EdgeInsets.only(left: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.white)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Center(
              child: Padding(
            padding: EdgeInsets.only(top: 15),
            child: ElevatedButton(
              child: Text(
                "Search",
                style: GoogleFonts.rowdies(
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: Size(120, 40),
                primary: Color(0xff343b71),
                elevation: 10,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          )),
          SizedBox(
            height: 10,
          ),
          Text(
            'OR',
            style: style,
          ),
          Container(
            height: 70,
            child: Padding(
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              child: ElevatedButton(
                child: Text(
                  "Search by Bus No",
                  style: GoogleFonts.rowdies(
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserFilterDemo()));
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 40),
                  primary: Color(0xff343b71),
                  elevation: 10,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
          ),
          Container(
            height: 500,
            width: double.infinity,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0),
                bottomLeft: const Radius.circular(10.0),
                bottomRight: const Radius.circular(10.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2.0,
                  spreadRadius: 3.0,
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
