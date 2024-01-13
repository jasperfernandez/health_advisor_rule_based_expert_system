import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double bodyTemperature;
  final List<String> symptoms;
  final int heartRate;

  const ResultScreen({
    Key? key,
    required this.bodyTemperature,
    required this.symptoms,
    required this.heartRate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String diagnosis = getDiagnosis();
    IconData iconData = getIconForDiagnosis(diagnosis);
    List<String> recommendedMedicines = getRecommendedMedicines(symptoms);

    Color textColor;
    switch (diagnosis) {
      case "It is advisable to consult a healthcare professional.":
        textColor = Colors.red;
        break;
      case "Monitor your symptoms and consider consulting a healthcare professional if they persist or worsen.":
        textColor = Colors.blue;
        break;
      default:
        textColor = Colors.green;
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Results',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/result.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 50),
              const Text(
                'Diagnosis:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconData,
                    color: textColor,
                    size: 24,
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      diagnosis,
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (recommendedMedicines.isNotEmpty)
                Column(
                  children: [
                    const Text(
                      'Recommended Medicines:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    for (String medicine in recommendedMedicines)
                      Text(
                        '- $medicine',
                        style: const TextStyle(fontSize: 16),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  IconData getIconForDiagnosis(String diagnosis) {
    switch (diagnosis) {
      case "It is advisable to consult a healthcare professional.":
        return Icons.warning;
      case "Monitor your symptoms and consider consulting a healthcare professional if they persist or worsen.":
        return Icons.info;
      default:
        return Icons.check_circle;
    }
  }

  String getDiagnosis() {
    if (bodyTemperature >= 38 || symptoms.length > 1 || heartRate > 100) {
      return "It is advisable to consult a healthcare professional.";
    } else if (bodyTemperature >= 37.5 ||
        symptoms.isNotEmpty ||
        heartRate > 90) {
      return "Monitor your symptoms and consider consulting a healthcare professional if they persist or worsen.";
    } else {
      return "Rest and stay hydrated. If symptoms persist or worsen, consult a healthcare professional.";
    }
  }

  List<String> getRecommendedMedicines(List<String> symptoms) {
    List<String> medicines = [];

    for (String symptom in symptoms) {
      switch (symptom) {
        case 'cough':
          medicines.add('Cough Syrup');
          break;
        case 'headache':
          medicines.add('Pain Reliever');
          break;
        case 'fatigue':
          medicines.add('Rest and Sleep');
          break;
        case 'sore throat':
          medicines.add('Throat Lozenges');
          break;
        case 'fever':
          medicines.add('Fever Reducer');
          break;
        case 'nausea':
          medicines.add('Anti-Nausea Medication');
          break;
        case 'vomiting':
          medicines.add('Rehydration Solution');
          break;
        case 'diarrhea':
          medicines.add('Anti-Diarrheal Medication');
          break;
        case 'shortness of breath':
          medicines.add('Inhaler');
          break;
        case 'chest pain':
          medicines.add('Emergency Medical Attention');
          break;
      }
    }

    return medicines;
  }
}
