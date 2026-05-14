// import 'package:flutter/material.dart';

// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [

//             const SizedBox(height: 40),

//             const Text("Day 5 of Journey",
//                 style: TextStyle(fontSize: 18)),

//             const SizedBox(height: 20),

//             _progressCard(),

//             const SizedBox(height: 20),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 _actionBtn(Icons.add, "Add"),
//                 _actionBtn(Icons.bar_chart, "Stats"),
//                 _actionBtn(Icons.compare, "Compare"),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _progressCard() {
//     return Container(
//       height: 180,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         gradient: const LinearGradient(
//           colors: [Colors.purple, Colors.blue],
//         ),
//       ),
//       child: const Center(
//         child: Text("60% Complete", style: TextStyle(fontSize: 22)),
//       ),
//     );
//   }

//   Widget _actionBtn(IconData icon, String label) {
//     return Column(
//       children: [
//         CircleAvatar(child: Icon(icon)),
//         const SizedBox(height: 5),
//         Text(label)
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:transformationtracker/core/constants/app_color.dart';
import 'package:transformationtracker/features/add_progress/view/add_progress_screen.dart';
import 'package:transformationtracker/features/compare/view/compare_screen.dart';
import 'package:transformationtracker/features/dashborad/controller/dashbord_provider_screen.dart';

import 'package:transformationtracker/features/dashborad/controller/dashbord_state.dart';
import 'package:transformationtracker/features/stats/view/stats_screen.dart';



class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
   final state = ref.watch(appProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text("Day ${state.daysSinceStartValue} of Journey", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("Current Weight: ${state.currentWeightValue.toStringAsFixed(1)} kg", style: const TextStyle(color: AppColors.textSecondary)),
              const SizedBox(height: 24),
              _progressCard(state),
              const SizedBox(height: 20),
              _streakCard(state.streakValue),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _actionButton(context, Icons.add, "Add Progress", () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddProgressScreen()))),
                  _actionButton(context, Icons.bar_chart, "Stats", () => Navigator.push(context, MaterialPageRoute(builder: (_) => const StatsScreen()))),
                  _actionButton(context, Icons.compare, "Compare", () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CompareScreen()))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _progressCard(AppState state) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [AppColors.gradientStart, AppColors.gradientEnd]),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 20)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            radius: 60,
            lineWidth: 10,
            percent: state.progressPercentValue,
            center: Text("${(state.progressPercentValue * 100).toInt()}%", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
            progressColor: Colors.white,
            backgroundColor: Colors.white24,
            circularStrokeCap: CircularStrokeCap.round,
          ),
          const SizedBox(height: 12),
          const Text("Complete", style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _streakCard(int streak) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1F3B),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 12)],
      ),
      child: Row(
        children: [
          const Icon(Icons.local_fire_department, color: Colors.orange, size: 32),
          const SizedBox(width: 12),
          Text("$streak Day Streak", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _actionButton(BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
            ),
            child: Icon(icon, color: Colors.white, size: 32),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}