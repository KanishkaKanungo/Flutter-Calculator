import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;
  num z = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();
  }

  // the TextEditingController instances (displayOneController and displayTwoController)
  // are used to control the text input fields (TextField) in the UI.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          //  1. Calculator Display
          DisplayOne(
              hint: "Enter First Number", controller: displayOneController),
          const SizedBox(
            height: 30,
          ),
          DisplayOne(
              hint: "Enter Second Number", controller: displayTwoController),
          const SizedBox(
            height: 50,
          ),
          Text(
            z.toString(),
            style: const TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const Spacer(), // To give flexible space in order to adjust elements
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                backgroundColor: const Color(0xFFE5A836),
                onPressed: () {
                  // whenever we want to show the changes on ui we use setState
                  setState(() {
                    z = num.tryParse(displayOneController.text)! +
                        num.tryParse(displayTwoController.text)!;
                  });
                  //The exclamation mark (!) is used in Dart to assert
                  //that an expression can't be null, even if its type allows null.
                  //It's called the "null assertion operator" or "bang operator".
                },
                child: const Icon(Icons.add,color: Colors.white),
                shape: const CircleBorder(),
              ),
              FloatingActionButton(
                backgroundColor: const Color(0xFFE5A836),
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! -
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child:
                    const Icon(Icons.remove,color: Colors.white,), // can use Cupertino.minus as well
                shape: const CircleBorder(),
              ),
              FloatingActionButton(
                backgroundColor: const Color(0xFFE5A836),
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! *
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.multiply,color: Colors.white,),
                shape: const CircleBorder(),
              ),
              FloatingActionButton(
                backgroundColor: const Color(0xFFE5A836),
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! /
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: Icon(CupertinoIcons.divide,color: Colors.white,),
                shape: const CircleBorder(),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          FloatingActionButton.extended(
            backgroundColor: const Color(0xFFE5A836),
            onPressed: () {
              setState(() {
                x = 0;
                y = 0;
                z = 0;
                displayOneController.clear();
                displayTwoController.clear();
              });
            },
            label: Text(
              "Clear",
              style: TextStyle(fontSize: 20,
              color: Colors.white
              ),
              
            ),
          )
        ],
      ),
    );
  }
}

class DisplayOne extends StatelessWidget {
  const DisplayOne(
      {super.key, this.hint = "Enter a Number", required this.controller});

  final String? hint;
  final TextEditingController controller;
  // ? shows that the variable can be null, and if it null than in that case the dafult value of the variable will be used

  @override
  Widget build(BuildContext context) {
    return TextField(
      // the controller passed will control the content of the text field
      controller: controller,

      //  To change color of the input text
      style: const TextStyle(color: Colors.white),

      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(

          // To get focused box while giving input

          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15))),

          // To get outline of the Box

          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3.0),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          hintText: hint,
          // The variable whose value would not remain constant or that would change like the hint variable, cannot be used in the widget which is made const
          hintStyle: const TextStyle(color: Colors.white)),
    );
  }
}
