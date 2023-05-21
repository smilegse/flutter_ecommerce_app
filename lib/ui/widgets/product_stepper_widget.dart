import 'package:flutter/material.dart';

class ProductStepperWidget extends StatefulWidget {
  const ProductStepperWidget({Key? key}) : super(key: key);

  @override
  State<ProductStepperWidget> createState() => _ProductStepperWidgetState();
}

class _ProductStepperWidgetState extends State<ProductStepperWidget> {
  int _currentValue = 1;
  late TextEditingController _stepperTEController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _stepperTEController = TextEditingController(text: '1');
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        stepperButton(
          () {
            if (_currentValue > 1) {
              _currentValue--;
              _stepperTEController.text = _currentValue.toString();
            }
          },
          Icons.remove,
        ),
        SizedBox(
          width: 45,
          height: 22,
          child: TextField(
            controller: _stepperTEController,
            enabled: false,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        stepperButton(
          () {
            if (_currentValue < 20) {
              _currentValue++;
              _stepperTEController.text = _currentValue.toString();
            }
          },
          Icons.add,
        ),
      ],
    );
  }
}

Widget stepperButton(VoidCallback onTap, IconData iconData) {
  return SizedBox(
    height: 20,
    width: 20,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: onTap,
      child: Icon(
        iconData,
        size: 15,
      ),
    ),
  );
}
