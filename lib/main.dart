import 'package:binamodapp/register_page.dart';
import 'package:flutter/material.dart';

import 'binalar.dart';

void main() => runApp(BinamodApp());

class BinamodApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Center(
                child: Container(
                  height: 184.0,
                  width: 184.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                  ),
                  child: Center(
                    child: Image.asset("images/logo.png"),
                  ),
                ),
              ),
            ), // Logo

            SizedBox(
              height: 52,
            ),
            Container(
              width: 330,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(35),
              ),
              margin: EdgeInsets.only(left: 22, right: 22),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Icon(
                      Icons.mail,
                      color: Color.fromRGBO(158, 158, 158, 1),
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  new Expanded(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "E-Mail",
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(170, 170, 170, 100)),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        isDense: true,
                      ),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ), //E-Mail kutucuğu
            SizedBox(
              height: 5,
            ),
            Container(
              width: 330,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(35),
              ),
              margin: EdgeInsets.only(left: 22, right: 22),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Icon(
                      Icons.vpn_key,
                      color: Color.fromRGBO(158, 158, 158, 1),
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  new Expanded(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(170, 170, 170, 100)),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        isDense: true,
                      ),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Icon(Icons.visibility,
                        color: Color.fromRGBO(158, 158, 158, 1)),
                  ),
                ],
              ),
            ), //Şifre kutucuğu
            Padding(
              padding: const EdgeInsets.only(left: 200),
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                },
                child: const Text(
                  'Şifremi Unuttum',
                  style: TextStyle(
                    color: Color.fromRGBO(100, 94, 94, 1),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 240.0,
              height: 65.0,
              child: new RaisedButton(
                color: Color.fromRGBO(0, 78, 152, 1),
                child: new Text('GİRİŞ',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BinalarPage()));

                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.5)),
              ),
            ), //Giriş butonu
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: const Text(
                  'Kayıt Ol',
                  style: TextStyle(
                    color: Color.fromRGBO(100, 94, 94, 1),
                  ),
                ),
              ),
            ), //Kayıt ol butonu

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Image.asset("images/icons/facebook.png"),
                  iconSize: 70,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Image.asset("images/icons/google.png"),
                  iconSize: 50,
                  onPressed: () {},
                ),
                IconButton(
                  padding: EdgeInsets.only(bottom: 10, left: 12),
                  icon: Image.asset("images/icons/apple.png"),
                  iconSize: 50,
                  onPressed: () {},
                ),
              ],
            ),  //Sosyal medya buttonları
          ],
        ),
      ),
    );
  }
}
