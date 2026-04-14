import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:guidetar/presentation/pages/login_page.dart';
import 'package:guidetar/presentation/widgets/home_bottom_navbar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _selectedNavIndex = 2;
  bool _notificationOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(26, 80, 26, 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _SectionTitle('TÀI KHOẢN'),
                  const SizedBox(height: 16),
                  _SettingTile(
                    icon: Icons.workspace_premium_outlined,
                    title: 'Gói thành viên',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF353534),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: const Color.fromRGBO(255, 183, 127, 0.2),
                            ),
                          ),
                          child: Text(
                            'MIỄN PHÍ',
                            style: GoogleFonts.plusJakartaSans(
                              color: const Color(0xFFFFB77F),
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                              height: 15 / 10,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.chevron_right,
                          color: Color(0xFFDDC1AE),
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const _SectionTitle('CÀI ĐẶT CHUNG'),
                  const SizedBox(height: 16),
                  _GroupCard(
                    children: [
                      _SettingTile(
                        icon: Icons.language,
                        title: 'Ngôn ngữ',
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Tiếng Anh',
                              style: GoogleFonts.plusJakartaSans(
                                color: const Color(0xFFDDC1AE),
                                fontSize: 14,
                                height: 20 / 14,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.chevron_right,
                              color: Color(0xFFDDC1AE),
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                      _SettingTile(
                        icon: Icons.notifications_none,
                        title: 'Thông báo',
                        trailing: Switch(
                          value: _notificationOn,
                          activeThumbColor: const Color(0xFFE5E2E1),
                          activeTrackColor: const Color(0xFFFF8A00),
                          inactiveThumbColor: const Color(0xFFE5E2E1),
                          inactiveTrackColor: const Color(0xFF3A3939),
                          onChanged: (v) => setState(() => _notificationOn = v),
                        ),
                        showDivider: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const _SectionTitle('NHẠC CỤ & LUYỆN TẬP'),
                  const SizedBox(height: 16),
                  _GroupCard(
                    children: [
                      _SettingTile(
                        icon: Icons.library_music_outlined,
                        title: 'Nhạc cụ mặc định',
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Guitar',
                              style: GoogleFonts.plusJakartaSans(
                                color: const Color(0xFFDDC1AE),
                                fontSize: 14,
                                height: 20 / 14,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.chevron_right,
                              color: Color(0xFFDDC1AE),
                              size: 16,
                            ),
                          ],
                        ),
                        showDivider: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const _SectionTitle('THÔNG TIN'),
                  const SizedBox(height: 16),
                  _GroupCard(
                    children: const [
                      _SettingTile(
                        icon: Icons.description_outlined,
                        title: 'Điều khoản & Chính sách',
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Color(0xFFDDC1AE),
                          size: 16,
                        ),
                      ),
                      _SettingTile(
                        icon: Icons.info_outline,
                        title: 'Phiên bản ứng dụng',
                        trailing: _VersionTag('v1.0.2'),
                        showDivider: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                        (route) => false,
                      );
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 17),
                      decoration: BoxDecoration(
                        color: const Color(0xFF201F1F),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color.fromRGBO(255, 180, 171, 0.1),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.logout,
                            color: Color(0xFFFF8A00),
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Đăng xuất',
                            style: GoogleFonts.plusJakartaSans(
                              color: const Color(0xFFFF8A00),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              height: 24 / 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _TopBar(onBackTap: () => Navigator.of(context).maybePop()),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Center(
                child: HomeBottomNavbar(
                  selectedIndex: _selectedNavIndex,
                  onChanged: (index) {
                    if (index == 0) {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      return;
                    }
                    setState(() {
                      _selectedNavIndex = index;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.onBackTap});

  final VoidCallback onBackTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.7)),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBackTap,
            behavior: HitTestBehavior.opaque,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Cài đặt',
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.4,
                height: 24 / 16,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.more_horiz, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.plusJakartaSans(
        color: const Color(0xFFC8C6C5),
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 2.4,
        height: 16 / 12,
      ),
    );
  }
}

class _GroupCard extends StatelessWidget {
  const _GroupCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF201F1F),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }
}

class _SettingTile extends StatelessWidget {
  const _SettingTile({
    required this.icon,
    required this.title,
    required this.trailing,
    this.showDivider = true,
  });

  final IconData icon;
  final String title;
  final Widget trailing;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        border: showDivider
            ? const Border(
                bottom: BorderSide(color: Color.fromRGBO(19, 19, 19, 0.1)),
              )
            : null,
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: const Color(0xFFE5E2E1)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.plusJakartaSans(
                color: const Color(0xFFE5E2E1),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 24 / 16,
              ),
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}

class _VersionTag extends StatelessWidget {
  const _VersionTag(this.value);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: GoogleFonts.plusJakartaSans(
        color: const Color(0xFFDDC1AE),
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
      ),
    );
  }
}
