import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginFirstPage extends StatefulWidget {
  @override
  _LoginFirstPageState createState() => _LoginFirstPageState();
}

class _LoginFirstPageState extends State<LoginFirstPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //checkbox (remember me)
  bool checkbox = false;

  // for inspect form with global key
  final _formkey = GlobalKey<FormState>();

  //define screen
  double screenheight;
  double screenwidth;

  //draw widget
  @override
  Widget build(BuildContext context) {
    //set height of screen
    screenheight = MediaQuery.of(context).size.height;
    screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //       begin: Alignment.topCenter,
        //       end: Alignment.bottomCenter,
        //       colors: [Colors.white12, Colors.green.shade300]),
        // ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  backgroundImage(),
                  imageLogo(),
                ],
              ),
              Container(
                height: screenheight * 0.72,
                decoration: BoxDecoration(color: Colors.lightGreen.shade200),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                  child: Column(
                    children: [
                      //เข้าสู่ระบบหรือลงทะเบียน
                      buildtextsignup(),
                      buildSizedBox(0.01),

                      //continue with facebook
                      facebookSignin(),
                      buildSizedBox(0.01),

                      //continue with apple
                      appleSignin(),
                      buildSizedBox(0.01),

                      //continue with google
                      googleSignin(),

                      //ตรงส่วนนี้เป็นขีดยาวคำว่า or
                      Column(children: [
                        buildSizedBox(0.01),
                        orLabel(),
                      ]),

                      //email and password textfield
                      emailAndpasswordForm(),

                      // forgot password
                      Align(
                        child: forgotLabel(),
                        alignment: Alignment.centerLeft,
                      ),

                      // Checkbox remember me and login button
                      checkboxAndloginbutton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  //ใส่รูป background หลัง logo
  Container backgroundImage() {
    return Container(
        height: screenheight * 0.28,
        color: Colors.lightGreen.shade200,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
            image: DecorationImage(
              image: ExactAssetImage('images/grass.jpg'),
              fit: BoxFit.fill,
            ),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.5),
            //     spreadRadius: 1,
            //     blurRadius: 8,
            //     offset: Offset(0, 10),
            //   )
            // ]),
            // child: BackdropFilter(
            //     filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            //     child: Container(
            //       decoration: BoxDecoration(color: Colors.white10.withOpacity(0)),
            //     )),
          ),
        ));
  }

  //ใส่รูป LogoGreenLink จ้า
  Center imageLogo() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: screenheight * 0.045),
        height: screenheight * 0.22,
        width: screenwidth * 0.45,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow.shade300, width: 2),
            image: DecorationImage(
                image: AssetImage(
                  'images/greenlinknewLOGO.jpg',
                ),
                fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Colors.yellow.withOpacity(0.5),
                spreadRadius: 7,
                blurRadius: 3,
              )
            ]),
      ),
    );
  }

  //ส่วนนี้เป็น checkbox remember me and login button
  Row checkboxAndloginbutton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: screenwidth * 0.05,
              child: Checkbox(
                activeColor: Colors.green.shade600,
                value: checkbox,
                onChanged: (value) {
                  setState(() {
                    checkbox = value;
                  });
                },
              ),
            ),
            buildSizedBox(0.02),
            Text('Remember me'),
          ],
        ),
        Container(width: screenwidth * 0.3, child: loginButton())
      ],
    );
  }

  //รวมทั้ง email and password
  Form emailAndpasswordForm() {
    return Form(
      key: _formkey,
      child: Column(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Email address",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        buildSizedBox(0.01),
        email(),
        buildSizedBox(0.02),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Password",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        buildSizedBox(0.01),
        password(),
      ]),
    );
  }

  //login ผ่าน google
  ButtonTheme googleSignin() {
    return ButtonTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Container(
        width: screenwidth * 0.75,
        height: screenheight * 0.05,
        child: SignInButton(
          Buttons.Google,
          text: "Continue with Google",
          onPressed: () {},
        ),
      ),
    );
  }

  //login ผ่าน apple
  ClipRRect appleSignin() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: screenwidth * 0.75,
        height: screenheight * 0.05,
        child: SignInButton(
          Buttons.AppleDark,
          text: "Continue with Apple",
          onPressed: () {},
        ),
      ),
    );
  }

  //login ผ่าน facebook
  ClipRRect facebookSignin() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: screenwidth * 0.75,
        height: screenheight * 0.05,
        child: SignInButton(
          Buttons.FacebookNew,
          text: "Continue with Facebook",
          onPressed: () {},
        ),
      ),
    );
  }

  //เข้าสู่ระบบหรือลงทะเบียน
  Row buildtextsignup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 3),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.black, width: 1))),
          child: Text(
            "เข้าสู่ระบบ หรือ",
            style: TextStyle(color: Colors.black, fontFamily: 'Kanit'),
          ),
        ),
        signup(),
      ],
    );
  }

  //กำหนด sizebox เพื่อเพิ่มช่องว่างระหว่าง widget
  SizedBox buildSizedBox(double size) {
    return SizedBox(
      height: screenheight * size,
      width: screenwidth * size,
    );
  }

  // Text กด 'ลงทะเบียน'
  Widget signup() {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, '/SignUp'),
      child: Container(
        padding: EdgeInsets.only(bottom: 3),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black, width: 1))),
        child: Text(
          "ลงทะเบียน",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontFamily: 'Kanit'),
        ),
      ),
    );
  }

  // -- or --
  Widget orLabel() {
    return Row(children: [
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 20.0),
            child: Divider(
              color: Colors.black,
              height: 36,
            )),
      ),
      Text(
        "OR",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 20.0, right: 10.0),
            child: Divider(
              color: Colors.black,
              height: 36,
            )),
      ),
    ]);
  }

  //ส่วนนี้ประกาศช่องกรอก email
  Widget email() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please fill your email or username';
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: 'Email address',
          hintStyle: TextStyle(fontSize: 14),
          contentPadding: EdgeInsets.only(left: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          fillColor: Colors.lightGreen.shade100,
          filled: true,
          suffixIcon: Icon(Icons.account_circle_outlined)),
    );
  }

  //ส่วนนี้ประกาศช่องกรอก password
  Widget password() {
    return TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please fill your password';
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(fontSize: 14),
          contentPadding: EdgeInsets.only(left: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          fillColor: Colors.lightGreen.shade100,
          filled: true,
          suffixIcon: Icon(Icons.lock_open)),
    );
  }

  //ปุ่ม forgot password
  Widget forgotLabel() {
    return TextButton(
      onPressed: () {},
      child: Text("Forgot your password?",
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.grey.shade600)),
    );
  }

  //ปุ่ม login
  Widget loginButton() {
    return ElevatedButton(
      onPressed: () {
        // if (_formkey.currentState.validate()) {
        Navigator.pushNamedAndRemoveUntil(context, '/Checklist1', (_) => false);
        // }

        // setState(() {
        //   if (_formkey.currentState.validate()) {
        //     print("Validations are correct.");
        //   }
        // });
      },
      style: ElevatedButton.styleFrom(
          enableFeedback: true,
          primary: Colors.green.shade800,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          padding: EdgeInsets.all(12)),
      child: Text(
        "LOG IN",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
