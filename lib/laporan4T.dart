import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tryhard/homepage.dart';
import 'dart:io';

import 'package:tryhard/laporan2T.dart';
import 'package:tryhard/laporan3T.dart';
import 'package:tryhard/laporan5T.dart';

class Laporan4Page extends StatefulWidget {
  const Laporan4Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<Laporan4Page> {
  File? _image;

  Future getImage(ImageSource src) async {
    var image = await ImagePicker().pickImage(source: src);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Container(
              height: 120,
              width: 500,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100)),
                image: DecorationImage(
                    image: AssetImage("assets/images/walpaper3.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 60),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 10),
                              child: Text("LAPORAN",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white,
                                      fontSize: 50)),
                            )
                          ]),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Laporan3Page()));
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              margin: EdgeInsets.only(left: 80, top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "PULLSTRAP/SCLAMP DI TIANG",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 500,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 20, bottom: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // ignore: unnecessary_null_comparison
                      _image == null
                          ? IconButton(
                              icon: Icon(Icons.add_a_photo),
                              onPressed: () {
                                //getImage();
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SimpleDialog(
                                        title: Text("Camera/Galery"),
                                        children: <Widget>[
                                          SimpleDialogOption(
                                            onPressed: () async {
                                              Navigator.pop(context);
                                              getImage(ImageSource.gallery);
                                            },
                                            child:
                                                const Text("Pick From Gallery"),
                                          ),
                                          SimpleDialogOption(
                                            onPressed: () async {
                                              Navigator.pop(context);
                                              getImage(ImageSource.camera);
                                            },
                                            child:
                                                const Text("Pick From Camera"),
                                          )
                                        ],
                                      );
                                    });
                              },
                            )
                          : Image.file(_image!)
                    ],
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(80.0),
            child: GestureDetector(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'LANJUT',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40), color: Colors.red),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Laporan5Page()));
              },
            ),
          ),
        ],
      ),
    )));
  }
}
