import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transformationtracker/core/constants/app_color.dart';
import 'package:transformationtracker/features/profile_setup/controller/on_profile_provider.dart';
import 'package:transformationtracker/features/profile_setup/model/user_profile.dart';

class ProfileSetupScreen extends ConsumerStatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  ConsumerState<ProfileSetupScreen> createState() =>
      _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends ConsumerState<ProfileSetupScreen> {
  final formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final age = TextEditingController();
  final weight = TextEditingController();
  final height = TextEditingController();
  final target = TextEditingController();

  String goal = "Weight Loss";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: const Color(0xFF0F172A), // dark background
     backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Profile "),
        backgroundColor: const Color(0xFF0F172A),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
    body: SafeArea(
  child: SingleChildScrollView(
    padding: const EdgeInsets.all(20),
    child: Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          field(name, "Name"),
          field(age, "Age", isNumber: true),
          field(weight, "Weight (kg)", isNumber: true),
          field(height, "Height (cm)", isNumber: true),
          field(target, "Target Weight (kg)", isNumber: true),

          const SizedBox(height: 20),

          Row(
            children: [
              goalWidget("Weight Loss"),
              const SizedBox(width: 10),
              goalWidget("Muscle Gain"),
            ],
          ),

          const SizedBox(height: 40),

          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6C5CE7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: save,
              child: const Text(
                "START JOURNEY",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    ),
  ),
)
    );
  }

  //  CLEAN TEXTFIELD UI
  Widget field(TextEditingController c, String label,
      {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: c,
        keyboardType:
            isNumber ? TextInputType.number : TextInputType.text,

        style: const TextStyle(color: Colors.white),

        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),

         filled: true,
          fillColor: const Color(0xFF1E293B),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                const BorderSide(color: Color(0xFF6C5CE7), width: 2),
          ),
        ),

        validator: (v) => v == null || v.isEmpty ? "Required" : null,
      ),
    );
  }

  //  GOAL CARD
  Widget goalWidget(String text) {
    final selected = goal == text;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => goal = text),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: selected
                ? const Color(0xFF6C5CE7)
                : const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected
                  ? const Color(0xFF6C5CE7)
                  : Colors.grey,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //  SAVE USING RIVERPOD
  void save() {
    if (formKey.currentState!.validate()) {
      final profile = UserProfile(
        name: name.text,
        age: int.parse(age.text),
        weight: double.parse(weight.text),
        height: double.parse(height.text),
        targetWeight: double.parse(target.text),
        goal: goal,
      );

      ref.read(userProfileProvider.notifier).saveProfile(profile);
        context.push('/dashborad');
    }
  }
}