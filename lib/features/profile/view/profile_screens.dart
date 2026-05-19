import 'package:flutter/material.dart';
import 'package:transformationtracker/features/profile/view/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          // ================= HEADER =================
          Container(
            height: 180,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFB6F245),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none),
                    )
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: -50),

          // ================= PROFILE CARD =================
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/150?img=3",
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Smith !",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text("Level 2"),
                ),
                const SizedBox(height: 15),

                // ================= STATS =================
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _InfoBox(title: "60kg", subtitle: "Weight"),
                    _InfoBox(title: "176cm", subtitle: "Height"),
                    _InfoBox(title: "20", subtitle: "Year Age"),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ================= MENU =================
          _MenuItem(
            icon: Icons.edit,
            text: "Edit profile",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>  const EditProfileScreen(),
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
      title: Text(text, style: TextStyle(color: color ?? Colors.black)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}