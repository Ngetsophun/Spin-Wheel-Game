import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/custom_app_bar/main_app_bar_screen.dart';
import '../../../utils/gradient_text.dart';
import '../../../utils/style.dart';

class CreateSpinWheelScreen extends StatefulWidget {
  const CreateSpinWheelScreen({super.key});

  @override
  State<CreateSpinWheelScreen> createState() => _CreateSpinWheelScreenState();
}

class _CreateSpinWheelScreenState extends State<CreateSpinWheelScreen> {
  final List<int> slices = [0]; // store slices
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainAppBar(
        context: context,
        appBarTitle: "Create New Wheel",
        iconRight: Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: ZoomTapAnimation(
            child: Text(
              'Create',
              style: TextStyles.bodyReg20.copyWith(color: Colors.white),
            ),
          ),
        ),
        backClick: (){
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GradientText(
                    'Wheel Name',
                    style: TextStyles.bodyReg24,
                    textAlign: TextAlign.center,
                    gradient: LinearGradient(colors: [orange3, orange4]),
                  ),
                  const SizedBox(height: 10),

                  /// Wheel Name TextField
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
                        hintText: "Wheel Name",
                        hintStyle: TextStyles.bodyReg16,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  /// Dynamic List of Slices
                  Expanded(
                    child: ListView.builder(
                      itemCount: slices.length + 1,
                      padding: EdgeInsets.zero,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index < slices.length) {
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
                                          flex: 2,
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
                                              contentPadding: const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 15),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
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
                                              contentPadding: const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 15),
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
                                  onTap: () {
                                    setState(() {
                                      slices.removeAt(index);
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white,
                                    ),
                                    height: 50,
                                    width: 50,
                                    child: const Icon(Icons.delete, color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Align(
                            alignment: Alignment.centerRight, // always end right
                            child: ZoomTapAnimation(
                              onTap: () {
                                setState(() {
                                  slices.add(slices.length); // add new slice
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white
                                      ),
                                      child: Icon(Icons.add,color: orange4,),
                                    ),
                                    SizedBox(width: 10,),
                                    Text(
                                      "Add Wheel Slice",
                                        style: TextStyles.bodyReg16.copyWith(color: Colors.white)
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),



                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
