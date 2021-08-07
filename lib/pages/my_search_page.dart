import 'package:flutter/material.dart';
import 'package:flutter_instaclone/model/user_model.dart';

class MySearch extends StatefulWidget {
  const MySearch({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MySearchState createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {

  var searchController = TextEditingController();
  List<User> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items.add(User(fullname: 'Ibrokhim', email: 'ibrokhimjon@gmail.com'));
    items.add(User(fullname: 'Ibrokhim', email: 'ibrokhimjon@gmail.com'));
    items.add(User(fullname: 'Ibrokhim', email: 'ibrokhimjon@gmail.com'));
    items.add(User(fullname: 'Ibrokhim', email: 'ibrokhimjon@gmail.com'));
    items.add(User(fullname: 'Ibrokhim', email: 'ibrokhimjon@gmail.com'));
    items.add(User(fullname: 'Ibrokhim', email: 'ibrokhimjon@gmail.com'));
    items.add(User(fullname: 'Ibrokhim', email: 'ibrokhimjon@gmail.com'));
    items.add(User(fullname: 'Ibrokhim', email: 'ibrokhimjon@gmail.com'));
    items.add(User(fullname: 'Ibrokhim', email: 'ibrokhimjon@gmail.com'));
    items.add(User(fullname: 'Ibrokhim', email: 'ibrokhimjon@gmail.com'));
    items.add(User(fullname: 'Ibrokhim', email: 'ibrokhimjon@gmail.com'));
    items.add(User(fullname: 'Ibrokhim', email: 'ibrokhimjon@gmail.com'));
    items.add(User(fullname: 'Ibrokhim', email: 'ibrokhimjon@gmail.com'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Search',style: TextStyle(color: Colors.black,fontFamily: 'Billabong',fontSize: 25),),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 20,left: 20),
        child: Column(
          children: [
            // #search
            Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              margin: EdgeInsets.only(bottom: 10),
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(7),
              ),
              child: TextField(
                controller: searchController,
                onChanged: (input){
                  print(input);
                },
                style: TextStyle(
                  color: Colors.black87,
                ),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (ctx,index){
                  return _itemOfUser(items[index]);
                },
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget _itemOfUser(User user){
    return Container(
      height: 90,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70),
              border: Border.all(width: 1.5,color: Color.fromRGBO(245, 96, 64, 1)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22.5),
              child: Image(
                image: AssetImage('assets/images/pr_person.png'),
                height: 45,
                width: 45,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(width: 15,),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.fullname,style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 3,),
              Text(user.email,style: TextStyle(color: Colors.black54),)
            ],
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(width: 1,color: Colors.grey),
                  ),
                  child: Center(
                    child: Text('Follow'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
