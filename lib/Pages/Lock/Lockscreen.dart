import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mynote_app/Constant/ConstColor.dart';
import 'package:mynote_app/Helper/HideKeybordonPop.dart';
import 'package:mynote_app/Pages/Home/ArchivedPage.dart';
import 'package:mynote_app/Pages/Lock/Component/Headercontent.dart';
import 'package:mynote_app/Pages/Lock/Component/KeyboardBTN.dart';
import 'package:mynote_app/Provider/Theme_Provider.dart';
import 'package:mynote_app/SharedPreferences/ArchivedPin.dart';

import 'package:provider/provider.dart';

class LockScreen extends StatefulWidget {
  const LockScreen(
      {Key key,
      this.isChangePassword = false,
      this.isFinalChangePassword = false})
      : super(key: key);

  @override
  _LockScreenState createState() => _LockScreenState();
  final bool isChangePassword;
  final bool isFinalChangePassword;
}

class _LockScreenState extends State<LockScreen> {
  bool pinone = false;
  bool pintwo = false;
  bool pinthree = false;
  bool pinfour = false;
  int pinindex = 0;
  List<String> currpin = ["", "", "", ""];
  String myPin = "";
  String errorMessage = "";
  String title = "";
  String subtitle = "";
  bool isusechangepasslink = true;

  @override
  void initState() {
    super.initState();
    getcurrentPin().then((value) {
      myPin = value;
      print(myPin);
      if (widget.isChangePassword == true) {
        setState(() {
          title = "Enter Old Passcode";
          subtitle = "Please Enter passcode you use to\nopen the archive";
          isusechangepasslink = false;
        });
        // setState(() {
        //   title = "Enter New Passcode";
        //   subtitle = "Please enter the four digit pin";
        // });
      } else if (value == "") {
        setState(() {
          title = "Create Passcode";
          subtitle = "This code will be used to\nopen the archive";
          isusechangepasslink = false;
        });
      } else {
        setState(() {
          title = "Enter Passcode";
          subtitle = "Please enter the four digit pin";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final keyboardBTNradius = MediaQuery.of(context).size.width * 0.19;
    final pinCircleradius = MediaQuery.of(context).size.width * 0.04;
    final _themechanger = Provider.of<ThemeProvider>(context);

    void setpin(int index, String number) {
      switch (index) {
        case 1:
          setState(() {
            pinone = !pinone;
            errorMessage = "";
          });
          break;
        case 2:
          setState(() {
            pintwo = !pintwo;
          });
          break;
        case 3:
          setState(() {
            pinthree = !pinthree;
          });
          break;
        case 4:
          setState(() {
            pinfour = !pinfour;
          });
          break;
      }
    }

    void clearallpin() {
      currpin[0] = "";
      currpin[1] = "";
      currpin[2] = "";
      currpin[3] = "";
      setState(() {
        pinone = false;
        pintwo = false;
        pinthree = false;
        pinfour = false;
      });
      pinindex = 0;
    }

    void pinindexsetup(String text) {
      if (pinindex == 0) {
        pinindex = 1;
      } else if (pinindex < 4) {
        pinindex++;
      }
      setpin(pinindex, text);
      currpin[pinindex - 1] = text; //karna dimulai dari 0
      String strpin = "";
      currpin.forEach((e) {
        strpin += e;
      });
      if (pinindex == 4) {
        if (myPin == "") {
          print(strpin);
          savePin(strpin);

          Future.delayed(const Duration(milliseconds: 300), () {
            if (widget.isFinalChangePassword == true) {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            } else {
              Navigator.of(context).pop();
            }

            Fluttertoast.showToast(
              msg: "Please enter you pin again",
              backgroundColor: Colors.grey[400],
            );
          });
        } else if (strpin != myPin) {
          Future.delayed(const Duration(milliseconds: 300), () {
            errorMessage = "Wrong Password";
            clearallpin();
          });
        } else {
          if (widget.isChangePassword == true) {
            savePin("");
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    const LockScreen(isFinalChangePassword: true)));
          } else {
            Future.delayed(const Duration(milliseconds: 300), () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ArchivedPage()));
            });
          }
        }
      }
    }

    void clearpin() {
      if (pinindex == 0) {
        pinindex = 0;
      } else {
        setpin(pinindex, "");
        currpin[pinindex - 1] = "";
        pinindex--;
      }
    }

    return Scaffold(
      backgroundColor: _themechanger.isdarkmode ? greyBGColor : Colors.white,
      body: HideKeyboardonPop(
        child: Column(
          children: [
            HeaderContent(
              pinCircleradius: pinCircleradius,
              pinone: pinone,
              pintwo: pintwo,
              pinthree: pinthree,
              pinfour: pinfour,
              errorMessage: errorMessage,
              title: title,
              subtitle: subtitle,
              ischangepass: isusechangepasslink,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                ),
                color: _themechanger.isdarkmode ? darkGrey : lightGrey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      KeyboardButton(
                          number: 1,
                          radius: keyboardBTNradius,
                          onpress: () {
                            pinindexsetup("1");
                          }),
                      KeyboardButton(
                          number: 2,
                          radius: keyboardBTNradius,
                          onpress: () {
                            pinindexsetup("2");
                          }),
                      KeyboardButton(
                          number: 3,
                          radius: keyboardBTNradius,
                          onpress: () {
                            pinindexsetup("3");
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      KeyboardButton(
                          number: 4,
                          radius: keyboardBTNradius,
                          onpress: () {
                            pinindexsetup("4");
                          }),
                      KeyboardButton(
                          number: 5,
                          radius: keyboardBTNradius,
                          onpress: () {
                            pinindexsetup("5");
                          }),
                      KeyboardButton(
                          number: 6,
                          radius: keyboardBTNradius,
                          onpress: () {
                            pinindexsetup("6");
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      KeyboardButton(
                          number: 7,
                          radius: keyboardBTNradius,
                          onpress: () {
                            pinindexsetup("7");
                          }),
                      KeyboardButton(
                          number: 8,
                          radius: keyboardBTNradius,
                          onpress: () {
                            pinindexsetup("8");
                          }),
                      KeyboardButton(
                          number: 9,
                          radius: keyboardBTNradius,
                          onpress: () {
                            pinindexsetup("9");
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      KeyboardButton(
                          text: "cancel",
                          radius: keyboardBTNradius,
                          onpress: () {
                            clearallpin();
                            Navigator.of(context).pop();
                            FocusScope.of(context).unfocus();
                          }),
                      KeyboardButton(
                          number: 0,
                          radius: keyboardBTNradius,
                          onpress: () {
                            pinindexsetup("0");
                          }),
                      KeyboardButton(
                          icon: Icon(Icons.backspace,
                              size: 18,
                              color: _themechanger.isdarkmode
                                  ? Colors.white
                                  : darkGrey),
                          radius: keyboardBTNradius,
                          onpress: () {
                            clearpin();
                          }),
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
