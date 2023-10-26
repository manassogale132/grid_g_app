import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:test_grid_task_project/widgets/custom_dialog_edit_text_widget.dart';
import 'package:test_grid_task_project/widgets/custom_info_bottom_sheet_widget.dart';

class MainGridScreen extends StatefulWidget {
  const MainGridScreen({Key? key}) : super(key: key);

  @override
  State<MainGridScreen> createState() => _MainGridScreenState();
}

class _MainGridScreenState extends State<MainGridScreen> {
  late final confettiController;
  final itemCountController = TextEditingController();
  final crossAxisCountController = TextEditingController();

  bool _validate = false;
  final bool _isPlaying = false;
  bool isLoading = true;

  int m = 0; //ItemCount Variable
  int n = 0; //Cross Axis Count Variable

  List<String> allItems = [];
  List<String> foundItems = [];

  @override
  void initState() {
    super.initState();
    confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  void _dropConfetti() {
    confettiController.play();
  }

  void filterSearchResults(String query) {
    setState(() {
      foundItems = allItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    confettiController.dispose();
    itemCountController.dispose();
    crossAxisCountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Grid Generator",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.info,
              color: Colors.green,
            ),
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return const CustomInfoBottomSheetWidget();
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: _validate
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  _validate = false;
                  isLoading = true;
                });
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text("Grid has been cleared!!!"),
                ));
              },
              shape: const CircleBorder(),
              backgroundColor: Colors.green,
              splashColor: Colors.white,
              child: const Text(
                "Reset",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
      body: Center(
        child: _validate
            ? buildColumn()
            : GestureDetector(
                onTap: () {
                  _dropConfetti();
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Dialog(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Text(
                                        'GRID CUSTOMIZER',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 30.0),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomDialogEditText(
                                            hintText: 'Enter Item-Count',
                                            maxLegth: 3,
                                            textInputFormatter:
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                            textEditingController:
                                                itemCountController,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                left: 14.0, top: 5),
                                            child: Text(
                                              "*Note: Max allowed input lenght is 0 - 999",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10.5,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomDialogEditText(
                                            hintText: 'Enter Cross-Axis-Count',
                                            maxLegth: 1,
                                            textInputFormatter:
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(r'[1-5]')),
                                            textEditingController:
                                                crossAxisCountController,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                left: 14.0, top: 5),
                                            child: Text(
                                              "*Note: Max allowed lenght is 1 to 5",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10.5),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                // Set your desired background color
                                                borderRadius: BorderRadius.circular(
                                                    8.0), // Optionally add rounded corners
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 22.0),
                                                child: TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                // Set your desired background color
                                                borderRadius: BorderRadius.circular(
                                                    8.0), // Optionally add rounded corners
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 22.0),
                                                child: TextButton(
                                                  onPressed: () {
                                                    if (_isPlaying) {
                                                      confettiController.stop();
                                                    }
                                                    setState(() {
                                                      if (itemCountController
                                                              .text
                                                              .isNotEmpty &&
                                                          crossAxisCountController
                                                              .text
                                                              .isNotEmpty) {
                                                        _validate = true;
                                                        Navigator.of(context)
                                                            .pop();
                                                        m = int.parse(
                                                            itemCountController
                                                                .text);
                                                        allItems = List<
                                                                String>.generate(
                                                            m, (i) => "$i");
                                                        foundItems = allItems;
                                                        n = int.parse(
                                                            crossAxisCountController
                                                                .text);
                                                        itemCountController
                                                            .clear();
                                                        crossAxisCountController
                                                            .clear();
                                                        Timer(
                                                            Duration(
                                                                seconds: 2),
                                                            () {
                                                          setState(() {
                                                            isLoading = false;
                                                          });
                                                        });
                                                      } else {
                                                        _validate = false;
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                          content: Text(
                                                              "Both fields are mandatory!!!"),
                                                        ));
                                                      }
                                                    });
                                                  },
                                                  child: const Text(
                                                    'Submit',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ConfettiWidget(
                                confettiController: confettiController,
                                shouldLoop: false,
                                blastDirectionality:
                                    BlastDirectionality.explosive,
                                numberOfParticles: 20,
                                minBlastForce: 10,
                                maxBlastForce: 20,
                              ),
                            ],
                          ));
                },
                child: SizedBox(
                  height: 180,
                  width: 180,
                  child: Lottie.asset(
                    'assets/hand.json',
                    animate: true,
                    repeat: true,
                  ),
                ),
              ),
      ),
    );
  }

  Widget buildColumn() {
    return isLoading
        ? CircularProgressIndicator()
        : Column(
            children: [
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoTextField(
                  onChanged: (value) => filterSearchResults(value),
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Icon(
                      Icons.search,
                      size: 30.0, // Icon size
                      color: Colors.black, // Icon color
                    ),
                  ),
                  placeholder: "Search...",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white10,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: n),
                  itemCount: foundItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.primaries[index % 10],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${foundItems[index]}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${n}*Grid',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
