import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert" as convert;
//import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';
import "dart:convert";
import 'main.dart';

class Photo{
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;
  Photo({data}){

    albumId=data["albumId"];
    id = data["id"];
    title=data["title"];
    url=data["url"];
    thumbnailUrl=data["thumbnailUrl"];
  }
}


//List <photo> d= new List();
//Future <List<Post>> f=[];

class tt2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return //MaterialApp(
      //debugShowCheckedModeBanner:false,home:
      _Api2();
      //);
  }
}



class _Api2 extends StatefulWidget {
  //const _Api2({required Key key}) : super(key: key);
  @override
  Api2 createState() => Api2();
}
//List<> a=[];
class Api2 extends State<_Api2> {
  Api2(){
    super.initState();
    _setData();
  }
  //List <List<double>> photo =[];
  List <dynamic> photo =[];
  //Map<String,dynamic>photo;
  List <Photo> photos= List as List<Photo>;///new List();
  bool loading=false;
  bool networkError = false;

  void _setData()async{
    /*setState(() {
      loading=true;
      networkError=false;
    });*/
    try{
    var client = http.Client();
    var uri =Uri.parse("https://jsonplaceholder.typicode.com/photos");
    //var uri =Uri.parse("https://fakestoreapi.com/products/1");
    //var uri ="https://fakestoreapi.com/products/1";

    var response = await http.get(uri);
    //Map<String,dynamic>jsonData2 = jsonDecode(response.body);
    //print("$jsonData2 +1111111");
    //print("$jsonResponse +2222222");
    if(response.statusCode ==200){
      print("hello");
      var jsonResponse = convert.jsonDecode(response.body);
      //var jsonResponse = jsonDecode(response.body);
      //var jsonResponse = response.body;
      jsonResponse.forEach((element){
        photos.add(Photo(data:element));
      });
      ///photo = jsonResponse;
      //print("fff $jsonResponse");
      setState(() {
        //photo = jsonResponse;
        loading=true;
      });
    }
    }catch(e){
      print("network error ssssssssssssssssssss");
      setState(() {
        networkError =true;
        loading=false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    /*try{
      var x;
      var y;
      x=5;
      y="";
      x+y;
    }
    catch(e){
      print("error is $e");
    }*/

    return MaterialApp(debugShowCheckedModeBanner: false,
        home: Scaffold(body:
      Container(child:body())
      /*loading?//Visibility(
        //visible:f,
      Material(child:Container(child:
        ListView.builder(
            itemCount:10,
            itemBuilder:(BuildContext context,int index){
              var phot=photo[index];
              ///
              return Container(
                  color: Colors.white,
                  child:ListTile(
                    title:Text(""//phot["title"]//photo["id"].toString()
                    ),//posts[index].title),
                    subtitle:Text(photos[index].title),
                    leading:
                    Container(
                        decoration:BoxDecoration(
                          shape:BoxShape.circle,
                          //image:AssetImage(""),
                    ),child:Image.network("",//phot["thumbnailUrl"].toString(),
                        fit:BoxFit.fill),),
                    //CircleAvatar(radius:30,backgroundImage:NetworkImage(phot["thumbnailUrl"]),)

                  ));
            }
        ))):CircularProgressIndicator()*/
    ));
  }

  body(){
    if(loading==true){
      return Material(child:Container(child:
      ListView.builder(
          itemCount:10,
          itemBuilder:(BuildContext context,int index){
            var phot=photo[index];
            ///
            return Container(
                color: Colors.white,
                child:ListTile(
                  title:Text(photos[index].id.toString()//photo["id"].toString()
                  ),//posts[index].title),
                  subtitle:Text(photos[index].title),
                  leading:Container(
                    decoration:BoxDecoration(
                      shape:BoxShape.circle,
                      //image:AssetImage(""),
                    ),child://Image.network(photos[index].url.toString(),fit:BoxFit.fill),
                    CircleAvatar(radius:30,backgroundImage:NetworkImage(photos[index].thumbnailUrl),)
                )));
          }
      )));
    }else if(networkError==true){
      return CircularProgressIndicator();
    }
    //return new CircularProgressIndicator();
  }
}


/*showNotification()async{
  print("work222222");
  //Workmanager().
  //executeTask((task, inputData)async{//=>
  //if(task == ""){
  var uri =Uri.parse("https://jsonplaceholder.typicode.com/photos");
  var response = await http.get(uri);
  Map data =json.decode(response.body);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings("");
  IOSInitializationSettings iosInitializationSettings =IOSInitializationSettings();

  InitializationSettings initializationSettings =InitializationSettings(
    android:androidInitializationSettings,iOS:iosInitializationSettings,);


  const AndroidNotificationDetails androidNotificationDetails =
  AndroidNotificationDetails("","",importance:Importance.max,priority:Priority.high,showWhen:false,);

  IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

  NotificationDetails platform = NotificationDetails(
    android:androidNotificationDetails,
    iOS:iosNotificationDetails,
  );
  //await flutterLocalNotificationsPlugin.show();

  const AndroidNotificationChannel  androidNotificationChannel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications',description:"",//title/*'This channel is used for important notifications.', // description*/
    importance: Importance.high, playSound: true,);


  Future<void> notification1() async {
    //WidgetsFlutterBinding.ensureInitialized();
    //await Firebase.initializeApp();
    //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    await flutterLocalNotificationsPlugin.
    resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    //runApp(MyApp());
  }
  notification1();

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification notification = message.notification;
    AndroidNotification android = message.notification?.android;

    if (notification != null && android != null) {

      flutterLocalNotificationsPlugin.show(notification.hashCode, notification.title, notification.body,platform
        /*NotificationDetails(
              android: AndroidNotificationDetails(
                androidNotificationChannel.id,
                androidNotificationChannel.name,
                //channel.description,
                color: Colors.blue,
                playSound: true,
                importance:Importance.max,
                priority:Priority.max,
                icon: '@mipmap/ic_launcher',
              ),
              iOS:IOSNotificationDetails()
            )*/);
    }
  });
}*/

InitialNotification()async{
  print("work1111111111");
  //await localNotificationsPlugin.initialize(initializationSettings);
  Workmanager().
  executeTask((task, inputData)async{//=>
    //showNotification();
    return Future.value(true);
  });
}
