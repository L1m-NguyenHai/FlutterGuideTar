import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:guidetar/presentation/widgets/home_bottom_navbar.dart';

class FingerStrengthLessonPage extends StatefulWidget {
  const FingerStrengthLessonPage({Key? key}) : super(key: key);

  @override
  State<FingerStrengthLessonPage> createState() =>
      _FingerStrengthLessonPageState();
}

class _FingerStrengthLessonPageState extends State<FingerStrengthLessonPage> {
  int _selectedNavIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0E14),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                const _LessonHeader(),
                // Main Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(32),
                      // Hero Section
                      const _HeroSection(),
                      const Gap(32),
                      // Section: Bài tập tăng cường
                      _SectionHeader(
                        title: 'Bài tập tăng cường',
                        description:
                            'Các bài tập hàng ngày để xây dựng sự ổn định về mặt kỹ thuật.',
                        onViewAll: () {
                          // TODO: Handle view all
                        },
                      ),
                      const Gap(24),
                      // Exercise Cards Grid
                      _ExerciseCardsGrid(),
                      const Gap(128),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Bottom navigation bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: HomeBottomNavbar(
                selectedIndex: _selectedNavIndex,
                onChanged: (index) {
                  setState(() {
                    _selectedNavIndex = index;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LessonHeader extends StatelessWidget {
  const _LessonHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0B0E14),
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const SizedBox(
              width: 16,
              height: 16,
              child: _SafeSvgAsset('assets/icons/profile_back.svg'),
            ),
          ),
          const Gap(16),
          Text(
            'Luyện ngón',
            style: GoogleFonts.plusJakartaSans(
              color: const Color(0xFFECEDF6),
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 28 / 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161A21),
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/luyen_ngon_lesson_background.png',
          ),
          fit: BoxFit.cover,
          opacity: 0.6,
        ),
      ),
      height: 400,
      child: Stack(
        children: [
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  const Color(0xFF0B0E14).withValues(alpha: 0.4),
                  const Color(0xFF0B0E14),
                ],
              ),
            ),
          ),
          // Content
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Description
                  SizedBox(
                    width: 576,
                    child: Text(
                      'Nắm vững khía cạnh khó khăn nhất của kỹ thuật chơi piano với Tiến sĩ Aris Thorne. Một buổi học chuyên sâu 45 phút về sự độc lập của dây chằng.',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        height: 28 / 18,
                      ),
                    ),
                  ),
                  const Gap(16),
                  // Start button
                  GestureDetector(
                    onTap: () {
                      // TODO: Handle start lesson
                    },
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF9F4A),
                        borderRadius: BorderRadius.circular(9999),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 11,
                            height: 14,
                            child: _SafeSvgAsset('assets/icons/play_icon.svg'),
                          ),
                          const Gap(8),
                          Text(
                            'Bắt đầu khóa học',
                            style: GoogleFonts.inter(
                              color: const Color(0xFF532A00),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(16),
                  // Duration and Status
                  Row(
                    children: [
                      // Duration
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thời gian',
                            style: GoogleFonts.inter(
                              color: const Color(0xFFA9ABB3),
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1,
                            ),
                          ),
                          const Gap(4),
                          Text(
                            '45m',
                            style: GoogleFonts.inter(
                              color: const Color(0xFFECEDF6),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const Gap(24),
                      // Status
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Trạng thái',
                            style: GoogleFonts.inter(
                              color: const Color(0xFFA9ABB3),
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1,
                            ),
                          ),
                          const Gap(4),
                          Text(
                            '85% Hoàn thành',
                            style: GoogleFonts.inter(
                              color: const Color(0xFF7FE6DB),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
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

class _SectionHeader extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onViewAll;

  const _SectionHeader({
    required this.title,
    required this.description,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title and description
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.plusJakartaSans(
                  color: const Color(0xFFECEDF6),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  height: 32 / 24,
                ),
              ),
              const Gap(4),
              Text(
                description,
                style: GoogleFonts.inter(
                  color: const Color(0xFFA9ABB3),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 24 / 16,
                ),
              ),
            ],
          ),
        ),
        // View all button
        GestureDetector(
          onTap: onViewAll,
          child: Row(
            children: [
              Text(
                'Xem tất cả',
                style: GoogleFonts.inter(
                  color: const Color(0xFFFF9F4A),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(4.82),
              const SizedBox(
                width: 7.4,
                height: 12,
                child: _SafeSvgAsset('assets/icons/chevron_right.svg'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ExerciseCardsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Card 1: Featured - Hanon
        _HanonCard(),
        const Gap(24),
        // Card 2: Điều khiển ngón tay độc lập
        _ExerciseCardWithImage(
          image: 'assets/images/lesson_dieu_khien_ngon_tay_doc_lap.png',
          title: 'Điều khiển ngón tay độc lập',
          description: 'Dạy bài luyện tập để độc lập ngón tay từng cái một',
          duration: '12m / bài',
          hasBadges: true,
        ),
        const Gap(24),
        // Card 3: Czerny
        _PracticeCard(
          icon: 'assets/icons/practice.svg',
          title: 'Czerny: Opus 599',
          subtitle: 'Sẽ tập luyện được ra đó',
          duration: '20m',
        ),
        const Gap(24),
        // Card 4: Staccato
        _PracticeCard(
          icon: 'assets/icons/staccato.svg',
          title: 'Staccato',
          subtitle: 'Kỹ thuật ngắt cắn có cơ chân',
          duration: '8m',
        ),
      ],
    );
  }
}

class _HanonCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161A21),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sheet music image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/hanon_sheet.png',
              height: 192,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(24),
          // Badge and metadata
          Row(
            children: [
              Text(
                'KỸ THUẬT',
                style: GoogleFonts.inter(
                  color: const Color(0xFFFF9F4A),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              const Gap(8),
              Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  color: Color(0xFF45484F),
                  shape: BoxShape.circle,
                ),
              ),
              const Gap(8),
              Text(
                'Cơ bản đến nâng cao',
                style: GoogleFonts.inter(
                  color: const Color(0xFFA9ABB3),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Gap(8),
          // Title
          Text(
            'Nghệ sĩ piano: Hanon số 1-20',
            style: GoogleFonts.inter(
              color: const Color(0xFFECEDF6),
              fontSize: 24,
              fontWeight: FontWeight.w600,
              height: 32 / 24,
            ),
          ),
          const Gap(4),
          // Description
          Text(
            'Tiêu chuẩn vàng cơ bản cho sự nhanh nhẹn của ngón tay. Tập trung vào độ chính xác nhịp điệu và sự linh hoạt.',
            style: GoogleFonts.inter(
              color: const Color(0xFFA9ABB3),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 20 / 14,
            ),
          ),
          const Gap(16),
          // Status badges
          Row(
            children: [
              Row(
                children: [
                  const Icon(Icons.timer, size: 12, color: Color(0xFFA9ABB3)),
                  const Gap(4),
                  Text(
                    '15m/ngày',
                    style: GoogleFonts.inter(
                      color: const Color(0xFFA9ABB3),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Gap(24),
              Row(
                children: [
                  const Icon(Icons.check_circle, size: 12, color: Color(0xFF7FE6DB)),
                  const Gap(4),
                  Text(
                    'Đã hoàn thành',
                    style: GoogleFonts.inter(
                      color: const Color(0xFFECEDF6),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ExerciseCardWithImage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String duration;
  final bool hasBadges;

  const _ExerciseCardWithImage({
    required this.image,
    required this.title,
    required this.description,
    required this.duration,
    this.hasBadges = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161A21),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hand image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              image,
              height: 192,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(24),
          // Title
          Text(
            title,
            style: GoogleFonts.inter(
              color: const Color(0xFFECEDF6),
              fontSize: 24,
              fontWeight: FontWeight.w600,
              height: 32 / 24,
            ),
          ),
          const Gap(8),
          // Description
          Text(
            description,
            style: GoogleFonts.inter(
              color: const Color(0xFFA9ABB3),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 20 / 14,
            ),
          ),
          const Gap(16),
          // Duration and Play button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                duration,
                style: GoogleFonts.inter(
                  color: const Color(0xFFFF9F4A),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // TODO: Handle play
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF9F4A),
                    borderRadius: BorderRadius.circular(9999),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 11,
                      height: 14,
                      child: _SafeSvgAsset('assets/icons/play_icon.svg'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PracticeCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final String duration;

  const _PracticeCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161A21),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      height: 96,
      child: Row(
        children: [
          // Icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 159, 74, 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: _SafeSvgAsset(icon),
              ),
            ),
          ),
          const Gap(16),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                    color: const Color(0xFFECEDF6),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 24 / 16,
                  ),
                ),
                const Gap(4),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    color: const Color(0xFFA9ABB3),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          // Duration
          Text(
            duration,
            style: GoogleFonts.inter(
              color: const Color(0xFFFF9F4A),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _SafeSvgAsset extends StatelessWidget {
  final String assetPath;

  const _SafeSvgAsset(this.assetPath);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      fit: BoxFit.contain,
      placeholderBuilder: (BuildContext context) {
        return const Icon(
          Icons.image_not_supported,
          color: Colors.grey,
        );
      },
    );
  }
}
