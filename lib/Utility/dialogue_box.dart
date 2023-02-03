import 'dart:developer';

import 'package:flutter/material.dart';

class DialogueBox extends StatelessWidget {
  final controller;
  VoidCallback saveFun;
  VoidCallback cancelFun;
  DialogueBox(
      {super.key,
      required this.controller,
      required this.saveFun,
      required this.cancelFun});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 223, 116, 241),
      content: Container(
        height: 160,
        child: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 233, 176, 243),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Center(
                    child: Text(
                      "Add your task",
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    saveFun();
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  color: Color.fromARGB(255, 19, 132, 224),
                ),
                MaterialButton(
                  onPressed: () {
                    cancelFun();
                    log("clicked");
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  color: Color.fromARGB(255, 238, 69, 57),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
