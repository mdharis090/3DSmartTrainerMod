import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_unit_ruler/flutter_unit_ruler.dart';
import 'package:go_router/go_router.dart';
import 'package:transformationtracker/core/constants/app_color.dart';
import 'package:transformationtracker/core/utils/custom_button.dart';
import 'package:transformationtracker/features/personal_name/controller/personal_deataile_provider.dart';
import 'package:transformationtracker/features/personal_name/model/user_data_model.dart';

class PersonalDetaileScreen extends ConsumerStatefulWidget {
  const PersonalDetaileScreen({super.key});

  @override
  ConsumerState<PersonalDetaileScreen> createState() =>
      _PersonalDetaileScreenState();
}

class _PersonalDetaileScreenState extends ConsumerState<PersonalDetaileScreen> {
  late final ScaleController _ageController;
  late final ScaleController _heightController;
  late final ScaleController _weightController;
  @override
  void initState() {
    super.initState();
    _ageController = ScaleController(value: 19);
    _heightController = ScaleController(value: 160);
    _weightController = ScaleController(value: 55);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final userData = ref.read(userDataProvider);
    // Clamp values to new ranges
    _ageController.value = userData.age.toDouble().clamp(1, 120);
    _heightController.value = userData.height.toDouble().clamp(100, 250);
    _weightController.value = userData.weight.toDouble().clamp(20, 200);
  }

  @override
  void dispose() {
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userDataProvider);
    final notifier = ref.read(userDataProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Personal Details',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Gender',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _GenderTile(
                      title: 'Male',
                      isSelected: userData.gender == Gender.male,
                      onTap: () => notifier.setGender(Gender.male),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _GenderTile(
                      title: 'Female',
                      isSelected: userData.gender == Gender.female,
                      onTap: () => notifier.setGender(Gender.female),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // // Horizontal ruler for Age
              // _HorizontalRulerSection(
              //   title: 'Age',
              //   unit: 'yrs',
              //   controller: _ageController,
              //   currentValue: userData.age.toDouble(),
              //   minValue: 19,
              //   maxValue: 25,
              //   onValueChanged: (value) => notifier.setAge(value.toInt()),
              // ),
              // const SizedBox(height: 32),

              // // Horizontal ruler for Height
              // _HorizontalRulerSection(
              //   title: 'Height',
              //   unit: 'cm',
              //   controller: _heightController,
              //   currentValue: userData.height.toDouble(),
              //   minValue: 160,
              //   maxValue: 166,
              //   onValueChanged: (value) => notifier.setHeight(value.toInt()),
              // ),
              // const SizedBox(height: 32),

              // // Horizontal ruler for Weight
              // _HorizontalRulerSection(
              //   title: 'Weight',
              //   unit: 'kg',
              //   controller: _weightController,
              //   currentValue: userData.weight.toDouble(),
              //   minValue: 55,
              //   maxValue: 61,
              //   onValueChanged: (value) => notifier.setWeight(value.toInt()),
              // ),
              // const SizedBox(height: 48),
              const SizedBox(height: 40),

              _HorizontalRulerSection(
                title: 'Age',
                unit: 'yrs',
                controller: _ageController,
                currentValue: userData.age.toDouble(),
                minValue: 1,
                maxValue: 120,
                onValueChanged: (value) => notifier.setAge(value.toInt()),
              ),
              const SizedBox(height: 32),
              _HorizontalRulerSection(
                title: 'Height',
                unit: 'cm',
                controller: _heightController,
                currentValue: userData.height.toDouble(),
                minValue: 100,
                maxValue: 250,
                onValueChanged: (value) => notifier.setHeight(value.toInt()),
              ),
              _HorizontalRulerSection(
                title: 'Weight',
                unit: 'kg',
                controller: _weightController,
                currentValue: userData.weight.toDouble(),
                minValue: 20,
                maxValue: 200,
                onValueChanged: (value) => notifier.setWeight(value.toInt()),
              ),
              const SizedBox(height: 48),
              
              // Set Now Button
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     onPressed: () => _showSetNowDialog(context, userData),
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: AppColors.background1,
              //       foregroundColor: AppColors.black,
              //       padding: const EdgeInsets.symmetric(vertical: 16),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //       elevation: 4,
              //     ),
              //     child: const Text(
              //       'Set Now',
              //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //  Verify Button
              CustomBoxButton(
                text: "Set Now",
                onTap: () {
                  _showSetNowDialog(context, userData);
               
                  context.push('/slectgoal');
                },
              ),
            ],
          ),
        ),
      ),
    );
    
  }

  void _showSetNowDialog(BuildContext context, UserData data) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Profile Saved'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Gender: ${data.gender == Gender.male ? 'Male' : 'Female'}'),
            Text('Age: ${data.age} years'),
            Text('Height: ${data.height} cm'),
            Text('Weight: ${data.weight} kg'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------
// Horizontal ruler widget (reusable)
// ---------------------------------------------------------------------
class _HorizontalRulerSection extends StatelessWidget {
  final String title;
  final String unit;
  final ScaleController controller;
  final double currentValue;
  final double minValue;
  final double maxValue;
  final ValueChanged<double> onValueChanged;

  const _HorizontalRulerSection({
    required this.title,
    required this.unit,
    required this.controller,
    required this.currentValue,
    required this.minValue,
    required this.maxValue,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    final int range = (maxValue - minValue).toInt(); // e.g., 6 for Age (19-25)

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title and current value badge
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFE9F5F0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${currentValue.toInt()} $unit',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D6A4F),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Horizontal ruler
        SizedBox(
          height: 100,
          width: double.infinity,
          child: UnitRuler(
            height: 100,
            width: double.infinity,
            controller: controller,
            scrollDirection: Axis.horizontal,
            backgroundColor: Colors.grey.shade100,
            scaleUnit: ScaleUnit(
              name: title,
              symbol: '',
              subDivisionCount: range,
              scaleIntervals: [
                ScaleIntervals(
                  begin: minValue.toInt(),
                  end: maxValue.toInt(),
                  scale: 1.0,
                ),
              ],
            ),
            scaleAlignment: Alignment.bottomCenter,
            scalePadding: const EdgeInsets.only(bottom: 20),
            scaleMargin: 0,
            scaleMarker: Container(
              width: 40,
              height: 4,
              color: const Color(0xFF2D6A4F),
            ),
            scaleMarkerPositionTop: 0,
            scaleMarkerPositionLeft: 0,
            scaleIntervalText: (index, value) => value.toInt().toString(),
            scaleIntervalTextStyle: const TextStyle(
              color: Colors.black54,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            scaleIntervalTextPosition: 20,
            onValueChanged: (value) {
              final clamped = value.toDouble().clamp(minValue, maxValue);
              controller.value = clamped;
              onValueChanged(clamped);
            },
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------
// Gender selection tile (unchanged)
// ---------------------------------------------------------------------
class _GenderTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenderTile({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.background1 : AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.background1 : AppColors.white,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.black : Colors.grey.shade800,
            ),
          ),
        ),
      ),
    );
  }
}
