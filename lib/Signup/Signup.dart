import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  double screenheight;
  double screenwidth;
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                height: screenheight * 0.225,
                decoration: BoxDecoration(boxShadow: [
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
                      TextFormField(
                        autofocus: true,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: screenwidth * 0.35,
                            margin: EdgeInsets.only(top: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              autofocus: false,
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
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
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
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
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
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              minLines: 3,
                              maxLines: null,
                              autofocus: false,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: screenwidth * 0.35,
                                margin: EdgeInsets.fromLTRB(55, 20, 0, 0),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    hintText: 'รหัสไปรษณีย์',
                                    hintStyle: TextStyle(
                                        fontSize: 16, fontFamily: 'Kanit'),
                                    contentPadding: EdgeInsets.only(left: 20),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    filled: true,
                                  ),
                                ),
                              ),
                              Container(
                                width: screenwidth * 0.35,
                                margin: EdgeInsets.only(top: 20),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    hintText: 'แขวง',
                                    hintStyle: TextStyle(
                                        fontSize: 16, fontFamily: 'Kanit'),
                                    contentPadding: EdgeInsets.only(left: 20),
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
                              Container(
                                width: screenwidth * 0.35,
                                margin: EdgeInsets.fromLTRB(55, 20, 0, 0),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    hintText: 'เขต',
                                    hintStyle: TextStyle(
                                        fontSize: 16, fontFamily: 'Kanit'),
                                    contentPadding: EdgeInsets.only(left: 20),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    filled: true,
                                  ),
                                ),
                              ),
                              Container(
                                width: screenwidth * 0.35,
                                margin: EdgeInsets.only(top: 20),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    hintText: 'จังหวัด',
                                    hintStyle: TextStyle(
                                        fontSize: 16, fontFamily: 'Kanit'),
                                    contentPadding: EdgeInsets.only(left: 20),
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
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.photo_camera_outlined,
                              size: 40,
                            ),
                            hintText: 'ภาพถ่ายหน้าบ้านหรือจุดสังเกต',
                            hintStyle:
                                TextStyle(fontSize: 16, fontFamily: 'Kanit'),
                            contentPadding: EdgeInsets.only(left: 20),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                            icon: InkWell(
                              child: Icon(
                                Icons.location_on_outlined,
                                size: 40,
                              ),
                              onTap: () {},
                            ),
                            hintText: 'ตำแหน่งบนแผนที่',
                            hintStyle:
                                TextStyle(fontSize: 16, fontFamily: 'Kanit'),
                            contentPadding: EdgeInsets.only(left: 20),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        height: screenheight * 0.06,
                        width: screenwidth * 0.4,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              enableFeedback: true,
                              primary: Color.fromRGBO(5, 0, 255, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              padding: EdgeInsets.all(12)),
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
    );
  }

  SizedBox buildSizedBox(double size) {
    return SizedBox(
      height: screenheight * size,
      width: screenwidth * size,
    );
  }
}
