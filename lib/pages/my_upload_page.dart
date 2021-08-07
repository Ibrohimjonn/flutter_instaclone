import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyUpload extends StatefulWidget {

  PageController pageController;

  MyUpload({this.pageController});

  @override
  _MyUploadState createState() => _MyUploadState();
}

class _MyUploadState extends State<MyUpload> {
  var captionController = TextEditingController();

  String imagePath = "";
  final picker = ImagePicker();

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Pick Photo'),
                      onTap: () async{
                        final pickedFile = await picker.getImage(source: ImageSource.gallery);
                        if(pickedFile != null){
                          setState(() {
                            imagePath = pickedFile.path;
                          });
                        }
                        Navigator.pop(context);
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Take Photo'),
                    onTap: () async{
                      final pickedFile = await picker.getImage(source: ImageSource.camera);
                      if(pickedFile != null){
                        setState(() {
                          imagePath = pickedFile.path;
                        });
                      }
                      Navigator.pop(context);
                    }
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  _uploadNewPost(){
    String caption =captionController.text.toString().trim();
    if(caption.isEmpty) return;
    if(imagePath == null) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Upload',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Billabong',
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              widget.pageController.animateToPage(0, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
              _uploadNewPost();
            },
            icon: Icon(
              Icons.post_add,
              color: Color.fromRGBO(245, 96, 64, 1),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              GestureDetector(
               onTap: (){
                 _showPicker(context);
               },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width,
                  color: Colors.grey.withOpacity(0.4),
                  child: imagePath == null
                      ? Center(
                          child: Icon(
                            Icons.add_a_photo,
                            size: 60,
                            color: Colors.grey,
                          ),
                        )
                      : Stack(
                          children: [
                            Image.file(File(imagePath),width: double.infinity,height: double.infinity,fit: BoxFit.cover,),
                          ],
                        ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: TextField(
                  controller: captionController,
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: 'Caption',
                      hintStyle:
                          TextStyle(fontSize: 17.0, color: Colors.black38)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
