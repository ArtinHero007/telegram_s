import 'package:flutter/material.dart';
import 'package:flutter_map_example/pages/animated_map_controller.dart';
import 'package:flutter_map_example/pages/circle.dart';
import 'package:flutter_map_example/pages/custom_crs/custom_crs.dart';
import 'package:flutter_map_example/pages/epsg3413_crs.dart';
import 'package:flutter_map_example/pages/epsg4326_crs.dart';
import 'package:flutter_map_example/pages/esri.dart';
import 'package:flutter_map_example/pages/home.dart';
import 'package:flutter_map_example/pages/interactive_test_page.dart';
import 'package:flutter_map_example/pages/latlng_to_screen_point.dart';
import 'package:flutter_map_example/pages/live_location.dart';
import 'package:flutter_map_example/pages/many_markers.dart';
import 'package:flutter_map_example/pages/map_controller.dart';
import 'package:flutter_map_example/pages/map_inside_listview.dart';
import 'package:flutter_map_example/pages/marker_anchor.dart';
import 'package:flutter_map_example/pages/marker_rotate.dart';
import 'package:flutter_map_example/pages/max_bounds.dart';
import 'package:flutter_map_example/pages/moving_markers.dart';
import 'package:flutter_map_example/pages/network_tile_provider.dart';
import 'package:flutter_map_example/pages/offline_map.dart';
import 'package:flutter_map_example/pages/on_tap.dart';
import 'package:flutter_map_example/pages/overlay_image.dart';
import 'package:flutter_map_example/pages/plugin_scalebar.dart';
import 'package:flutter_map_example/pages/plugin_zoombuttons.dart';
import 'package:flutter_map_example/pages/point_to_latlng.dart';
import 'package:flutter_map_example/pages/polygon.dart';
import 'package:flutter_map_example/pages/polyline.dart';
import 'package:flutter_map_example/pages/reset_tile_layer.dart';
import 'package:flutter_map_example/pages/sliding_map.dart';
import 'package:flutter_map_example/pages/stateful_markers.dart';
import 'package:flutter_map_example/pages/tap_to_add.dart';
import 'package:flutter_map_example/pages/tile_builder_example.dart';
import 'package:flutter_map_example/pages/tile_loading_error_handle.dart';
import 'package:flutter_map_example/pages/widgets.dart';
import 'package:flutter_map_example/pages/wms_tile_layer.dart';

main(){
runApp(app);
}
class _mainPage1 extends StatefulWidget{
  @override
  mainPage11 createState() => mainPage11();
  //State CreateState()=>mainPage11();
}
class mainPage11 extends State<_mainPage1>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(body:Container(child:FlutterMap(),),);
  }


}