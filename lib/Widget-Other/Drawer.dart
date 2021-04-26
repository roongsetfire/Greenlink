import 'package:flutter/material.dart';

class DrawMenu1 extends StatefulWidget {
  @override
  _DrawMenu1State createState() => _DrawMenu1State();
}

class _DrawMenu1State extends State<DrawMenu1> {
  double screenheight;
  @override
  Widget build(BuildContext context) {
    screenheight = MediaQuery.of(context).size.height;
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: Colors.lightGreen.shade700),
        child: Column(
          children: [
            DrawerHeader(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                padding: EdgeInsets.zero,
                child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.lightGreen.shade700,
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.white38, width: 2))),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.account_circle,
                                size: 50,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Green Link",
                                style: TextStyle(
                                    fontFamily: 'Kanit',
                                    fontSize: 34,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: Text(
                            'สวัสดีคุณ ชื่อ (นามสกุลไม่ต้อง)',
                            style: TextStyle(
                                fontFamily: 'Kanit',
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ))),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              padding: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.white38, width: 2))),
              child: Column(
                children: [
                  createDrawerItem(
                      icon: Icons.notifications_active_rounded,
                      text: 'แจ้งเตือน',
                      onTap: () {
                        Navigator.pushNamed(context, '/Notification');
                      }),
                  createDrawerItem(
                      icon: Icons.settings,
                      text: 'ตั้งค่า',
                      onTap: () {
                        Navigator.pushNamed(context, '/Setting');
                      }),
                  createDrawerItem(
                      icon: Icons.contact_support_rounded,
                      text: 'ติดต่อเรา',
                      onTap: () {}),
                  createDrawerItem(
                      icon: Icons.policy_rounded,
                      text: 'นโยบายและข้อมูลส่วนตัว',
                      onTap: () {}),
                  createDrawerItem(
                      icon: Icons.exit_to_app,
                      text: 'ออกจากระบบ',
                      onTap: () {}),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                'Version 1.0',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  //สร้าง list ย่อยใน drawer
  Widget createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  text,
                  style: TextStyle(
                      fontFamily: 'Kanit', fontSize: 18, color: Colors.white),
                ),
              )
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
