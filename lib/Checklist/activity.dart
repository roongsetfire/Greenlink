import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  int countTicket = 1;
  List<bool> checkbox = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30),
          child: Text(
            'คุณได้รับตั๋วลุ้นทองแล้วทั้งสิ้น $countTicket ใบ',
            style: TextStyle(fontFamily: 'Kanit', fontSize: 20),
          ),
        ),
        // list รายการ
        Container(
          margin: EdgeInsets.fromLTRB(25, 15, 25, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            //แต่ละ list กด checkbox แล้ว จะมีสีพื้นหลังขึ้นและจะ check
            children: [
              //row 1
              Container(
                margin: EdgeInsets.only(bottom: 5),
                padding: EdgeInsets.fromLTRB(5, 0, 15, 0),
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                  color:
                      checkbox[0] ? Colors.lightGreen.shade100 : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          activeColor: Colors.green.shade600,
                          value: checkbox[0],
                          onChanged: (value) {
                            setState(() {
                              checkbox[0] = value;
                            });
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'รับนัดล่วงหน้า',
                              style: TextStyle(
                                  fontFamily: 'Kanit',
                                  fontSize: 16,
                                  color: Colors.grey.shade600),
                            ),
                            Text(
                              'จะหมดสิทธิ์ในอีก xxxxxxxxxxxxxx',
                              style: TextStyle(
                                  fontFamily: 'Kanit',
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'จำนวนสิทธิ',
                            style: TextStyle(
                                fontFamily: 'Kanit',
                                fontSize: 13,
                                color: Colors.grey.shade600),
                          ),
                          Text(
                            'x ใบ',
                            style: TextStyle(
                                fontFamily: 'Kanit',
                                fontSize: 13,
                                color: Colors.grey.shade600),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //row 2
              Container(
                margin: EdgeInsets.only(bottom: 5),
                padding: EdgeInsets.fromLTRB(5, 0, 15, 0),
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                  color:
                      checkbox[1] ? Colors.lightGreen.shade100 : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          activeColor: Colors.green.shade600,
                          value: checkbox[1],
                          onChanged: (value) {
                            setState(() {
                              checkbox[1] = value;
                            });
                          },
                        ),
                        Text(
                          'ยืนยันน้ำหนัก',
                          style: TextStyle(
                              fontFamily: 'Kanit',
                              fontSize: 16,
                              color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'จำนวนสิทธิ',
                          style: TextStyle(
                              fontFamily: 'Kanit',
                              fontSize: 13,
                              color: Colors.grey.shade600),
                        ),
                        Text(
                          'x ใบ',
                          style: TextStyle(
                              fontFamily: 'Kanit',
                              fontSize: 13,
                              color: Colors.grey.shade600),
                        )
                      ],
                    )
                  ],
                ),
              ),
              //row 3
              Container(
                margin: EdgeInsets.only(bottom: 5),
                padding: EdgeInsets.fromLTRB(5, 0, 15, 0),
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                  color:
                      checkbox[2] ? Colors.lightGreen.shade100 : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          activeColor: Colors.green.shade600,
                          value: checkbox[2],
                          onChanged: (value) {
                            setState(() {
                              checkbox[2] = value;
                            });
                          },
                        ),
                        Text(
                          'ถ่ายรูปหน้าบ้าน',
                          style: TextStyle(
                              fontFamily: 'Kanit',
                              fontSize: 16,
                              color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 65),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'จำนวนสิทธิ',
                            style: TextStyle(
                                fontFamily: 'Kanit',
                                fontSize: 13,
                                color: Colors.grey.shade600),
                          ),
                          Text(
                            'x ใบ',
                            style: TextStyle(
                                fontFamily: 'Kanit',
                                fontSize: 13,
                                color: Colors.grey.shade600),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //row 4
              Container(
                height: 55,
                padding: EdgeInsets.fromLTRB(5, 0, 15, 0),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightGreen.shade100,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 7, 0),
                            child: Icon(
                              Icons.link_rounded,
                              size: 30,
                              color: Colors.grey.shade700,
                            )),
                        Text(
                          'ชวนเพื่อน',
                          style: TextStyle(
                              fontFamily: 'Kanit',
                              fontSize: 16,
                              color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'จำนวนสิทธิ',
                          style: TextStyle(
                              fontFamily: 'Kanit',
                              fontSize: 13,
                              color: Colors.grey.shade600),
                        ),
                        Text(
                          'ไม่จำกัด',
                          style: TextStyle(
                              fontFamily: 'Kanit',
                              fontSize: 13,
                              color: Colors.grey.shade600),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
