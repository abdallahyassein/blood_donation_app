import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spotway_app/pages/login_page.dart';
import 'package:spotway_app/provider/UserProvider.dart';
import 'package:spotway_app/widgets/loading_progress.dart';
import 'package:direct_select/direct_select.dart';
import 'package:spotway_app/widgets/my_selection.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLoading = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController bloodType = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();

  final types = [
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-",
  ];

  int selectedIndex1 = 0;

  List<Widget> _buildItems1() {
    return types
        .map((val) => MySelectionItem(
              title: val,
            ))
        .toList();
  }

  Future<void> _showMyDialog(String title, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                if (title == "Success") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _register() async {
      if (_formKey.currentState.validate()) {
        setState(() {
          isLoading = true;
        });

        await Provider.of<UserProvider>(context, listen: false)
            .register(
                name.text,
                types[selectedIndex1],
                int.parse(phoneNumber.text),
                email.text,
                password.text,
                confirmPassword.text)
            .then((value) {
          // print(value);
          if (value == true) {
            _showMyDialog("Success", "your acount created successfully");
          } else {
            _showMyDialog("Alert", "your phone Number or email is used before");
          }
        });
      }
    }

    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? LoadingProgress()
            : Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/blood_back.jpg"),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(30),
                          child: SingleChildScrollView(
                            child: Card(
                              color: Color.fromRGBO(56, 56, 56, 0.9),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Blood Donation",
                                      style: GoogleFonts.abel(
                                          textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 48,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.italic,
                                      )),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Form(
                                        key: _formKey,
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Colors
                                                              .grey[200]))),
                                              child: TextFormField(
                                                controller: name,
                                                decoration: InputDecoration(
                                                    hintText: "Name",
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey),
                                                    border: InputBorder.none),
                                                onEditingComplete: () =>
                                                    FocusScope.of(context)
                                                        .nextFocus(),
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'please write your name';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Colors
                                                              .grey[200]))),
                                              child: TextFormField(
                                                controller: email,
                                                decoration: InputDecoration(
                                                    hintText: "Email",
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey),
                                                    border: InputBorder.none),
                                                onEditingComplete: () =>
                                                    FocusScope.of(context)
                                                        .nextFocus(),
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'please write your email';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Colors
                                                              .grey[200]))),
                                              child: TextFormField(
                                                controller: phoneNumber,
                                                decoration: InputDecoration(
                                                    hintText: "Phone Number",
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey),
                                                    border: InputBorder.none),
                                                onEditingComplete: () =>
                                                    FocusScope.of(context)
                                                        .nextFocus(),
                                                inputFormatters: [
                                                  WhitelistingTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'please write your phone number';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                              ),
                                            ),
                                            // Container(
                                            //   padding: EdgeInsets.all(10),
                                            //   decoration: BoxDecoration(
                                            //       border: Border(
                                            //           bottom: BorderSide(
                                            //               color: Colors
                                            //                   .grey[200]))),
                                            //   child: TextFormField(
                                            //     controller: bloodType,
                                            //     decoration: InputDecoration(
                                            //         hintText: "Blood Type",
                                            //         hintStyle: TextStyle(
                                            //             color: Colors.grey),
                                            //         border: InputBorder.none),
                                            //     onEditingComplete: () =>
                                            //         FocusScope.of(context)
                                            //             .nextFocus(),
                                            //     inputFormatters: [
                                            //       WhitelistingTextInputFormatter
                                            //           .digitsOnly
                                            //     ],
                                            //     validator: (value) {
                                            //       if (value.isEmpty) {
                                            //         return 'please write your phone number';
                                            //       } else {
                                            //         return null;
                                            //       }
                                            //     },
                                            //   ),
                                            // ),
                                            DirectSelect(
                                                itemExtent: 35.0,
                                                selectedIndex: selectedIndex1,
                                                backgroundColor:
                                                    Colors.redAccent,
                                                child: MySelectionItem(
                                                  isForList: false,
                                                  title: types[selectedIndex1],
                                                ),
                                                onSelectedItemChanged: (index) {
                                                  setState(() {
                                                    selectedIndex1 = index;
                                                  });
                                                },
                                                items: _buildItems1()),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: TextFormField(
                                                controller: password,
                                                decoration: InputDecoration(
                                                    hintText: "Password",
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey),
                                                    border: InputBorder.none),
                                                onEditingComplete: () =>
                                                    FocusScope.of(context)
                                                        .nextFocus(),
                                                obscureText: true,
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'please write your phone number';
                                                  } else if (value.length < 6) {
                                                    return "your password must be at least 6 characters";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Colors
                                                              .grey[200]))),
                                              child: TextFormField(
                                                controller: confirmPassword,
                                                decoration: InputDecoration(
                                                    hintText:
                                                        "Confirm Password",
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey),
                                                    border: InputBorder.none),
                                                onEditingComplete: () =>
                                                    FocusScope.of(context)
                                                        .unfocus(),
                                                obscureText: true,
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'please write your phone number';
                                                  }
                                                  if (value != password.text) {
                                                    return "passwords doesn't match";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      child: Container(
                                        height: 50,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 50),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.blue[300]),
                                        child: Center(
                                          child: Text(
                                            "Register",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      onTap: _register,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
