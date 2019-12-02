
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'building.dart';
import 'map_page.dart';

class HumanPage extends StatefulWidget {
  @override
  _HumanPageState createState() => _HumanPageState();
}

class _HumanPageState extends State<HumanPage> {
  List<Building> buildings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('전남대 Map', style: TextStyle(fontFamily: 'NanumMyeongjo',fontWeight: FontWeight.bold, fontSize: 16.0),),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){},
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Padding(padding: EdgeInsets.all(8.0),
      child: Center(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/json/human.json'),
            builder: (context, snapshot){
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }
              var data = json.decode(snapshot.data.toString()).cast<Map<String, dynamic>>() ?? [];
              buildings = data.map<Building>((json) =>  Building.fromJson(json)).toList();

              return ListView.builder(
                itemBuilder: (context, index){
                  return _buildListTile(context, index);
                },
                itemCount: buildings.length,
              );
            }
        ),
      )
    );
  }

  Widget _buildListTile(BuildContext context, index) {
    return ListTile(
      leading: SizedBox(
          width: 70,
          height: 60,
          child: Image.asset(buildings[index].path, fit: BoxFit.fill,)),
      title: Text(buildings[index].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
      subtitle: Text('1호관'),
      dense: true,
      trailing: Icon(Icons.more_vert),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage(buildings[index])));
      },
    );
  }

  Future<Map<String, dynamic>> parseJsonFromAssets(String path) async{
    return rootBundle.loadString(path).then((jsonStr) => jsonDecode(jsonStr));
  }
}
