import 'package:flutter/material.dart';

class GoalSlectionScreen extends StatefulWidget {
  const GoalSlectionScreen({super.key});

  @override
  State<GoalSlectionScreen> createState() => _GoalSlectionScreenState();
}

class _GoalSlectionScreenState extends State<GoalSlectionScreen> {
  final Map<String, bool> _selectedGoals = {
     'Lose Weight': false,
    'Muscle Building': false,
    'Increasing Activity': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'choose your goal',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
       body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // List of selection cards
              Expanded(
                child: ListView(
                  children: _selectedGoals.keys.map((String key) {
                    return Card(
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      margin: const EdgeInsets.only(bottom: 12.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, 
                          vertical: 8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              key,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Checkbox(
                              value: _selectedGoals[key],
                              activeColor: const Color(0xFFB4EC51), // Match button color
                              checkColor: Colors.black,
                              side: const BorderSide(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                              onChanged: (bool? value) {
                                setState(() {
                                  _selectedGoals[key] = value ?? false;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              
              // Bottom Finish Button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    // Collect selected items
                    List<String> selectedGoals = _selectedGoals.entries
                        .where((entry) => entry.value)
                        .map((entry) => entry.key)
                        .toList();
                    
                    print("Selected Goals: $selectedGoals");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB4EC51), // Bright lime green
                    foregroundColor: Colors.black, // Text color
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Finish',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
    