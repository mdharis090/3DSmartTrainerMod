import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    _HomeBody(),
    Center(child: Text('Programs')),
    Center(child: Text('Activity')),
    Center(child: Text('Leaderboard')),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: _BottomNav(
        selectedIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
      ),
    );
  }
}

// ─────────────────────────────────────────
//  HOME BODY (scrollable content)
// ─────────────────────────────────────────
class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          // ── Top bar ──────────────────────────────
          const _TopBar(),
          const SizedBox(height: 16),
          // ── Search ───────────────────────────────
          const _SearchBar(),
          const SizedBox(height: 20),
          // ── Level / target card ──────────────────
          const _TargetCard(),
          const SizedBox(height: 24),
          // ── Workout Programs ─────────────────────
          _SectionHeader(title: 'Workout Programs', onSeeAll: () {}),
          const SizedBox(height: 12),
          const _ProgramFilter(),
          const SizedBox(height: 12),
          const _ProgramRow(),
          const SizedBox(height: 24),
          // ── Workout Tips ─────────────────────────
          _SectionHeader(title: 'Workout Tips', onSeeAll: () {}),
          const SizedBox(height: 12),
          const _TipsRow(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // LEFT: Greeting
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Rohan',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A1A2E),
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Monday, Nov 1',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF9A9AB0),
              ),
            ),
          ],
        ),

        // RIGHT: Search + Notification
        Row(
          children: [
            // 🔍 Search Icon Button
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.search,
                  size: 20,
                  color: Color(0xFF1A1A2E),
                ),
                onPressed: () {
                    context.push('/search');
                },
              ),
            ),

            const SizedBox(width: 10),

            // 🔔 Notification Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const NotificationScreen(),
                  ),
                );
              },
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    const Center(
                      child: Icon(
                        Icons.notifications_outlined,
                        size: 20,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),

                    // 🔴 Badge
                    Positioned(
                      top: 7,
                      right: 7,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────
//  TOP BAR
// ─────────────────────────────────────────
// class _TopBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Hi, Rohan',
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.w700,
//                 color: Color(0xFF1A1A2E),
//               ),
//             ),
//             SizedBox(height: 2),
//             Text(
//               'Monday, Nov 1',
//               style: TextStyle(
//                 fontSize: 13,
//                 color: Color(0xFF9A9AB0),
//               ),
//             ),
//           ],
//         ),
//         Row(
//           children: [
//             // Streak chip
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.06),
//                     blurRadius: 8,
//                     offset: const Offset(0, 2),
//                   )
//                 ],
//               ),
//               child: const Row(
//                 children: [
//                   Icon(Icons.local_fire_department,
//                       color: Color(0xFFFF6B35), size: 16),
//                   SizedBox(width: 4),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Streak',
//                           style: TextStyle(
//                               fontSize: 10,
//                               color: Color(0xFF9A9AB0),
//                               fontWeight: FontWeight.w500)),
//                       Text('1 Days',
//                           style: TextStyle(
//                               fontSize: 11,
//                               fontWeight: FontWeight.w700,
//                               color: Color(0xFF1A1A2E))),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 10),
//             // Bell
//             Container(
//               width: 38,
//               height: 38,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.06),
//                     blurRadius: 8,
//                     offset: const Offset(0, 2),
//                   )
//                 ],
//               ),
//               child: Stack(
//                 children: [
//                   const Center(
//                     child: Icon(Icons.notifications_outlined,
//                         color: Color(0xFF1A1A2E), size: 20),
//                   ),
//                   Positioned(
//                     top: 7,
//                     right: 7,
//                     child: Container(
//                       width: 8,
//                       height: 8,
//                       decoration: const BoxDecoration(
//                         color: Color(0xFFFF3B30),
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// ─────────────────────────────────────────
//  SEARCH BAR
// // ─────────────────────────────────────────
// class _SearchBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 46,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           )
//         ],
//       ),
//       child: const TextField(
//         decoration: InputDecoration(
//           fillColor: AppColors.white,
//           filled: true,
//           hintText: 'Search...',
          
//           hintStyle: TextStyle(color: AppColors.black, fontSize: 14),
//           prefixIcon: Icon(Icons.search, color: Color(0xFFB0B0C8), size: 20),
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.symmetric(vertical: 13),
//         ),
//       ),
//     );
//   }
// }
class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: 'Search workout, trainer...',
          hintStyle: TextStyle(
            color: Color(0xFFB0B0C8),
            fontSize: 14,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xFFB0B0C8),
          ),
          border: InputBorder.none,
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}
// ─────────────────────────────────────────
//  TARGET CARD  (gradient banner)
// ─────────────────────────────────────────
class _TargetCard extends StatelessWidget {
  const _TargetCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF1C3A2F), Color(0xFF2D6A4F)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Background decorative circle
          Positioned(
            right: -30,
            top: -30,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),
          // Fitness person image placeholder (green overlay)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    const Color(0xFF4CD964).withOpacity(0.15)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: const Icon(Icons.fitness_center,
                  color: Colors.white24, size: 80),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Level badge
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.emoji_events, color: Color(0xFF4CD964), size: 14),
                      SizedBox(width: 4),
                      Text('Level 2',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Your Target',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                const Text('Progress to Level 2',
                    style: TextStyle(color: Colors.white60, fontSize: 12)),
                const Spacer(),
                // XP bar
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: const LinearProgressIndicator(
                          value: 25 / 100,
                          minHeight: 6,
                          backgroundColor: Colors.white24,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFF4CD964)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('25/100',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
          // XP badge top-right
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF4CD964),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('1 XP',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
//  SECTION HEADER
// ─────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;

  const _SectionHeader({required this.title, required this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A1A2E))),
        GestureDetector(
          onTap: onSeeAll,
          child: const Text('See all',
              style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF4CD964),
                  fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────
//  PROGRAM FILTER CHIPS
// ─────────────────────────────────────────
class _ProgramFilter extends StatefulWidget {
  const _ProgramFilter();

  @override
  State<_ProgramFilter> createState() => _ProgramFilterState();
}

class _ProgramFilterState extends State<_ProgramFilter> {
  int _selected = 0;
  final List<String> _filters = ['All Type', 'Upper Body', 'Lower Body', 'Abs'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(_filters.length, (i) {
          final bool active = _selected == i;
          return GestureDetector(
            onTap: () => setState(() => _selected = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: active ? const Color(0xFF4CD964) : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: active
                    ? [
                        BoxShadow(
                          color: const Color(0xFF4CD964).withOpacity(0.35),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        )
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        )
                      ],
              ),
              child: Text(
                _filters[i],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: active ? Colors.white : const Color(0xFF9A9AB0),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ─────────────────────────────────────────
//  PROGRAM ROW
// ─────────────────────────────────────────
class _ProgramRow extends StatelessWidget {
  const _ProgramRow();

  static const List<_ProgramData> _programs = [
    _ProgramData(
      title: 'Full Body',
      duration: '45 min',
      xp: '+1 XP',
      gradient: [Color(0xFF1A1A2E), Color(0xFF2D2D44)],
    ),
    _ProgramData(
      title: 'Lower Body',
      duration: '45 min',
      xp: '+1 XP',
      gradient: [Color(0xFF1C2340), Color(0xFF2A3560)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _programs.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (ctx, i) => _ProgramCard(data: _programs[i]),
      ),
    );
  }
}

class _ProgramData {
  final String title;
  final String duration;
  final String xp;
  final List<Color> gradient;

  const _ProgramData({
    required this.title,
    required this.duration,
    required this.xp,
    required this.gradient,
  });
}

class _ProgramCard extends StatelessWidget {
  final _ProgramData data;

  const _ProgramCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: data.gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: data.gradient.first.withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 6),
          )
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Background icon
          Positioned(
            right: -10,
            top: 10,
            child: Icon(
              Icons.directions_run,
              size: 90,
              color: Colors.white.withOpacity(0.08),
            ),
          ),
          // XP badge
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFF4CD964),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Text(data.xp,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w700)),
            ),
          ),
          // Bottom info
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.5),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.access_time,
                          color: Colors.white60, size: 12),
                      const SizedBox(width: 4),
                      Text(data.duration,
                          style: const TextStyle(
                              color: Colors.white60, fontSize: 11)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//notfication screen 
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text("Notification"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.fitness_center, color: Color(0xFF4CD964)),
            title: Text("New Workout Available"),
            subtitle: Text("Try your new full body workout"),
          ),
          ListTile(
            leading: Icon(Icons.timer, color: Color(0xFF4CD964)),
            title: Text("Reminder"),
            subtitle: Text("Don’t forget today’s session"),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
//  TIPS ROW
// ─────────────────────────────────────────
class _TipsRow extends StatelessWidget {
  const _TipsRow();

  static const List<_TipData> _tips = [
    _TipData(
      title: 'Warm-up First',
      subtitle: '10-15 mins warm-up avoids injuries',
      icon: Icons.self_improvement,
      color: Color(0xFF2D6A4F),
    ),
    _TipData(
      title: 'Rest Between Sets',
      subtitle: '30-60 sec rest improves strength',
      icon: Icons.bedtime_outlined,
      color: Color(0xFF1C3A2F),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _TipCard(data: _tips[0])),
        const SizedBox(width: 14),
        Expanded(child: _TipCard(data: _tips[1])),
      ],
    );
  }
}

class _TipData {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _TipData(
      {required this.title,
      required this.subtitle,
      required this.icon,
      required this.color});
}

class _TipCard extends StatelessWidget {
  final _TipData data;

  const _TipCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [data.color, data.color.withOpacity(0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: data.color.withOpacity(0.35),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            right: -10,
            bottom: -10,
            child: Icon(data.icon,
                size: 70, color: Colors.white.withOpacity(0.1)),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(data.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(data.subtitle,
                    style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 10,
                        height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
//  BOTTOM NAV
// ─────────────────────────────────────────
class _BottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const _BottomNav({required this.selectedIndex, required this.onTap});

  static const List<_NavItem> _items = [
    _NavItem(icon: Icons.home_rounded, label: 'Home'),
    _NavItem(icon: Icons.grid_view_rounded, label: 'Programs'),
    _NavItem(icon: Icons.bar_chart_rounded, label: 'Activity'),
    _NavItem(icon: Icons.emoji_events_rounded, label: 'Leaderboard'),
    _NavItem(icon: Icons.person_rounded, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 20,
            offset: const Offset(0, -4),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_items.length, (i) {
          final bool active = selectedIndex == i;
          return GestureDetector(
            onTap: () => onTap(i),
            behavior: HitTestBehavior.opaque,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: active
                    ? const Color(0xFF4CD964).withOpacity(0.12)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                _items[i].icon,
                color: active
                    ? const Color(0xFF4CD964)
                    : const Color(0xFFB0B0C8),
                size: 26,
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;

  const _NavItem({required this.icon, required this.label});
}