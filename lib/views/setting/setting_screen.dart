import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/gradient_text.dart';
import '../../utils/style.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            bottom: 10, // 👈 give it bottom constraints
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GradientText(
                    'Wheel Name',
                    style: TextStyles.bodyReg20,
                    textAlign: TextAlign.center,
                    gradient: LinearGradient(colors: [orange3, orange4]),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 16,
                        color: orange3,
                        fontWeight: FontWeight.w500,
                      ),
                      cursorColor: orange3,
                      decoration: InputDecoration(
                        hintText: "Title Name",
                        hintStyle: TextStyles.bodyReg16,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 👇 Wrap ListView with Expanded
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10, // just example
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 6,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: orange3,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          cursorColor: orange3,
                                          decoration: InputDecoration(
                                            hintText: "Title Name",
                                            hintStyle: TextStyles.bodyReg16,
                                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: TextField(
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: orange3,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          cursorColor: orange3,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.digitsOnly,
                                          ],
                                          decoration: InputDecoration(
                                            hintText: "Percent",
                                            hintStyle: TextStyles.bodyReg16,
                                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              ZoomTapAnimation(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white,
                                  ),
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  ZoomTapAnimation(
                    child: GradientText(
                      'Add Wheel Slice',
                      style: TextStyles.bodyReg20,
                      textAlign: TextAlign.end,
                      gradient: LinearGradient(colors: [orange3, orange4]),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ZoomTapAnimation(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        child: GradientText(
                          'Create Wheel',
                          style: TextStyles.bodyReg20,
                          textAlign: TextAlign.end,
                          gradient: LinearGradient(colors: [orange3, orange4]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 70,
            right: 10,
            child: ZoomTapAnimation(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15,
                    bottom: 8,
                    top: 8,
                  ),
                  child: GradientText(
                    'Back',
                    style: TextStyles.bodyReg20,
                    textAlign: TextAlign.end,
                    gradient: LinearGradient(colors: [orange3, orange4]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class SettingScreen extends StatefulWidget {
//   const SettingScreen({super.key});
//
//   @override
//   State<SettingScreen> createState() => _SettingScreenState();
// }
//
// class _SettingScreenState extends State<SettingScreen> {
//   List<TextEditingController> prizeControllers = [];
//   List<TextEditingController> probabilityControllers = [];
//
//   @override
//   void initState() {
//     super.initState();
//     // Example initial values
//     final prizes = ["200", "100", "50", "20", "10", "5", "1", "Try Again"];
//     final probabilities = [0, 1, 1, 1, 1, 2, 23, 70];
//
//     for (int i = 0; i < prizes.length; i++) {
//       prizeControllers.add(TextEditingController(text: prizes[i]));
//       probabilityControllers.add(TextEditingController(text: probabilities[i].toString()));
//     }
//   }
//
//   @override
//   void dispose() {
//     for (var c in prizeControllers) {
//       c.dispose();
//     }
//     for (var c in probabilityControllers) {
//       c.dispose();
//     }
//     super.dispose();
//   }
//
//   void addPrize() {
//     setState(() {
//       prizeControllers.add(TextEditingController());
//       probabilityControllers.add(TextEditingController(text: "1"));
//     });
//   }
//
//   void saveSettings() {
//     final prizes = prizeControllers.map((c) => c.text).toList();
//     final probabilities = probabilityControllers.map((c) => int.tryParse(c.text) ?? 0).toList();
//
//     print("🎯 Prizes: $prizes");
//     print("🎯 Probabilities: $probabilities");
//
//     // TODO: Pass this back or save to storage
//     Navigator.pop(context, {"prizes": prizes, "probabilities": probabilities});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: ListView.builder(
//           itemCount: prizeControllers.length,
//           itemBuilder: (context, index) {
//             return Container(
//               margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//               child: ListTile(
//                 leading: IconButton(
//                   icon: const Icon(Icons.delete, color: Colors.red),
//                   onPressed: () {
//                     setState(() {
//                       prizeControllers.removeAt(index);
//                       probabilityControllers.removeAt(index);
//                     });
//                   },
//                 ),
//                 title: TextField(
//                   controller: prizeControllers[index],
//                   decoration: const InputDecoration(labelText: "Prize"),
//                 ),
//                 subtitle: TextField(
//                   controller: probabilityControllers[index],
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(labelText: "Probability"),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: addPrize,
//         backgroundColor: Colors.deepOrange,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
