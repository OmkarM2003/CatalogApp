import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DriverInfo extends StatelessWidget {
  const DriverInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _descriptionController =
        TextEditingController();

    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35, right: 25),
            child: Container(
              child: Text(
                "Register A Complaint",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: context.theme.cardColor),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  hintText: "Complaint Title",
                  hintStyle: TextStyle(color: context.theme.cardColor)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              child: SizedBox(
                height: 200,
                child: TextField(
                  controller: _descriptionController,
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintText: "Complaint Description",
                      hintStyle: TextStyle(color: context.theme.cardColor)),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _titleController.clear(); // Clear title field
              _descriptionController.clear(); // Clear description field
              final snackBar =
                  SnackBar(content: Text('Your Complaint is Submitted'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.green,
                ),
                child: Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
