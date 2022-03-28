// ignore_for_file: camel_case_types, prefer_const_constructors, use_key_in_widget_constructors, unnecessary_type_check, unrelated_type_equality_checks, prefer_final_fields, unused_field, unnecessary_null_comparison

import 'package:b_track/homepage.dart';
import 'package:b_track/registration.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Resetpassword extends StatefulWidget {
  @override
  _ResetpasswordState createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
  bool _isVisible = false;
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;
  String value1 = "";

  onPasswordChanged(String password) {
    final numbericRegex = RegExp(r'[0-9]');
    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if (numbericRegex.hasMatch(password)) _hasPasswordOneNumber = true;
    });
  }

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
        title: Text('Reset Password',
            style: GoogleFonts.rowdies(
                textStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ))),
        backgroundColor: Color(0xff343b71),
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
                  'New Password',
                  style: style,
                ),
              )),
              Center(
                  child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextFormField(
                    cursorColor: Colors.grey.shade800,
                    onChanged: (password) => onPasswordChanged(password),
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
                                  color: Color(0xff343b71),
                                )
                              : Icon(Icons.visibility_off,
                                  color: Color(0xff343b71)),
                        ),
                        contentPadding: EdgeInsets.only(left: 25),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Color(0xff343b71))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white)),
                        filled: true,
                        fillColor: Colors.white),
                    validator: (value) {
                      value1 = value!;
                      if (value == null ||
                          (_isPasswordEightCharacters == false ||
                              _hasPasswordOneNumber == false)) {
                        return 'Please a Enter Valid Password';
                      }
                      return null;
                    }),
              )),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: _isPasswordEightCharacters
                              ? Colors.white
                              : Colors.transparent,
                          border: _isPasswordEightCharacters
                              ? Border.all(color: Colors.transparent)
                              : Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: Color(0xff343b71),
                          size: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Contains at least 8 characters",
                      style: style,
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: _hasPasswordOneNumber
                              ? Colors.white
                              : Colors.transparent,
                          border: _hasPasswordOneNumber
                              ? Border.all(color: Colors.transparent)
                              : Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: Color(0xff343b71),
                          size: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Contains at least 1 number",
                      style: style,
                    )
                  ],
                ),
              ),
              Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  'Confirm Password',
                  style: style,
                ),
              )),
              Center(
                  child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextFormField(
                    cursorColor: Colors.grey.shade800,
                    obscureText: !_isVisible,
                    decoration: InputDecoration(
                        errorStyle: estyle,
                        contentPadding: EdgeInsets.only(left: 25),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Color(0xff343b71))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white)),
                        filled: true,
                        fillColor: Colors.white),
                    validator: (value) {
                      if (value != value1) {
                        return 'Password not match';
                      }
                      return null;
                    }),
              )),
              Center(
                  child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: ElevatedButton(
                    child: Text("Reset", style: style),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Fluttertoast.showToast(
                            msg: "Password Changed Successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 2);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Homepage()));
                      }
                    },
                    style: buttonstyle),
              )),
            ],
          )),
    );
  }
}
