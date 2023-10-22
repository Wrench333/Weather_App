import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/second': (context) => SecondPage(),
    },
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Vidyavihar"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Implement menu functionality here
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                Text("39°C", style: TextStyle(fontSize: 72, color: Colors.black)),
                Text("Haze", style: TextStyle(fontSize: 24, color: Colors.grey)),
                Text('😷 AQI 165', style: TextStyle(fontSize: 14.0, color: Colors.black)),
              ],
            ),
          ),
          Container(
            width: size.width,
            margin: const EdgeInsets.all(15.0),
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 10.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text("More Details>", textAlign: TextAlign.right, style: TextStyle(color: Colors.blue)),
                    onPressed: () {},
                  ),
                ),
                WeatherInfoRow(icon: Icons.cloud, day: "Today", condition: "Haze", temperature: "40°/23°"),
                SizedBox(height: 10),
                WeatherInfoRow(icon: Icons.cloud, day: "Tomorrow", condition: "Haze", temperature: "36°/24°"),
                SizedBox(height: 10),
                WeatherInfoRow(icon: Icons.cloud, day: "Sun", condition: "Haze", temperature: "36°/25°"),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 30.0),
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement 5-day forecast functionality here
                    },
                    child: Text("5-day forecast", textAlign: TextAlign.center),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    WeatherDataRow('Now', '15:00', '16:00', '17:00'),
                    WeatherDataRow('39°', '39°', '40°', '39°'),
                    WeatherDataRow('☁', '☁', '☁', '☁'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Manage cities"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
            width: size.width,
            height: size.height / 10,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.fromLTRB(10.0,5.0,10.0,10.0),
            padding: const EdgeInsets.all(18.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.blueGrey,
            ),
            width: size.width,
            height: size.height / 9,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vidyavihar",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        "AQI 165 40° / 23°",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "39°",
                        style: TextStyle(fontSize: 39, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 0),
          Container(
            margin: const EdgeInsets.fromLTRB(10.0,5.0,10.0,10.0),
            padding: const EdgeInsets.all(19.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.blueGrey,
            ),
            width: size.width,
            height: size.height / 9,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delhi",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        "AQI 158 39° / 24°",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "35°",
                        style: TextStyle(fontSize: 39, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class WeatherInfoRow extends StatelessWidget {
  final IconData icon;
  final String day;
  final String condition;
  final String temperature;

  WeatherInfoRow({
  required this.icon,
  required this.day,
  required this.condition,
  required this.temperature,
});

@override
Widget build(BuildContext context) {
  return Row(
    children: [
      Icon(icon),
      SizedBox(width: 8),
      Text("$day · $condition", style: TextStyle(fontSize: 18)),
      Spacer(),
      Text(temperature, style: TextStyle(fontSize: 18)),
    ],
  );
}
}

class WeatherDataRow extends StatelessWidget {
  final String time1;
  final String time2;
  final String time3;
  final String time4;

  WeatherDataRow(this.time1, this.time2, this.time3, this.time4);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          time1,
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
        Text(
          time2,
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
        Text(
          time3,
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
        Text(
          time4,
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
      ],
    );
  }
}
