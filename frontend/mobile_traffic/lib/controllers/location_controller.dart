
import 'package:get/state_manager.dart';
import 'package:location/location.dart';

import 'package:get/get.dart';

class LocationController extends GetxController{
      Location location = new Location();

      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      Rx<LocationData> _locationData  = new LocationData.fromMap({}).obs;

      LocationData getLocationData(){
        print("location data is  : ${_locationData.value} ");
        return _locationData.value;

      }
      
      Future<void> updateLocation() async{
        _serviceEnabled = await location.serviceEnabled();
        
          if (!_serviceEnabled) {
            _serviceEnabled = await location.requestService();
            if (!_serviceEnabled) {
              return;
            }
        }

        _permissionGranted = await location.hasPermission();
          if (_permissionGranted == PermissionStatus.denied) {
            _permissionGranted = await location.requestPermission();
            if (_permissionGranted != PermissionStatus.granted) {
              return;
            }
        }

          _locationData.value = await location.getLocation();
          print("location data is  : ${_locationData.value} ");
      }
}