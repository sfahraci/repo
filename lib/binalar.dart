
import 'package:binamodapp/lib/chard.dart';
import 'package:binamodapp/lib/mapPage.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(

  ));
}

class BinalarPage extends StatefulWidget {
  @override
  _BinalarPageState createState() => _BinalarPageState();
}

class _BinalarPageState extends State<BinalarPage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        barrierDismissible: true,

        context: context,
        builder: (context) {
          final TextEditingController _textEditingControler =
              TextEditingController();
          return AlertDialog(
              backgroundColor: const Color(0xfff4f4f4),
              content: Container(
                width: 500,
                height: 100,
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                hintText: "Bina Adı Giriniz"

                        ),
                            controller: _textEditingControler,
                            validator: (value) {
                              return value!.isNotEmpty ? null : "Bina Adı Giriniz";
                            },
                          ),
                        ),
                      ],
                    )),
              ),
              actions: <Widget>[
                Center(
                  child: Container(
                    height: 35,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: Colors.white
                    ),
                    borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Ekle",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
                        ),)),
                  ),
                )
                //Ekle Butonu
              ]);
        });
  }             //------>InformationDialog

  Future<void> packageInformationDialog(BuildContext context) async {
    return await showDialog(
        barrierDismissible: true,


        context: context,
        builder: (context) {

          return AlertDialog(
              backgroundColor: const Color(0xfff4f4f4),

            content: Container(

              margin: EdgeInsets.only(bottom: 5),
              width: 400,
              height: 400,
              child: Form(
                  key: _formkey,
                  child: Column(
                    children: [

                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        elevation:20,
                        color: Colors.white,
                        child: ListTile(
                          leading: FlutterLogo(),
                          title: Text("Deprem Tehlikesi"),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => (MapPage())));
                            }


                        ),
                      ),                               //------>Deprem Tehlikesi
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        elevation:20,
                        color: Colors.white,
                        child: ListTile(
                          leading: FlutterLogo(),
                          title: Text("Bina Riski"),
                            onTap: () {

                            }
                        ),
                      ),                       //------>Bina Riski
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        elevation:20,
                        color: Colors.white,
                        child: ListTile(
                          leading: FlutterLogo(),
                          title: Text("Hasar Tespit"),
                        ),
                      ),                       //------>Hasar Tespit
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        elevation:20,
                        color: Colors.white,
                        child: ListTile(
                          leading: FlutterLogo(),
                          title: Text("Hızlı Deprem Performansı"),
                        ),
                      ),                       //------>Hızlı Deprem Performansı
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        elevation:20,
                        color: Colors.white,
                        child: ListTile(
                          leading: FlutterLogo(),
                          title: Text("Kapsamlı Deprem Persormansı"),
                        ),
                      ),                       //------>Kapsamlı Deprem Persormansı
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        elevation:20,
                        color: Colors.white,
                        child: ListTile(
                          leading: FlutterLogo(),
                          title: Text("Projelendirme"),
                        ),
                      ),                       //------>Projelendirme


                    ],
                  )),
            ),
            actions: <Widget>[
            ],
          );
        });

  }           //------>packageInformationDialog

  @override
  Widget build(BuildContext context) {
    var binalar = ["Evim", "Annemin Evi"];
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),),
        ),
        backgroundColor: Color.fromRGBO(244, 42, 42, 75),
        toolbarHeight: 240,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Column(
            children: [

              Container(
              padding: EdgeInsets.only(right: 145, left: 145, top: 20, bottom: 20),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text('K',
                      style: TextStyle(fontSize: 80, color: Colors.black,
                            fontFamily: 'Palatino Linotype',
                            fontWeight: FontWeight.bold
                        ),),
                )),
              ),

              Container(
                child: Text("Kurtuluş\nAtasever",
                style: TextStyle(fontSize: 25,
                fontWeight: FontWeight.bold),),
              )
    ],
          ),
        ],
      ),                             //------>AppBar icon ve isim bilgisi
     body: Column(
        children: <Widget>[
          SizedBox(
            height: 35,
          ),
          Container(
            child: Center(
              child: Text("Binalar",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color.fromRGBO(244, 42, 42, 75),),),
            ),
            width: 288,
            height: 37,
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.circular(20),

            color: Colors.white,
          ),
          ),                    //------>Binalar başlığı
          SizedBox(
            height: 45,
          ),

          Expanded(
            child: ListView.builder(
                itemCount: binalar.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                   title: Text(binalar[index],
                   style: TextStyle(
                     fontSize: 20,
                     fontFamily: 'Roboto',
                     fontWeight: FontWeight.bold
                   ),),
                      onTap: () async {
              await packageInformationDialog(context,
              ); },


                  );

                }),
          ),                   //---->Listeleme
        ],
      ),
        floatingActionButton: Container(child: buildNavigateButton()),


    );
  }
  Widget buildNavigateButton() => FloatingActionButton(
        backgroundColor: Colors.grey,

        onPressed: () async {
          await showInformationDialog(context);
        },
        child: Icon(Icons.add,
        size: 45,

        ),
      );            //------>Bina Adı Ekleme Buttonu


}
