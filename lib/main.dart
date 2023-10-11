import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
//import 'package:ionicons/ionicons.dart';
import 'package:flutter_icons/flutter_icons.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:workmanager/workmanager.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


import 'package:telegram_s/calls.dart';
import 'package:telegram_s/contacts.dart';
import 'package:telegram_s/setting.dart';
import 'package:telegram_s/chats.dart';
import 'package:telegram_s/backend5.dart';
import 'package:telegram_s/backend.dart';
import 'package:telegram_s/backenddoc1.dart';
import 'package:telegram_s/backenddoc2.dart';



String page = "chats";
Color colorNavigation = Colors.blue;
Chats pageChat = Chats();
int numPage =2;
String textMessage ="";
//var titleCenter ="Chats";

int numTitleLeft = 1;
int numTitleCenter = 1;
int numTitleRight = 1;

TextEditingController messageYou =TextEditingController();
TextEditingController messageMe =TextEditingController();
List <Widget>showChats =[Container()];

DateTime dateTime =DateTime.now();
int selectChat = 1;


List <dynamic>titleCenter =[
  Text("Contacts",style:TextStyle(color:Colors.black)),
  Text("All",style:TextStyle(color:Colors.black,fontSize:18)),
  Text("Chats",style:TextStyle(color:Colors.black,fontSize:18)),
  Text(" ",style:TextStyle(color:Colors.black,fontSize:18)),
];

List <dynamic>titleLeft =[
  Text("Sort",style:TextStyle(color:Colors.blue)),
  Text("Edit",style:TextStyle(color:Colors.blue)),
  Text("Edit",style:TextStyle(color:Colors.blue)),
  Icon(Icons.qr_code_scanner,color:Colors.blue)
];
List <dynamic> titleRight =[
  Icon(Icons.add,color:Colors.blue),
  Icon(Icons.phone_forwarded,color:Colors.blue),
  Icon(LineIcons.edit,color:Colors.blue,size:27),
  Text("Edit",style:TextStyle(color:Colors.blue)),
];




void main()async{
  runApp(MyApp());
  Workmanager().initialize(InitialNotification(),isInDebugMode: true);
  Workmanager().registerPeriodicTask("","",frequency:Duration(minutes:5));
  //await Firebase.initializeApp();
  //var messageing =FirebaseMessaging.instance;
  //var token =await messageing.getToken();
  //print(token);
}

//IO.Socket socket;
void connect(){
  //socket = IO.io();
}


class MyApp extends StatelessWidget {
  //const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _mainPage(),
    );
  }
}



class _mainPage extends StatefulWidget {
  //const _mainPage({Key? key,}) : super(key: key);
  //final String title;
  @override
  //State<_mainPage> createState() => mainPage();
  mainPage createState() => mainPage();
}



//enum Navigation{}
//class NavigationBloc<>{}



class mainPage extends State<_mainPage> {



  ManageState(){
    //setState(() {
    if(numPage == 0){
      return ContactsPage();
    }
    if(numPage == 1){
      return CallsPage();
    }
    if(numPage == 2){
      return ChatsPage();
    }
    if(numPage == 3){
      return SettingPage();
    }
    //});
  }

  /*Widget ManageState(){
    return IndexedStack(
      index:numPage,
        children:[
        _Contacts(),
        ]);
  }*/


  @override
  Widget build(BuildContext context) {



    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
    Scaffold(

      appBar: AppBar(
        backgroundColor:Colors.white,elevation:0,
        //title:Center(child:titleCenter[numTitleCenter]),
        actions:[
          Container(
            width:MediaQuery.of(context).size.width,
            child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[
            FlatButton(//RaisedButton
              minWidth:40,height:40,
              onPressed:(){setState(() {
                page="chats";
              });},splashColor:Colors.transparent,
              highlightColor:Colors.grey.shade200,
              child:titleLeft[numPage]),
            Container(child:titleCenter[numPage]),
            FlatButton(
                minWidth:40,height:40,
                onPressed:(){setState(() {page="";
                });},splashColor:Colors.transparent,
                highlightColor:Colors.grey.shade200,
              ///highlightColor:Colors.transparent,
              child:titleRight[numPage])
          ],))]),


        body:Container(
            width:MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height,
            color:Colors.white,
          child:Stack(children:[

          Container(child:ManageState()),

      ])),

     bottomNavigationBar:SizedBox(
         height:60,
         child:BottomNavigationBar(//NavigationBar(

       type:BottomNavigationBarType.fixed,
       backgroundColor: Colors.white70,
       selectedItemColor:Colors.blue,
       unselectedItemColor:Colors.grey,

       //showSelectedLabels:false,
       elevation:0,
       iconSize:25,
       //selectedFontSize:10,
       currentIndex:numPage,
       onTap:(index){setState((){ numPage = index;});},
       items:const [
       //destinations:const [
       //NavigationDestination(
       BottomNavigationBarItem(
          icon:Icon(Icons.account_circle),
          label:"Contacts",tooltip:""),
         BottomNavigationBarItem(
          icon:Icon(Icons.call),
          label:"Calls",tooltip:""),
         BottomNavigationBarItem(
          icon:Icon(Icons.chat),
          label:"Chats",tooltip:""),
         BottomNavigationBarItem(
          icon:Icon(Icons.settings),
          label:"Setting",tooltip:""),
       ],))));

  }
}




//drawer
/*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),*/
