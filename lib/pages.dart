import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthome_ui/smartdevicesbox.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List SmartDevices = [
    ["Smart      Light", "assets/lightbulb.png", false],
    ["Smart          AC", "assets/air-conditioner.png", false],
    ["Smart          TV", "assets/smart-tv.png", false],
    ["Smart      Fan", "assets/fan.png", false],
  ];

  void onClick(bool value, int index) {
    setState(() {
      SmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),

              //custom app bar
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/more.png",
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            //welcome
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Home,",
                      style: TextStyle(fontSize: 20, color: Colors.grey[700])),
                  Text("SWEETIE",
                      style: GoogleFonts.bebasNeue(
                          fontSize: 80, color: Colors.grey[900])),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Divider(thickness: 1, color: Colors.grey[400]),
                  ),
                  Text("Smart Devices",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      )),
                ],
              ),
            ),
            //grid
            Expanded(
              child: GridView.builder(
                //physics: const NeverScrollableScrollPhysics(),
                itemCount: SmartDevices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return Smartdevicesbox(
                    deviceName: SmartDevices[index][0],
                    iconPath: SmartDevices[index][1],
                    powerOn: SmartDevices[index][2],
                    onChanged: (value) => onClick(value!, index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
