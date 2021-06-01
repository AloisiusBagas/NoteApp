import 'package:flutter/material.dart';
import 'package:mynote_app/Pages/Lock/Component/PinNumber.dart';
import 'package:mynote_app/Pages/Lock/Lockscreen.dart';

class HeaderContent extends StatelessWidget {
  const HeaderContent({
    Key key,
    @required this.pinCircleradius,
    @required this.pinone,
    @required this.pintwo,
    @required this.pinthree,
    @required this.pinfour,
    this.errorMessage,
    this.title,
    this.subtitle,
    this.ischangepass = true,
  }) : super(key: key);

  final double pinCircleradius;
  final bool pinone;
  final bool pintwo;
  final bool pinthree;
  final bool pinfour;
  final String errorMessage;
  final String title;
  final String subtitle;
  final bool ischangepass;

  @override
  Widget build(BuildContext context) {
    final paddingheader = MediaQuery.of(context).size.height * 0.04;
    final paddingtop = MediaQuery.of(context).padding.top + paddingheader;
    return Container(
      padding: EdgeInsets.only(top: paddingtop, bottom: paddingheader),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 17),
          Text(subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PinNumber(pinCircleradius: pinCircleradius, isActive: pinone),
              PinNumber(pinCircleradius: pinCircleradius, isActive: pintwo),
              PinNumber(pinCircleradius: pinCircleradius, isActive: pinthree),
              PinNumber(pinCircleradius: pinCircleradius, isActive: pinfour),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            errorMessage,
            style: const TextStyle(
                color: Colors.redAccent,
                fontSize: 12,
                fontStyle: FontStyle.italic),
          ),
          if (ischangepass)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const LockScreen(isChangePassword: true)));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Change Password?",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            )
        ],
      ),
    );
  }
}
