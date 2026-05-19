// import 'package:flutter/material.dart';
// import 'package:transformationtracker/features/profile/view/edit_profile_screen.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // ================= HEADER =================
//             Container(
//               height: 220,
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Color(0xFFB6F245),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30),
//                 ),
//               ),
//               child: SafeArea(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         "Profile",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: const Icon(Icons.notifications_none),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             // ================= OVERLAP SECTION =================
//             Transform.translate(
//               offset: const Offset(0, -60),
//               child: Column(
//                 children: [
//                   // PROFILE CARD
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 20),
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.05),
//                           blurRadius: 10,
//                           spreadRadius: 2,
//                         )
//                       ],
//                     ),
//                     child: Column(
//                       children: [
//                         const CircleAvatar(
//                           radius: 40,
//                           backgroundImage: NetworkImage(
//                             "https://i.pravatar.cc/150?img=3",
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         const Text(
//                           "Smith",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 5),

//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 5),
//                           decoration: BoxDecoration(
//                             color: Colors.grey[200],
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: const Text("Level 2"),
//                         ),

//                         const SizedBox(height: 15),

//                         // ================= STATS =================
//                         const Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             _InfoBox(title: "60kg", subtitle: "Weight"),
//                             _InfoBox(title: "176cm", subtitle: "Height"),
//                             _InfoBox(title: "20", subtitle: "Age"),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   // ================= MENU =================
//                   _MenuItem(
//                     icon: Icons.edit,
//                     text: "Edit profile",
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => const EditProfileScreen(),
//                         ),
//                       );
//                     },
//                   ),

//                   _MenuItem(
//                     icon: Icons.subscriptions,
//                     text: "Subscription",
//                     onTap: () {},
//                   ),

//                   _MenuItem(
//                     icon: Icons.logout,
//                     text: "Logout",
//                     color: Colors.red,
//                     onTap: () {},
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ================= INFO BOX =================
// class _InfoBox extends StatelessWidget {
//   final String title;
//   final String subtitle;

//   const _InfoBox({
//     required this.title,
//     required this.subtitle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 5),
//         Text(
//           subtitle,
//           style: const TextStyle(color: Colors.grey),
//         ),
//       ],
//     );
//   }
// }

// // ================= MENU ITEM =================
// class _MenuItem extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   final Color? color;
//   final VoidCallback onTap;

//   const _MenuItem({
//     required this.icon,
//     required this.text,
//     required this.onTap,
//     this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Icon(icon, color: color ?? Colors.black),
//       title: Text(
//         text,
//         style: TextStyle(color: color ?? Colors.black),
//       ),
//       trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//       onTap: onTap,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:transformationtracker/core/constants/app_color.dart';
import 'package:transformationtracker/features/profile/view/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
       appBar: AppBar(
        backgroundColor: AppColors.background1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
  
            Transform.translate(
              offset: const Offset(0, 20),
              child: Column(
                children: [
                  // PROFILE CARD
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Transform.translate(
                            offset: const Offset(0, -30),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                  "https://i.pravatar.cc/150?img=3",
                                ),
                                
                              ),
                               const SizedBox(width: 10),
                        const Text(
                          "Smith!", // exactly as in the provided image description
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black
                          ),

                        ),

                      const SizedBox(width: 70),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: 
                            const Color(0xFFB6F245).withOpacity(0.2),
                           borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text("Level 2",style: TextStyle(color: AppColors.black)),),
                        
                      
                            ],
                          ),
                        ),
                       
                        // STATS ROW
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _InfoBox(title: "60kg", subtitle: "Weight"),
                            Divider(),
                            _InfoBox(title: "176cm", subtitle: "Height"),
                             Divider(),
                            _InfoBox(title: "20", subtitle: "Age"),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ================= PREMIUM MEMBERSHIP CARD =================
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // PRO badge + "Go Premium"
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFB6F245).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "PRO",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              "Go Premium",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Black Bull Accessories Experience All",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Premium Membership",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            // TODO: navigate to upgrade screen
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: const Row(
                              children: [
                                Text(
                                  "Upgrade",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ================= MENU ITEMS =================
                  _MenuItem(
                    icon: Icons.edit,
                    text: "Edit profile",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const EditProfileScreen(),
                        ),
                      );
                    },
                  ),
                  _MenuItem(
                    icon: Icons.subscriptions,
                    text: "Subscription",
                    onTap: () {},
                  ),
                  _MenuItem(
                    icon: Icons.logout,
                    text: "Logout",
                    color: Colors.red,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= INFO BOX =================
class _InfoBox extends StatelessWidget {
  final String title;
  final String subtitle;

  const _InfoBox({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

// ================= MENU ITEM =================
class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.text,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: color ?? Colors.black),
      title: Text(
        text,
        style: TextStyle(color: color ?? Colors.black),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}