import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'BeerJsonToData.dart';
import 'food_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late BeerJsonToData _dataFromAPI;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var url = "https://api.punkapi.com/v2/beers/1";
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonStr = jsonDecode(response.body);
      print(jsonStr);
    } else {
      print("fail");
    }
    // _dataFromAPI = beerJsonToDataFromJson(response.body);
    // print(_dataFromAPI.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
    );
  }
}

///////*************************///////////////
///////*************************///////////////
///////*************************///////////////
class MyPic extends StatelessWidget {
  const MyPic({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "abc",
      home: Scaffold(
        body: Center(
          child: Image(
              image: NetworkImage(
                  "https://cdn.tigthai.com/imguploads/202010/14/0705973001602671379370_The_Labyrinth_of_Ragnarok_main.jpg")),
        ),
      ),
    );
  }
}

class testlist extends StatefulWidget {
  testlist({Key? key}) : super(key: key);

  @override
  State<testlist> createState() => _testlistState();
}

class _testlistState extends State<testlist> {
  @override
  Widget build(BuildContext context) {
    List<FoodMenu> menu = [];
    menu.add(FoodMenu("กุ้งเผา", "500", "assets/images/kungpao.jpg"));
    menu.add(FoodMenu("ไข่เจียว", "100", "assets/images/omlet.jpg"));
    menu.add(FoodMenu("ไข่ดาว", "200", "assets/images/fried_egg.jpg"));

    return Scaffold(
        appBar: AppBar(
          title: Text("เมนูอาหาร"),
        ),
        body: ListView.builder(
            itemCount: menu.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Image.asset(menu[index].img),
                title: Text(
                  "${menu[index].name}",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  "ราคา ${menu[index].price}",
                  style: TextStyle(fontSize: 15),
                ),
              );
            }));
  }
}
