
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
        SizedBox(
          height: 30,
          width: 30,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: () {
              if (_currentValue > 1) {
                _currentValue--;
                _stepperTEController.text = _currentValue.toString();
              }
            },
            child: const Icon(Icons.remove,size: 20,),
          ),
        ),
        SizedBox(
          width: 50,
          height: 28,
          child: TextField(
            controller: _stepperTEController,
            enabled: false,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        SizedBox(
          height: 30,
          width: 30,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: () {
              if (_currentValue < 20) {
                _currentValue++;
                _stepperTEController.text = _currentValue.toString();
              }
            },
            child: const Icon(
              Icons.add,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
