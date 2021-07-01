import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
//'https://worldtimeapi.org/api/timezone/Asia/Jerusalem'

class WorldTime {
  String location = ''; //location name for the UI
  String time = ''; //the time in that location
  String flag = ''; //url to an asset flag icon
  String url = ''; //location url for api endpoint
  bool isDaytime; //true day; false night

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      //make the request
      Response response = await get(
          Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //print(datetime);
      //print(offset);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('caught error: $e');
      time = 'Could not get time data';
    }
  }

}

WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
