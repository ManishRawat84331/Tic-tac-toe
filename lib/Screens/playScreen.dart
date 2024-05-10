import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/Screens/isfilled.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  isFilledController controller = Get.put(isFilledController());
  String winner = "";
  bool isWin = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: Height * 0.2,
              width: Width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.red,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Score O",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Obx(() => Text(controller.oScore.value.toString(),
                            style: TextStyle(fontSize: 35)))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Score X",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Obx(() => Text(controller.xScore.value.toString(),
                            style: TextStyle(fontSize: 35)))
                      ],
                    )
                  ],
                ),
              ),
            ),
            20.heightBox,
            Container(
              height: Height * 0.45,
              width: Width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20)),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: controller.played.value.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        if (controller.turn.value == true) {
                          controller.toadd("O", index);
                          controller.turn.value = !controller.turn.value;
                        } else {
                          controller.toadd("X", index);
                          controller.turn.value = !controller.turn.value;
                        }

                        if (controller.isWin == true) {
                          controller.isWin = false;
                          _showWinner(controller.winner.value);

                          if (controller.winner.value == 'X') {
                            controller.xScore++;
                          } else {
                            controller.oScore++;
                          }
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: Obx(() => Text(
                                  controller.played.value[index],
                                  style: TextStyle(
                                      fontSize: 55,
                                      fontWeight: FontWeight.bold),
                                ))),
                      ),
                    ),
                  );
                },
              ),
            ),
            25.heightBox,
            GestureDetector(
              onTap: () {
                setState(() {
                  controller.clear();
                });
              },
              child: Container(
                  height: Height * 0.1,
                  width: Width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.red),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.clear_all,
                        size: 45,
                      ),
                      Text(
                        "Clear",
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future _showWinner(String value) {
    context:
    context;
    return Get.defaultDialog(
        title: "Winner",
        content: Text('This Game Winner is  ${value}'),
        onConfirm: () {
          Navigator.of(context).pop();
        });
  }
}
