// ignore_for_file: library_private_types_in_public_api

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:news/components/category_card.dart';
import 'package:news/helper/categoryData.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/home_screen.dart';
import 'package:transition/transition.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<CategoryModel> categories = [];
  bool _showConnected = false;
  bool isLightTheme = false;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    Connectivity().onConnectivityChanged.listen((event) {
      checkConnectivity();
    });
    getTheme();
  }

  getTheme() async {
    final settings = await Hive.openBox('settings');
    setState(() {
      isLightTheme = settings.get('isLightTheme') ?? false;
    });
  }

  checkConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    showConnectivitySnackBar(result);
  }

  void showConnectivitySnackBar(ConnectivityResult result) {
    var isConnected = result != ConnectivityResult.none;
    if (!isConnected) {
      _showConnected = true;
      const snackBar = SnackBar(
          content: Text(
            "You are Offline",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    if (isConnected && _showConnected) {
      _showConnected = false;
      const snackBar = SnackBar(
          content: Text(
            "You are back Online",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: isLightTheme
            ? const SystemUiOverlayStyle(statusBarColor: Colors.transparent)
            : const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
        title: const Text('Categories'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: CategoryCard(
                image: categories[index].imageAssetUrl,
                text: categories[index].categoryName,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  Transition(
                    child: HomeScreen(category: categories[index].category),
                    transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
