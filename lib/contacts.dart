import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return _Contacts();
  }
}

class _Contacts extends StatefulWidget {
  @override
  Contacts createState() => Contacts();
}

class Contacts extends State<_Contacts> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child:

      Column(children:[
        Container(
        padding: const EdgeInsets.only(top:0,left:15,right:15,bottom:15),
        height:53,
        decoration:BoxDecoration(color:Colors.white,
        borderRadius:BorderRadius.circular(10),),

          child:Container(
            decoration:BoxDecoration(borderRadius:BorderRadius.circular(10),color:Colors.grey.shade100),
            height:38,
            child:const TextField(
            //style:TextStyle(color:Colors.white.withOpacity(10)),
              textAlign:TextAlign.start,
              decoration:InputDecoration(
              border:InputBorder.none,
              prefixIcon:Icon(Icons.search,color:Colors.blue,),
              hintText:"Search",hintStyle:TextStyle(color:Colors.blue,fontSize:16),
            )
          ),)
      ),
        Divider(height:0,thickness:1,indent:0,endIndent:0,color:Colors.grey.shade300),
      Column(children:[
        Container(margin:EdgeInsets.only(top:10),height:40,padding:EdgeInsets.only(left:10,right:10),child:FlatButton(onPressed:(){},child:Row(
            children:[
              Icon(Icons.location_on_outlined,color:Colors.blue,size:30),
              SizedBox(width:10,),
              Text("Find Peaple Nearby",style:TextStyle(color:Colors.blue),)]))),
        Divider(height:0,thickness:1,indent:50,endIndent:10,color:Colors.grey.shade300),

        Container(padding:EdgeInsets.only(left:10,right:10),child:FlatButton(onPressed:(){},child:Row(
            children:[
              Icon(Icons.location_history_outlined,color:Colors.blue,size:30),
              SizedBox(width:10,),
              Text("Invite Friends",style:TextStyle(color:Colors.blue),)]))),
      ]),


      ]));
  }
}
