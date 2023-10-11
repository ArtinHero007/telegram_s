import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';

class SettingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return _Setting();
  }
}


List iconSettings1 = [
  {
    "icon":MaterialIcons.save,
    "text":"Saved Massage",
    "color":Colors.blue
  },
  {
  "icon":Icons.phone,//FaIcon(FontAwesomeIcons.circle),
  "text":"Recent Calls",
  "color":Colors.green},
  {
  "icon":MaterialIcons.devices,
  "text":"Devices",
  "color":Colors.orange//Color(0xFFCAA26),
  },
  {"icon":Icons.folder,
  "text":"Chat Folders",
  "color":Colors.cyan}
  ];

List iconSettings2 =[{
  "icon":Icons.notifications,
  "text":"Data and Storage",
  "color":Colors.redAccent,},
  {
    "icon":Icons.lock,
    "text":"Privacy and Security",
    "color":Colors.grey,},
  {
   "icon":Icons.dark_mode,
   "text":"Appearance",
   "color":Colors.cyan,},
  {
    "icon":Icons.language,
    "text":"Language",
    "color":Colors.purple,},
  {
    "icon":Icons.sticky_note_2,
    "text":"Stikers and Emogi",
    "color":Colors.yellow},
  ];

List iconSettings3 =[
  {
  "icon":Icons.chat,
  "text":"Ask a Question",
  "color":Colors.yellow,},
  {
    "icon":Icons.info,
    "text":"Telegram FAQ",
    "color":Colors.cyan,},
  {
    "icon":MaterialIcons.lightbulb_outline,
    "text":"Telegram Features",
    "color":Color(0xFFFCAA26) }
 ];

class _Setting extends StatefulWidget {
  @override
  Setting createState() => Setting();
}

class Setting extends State<_Setting> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(///Scrollbar(
      child:Container(width://MediaQuery.of(context).size.width
          double.infinity
          ,color:Colors.grey.shade200
        ,padding:EdgeInsets.all(15),
        child:Column(children:[
          CircleAvatar(
            backgroundColor:Colors.purple.shade400,
            radius:90,
            child:Text("A",style:TextStyle(fontSize:55,color:Colors.white),),),
          Container(margin:EdgeInsets.only(bottom:10,top:10),child:
          Text("Ali Fanaie",style:TextStyle(fontSize:30),)),

          Column(children: [
            settingOne(),
            SizedBox(height:30,),
            settingTwo(),
            SizedBox(height:30,),
            settingThree()
           ],)

        /*Column(children:List.generate(iconSettings2.length,(index){
          return Container(
              color:Color(0xFF1c1d1f),
              padding:EdgeInsets.all(10),
              child:Row(
                //mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                    //iconSettings2[index]["icon"],
                    Icon(iconSettings2[index]["icon"]),
                    Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children:[
                        Text(iconSettings2[index]["text"]),
                        Icon(Icons.arrow_forward_ios)
                      ],)]
              )
          );
        })),*/

      ])));
  }
}

settingOne(){
  return Container(
      decoration:BoxDecoration(
      color:Colors.white,
      borderRadius:BorderRadius.circular(15)),child:
  Column(children:List.generate(iconSettings1.length,(index){
    return
      Column(children:[//children:List.generate(iconSettings1.length,(index){
        FlatButton(onPressed:(){},child:Container(margin:EdgeInsets.all(0),child:
        Row(//mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:[
              Container(
                  margin:EdgeInsets.only(right:15),
                  decoration:BoxDecoration(
                      color:iconSettings1[index]["color"],
                      borderRadius:BorderRadius.circular(10)),
                  height:30,width:30,
                  child:Center( child:Icon(iconSettings1[index]["icon"],color:Colors.white,))),


              //Container(width:MediaQuery.of(context).size.width,child:
              Expanded(child:
              Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                    Text(iconSettings1[index]["text"],style:TextStyle(fontSize:16),),
                    Icon(Icons.arrow_forward_ios,size:15),
                  ])),
            ]))),

          Container(width:double.infinity,child:
            Column(children:[
              Divider(height:0,thickness:1,indent:61,endIndent:10,color:Colors.grey.shade300),
            ])),

      ]);})));

}
settingTwo(){
  return Container(
      decoration:BoxDecoration(
          color:Colors.white,
          borderRadius:BorderRadius.circular(15)),child:
  Column(children:List.generate(iconSettings2.length,(index){
    return
      Column(children:[//children:List.generate(iconSettings1.length,(index){
        FlatButton(onPressed:(){},child:Container(margin:EdgeInsets.all(0),child:
        Row(//mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:[
              Container(
                  margin:EdgeInsets.only(right:15),
                  decoration:BoxDecoration(
                      color:iconSettings2[index]["color"],
                      borderRadius:BorderRadius.circular(10)),
                  height:30,width:30,
                  child:Center( child:Icon(iconSettings2[index]["icon"],color:Colors.white,))),


              //Container(width:MediaQuery.of(context).size.width,child:
              Expanded(child:
              Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                    Text(iconSettings2[index]["text"],style:TextStyle(fontSize:16),),
                    Icon(Icons.arrow_forward_ios,size:15),
                  ])),
            ]))),

        Container(width:double.infinity,child:
        Column(children:[
          Divider(height:0,thickness:1,indent:61,endIndent:10,color:Colors.grey.shade300),
        ])),

      ]);})));

}
settingThree(){
  return Container(
      decoration:BoxDecoration(
          color:Colors.white,
          borderRadius:BorderRadius.circular(15)),child:
  Column(children:List.generate(iconSettings3.length,(index){
    return
      Column(children:[//children:List.generate(iconSettings1.length,(index){
        FlatButton(onPressed:(){},child:Container(margin:EdgeInsets.all(0),child:
        Row(//mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:[
              Container(
                  margin:EdgeInsets.only(right:15),
                  decoration:BoxDecoration(
                      color:iconSettings3[index]["color"],
                      borderRadius:BorderRadius.circular(10)),
                  height:30,width:30,
                  child:Center( child:Icon(iconSettings3[index]["icon"],color:Colors.white,))),


              //Container(width:MediaQuery.of(context).size.width,child:
              Expanded(child:
              Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                    Text(iconSettings3[index]["text"],style:TextStyle(fontSize:16),),
                    Icon(Icons.arrow_forward_ios,size:15),
                  ])),
            ]))),

        Container(width:double.infinity,child:
        Column(children:[
          Divider(height:0,thickness:1,indent:61,endIndent:10,color:Colors.grey.shade300),
        ])),

      ]);})));

}

/*Container(width:double.infinity,color:Colors.grey.shade300
        ,padding:EdgeInsets.all(10),
        child:Column(children:[
        CircleAvatar(),
        Text("Ali Fanaie"),
        Column(children:List.generate(iconSettings1.length,(index){
          return Container(
              color:Color(0xFF1c1d1f),
              padding:EdgeInsets.all(10),
              child:Row(
                //mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                    Container(
                    color:iconSettings1[index]["color"]
                  ,height:30,width:30,child:
                    Center(child:Icon(iconSettings1[index]["icon"],))),
                    Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children:[
                        Text(iconSettings1[index]["text"]),
                        Icon(Icons.arrow_forward_ios)
                      ],)]
              )
          );
        })),
      ]),)*/
