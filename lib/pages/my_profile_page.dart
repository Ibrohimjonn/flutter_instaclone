import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instaclone/model/post_model.dart';
import 'package:flutter_instaclone/services/auth_service.dart';
import 'package:image_picker/image_picker.dart';


class MyProfile extends StatefulWidget {
  const MyProfile({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  int axisCount = 1;

  List<Post> items = [];

  String post_img1 =
      "https://cdn.pixabay.com/photo/2021/07/14/19/18/woman-6466907_960_720.jpg";
  String post_img2 =
      "https://cdn.pixabay.com/photo/2021/07/28/20/39/penguin-6503804_960_720.jpg";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items.add(Post(
        postImage: post_img1,
        caption: "Discover more great images on your sponsor's site"));
    items.add(Post(
        postImage: post_img1,
        caption: "Discover more great images on your sponsor's site"));
    items.add(Post(
        postImage: post_img1,
        caption: "Discover more great images on your sponsor's site"));
    items.add(Post(
        postImage: post_img1,
        caption: "Discover more great images on your sponsor's site"));
    items.add(Post(
        postImage: post_img1,
        caption: "Discover more great images on your sponsor's site"));
    items.add(Post(
        postImage: post_img1,
        caption: "Discover more great images on your sponsor's site"));
    items.add(Post(
        postImage: post_img1,
        caption: "Discover more great images on your sponsor's site"));
    items.add(Post(
        postImage: post_img1,
        caption: "Discover more great images on your sponsor's site"));
    items.add(Post(
        postImage: post_img2,
        caption: "Discover more great images on your sponsor's site"));
    items.add(Post(
        postImage: post_img2,
        caption: "Discover more great images on your sponsor's site"));
    items.add(Post(
        postImage: post_img2,
        caption: "Discover more great images on your sponsor's site"));
    items.add(Post(
        postImage: post_img2,
        caption: "Discover more great images on your sponsor's site"));
    items.add(Post(
        postImage: post_img2,
        caption: "Discover more great images on your sponsor's site"));
    items.add(Post(
        postImage: post_img2,
        caption: "Discover more great images on your sponsor's site"));
    items.add(Post(
        postImage: post_img2,
        caption: "Discover more great images on your sponsor's site"));
    items.add(Post(
        postImage: post_img2,
        caption: "Discover more great images on your sponsor's site"));
    items.add(Post(
        postImage: post_img2,
        caption: "Discover more great images on your sponsor's site"));
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Profile',
            style: TextStyle(
                color: Colors.black, fontFamily: 'Billabong', fontSize: 25),
          ),
          actions: [
            IconButton(
              onPressed: (){
                AuthService.signOutUser(context);
              },
              icon: Icon(Icons.exit_to_app,color: Colors.black87,),
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  // #myphoto
                  GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: Stack(
                      children: [
                         Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              border: Border.all(
                                  width: 1.5, color: Color.fromRGBO(245, 96, 64, 1)),
                            ),
                            child:
                            ClipRRect(
                              borderRadius: BorderRadius.circular(35),
                              child: imagePath == null
                                ? Image(
                                image: AssetImage('assets/images/pr_person.png'),
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              ): Stack(
                                children: [
                                  Image.file(File(imagePath),width: 70,height: 70,fit: BoxFit.cover,),
                                ],
                              ),
                            ),
                          ),

                        Container(
                          height: 80,
                          width: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.add_circle,
                                color: Colors.purple,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // #myinfos
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Ibrokhim'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Ibrokhimjon@gmail.com',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),

                  Container(
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('23',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                              SizedBox(width: 3,),
                              Text('POSTS',style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.normal),),
                            ],
                          ),
                        ),
                        Container(width: 1,height: 20,color: Colors.grey.withOpacity(0.5),),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('100mil',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                              SizedBox(width: 3,),
                              Text('Followers',style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.normal),),
                            ],
                          ),
                        ),
                        Container(width: 1,height: 20,color: Colors.grey.withOpacity(0.5),),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('97',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                              SizedBox(width: 3,),
                              Text('Following',style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.normal),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  axisCount = 1;
                                });
                              },
                              icon: Icon(Icons.list_alt),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  axisCount = 2;
                                });
                              },
                              icon: Icon(Icons.grid_view),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: axisCount),
                      itemCount: items.length,
                      itemBuilder: (ctx,index){
                        return _itemOfPost(items[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }

  Widget _itemOfPost(Post post){
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Expanded(
            child: CachedNetworkImage(
              width: double.infinity,
              imageUrl: post.postImage,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

}
