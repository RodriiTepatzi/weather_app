import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/dashboard_controller.dart';
import 'package:weather_app/models/city.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});


  _showAddModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 90, 90, 90),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    margin: const EdgeInsets.only(bottom: 15),
                  ),Autocomplete<City>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text.isEmpty) {
                          return const Iterable<City>.empty();
                        }
                        return controller.locations
                            .where((location) => location.localizedName
                                .toLowerCase()
                                .startsWith(textEditingValue.text.toLowerCase()))
                            .toList();
                      },
                      displayStringForOption: (option) {
                        return option.localizedName;
                      },
                      onSelected: (option) {
                        controller.selectedLocation = option;
                      },
                      fieldViewBuilder: (BuildContext context,
                          TextEditingController textEditingController,
                          FocusNode focusNode,
                          VoidCallback onFieldSubmitted) {
                        return TextField(
                          controller: textEditingController,
                          focusNode: focusNode,
                          onChanged: (value) async {
                            if (value.isNotEmpty) {
                              await controller.fetchLocations(value);
                            }
                          },
                          decoration: const InputDecoration(
                            labelText: 'Add City',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 3.0,
                              ),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        );
                      },
                    ),
                  
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: TextField(
                      controller: controller.descriptionTextController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 3.0,
                          ),
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      maxLines: 4,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 90),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.saveCity();
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        'Save City',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'WeatherForemost',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: SvgPicture.asset(
            'assets/svg/appbar_icon.svg',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddModal(context);
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/home.svg',
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/svg/home.svg',
              color: Colors.blue,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/location.svg',
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/svg/location.svg',
              color: Colors.blue,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/person.svg',
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/svg/person.svg',
              color: Colors.blue,
            ),
            label: '',
          ),
        ],
        currentIndex: controller.selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: controller.onItemTapped,
      ),
      body: controller.widgetOptions[controller.selectedIndex],
    );
  }
}
