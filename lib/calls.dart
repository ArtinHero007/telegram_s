import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CallsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return _Calls();
  }
}

class _Calls extends StatefulWidget {
  @override
  Calls createState() => Calls();
}

class Calls extends State<_Calls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body://SingleChildScrollView(
      //child://Expanded(
          //width:MediaQuery.of(context).size.width,
          //height:MediaQuery.of(context).size.height,
        //child:
        Container(
          color:Colors.white,
          child:Column(mainAxisAlignment:MainAxisAlignment.start,children:[

            Container(height:22,width:MediaQuery.of(context).size.width,
                decoration:BoxDecoration(
                  color:Colors.grey.shade100,
                  border:Border(
                     top:BorderSide(width:1,color:Colors.grey.shade400,),
                     //bottom:BorderSide(width:1,color:Colors.black54)
                  )),
                child:Container(margin:EdgeInsets.only(left:10),child:
                    Text("RECENT CALLS",style:TextStyle(color:Colors.grey.shade700),))),

            Column(children:List.generate(callsMissed.length,(index) => Container(
              height:75,//60
              child:Column(children:[

              FlatButton(onPressed:(){},child:
                Row(children:[

                  /*Container(height:75,decoration:BoxDecoration(shape:BoxShape.circle,),
                    child:Image.asset(callsMissed[index]["profile"]),),*/
                  Container(margin:EdgeInsets.only(right:10),child:CircleAvatar(backgroundColor:Colors.white,maxRadius:34,
                  backgroundImage:AssetImage(callsMissed[index]["profile"]),)),

                    Expanded(child:
                    Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[
                 Column(mainAxisAlignment:MainAxisAlignment.center,crossAxisAlignment:CrossAxisAlignment.start,
                     children:[Text(callsMissed[index]["nameContact"],style:TextStyle(color:Colors.black,fontSize:20)),
                       Text("Outgoing",style:TextStyle(color:Colors.grey.shade700,fontSize:16)),
                   //Container(color:Colors.orange,width:MediaQuery.of(context).size.width,height:3,),
                  // Divider(height:3,thickness:1,indent:61,endIndent:10,color:Colors.black//grey.shade300
                   //),
              ]),
              Container(child:Row(children:[
                Container(margin:EdgeInsets.only(right:10),child:
                Text(callsMissed[index]["time"],style:TextStyle(color:Colors.grey.shade700,fontSize:17),)),
                Icon(MaterialIcons.info_outline,color:Colors.blue,)]),)

            ]))])),
                Divider(height:0,thickness:1,indent:85,endIndent:10,color:Colors.grey.shade400)
              ],)
            )))

    ])));
  }
}

List <dynamic> callsMissed =[{
  "nameContact":"Artin",
  "profile":"assets/selfie.jfif",//Image.asset(""),
  "time":"08/22/22",
}];
