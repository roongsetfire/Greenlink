import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  List<bool> status = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text(
          'ตั้งค่า',
          style: TextStyle(
              fontFamily: 'Kanit',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
        backgroundColor: Colors.lightGreen.shade700,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                height: 55,
                decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal:
                          BorderSide(color: Colors.grey.shade300, width: 4)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ภาษาที่ใช้',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'ไทย',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'การแจ้งเตือน',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        color: Colors.black54,
                        decoration: TextDecoration.underline,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              // row1
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                height: 55,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.grey.shade300, width: 4)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'เมื่อมีกิจกรรมลุ้นทองใหม่',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    FlutterSwitch(
                      activeColor: Colors.lightGreen,
                      inactiveColor: Colors.grey.shade300,
                      width: 50.0,
                      height: 25.0,
                      valueFontSize: 25.0,
                      toggleSize: 20.0,
                      value: status[0],
                      borderRadius: 30.0,
                      padding: 4.0,
                      showOnOff: false,
                      onToggle: (val) {
                        setState(() {
                          status[0] = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              //row2
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                height: 55,
                decoration: BoxDecoration(
                    border: Border(
                        top:
                            BorderSide(color: Colors.grey.shade300, width: 4))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'เมื่อมีนัดหมายใหม่',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    FlutterSwitch(
                      activeColor: Colors.lightGreen,
                      inactiveColor: Colors.grey.shade300,
                      width: 50.0,
                      height: 25.0,
                      valueFontSize: 25.0,
                      toggleSize: 20.0,
                      value: status[1],
                      borderRadius: 30.0,
                      padding: 4.0,
                      showOnOff: false,
                      onToggle: (val) {
                        setState(() {
                          status[1] = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              //row3
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                height: 55,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.grey.shade300, width: 4)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'เมื่อนัดหมายมีการเปลี่ยน',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    FlutterSwitch(
                      activeColor: Colors.lightGreen,
                      inactiveColor: Colors.grey.shade300,
                      width: 50.0,
                      height: 25.0,
                      valueFontSize: 25.0,
                      toggleSize: 20.0,
                      value: status[2],
                      borderRadius: 30.0,
                      padding: 4.0,
                      showOnOff: false,
                      onToggle: (val) {
                        setState(() {
                          status[2] = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              //row4
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                height: 55,
                decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal:
                          BorderSide(color: Colors.grey.shade300, width: 4)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'เมื่อสถานะการเก็บเปลี่ยน',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    FlutterSwitch(
                      activeColor: Colors.lightGreen,
                      inactiveColor: Colors.grey.shade300,
                      width: 50.0,
                      height: 25.0,
                      valueFontSize: 25.0,
                      toggleSize: 20.0,
                      value: status[3],
                      borderRadius: 30.0,
                      padding: 4.0,
                      showOnOff: false,
                      onToggle: (val) {
                        setState(() {
                          status[3] = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),

          //ปุ่ม ล่างสุด 2 อัน
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 140,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      enableFeedback: true,
                      primary: Colors.lightGreen.shade600,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: Text(
                      "บันทึก",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Kanit',
                          fontSize: 20),
                    ),
                  ),
                ),
                TextButton(
                  child: Text(
                    'ลบบัญชี',
                    style: TextStyle(
                      fontFamily: 'Kanit',
                      color: Colors.grey.shade700,
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/Login', (route) => false);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
