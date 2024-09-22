import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Smartdevicesbox extends StatelessWidget {
  final String deviceName;
  final String iconPath;
  final bool powerOn;
  final Function(bool?)? onChanged;
  const Smartdevicesbox({
    super.key,
    required this.deviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn ? Colors.grey[900] : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            const BoxShadow(
                blurRadius: 15.0,
                spreadRadius: 1.0,
                offset: Offset(-4.0, -4.0),
                color: Colors.white),
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              offset: const Offset(4.0, 4.0),
              spreadRadius: 1.0,
              blurRadius: 15.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              iconPath,
              height: 100,
              color: powerOn ? Colors.white : Colors.black,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    deviceName,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: powerOn ? Colors.white : Colors.black),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Transform.rotate(
                      angle: pi / 2,
                      child: CupertinoSwitch(
                          value: powerOn, onChanged: onChanged)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
