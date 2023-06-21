import 'package:flutter/material.dart';

class HomeMenu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeMenu();
  }
}
class _HomeMenu extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return(
    ListView(
      children: [
        ListTile(
          shape: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: Colors.cyanAccent,
                width: 1,
              )
          ),
          onTap: menuProfile1,
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset('assets/icons/ic_eye_hide.png'),
          ),
          title: const Text("My Profile 1", style: TextStyle(color: Colors.red, fontSize: 18)),
        ),
        ListTile(
          onTap: menuProfile2,
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset('assets/icons/ic_eye_show.png'),
          ),
          title: const Text("My Profile 2", style: TextStyle(color: Colors.red, fontSize: 18)),
        ),
        ListTile(
          shape: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: Colors.cyanAccent,
                width: 1,
              )
          ),
          onTap: menuProfile3,
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset('assets/icons/ic_user.png'),
          ),
          title: const Text("My Profile 3", style: TextStyle(color: Colors.red, fontSize: 18)),
        ),
        ListTile(
          onTap: menuProfile4,
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset('assets/icons/ic_mail.png'),
          ),
          title: const Text("My Profile 4", style: TextStyle(color: Colors.red, fontSize: 18)),
        ),
      ],
    )
    );
  }

  void menuProfile1() {
    print("menu profile 1");
  }
  void menuProfile2() {
    print("menu profile 2");
  }
  void menuProfile3() {
    print("menu profile 3");
  }
  void menuProfile4() {
    print("menu profile 4");
  }

}