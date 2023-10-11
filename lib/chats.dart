import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:grouped_list/sliver_grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:bubble/bubble.dart';
import 'main.dart';


class ChatsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return _Chats();
  }
}

class _Chats extends StatefulWidget {
  Chats createState() => Chats();
}

class Chats extends State<_Chats> {

  Widget build(BuildContext context) {
    return
      SingleChildScrollView(child:

      Container(
        color:Colors.white,
        child:Column(children:[
      Container(
        height:53,
        padding:EdgeInsets.only(left:15,right:15,bottom:15),
        decoration:BoxDecoration(color:Colors.white,
          borderRadius:BorderRadius.circular(10),),

        child:Container(
          height:38,
          decoration:BoxDecoration(color:Colors.grey.shade100,borderRadius:BorderRadius.circular(10),),
          child:const TextField(
            //style:TextStyle(color:Colors.white.withOpacity(10)),

            decoration:InputDecoration(
              border:InputBorder.none,
              prefixIcon:Icon(Icons.search,color:Colors.blue,),
              hintText:"Search for messages or users",
              hintStyle:TextStyle(color:Colors.blue,fontSize:17),
            )
        ),)
      ),
       Divider(height:0,thickness:1,indent:0,endIndent:0,color:Colors.grey.shade300),
      //singleChat(),
          Column(children:List.generate(chatDetails.length,(index){
            return
              Container(
                  height:80,
                  //margin:EdgeInsets.only(top:10),
                  //width:MediaQuery.of(context).size.width,
                  padding:EdgeInsets.only(left:10,right:10),
                  child:/*GestureDetector(
                   onTap:(){Navigator.push(context,MaterialPageRoute(builder:(_)=>_ChatDetails(
                   img:chatDetails[index]["profile"],
                    name:chatDetails[index]["name"],
                    )));},
                 child:*/
                  Column(children:[

                  FlatButton(
                    //minWidth:50,
                    padding:EdgeInsets.only(right:10,),
                      splashColor:Colors.transparent,
                      highlightColor:Colors.grey.shade300,
                      onPressed:(){
                        Navigator.push(context,MaterialPageRoute(builder:(_)=>_ChatDetails(
                          img:chatDetails[index]["profile"],
                          name:chatDetails[index]["name"],
                        )));
                      },child:
                  Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[

                    Container(height:80,decoration:BoxDecoration(shape:BoxShape.circle,),
                      child:Image.asset(chatDetails[index]["profile"]),),
                    /*CircleAvatar(radius:30,
                        child:Image.asset(chatDetails[index]["profile"],fit:BoxFit.fill),
                        backgroundImage:AssetImage(chatDetails[index]["profile"])
                    ),*/

                    Expanded(child:
                    Column(mainAxisAlignment:MainAxisAlignment.center,children:[
                      //Container(height:50,child:
                      Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[
                        Text(chatDetails[index]["name"],style:TextStyle(color:Colors.black,fontSize:17),),
                        Text(chatDetails[index]["time"],style:TextStyle(color:Colors.grey.shade400),),]),

                      Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[
                        Text(chatDetails[index]["text"],style:TextStyle(color:Colors.grey.shade400,fontSize:15),),
                        Container(height:18,width:18,decoration:BoxDecoration(shape:BoxShape.circle,color:Colors.blue),
                            child:Center(child:Text(chatDetails[index]["notification"],style:TextStyle(color:Colors.white),))),
                      ],),
                    ]))])),

                    Divider(height:0,thickness:1,indent:72,endIndent:0,color:Colors.grey.shade300)
                  ])
            );
          })),


       ])
      ));//Container(child:ListView.separated(





        /*itemBuilder:(_,index){ return ListTile(leading:Container(color:Colors.amber,height:50, ));},
        separatorBuilder:(_,__){return Divider();},
        itemCount: 12
            //child:GridView.count(crossAxisCount:1,children:[));*/
  }
}
List chatDetails =[
  {
    "profile":"assets/saved.PNG",
    "name":"Saved Massages",
    "text":"Saved Massages",
    "time":"12:00",
    "notification":"1"
  },
];


/*class ChatRoom extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:_ChatDetails);///_ChatDetails();
  }
}*/

class _ChatDetails extends StatefulWidget{
  @override
  final String name;
  final String img;
  const _ChatDetails({/*@required*/@required this.name,@required this.img}):super();
  //State<StatefulWidget> createState() {}
  ChatDetails createState() => ChatDetails();
}
class ChatDetails extends State<_ChatDetails>{
  @override

  SendMassages2(){
    if(selectChat == 1){
      setState(() {
      //return
        Container(
          height:40,width:100,
          decoration: BoxDecoration(borderRadius:BorderRadius.circular(10)),
          //color:Colors.white,
          child:
      Column(children:[
        Text(messageMe.text),
        Text(dateTime.minute.toString())
      ],));


          });
    showChats.add(SendMassages2());
    }
    if(selectChat == 2){}
  }
  var message;

  enterText(text){
    message = Message(
    text:text,
    date:DateTime.now(),
    isSentByMe:true
    );
    textMessage = text;
  }

  enterText2(){
    message = Message(
        text:messageMe.text,
        date:DateTime.now(),
        isSentByMe:true
    );
    messages.add(message);
  }




  Widget build(BuildContext context) {
   return Scaffold(
     appBar:AppBar(
         toolbarHeight:65,
         elevation:1,
       backgroundColor:Colors.white,
       leading:FlatButton(
         shape:CircleBorder(),
         onPressed:(){Navigator.pop(context);},child:Icon(Icons.arrow_back_ios,color:Colors.blue),),
       title:Container(
        child:Center(child:Column(children:[
        Text(widget.name,style:TextStyle(color:Colors.black,fontSize:20),),
        Text("last seen recently",style:TextStyle(color:Colors.grey,fontSize:16))
         ]))),
         actions:[Container(margin:EdgeInsets.only(right:5),
           child:CircleAvatar(backgroundColor:Colors.white,radius:28,
               backgroundImage:AssetImage(widget.img,)),)]),

     //bottomNavigationBar:

     //body:ListView(children:List.generate(Massage.length,(index) =>SendMassages2()))
     /*ListView.builder(
       itemCount:1,
       scrollDirection:Axis.vertical,
       itemBuilder:(context,index){
         return SendMassages2();
       },)*/
     body://Expanded(child:
     Column(mainAxisAlignment:MainAxisAlignment.end,children:[
       Expanded(child:
      GroupedListView<Message,DateTime>(

       padding: EdgeInsets.all(10),
       elements:messages,
       reverse:true,
       order:GroupedListOrder.DESC,
       useStickyGroupSeparators:true,
       floatingHeader:true,

       groupBy:(message)=>DateTime(//2022
         message.date.year,
         message.date.month,
         message.date.day
       ),
       //groupSeparatorBuilder:(DateTime f)=>Padding(padding:EdgeInsets.all(5),child:Text(value)),
       groupHeaderBuilder:(/*dynamic*/Message message) => SizedBox(
         height:40,
         child:Center(child:
           Container(
             padding:EdgeInsets.all(4),
             decoration:BoxDecoration(
                 color:Colors.grey.shade400,//grey.shade200,
                 borderRadius:BorderRadius.circular(5)),
             child:Text(DateFormat.yMMMd().format(message.date),
               style:TextStyle(color:Colors.white,fontSize:16),))),
       ),

       itemBuilder:(context,Message message/*c,element*/)=>
       //SingleChildScrollView(reverse:true,child:
         Align(alignment:message.isSentByMe ?
             Alignment.centerRight:
             Alignment.centerLeft,
           child:message.isSentByMe ?

               //Bubble(
                 //nip:BubbleNip.rightCenter,
                 //style:BubbleStyle(),
                 //color:Colors.limeAccent.shade400,


              SizedBox(height:50,child:
                 Container(
                   //height:30,
                   //width:100,
                   padding: EdgeInsets.all(10),
                     margin:EdgeInsets.all(4),
                     decoration:BoxDecoration(
                       boxShadow:[BoxShadow(
                         color:Colors.grey,
                           spreadRadius:0,
                           blurRadius:3,
                         offset:Offset(-1,4)
                       ),],
                       color:Colors.blue,//.shade500,//limeAccent.shade400,
                       borderRadius:BorderRadius.only(
                       topLeft:Radius.circular(25),
                       bottomRight:Radius.circular(25),
                       bottomLeft:Radius.circular(25),
                     )),
                     child:Text(message.text,style:TextStyle(color:Colors.white),))):
                 /*Card(elevation:8,child:
                 Padding(padding:EdgeInsets.all(12),
                 child:Text(message.text)))*/

           SizedBox(height:50,child:
           Container(
             //height:30,
             //width:100,
               padding: EdgeInsets.all(10),
               margin:EdgeInsets.all(4),
               decoration:BoxDecoration(
                   boxShadow:[BoxShadow(
                       color:Colors.grey,
                       spreadRadius:0,
                       blurRadius:4,
                       offset:Offset(-1,4)
                   ),],
                   color:Colors.white,
                   borderRadius:BorderRadius.only(
                     topRight:Radius.circular(25),
                     bottomRight:Radius.circular(25),
                     bottomLeft:Radius.circular(25),
                   )),
               child:Text(message.text,style:TextStyle(color:Colors.blue.shade600),)))

              /*Bubble(
                 padding:BubbleEdges.all(10),
                color:Colors.blue,
                nip:BubbleNip.leftBottom,

                child:Text(message.text,style:TextStyle(color:Colors.white),)
                /*Card(elevation:8,child:
                 Padding(padding:EdgeInsets.all(12),
                 child:Text(message.text)))*/
               )*/

         ))),

       Container(
         height:70,
         //color:Colors.grey.shade100,
         padding:EdgeInsets.all(5),
         child:Row(mainAxisAlignment:MainAxisAlignment.start,//spaceBetween,
           children:[

             FlatButton(minWidth:15,padding:EdgeInsets.all(10),onPressed:(){},
                 child:Center(child:Icon(Entypo.attachment,color:Colors.blue,))),

             Container(
                 height:35,
                 margin:EdgeInsets.only(left:5),
                 width:MediaQuery.of(context).size.width *0.58,
                 decoration:BoxDecoration(
                   color:Colors.white,
                   borderRadius:BorderRadius.circular(15),
                   boxShadow:[BoxShadow(
                       color:Colors.grey,
                       spreadRadius:0,
                       blurRadius:4,
                       offset:Offset(-1,4)
                   )]
                 ),
                 child:TextField(
                   controller:messageMe,
                   enableSuggestions:true,
                   autocorrect:true,
                   //maxLines:2,
                   //textInputAction:TextInputAction.newline,
                   ///onSubmitted:enterText,
                   decoration:InputDecoration(
                     //fillColor:Colors.purple,
                     border:InputBorder.none,contentPadding:EdgeInsets.all(10),
                     //prefixIcon:Icon(Icons.search,color:Colors.blue,),
                     hintText:"Message",
                     hintStyle:TextStyle(color:Colors.grey.shade400,fontSize:17),
                     //suffixIcon:Icon(MaterialCommunityIcons.sticker_emoji)
                   ),)),


             FlatButton(shape:CircleBorder(),minWidth:10,padding:EdgeInsets.all(10),onPressed:(){},
                 child:Center(child:Icon(MaterialCommunityIcons.microphone,color:Colors.blue,size:28,))),


             Container(
               //margin:EdgeInsets.only(left:25),
               child:FlatButton(color:Colors.blue,shape:CircleBorder(),minWidth:20,
               splashColor:Colors.transparent,
               highlightColor:Colors.black12,//lightBlue.shade400,//.withOpacity(0.5),
               onPressed:(){
                 /*if(message != null){
                   setState(() {
                     messages.add(message);
                     var h = messageMe.text;
                     enterText("");
                     messageMe.clear();
                   });
                 }*/
                 if(messageMe.text != ""){
                   setState((){
                     enterText2();
                     messageMe.clear();
                   });
                 }
                 },
               child:Center(child:Container(decoration:BoxDecoration(shape:BoxShape.circle),child:Icon(MaterialCommunityIcons.send,color:Colors.white,))))),

           ]
           ,),),



     ])
   );
  }
}


List <Message> messages= [
  Message(
    text:"Welcome to Telegram",
      date:DateTime.now().subtract(Duration(minutes:1)),
      isSentByMe:false),
  Message(text:"Hello",date:DateTime.now().subtract(Duration(minutes:1)),isSentByMe:true),
  Message(text:"Iam using telegram",date:DateTime.now().subtract(Duration(minutes:1)),isSentByMe:true),

  /*{
    "text":"Welcome to telegram",
    "date":DateTime.now().subtract(Duration(minutes:1)),
    "isSentByMe":"false"
  },
  {
    "text":"Hello",
    "date":DateTime.now().subtract(Duration(minutes:1)),
    "isSendByMe":"true",
  },
  {
    "text":"Iam using telegram",
    "date":DateTime.now().subtract(Duration(minutes:1)),
    "isSendByMe":"true",
  }*/
];//.reversed.toList();


class Message {
  /*Massage({
    text:"Hello",
    date:DateTime.now().subtract(Duration(minutes:1)),
    isSentByMe:false});*/
  Message({
    @required this.text,@required this.date,@required this.isSentByMe
  });
   String text = "";
   DateTime date;//=DateTime.now().subtract(Duration(minutes:1));
   bool isSentByMe;
  //get d => null;
}//.reversed.toList();


/*class _SendMasseges extends StatefulWidget{
  @override
  SendMassages createState() => SendMassages();
}
class SendMassages extends State<_SendMasseges>{
  @override
  Widget build(BuildContext context) {
    return
  }
}*/


/*
Row(mainAxisAlignment:MainAxisAlignment.start,children:[

        Container(decoration:BoxDecoration(shape:BoxShape.rectangle,),child:Image.asset("assets/saved.PNG"),),//CircleAvatar(),
        Column(mainAxisAlignment:MainAxisAlignment.center,children:[
          Container(height:50,child:
          Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[
            Text("Saved Massages",style:TextStyle(color:Colors.grey.shade100),),
            Text("12:00",style:TextStyle(color:Colors.grey.shade100),),
          ] )),
          Row(children:[
            Text("Saved Massages",style:TextStyle(color:Colors.grey.shade100),),
            Container(height:10,decoration:BoxDecoration(shape:BoxShape.rectangle,color:Colors.red),child:Text("1")),
          ],),
           Text("hello",style:TextStyle(color:Colors.grey.shade100),),
        ]) ]
 */
