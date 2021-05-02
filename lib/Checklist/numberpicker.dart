import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class PickNumber extends StatefulWidget {
  final VoidCallback onPressed;
  PickNumber({this.onPressed});
  @override
  _PickNumberState createState() => _PickNumberState();
}

class _PickNumberState extends State<PickNumber> {
  int _currentIntValue = 1000;
  List<int> pickedNumber = [];
  int remaining = 5;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(height: 16),
      Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Text('กรุณาเลือกหมายเลข',
            style: TextStyle(
              fontFamily: 'Kanit',
              fontSize: 24,
              color: Colors.lightGreen.shade700,
            )),
      ),
      // เลือกหมายเลข
      NumberPicker(
        value: _currentIntValue,
        minValue: 1000,
        maxValue: 9990,
        step: 31,
        haptics: true,
        selectedTextStyle: (pickedNumber.contains(_currentIntValue))
            ? TextStyle(color: Colors.red, fontFamily: 'Kanit', fontSize: 28)
            : TextStyle(
                color: Colors.lightGreen, fontFamily: 'Kanit', fontSize: 28),
        textStyle: TextStyle(
            color: Colors.grey.shade400, fontFamily: 'Kanit', fontSize: 18),
        onChanged: (value) => setState(() => _currentIntValue = value),
      ),
      //แถบแสดงปุ่ม + -
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.remove,
              color: Colors.grey.shade600,
            ),
            onPressed: () => setState(() {
              final newValue = _currentIntValue - 31;
              _currentIntValue = newValue.clamp(1000, 9990);
            }),
          ),
          Text(
            'หมายเลขปัจจุบัน : $_currentIntValue',
            style: TextStyle(
                fontFamily: 'Kanit', fontSize: 18, color: Colors.grey.shade500),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.grey.shade600,
            ),
            onPressed: () => setState(() {
              final newValue = _currentIntValue + 31;
              _currentIntValue = newValue.clamp(1000, 9990);
            }),
          ),
        ],
      ),
      //ปุ่ม เลือกหมายเลขนี้
      ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)))),
          onPressed: () {
            // widget.onPressed();
            setState(() {
              if (!(pickedNumber.contains(_currentIntValue)) &&
                  remaining >= 0) {
                pickedNumber.add(_currentIntValue);
                remaining -= 1;
              }
            });

            print(pickedNumber);
          },
          child: Text(
            'เลือกหมายเลขนี้',
            style: TextStyle(fontFamily: 'Kanit', fontSize: 16),
          )),
      //ส่วนล่างเป็นรายการหมายเลขที่เลือก
      Container(
          margin: EdgeInsets.fromLTRB(20, 15, 0, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'หมายเลขที่คุณเลือก',
                    style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 20,
                        color: Colors.grey.shade600),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'คงเหลือ $remaining สิทธิ',
                    style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 14,
                        color: Colors.indigo),
                  ),
                ],
              ),
            ],
          )),
      // listview รายการเลขที่เลือก ถ้าไม่มีจะแสดงว่าไม่มีรายการที่เลือก
      Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 30),
        padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: (pickedNumber.length == 0)
            ? Container(
                margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Text('ไม่มีหมายเลขที่เลือก',
                    style: TextStyle(
                      fontFamily: 'Kanit',
                      color: Colors.lightGreen,
                      fontSize: 20,
                    )),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: pickedNumber.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          pickedNumber[index].toString(),
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontFamily: 'Kanit',
                              fontSize: 20),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              pickedNumber.removeAt(index);
                              remaining += 1;
                            });
                          },
                          child: Text(
                            'ลบ',
                            style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Kanit',
                                fontSize: 18,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
      ),
      // เช็คว่ามีรายการที่เลือกมั้ย ถ้ามีให้โชว์ปุ่มบันทึก ถ้าไม่มีจะไม่แสดงปุ่มออกมา
      (pickedNumber.length == 0)
          ? Container()
          : Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.fromLTRB(25, 10, 25, 10)),
                          backgroundColor: MaterialStateProperty.all(
                              Colors.blueAccent.shade400),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      onPressed: () {
                        widget.onPressed();
                        setState(() {
                          //ถ้ารายการที่เลือกไม่เคยเลือกมาก่อน และ เรายังมีจำนวนสิทธิ์เหลือ
                          if (!(pickedNumber.contains(_currentIntValue)) &&
                              remaining >= 0) {
                            pickedNumber.add(_currentIntValue);
                            remaining -= 1;
                          }
                        });

                        print(pickedNumber);
                      },
                      child: Text(
                        'บันทึก',
                        style: TextStyle(fontFamily: 'Kanit', fontSize: 20),
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.fromLTRB(25, 10, 25, 10)),
                          backgroundColor: MaterialStateProperty.all(
                              Colors.redAccent.shade200),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      onPressed: () {
                        setState(() {
                          remaining += pickedNumber.length;
                          pickedNumber = [];
                        });

                        print(pickedNumber);
                      },
                      child: Text(
                        'ยกเลิก',
                        style: TextStyle(fontFamily: 'Kanit', fontSize: 20),
                      )),
                ],
              ),
            )
    ]);
  }
}
