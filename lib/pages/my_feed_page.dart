import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_instaclone/model/post_model.dart';

class MyFeed extends StatefulWidget {

  MyFeed({this.pageController});

   PageController pageController;

  @override
  _MyFeedState createState() => _MyFeedState();
}

class _MyFeedState extends State<MyFeed> {
  List<Post> items = new List();

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
        postImage: post_img2,
        caption: "Discover more great images on your sponsor's site"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Instagram",
          style: TextStyle(
              color: Colors.black, fontFamily: "Billabong", fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {
              widget.pageController.animateToPage(2, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
            },
            icon: Icon(
              Icons.camera_alt,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (ctx, index) {
            return _itemOfPost(items[index]);
          }),
    );
  }

  Widget _itemOfPost(Post post) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage('assets/images/pr_person.png'),
                        height: 40,
                        width: 40,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'July 30, 2021',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz_rounded),
                ),
              ],
            ),
          ),
          //Image.network(post.postImage, fit: BoxFit.cover,),
          
          CachedNetworkImage(
              imageUrl: post.postImage,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(FontAwesome.heart),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.share_outlined),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                text: "${post.caption}",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
