import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: BMICalculator(),
  ));
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double height = 160; // Default height in centimeters
  double weight = 60; // Default weight in kilograms
  double bmi = 0;
  String bmiStatus = "";

  void calculateBMI() {
    setState(() {
      bmi = weight / ((height / 100) * (height / 100));
      updateBMIStatus();
    });
  }

  void updateBMIStatus() {
    if (bmi < 18.5) {
      bmiStatus = "Underweight";
    } else if (bmi >= 18.5 && bmi < 25) {
      bmiStatus = "Normal";
    } else if (bmi >= 25 && bmi < 30) {
      bmiStatus = "Overweight";
    } else {
      bmiStatus = "Obesity";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator BMI'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  bottom: 40), // Atur top margin sesuai kebutuhan
              child: Text(
                'Dede Sunarwan 21552011318 \n TIF RM 221MC',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              'Tinggi Badan (cm)',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: height,
              min: 100,
              max: 250,
              onChanged: (value) {
                setState(() {
                  height = value;
                });
              },
            ),
            Text(height.toStringAsFixed(0)),
            SizedBox(height: 16),
            Text(
              'Berat Badan (kg)',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: weight,
              min: 20,
              max: 200,
              onChanged: (value) {
                setState(() {
                  weight = value;
                });
              },
            ),
            Text(weight.toStringAsFixed(0)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                calculateBMI();
              },
              child: Text('Hitung BMI'),
            ),
            Text(
              'BMI: ${bmi.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Status BMI: $bmiStatus',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
