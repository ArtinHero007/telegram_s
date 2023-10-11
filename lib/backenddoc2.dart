import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'backend.dart';



class run extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body:ShowPhotos()),);
  }
}



class ShowPhotos extends StatefulWidget {
  @override
  _ShowPhotosState createState() => _ShowPhotosState();
}

class _ShowPhotosState extends State<ShowPhotos> {
  List<Photo> photos = List as List<Photo>;//new List();
  bool _loading = true;
  bool internetError=false;

  List myList = [10, 20, 30, 40, 50, 60, 70];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setData();
  }

  @override
  Widget build(BuildContext context) {

    // after setState
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }

    else if(internetError){
      return new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new Text('check the internet connection',style: new TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.w700
            ),),
            new MaterialButton(onPressed: (){
              _setData();
            },color: Colors.indigo,child: new Text('try again',style: new TextStyle(color: Colors.white),),)
          ],
        ),
      );
    }
    return new Container(
      child: ListView.builder(
          itemCount: photos.length,
          itemBuilder: (BuildContext context, int index) {
            var photo = photos[index];
            return new Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              child: new ListTile(
                onTap: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context){
                    return new ShowPhoto(photo: photo);
                  }));
                },
                title: new Text(
                  photo.title,
                  style: new TextStyle(fontSize: 14),
                ),
                subtitle: new Text(photo.id.toString()),
                leading: new Hero( tag: photo.id,child: new CircleAvatar(
                  backgroundColor: Colors.grey[600],
                  backgroundImage: NetworkImage(photo.thumbnailUrl),
                ),),
              ),
            );
          }),
    );
  }

  void _setData() async {
    setState(() {
      _loading=true;
      internetError=false;
    });
    try{
      var url =Uri.parse('https://jsonplaceholder.typicode.com/photos');
      //var url = 'https://jsonplaceholder.typicode.com/photos';
      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        jsonResponse.forEach((element) {
          photos.add(Photo(data: element));
        });
        setState(() {
          _loading = false;
//          photos=jsonResponse;
        });
      }
    }catch(e){
      setState(() {
        _loading=false;
        internetError=true;
      });
    }

  }
}


class ShowPhoto extends StatelessWidget {
Photo photo;
ShowPhoto({@required this.photo});
@override
Widget build(BuildContext context) {
  return new Scaffold(
    body: new Center(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
//            new Container(
//              child: new Image.network(photo.thumbnailUrl),
//            )
          new Container(
            width: 300,
            height: 300,
            child: new Hero( tag: photo.id,child: new CircleAvatar(
              backgroundColor: Colors.grey[600],
              backgroundImage: NetworkImage(photo.thumbnailUrl),
            ),),
          )
        ],
      ),
    ),
  );
}
}




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xffE3E3ED),
          child: StreamBuilder(
              stream: _myStream(),
              builder: (BuildContext context,AsyncSnapshot snapShot){
                if(!snapShot.hasData){
                  return Center(
                    child: new Text('loading ...'),
                  );
                }
                return new Stack(
                  alignment: Alignment.center,
                  children: [
                    new Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Color(0xff2c3143),
                    ),
                    new Container(
                      width: 350,
                      height: 350,
                      alignment: Alignment.center,
                      child: new Text(_currentTime(),style: new TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w600
                      ),),
                    ),
                    new CircularProgressIndicator(
                      /*radius: 240.0,
                      lineWidth: 6.0,
                      percent: snapShot.data,
                      backgroundColor: Colors.transparent,
                      progressColor: Colors.green,
                      animation: true,
                      animateFromLastPercent: true,*/
                    )

                  ],
                );
              })
      ),
    );
  }

  String _currentTime() {
    String hour=DateTime.now().hour.toString().padLeft(2,"0");
    String minute=DateTime.now().minute.toString().padLeft(2,"0");
    String second=DateTime.now().second.toString().padLeft(2,"0");
    return "$hour : $minute : $second";
  }

  Stream _myStream() async*{
    yield* Stream.periodic(Duration(milliseconds: 500),(int){
//     return DateTime.now().second/60;
      return (DateTime.now().second*1000+DateTime.now().millisecond)/
          (1000*60);
    });
  }
}

