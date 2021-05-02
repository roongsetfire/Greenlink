import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  double screenheight;
  double screenwidth;
  String text = 'คลิกไอคอนด้านซ้ายเพื่อเลือกที่อยู่';
  String textlatlng = '';
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // กดข้างนอกเพื่อออกจากแป้นพิม
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  height: screenheight * 0.225,
                  decoration: BoxDecoration(boxShadow: [
                    //วาดเงาของรูปหญ้าข้างบน
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: Offset(0, 10),
                    )
                  ]),
                  child: AppBar(
                    flexibleSpace: Image(
                      image: AssetImage('images/house.jpg'),
                      fit: BoxFit.fill,
                    ),
                    leading: new IconButton(
                      icon: new Icon(Icons.arrow_back_ios_rounded,
                          color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    //You can make this transparent
                    elevation: 10.0,
                  ),
                ),
              ),
              //ใส่แต่ละ widget แบบเลือกตำแหน่ง
              Positioned(
                  top: 140,
                  left: 70,
                  child: Container(
                      padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: Offset(0, 3),
                            )
                          ],
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Text(
                        "สมัครใช้บริการเก็บขยะ",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Kanit'),
                      ))),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 220, 0, 0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.account_circle_rounded,
                        size: 130,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //ชื่อ-นามสกุล
                        TextFormField(
                          autofocus: false,
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.normal),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.account_circle_outlined,
                              size: 40,
                            ),
                            hintText: 'ชื่อ-นามสกุล',
                            hintStyle:
                                TextStyle(fontSize: 16, fontFamily: 'Kanit'),
                            contentPadding: EdgeInsets.only(left: 20),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                          ),
                        ),
                        //เพศ-เดือนเกิด-ปีเกิด
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: screenwidth * 0.35,
                              margin: EdgeInsets.only(top: 20),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                autofocus: false,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.normal),
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.cake_outlined,
                                    size: 40,
                                  ),
                                  hintText: 'เพศ',
                                  hintStyle: TextStyle(
                                      fontSize: 16, fontFamily: 'Kanit'),
                                  contentPadding: EdgeInsets.only(left: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                ),
                              ),
                            ),
                            Container(
                              width: screenwidth * 0.2,
                              margin: EdgeInsets.only(top: 20),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                autofocus: false,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.normal),
                                decoration: InputDecoration(
                                  hintText: 'เดือนเกิด',
                                  hintStyle: TextStyle(
                                      fontSize: 16, fontFamily: 'Kanit'),
                                  contentPadding: EdgeInsets.only(left: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                ),
                              ),
                            ),
                            Container(
                              width: screenwidth * 0.25,
                              margin: EdgeInsets.only(top: 20),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                autofocus: false,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.normal),
                                decoration: InputDecoration(
                                  hintText: 'ปีเกิด(พศ.)',
                                  hintStyle: TextStyle(
                                      fontSize: 16, fontFamily: 'Kanit'),
                                  contentPadding: EdgeInsets.only(left: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        //email
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            autofocus: false,
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.email_outlined,
                                size: 40,
                              ),
                              hintText: 'email@greenlink.com',
                              hintStyle:
                                  TextStyle(fontSize: 16, fontFamily: 'Kanit'),
                              contentPadding: EdgeInsets.only(left: 20),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                            ),
                          ),
                        ),
                        // Phone number
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            autofocus: false,
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.phone_android_outlined,
                                size: 40,
                              ),
                              hintText: 'เบอร์โทรศัพท์',
                              hintStyle:
                                  TextStyle(fontSize: 16, fontFamily: 'Kanit'),
                              contentPadding: EdgeInsets.only(left: 20),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                            ),
                          ),
                        ),

                        Column(
                          children: [
                            // address
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                minLines: 3,
                                maxLines: null,
                                autofocus: false,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.normal),
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.location_city_rounded,
                                    size: 40,
                                  ),
                                  hintText: 'รายละเอียดที่อยู่',
                                  hintStyle: TextStyle(
                                      fontSize: 16, fontFamily: 'Kanit'),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 10, 10, 20),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                ),
                              ),
                            ),
                            //zip code
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: screenwidth * 0.33,
                                  margin: EdgeInsets.fromLTRB(55, 20, 0, 0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    autofocus: false,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Kanit',
                                        fontWeight: FontWeight.normal),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(5)
                                    ],
                                    decoration: InputDecoration(
                                      hintText: 'รหัสไปรษณีย์',
                                      hintStyle: TextStyle(
                                          fontSize: 16, fontFamily: 'Kanit'),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      filled: true,
                                    ),
                                  ),
                                ),
                                //แขวง
                                Container(
                                  width: screenwidth * 0.33,
                                  margin: EdgeInsets.only(top: 20),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    autofocus: false,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Kanit',
                                        fontWeight: FontWeight.normal),
                                    decoration: InputDecoration(
                                      hintText: 'แขวง',
                                      hintStyle: TextStyle(
                                          fontSize: 16, fontFamily: 'Kanit'),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //เขต
                                Container(
                                  width: screenwidth * 0.33,
                                  margin: EdgeInsets.fromLTRB(55, 20, 0, 0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    autofocus: false,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Kanit',
                                        fontWeight: FontWeight.normal),
                                    decoration: InputDecoration(
                                      hintText: 'เขต',
                                      hintStyle: TextStyle(
                                          fontSize: 16, fontFamily: 'Kanit'),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      filled: true,
                                    ),
                                  ),
                                ),
                                //จังหวัด
                                Container(
                                  width: screenwidth * 0.33,
                                  margin: EdgeInsets.only(top: 20),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    autofocus: false,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Kanit',
                                        fontWeight: FontWeight.normal),
                                    decoration: InputDecoration(
                                      hintText: 'จังหวัด',
                                      hintStyle: TextStyle(
                                          fontSize: 16, fontFamily: 'Kanit'),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //จุดสังเกตบริเวณบ้าน
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            autofocus: false,
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.wb_incandescent_sharp,
                                size: 40,
                              ),
                              hintText: 'จุดสังเกตบริเวณบ้าน',
                              hintStyle:
                                  TextStyle(fontSize: 16, fontFamily: 'Kanit'),
                              contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                            ),
                          ),
                        ),
                        //ตำแหน่งที่อยู่
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: TextFormField(
                            controller: TextEditingController(text: textlatlng),
                            autofocus: false,
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                              icon: InkWell(
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    size: 40,
                                  ),
                                  onTap: () {
                                    //คลิกไอคอนแล้วรอแผนที่
                                    _awaitmap(context);
                                  }),
                              hintText: text,
                              hintStyle:
                                  TextStyle(fontSize: 16, fontFamily: 'Kanit'),
                              contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                            ),
                          ),
                        ),
                        //ปุ่มบันทึก
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          height: screenheight * 0.06,
                          width: screenwidth * 0.4,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              enableFeedback: true,
                              primary: Color.fromRGBO(5, 0, 255, 1),
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
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double size) {
    return SizedBox(
      height: screenheight * size,
      width: screenwidth * size,
    );
  }

  void _awaitmap(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.pushNamed(context, '/MapSignUp');
    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      textlatlng = result;
    });
  }
}
