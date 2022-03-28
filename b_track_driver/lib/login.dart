// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, unnecessary_new, unrelated_type_equality_checks, unnecessary_type_check

import 'package:b_track_driver/SuccessfulLogin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:b_track_driver/textfieldstyle.dart';

final style = GoogleFonts.rowdies(
    textStyle: TextStyle(
  color: Colors.white,
  fontSize: 15,
));

final estyle = GoogleFonts.rowdies(
    textStyle: TextStyle(
  color: Colors.red[900],
  fontSize: 12,
));

final buttonstyle = ElevatedButton.styleFrom(
    fixedSize: Size(150, 40),
    primary: Color(0xfffb713c),
    elevation: 15,
    shadowColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
      //side: BorderSide(color: Colors.grey.shade800),
    ));

class login extends StatefulWidget {
  @override
  _login createState() => _login();
}

class _login extends State<login> {
  bool _isVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Login',
            style: GoogleFonts.rowdies(
                textStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ))),
        backgroundColor: Color(0xfffb713c),
        elevation: 0,
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Text(
                  'Mobile no / Email-Id',
                  style: style,
                ),
              )),
              Center(
                  child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextFormField(
                    cursorColor: Colors.grey.shade500,
                    decoration: buildInputDecoration(),
                    style: TextStyle(color: Colors.grey.shade800),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter valid Mobile no / Email-Id';
                      }
                      if (value == num.tryParse(value) && value.length != 10) {
                        return 'Please Enter valid Mobile no';
                      } else if (value is String &&
                          !RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                        return 'Please Enter valid Email';
                      }
                      return null;
                    }),
              )),
              Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  'Password',
                  style: style,
                ),
              )),
              Center(
                  child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextFormField(
                    cursorColor: Colors.grey.shade500,
                    obscureText: !_isVisible,
                    decoration: InputDecoration(
                        errorStyle: estyle,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          icon: _isVisible
                              ? Icon(
                                  Icons.visibility,
                                  color: Color(0xfffb713c),
                                )
                              : Icon(Icons.visibility_off,
                                  color: Color(0xfffb713c)),
                        ),
                        contentPadding: EdgeInsets.only(left: 25),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Color(0xfffb713c))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Color(0xfffb713c))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Color(0xfffb713c))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white)),
                        filled: true,
                        fillColor: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter valid password';
                      }
                      return null;
                    }),
              )),
              Center(
                  child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: ElevatedButton(
                    child: Text("Login", style: style),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => successpage2()));
                      }
                    },
                    style: buttonstyle),
              )),
            ],
          )),
    );
  }
}
