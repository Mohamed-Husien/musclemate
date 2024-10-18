import 'package:musclemate/generated/l10n.dart';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/views/home_view.dart';
import 'package:musclemate/views/meal_plan/meal_plan_view.dart';
import 'package:musclemate/views/running/running_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class WeightView extends StatefulWidget {
  const WeightView({super.key});

  @override
  State<WeightView> createState() => _WeightViewState();
}

class _WeightViewState extends State<WeightView> {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _weightController = TextEditingController();
  DateTime? _selectedDate;
  List<Map<String, String>> myWeightArr = [];
  List<Map<String, String>> weightDataList = [];

  @override
  void initState() {
    super.initState();
    _loadSavedImages();
    _loadWeightData();
  }

  Future<void> _loadSavedImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedImages = prefs.getStringList('weight_images');
    if (savedImages != null) {
      setState(() {
        myWeightArr.addAll(
          savedImages.map((image) => {"name": "Custom Image", "image": image}),
        );
      });
    }
  }

  Future<void> _addImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? savedImages = prefs.getStringList('weight_images') ?? [];

      savedImages.insert(0, image.path);
      await prefs.setStringList('weight_images', savedImages);

      setState(() {
        myWeightArr.insert(0, {"name": "Custom Image", "image": image.path});
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _saveWeightData() async {
    if (_selectedDate != null && _weightController.text.isNotEmpty) {
      String formattedDate = DateFormat('EEEE, MMM d').format(_selectedDate!);
      String weight = _weightController.text;

      Map<String, String> newWeightData = {
        'date': formattedDate,
        'weight': weight,
      };

      setState(() {
        weightDataList.insert(0, newWeightData);
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> weightDataStrings = weightDataList
          .map((data) => '${data['date']}|${data['weight']}')
          .toList();
      await prefs.setStringList('weight_data', weightDataStrings);
    }
  }

  Future<void> _loadWeightData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedWeightData = prefs.getStringList('weight_data');
    if (savedWeightData != null) {
      setState(() {
        weightDataList = savedWeightData.map((data) {
          List<String> splitData = data.split('|');
          return {'date': splitData[0], 'weight': splitData[1]};
        }).toList();
      });
    }
  }

  Future<void> _deleteImage(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedImages = prefs.getStringList('weight_images') ?? [];

    savedImages.removeAt(index);
    await prefs.setStringList('weight_images', savedImages);

    setState(() {
      myWeightArr.removeAt(index);
    });
  }

  Future<void> _deleteWeightData(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weightDataList.removeAt(index);
    List<String> weightDataStrings = weightDataList
        .map((data) => '${data['date']}|${data['weight']}')
        .toList();
    await prefs.setStringList('weight_data', weightDataStrings);

    setState(() {
      weightDataList = weightDataList;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: TColor.kPrimaryColor,
          centerTitle: true,
          elevation: 0.1,
          title: Text(
            S.of(context).your_weight_progress,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Text(
                  S.of(context).add_more_photos,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  width: media.width,
                  height: media.width * 0.9,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                        autoPlay: false,
                        aspectRatio: 0.5,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        viewportFraction: 0.65,
                        enlargeFactor: 0.4,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom),
                    itemCount: myWeightArr.length,
                    itemBuilder:
                        (BuildContext context, int itemIndex, int index) {
                      var dObj = myWeightArr[index];
                      bool isAsset = dObj["image"]!.contains("assets");

                      return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.up,
                        onDismissed: (direction) {
                          _deleteImage(index);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(S.of(context).image_deleted),
                            duration: Duration(seconds: 1),
                          ));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    offset: Offset(0, 2)),
                              ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: isAsset
                                ? Image.asset(
                                    dObj["image"].toString(),
                                    width: double.maxFinite,
                                    height: double.maxFinite,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    File(dObj["image"].toString()),
                                    width: double.maxFinite,
                                    height: double.maxFinite,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: _addImageFromGallery,
                      icon:
                          Icon(Icons.add_a_photo, color: TColor.kPrimaryColor),
                    ),
                    Expanded(
                      child: Text(
                        _selectedDate != null
                            ? DateFormat('EEEE, MMM d').format(_selectedDate!)
                            : S.of(context).select_date,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    IconButton(
                      onPressed: () => _selectDate(context),
                      icon: Icon(Icons.calendar_today,
                          color: TColor.kPrimaryColor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: S.of(context).enter_weight,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _saveWeightData,
                child: Text(S.of(context).add),
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColor.kPrimaryColor,
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: weightDataList.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      _deleteWeightData(index);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(S.of(context).weight_entry_deleted),
                        duration: Duration(seconds: 1),
                      ));
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: ListTile(
                        title: Text(weightDataList[index]['date']!),
                        subtitle: Text('${weightDataList[index]['weight']} kg'),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RunningView(),
                      ),
                    );
                  },
                  child: Image.asset("assets/img/menu_running.png",
                      width: 25, height: 25),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MealPlanView2(),
                      ),
                    );
                  },
                  child: Image.asset("assets/img/menu_meal_plan.png",
                      width: 25, height: 25),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ),
                    );
                  },
                  child: Image.asset("assets/img/menu_home.png",
                      width: 25, height: 25),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WeightView(),
                      ),
                    );
                  },
                  child: Image.asset("assets/img/menu_weight.png",
                      width: 25, height: 25),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
