//import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';
import "dart:convert";
import 'main.dart';

class ye{}
class tt extends StatelessWidget {
  //const tt({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home:Scaffold(body:_Api()),);
  }
}

List<Post> postFromJson(String str)=> List<Post>.from(json.decode(str).map((x)=>Post.fromJson(x)));
String postToJson(List<Post>data) => json.encode(List<dynamic>.from(data.map((x2) => x2.toJson())));
//List<void>

class Post{
  ///constarctor
  Post({
    //?required
    @required this.userId,
    @required this.id,
    @required this.title,
    @required this.body,
  });

int userId;
int id;
String title;
String body;

factory Post.fromJson(Map<String,dynamic> json)=> Post(
  userId:json[""],
  id:json[""],
  title:json[""],
  body:json[""],

 );

Map<String,dynamic> toJson()=>{
  //userId: json[""],
  "userId":userId, //json[""],
  "id":id,
  "title":title,
  "body":body,

  };
}
List<Post>posts=List as List<Post>;
//List<Post>? posts;
class RemoteService{
  Future<List<Post>> getPosts()async{
    var client = http.Client();

    var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response =await client.get(uri);

    if(response.statusCode==200){
      var json = response.body;
      print(json);
      return postFromJson(json);
    }
  }
}
bool f=true;
var a =null;
///Image.asset("")
//Image(image:Image.asset(""))

class _Api extends StatefulWidget {

  @override
  Api createState() => Api();
}

class Api extends State<_Api> {
  Api(){
    super.initState();
    getData();
  }

  getData()async{
    posts=await RemoteService().getPosts();
    if(posts != null){
      setState(() {
        f=true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child:Visibility(
        visible:f,
        child:ListView.builder(
          itemCount:10,
          itemBuilder:(BuildContext context,int index){
            return Container(
              color: Colors.white,
               child:ListTile(
                  title:Text(""),//posts[index].title),
                  subtitle:Text("hhh"),
                  leading:Container(
                    decoration:BoxDecoration(
                    shape:BoxShape.circle,
                    //image:AssetImage(""),
                  ),child:Image.asset("")),

               ));
          }
      ),replacement:CircularProgressIndicator(),

    ),);
  }
}