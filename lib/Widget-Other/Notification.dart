import 'package:flutter/material.dart';

class Notificate extends StatefulWidget {
  @override
  _NotificateState createState() => _NotificateState();
}

class _NotificateState extends State<Notificate> {
  //หัวข้อรายการ
  List<String> listNotification = [
    'ร้องเรียนโพสต์หมายเลข 123',
    'เสนอแนะการให้บริการ',
    'รายการแจ้งเตือนยังไม่อ่าน',
    'รายการแจ้งเตือน'
  ];
  //สีที่เปลี่ยนแต่ละ list
  List<Color> listColor;
  // กดแก้ไขจะขึ้น checkbox
  bool edit = false;
  //กด checkbox แต่ละอันได้
  List<bool> checklist;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //แถบ appbar บนสุด
      appBar: AppBar(
        elevation: 10,
        title: Text(
          'แจ้งเตือน',
          style: TextStyle(
              fontFamily: 'Kanit',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
        backgroundColor: Colors.lightGreen.shade700,
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  edit = !edit;
                });
                if (!edit) {
                  setState(() {
                    checklist = List.generate(
                        listNotification.length, (index) => false);
                  });
                }
              },
              child: Text(
                'แก้ไข',
                style: TextStyle(
                    fontFamily: 'Kanit',
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.underline),
              ))
        ],
      ),

      // list รายการแจ้งเตือนแต่ละรายการ
      body: (listNotification.length == 0)
          ? Center(
              child: Text(
                'ไม่มีแจ้งเตือนที่เหลืออยู่',
                style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 30,
                    color: Colors.lightGreen.shade700),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: listNotification.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            if (!edit) {
                              setState(() {
                                listColor[index] = Colors.grey.shade200;
                              });
                            }
                            print(index);
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            height: 60,
                            decoration: BoxDecoration(
                              color: listColor[index],
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey.shade300, width: 4),
                                  bottom: BorderSide(
                                      color:
                                          (index == listNotification.length - 1)
                                              ? Colors.grey.shade300
                                              : Colors.transparent,
                                      width: 4)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    (edit)
                                        ? Checkbox(
                                            activeColor: Colors.green.shade600,
                                            value: checklist[index],
                                            onChanged: (value) {
                                              setState(() {
                                                checklist[index] = value;
                                              });
                                            },
                                          )
                                        : Container(),
                                    Text(
                                      listNotification[index],
                                      style: TextStyle(
                                        fontFamily: 'Kanit',
                                        color: Colors.grey,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                (listNotification[index]
                                        .startsWith('ร้องเรียน'))
                                    ? Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.lightGreen.shade500),
                                        child: Text(
                                          'สำเร็จ',
                                          style: TextStyle(
                                              fontFamily: 'Kanit',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                // ปุ่ม 2 ปุ่ม ข้างล่างสุด
                (edit)
                    ? Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // button 1
                            Container(
                                height: 40,
                                width: 120,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.lightGreen),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                    ),
                                    onPressed: () {
                                      //ต้องกดแก้ไขก่อน ถึงจะกดเลือกทั้งหมดได้
                                      if (edit) {
                                        setState(() {
                                          for (var i = 0;
                                              i < checklist.length;
                                              i++) {
                                            checklist[i] = true;
                                          }
                                        });
                                      }
                                    },
                                    child: Text(
                                      'เลือกทั้งหมด',
                                      style: TextStyle(
                                          fontFamily: 'Kanit', fontSize: 16),
                                    ))),

                            //button2
                            Container(
                                height: 40,
                                width: 120,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.orange),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                    ),
                                    onPressed: () {
                                      // หลักการคือเราจะสร้าง listRemaining มาเก็บค่าที่ไม่ได้ checkbox เพื่อเอาไปวาด widget ใหม่ ส่วนค่าที่ check จะไม่เลือกมา add
                                      List<String> listRemaining = [];
                                      if (edit) {
                                        for (var i = 0;
                                            i < checklist.length;
                                            i++) {
                                          if (checklist[i] == false) {
                                            listRemaining
                                                .add(listNotification[i]);
                                          }
                                        }

                                        setState(() {
                                          listNotification = listRemaining;
                                          listColor = List.generate(
                                              listNotification.length,
                                              (index) => Colors.white);
                                          checklist = List.generate(
                                              listNotification.length,
                                              (index) => false);
                                        });
                                        //ลอง uncomment 2 ล่างดูถ้าเกิดสงสัย
                                        // print(listNotification);
                                        // print(checklist);
                                      }
                                    },
                                    child: Text(
                                      'ลบ',
                                      style: TextStyle(
                                          fontFamily: 'Kanit', fontSize: 16),
                                    ))),
                          ],
                        ),
                      )
                    : Container()
              ],
            ),
    );
  }

//constructor ไว้ประกาศตอนต้นก่อนวาดแอพ
  _NotificateState() {
    listColor = List.generate(listNotification.length, (index) => Colors.white);
    checklist = List.generate(listNotification.length, (index) => false);
  }
}
