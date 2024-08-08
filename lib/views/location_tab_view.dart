import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:weather_app/const/colors.dart';
import 'package:weather_app/controllers/location_tab_controller.dart';
import 'package:weather_app/widgets/city_card.dart';

class LocationTabView extends StatefulWidget {
  const LocationTabView({super.key});

  @override
  State<LocationTabView> createState() => _LocationTabViewState();
}

class _LocationTabViewState extends State<LocationTabView> {
  final LocationTabController controller = Get.put(LocationTabController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Obx(() {
          return controller.savedCities.isEmpty ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/svg/search_background.svg',
              ),
              const Text(
                'No data Found',
                style: TextStyle(
                  fontSize: 20.0,
                  color: textColor1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Please add a city to track it's weather",
                style: TextStyle(
                  fontSize: 16.0,
                  color: textColor1,
                ),
              ),
            ],
          )
          :
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (var city in controller.savedCities)
                CityCard(weatherData: city),
            ],
          );
        }
      )
      ,
    );
  }
  
  
}