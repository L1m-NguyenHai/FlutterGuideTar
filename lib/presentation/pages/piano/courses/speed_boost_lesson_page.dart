import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:guidetar/presentation/widgets/home_bottom_navbar.dart';

class SpeedBoostLessonPage extends StatefulWidget {
  const SpeedBoostLessonPage({Key? key}) : super(key: key);

  @override
  State<SpeedBoostLessonPage> createState() => _SpeedBoostLessonPageState();
}

class _SpeedBoostLessonPageState extends State<SpeedBoostLessonPage> {
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
                      // Section: Bài tập cốt lõi
                      _SectionHeader(
                        title: 'Bài tập cốt lõi',
                        description:
                            'Các bài tập cường độ cao nhằm tăng độ chính xác và sức bền.',
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
          // Bottom navigation placeholder
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
            'Tăng tốc độ',
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
            'assets/images/speed_boost_piano_background.png',
          ),
          fit: BoxFit.cover,
          opacity: 0.6,
        ),
      ),
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
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'Bậc thầy tốc độ',
                  style: GoogleFonts.plusJakartaSans(
                    color: const Color(0xFFECEDF6),
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    height: 39.6 / 36,
                  ),
                ),
                const Gap(15.3),
                // Description
                SizedBox(
                  width: 576,
                  child: Text(
                    'Nắm vững nghệ thuật thực hiện nhanh chóng thông qua hiệu quả cơ học và cách diễn đạt thông minh. Hành trình đạt tốc độ 160 BPM của bạn bắt đầu từ đây.',
                    style: GoogleFonts.inter(
                      color: const Color(0xFFA9ABB3),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 28 / 18,
                    ),
                  ),
                ),
                const Gap(32),
                // Start button
                GestureDetector(
                  onTap: () {
                    // TODO: Handle start lesson
                  },
                  child: Container(
                    width: 278,
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
                          'Bắt đầu bài học',
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
                const Gap(32),
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
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 20 / 14,
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
        // Card 1: Featured - Chuyển đổi nhanh bằng ngón tay
        _FeaturedExerciseCard(),
        const Gap(24),
        // Card 2: Tăng tốc độ
        _ExerciseCardDefault(
          icon: 'assets/icons/trending_up.svg',
          title: 'Tăng tốc độ',
          description:
              'Luyện tập nhịp điệu tăng dần để đạt được sự đồng bộ tay nhất quán.',
          duration: '18m',
          progress: 0.33,
          progressText: '30%',
        ),
        const Gap(24),
        // Card 3: Độ chính xác của ngón cái
        _ExerciseCardLocked(
          icon: 'assets/icons/hand.svg',
          title: 'Độ chính xác của ngón cái',
          description:
              'Các đoạn chuyển tiếp mượt mà cho các quãng dài và sự thay đổi quãng tám.',
          duration: '15m',
        ),
        // const Gap(24),
        // Card 4: Cơ sinh học của tốc độ
        // _EditorialHighlightCard(),
      ],
    );
  }
}

class _FeaturedExerciseCard extends StatelessWidget {
  const _FeaturedExerciseCard();

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
          // Badge
          Row(
            children: [
              const SizedBox(
                width: 15,
                height: 12,
                child: _SafeSvgAsset('assets/icons/technique.svg'),
              ),
              const Gap(8),
              Text(
                'Kỹ thuật',
                style: GoogleFonts.inter(
                  color: const Color(0xFFA9ABB3),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const Gap(16),
          // Title
          Text(
            'Chuyển đổi nhanh bằng ngón tay',
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
            'Phân lập chuyển động ở ngón thứ 3 và ngón thứ 4 để loại bỏ ma sát trong quá trình leo nốt nhạc.',
            style: GoogleFonts.inter(
              color: const Color(0xFFA9ABB3),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 20 / 14,
            ),
          ),
          const Gap(24),
          // Metadata
          Row(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 11.667,
                    height: 11.667,
                    child: _SafeSvgAsset('assets/icons/clock.svg'),
                  ),
                  const Gap(8),
                  Text(
                    '15m/ngày',
                    style: GoogleFonts.inter(
                      color: const Color(0xFFECEDF6),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Gap(24),
              Row(
                children: [
                  const SizedBox(
                    width: 11.667,
                    height: 11.667,
                    child: _SafeSvgAsset('assets/icons/check_green.svg'),
                  ),
                  const Gap(8),
                  Text(
                    'Đã hoàn thành',
                    style: GoogleFonts.inter(
                      color: const Color(0xFFECEDF6),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
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

class _ExerciseCardDefault extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final String duration;
  final double progress;
  final String progressText;

  const _ExerciseCardDefault({
    required this.icon,
    required this.title,
    required this.description,
    required this.duration,
    required this.progress,
    required this.progressText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161A21),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color.fromRGBO(69, 72, 79, 0.05),
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF22262F),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: SizedBox(
                width: 20,
                height: 12,
                child: _SafeSvgAsset(icon),
              ),
            ),
          ),
          const Gap(24),
          // Title
          Text(
            title,
            style: GoogleFonts.inter(
              color: const Color(0xFFECEDF6),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              height: 28 / 20,
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
          const Gap(32),
          // Progress and Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Progress Info
              Row(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 11.667,
                        height: 11.667,
                        child: _SafeSvgAsset('assets/icons/clock.svg'),
                      ),
                      const Gap(4),
                      Text(
                        duration,
                        style: GoogleFonts.inter(
                          color: const Color(0xFFA9ABB3),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Gap(12),
                  // Progress bar
                  Row(
                    children: [
                      Container(
                        width: 64,
                        height: 4,
                        decoration: BoxDecoration(
                          color: const Color(0xFF22262F),
                          borderRadius: BorderRadius.circular(9999),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: 64 * progress,
                              height: 4,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF9F4A),
                                borderRadius: BorderRadius.circular(9999),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(8),
                      Text(
                        progressText,
                        style: GoogleFonts.inter(
                          color: const Color(0xFFA9ABB3),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Play button
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

class _ExerciseCardLocked extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final String duration;

  const _ExerciseCardLocked({
    required this.icon,
    required this.title,
    required this.description,
    required this.duration,
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
          // Icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(127, 230, 219, 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: SizedBox(
                width: 22.5,
                height: 22.5,
                child: _SafeSvgAsset(icon),
              ),
            ),
          ),
          const Gap(24),
          // Title
          Text(
            title,
            style: GoogleFonts.inter(
              color: const Color(0xFFECEDF6),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              height: 28 / 20,
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
          const Gap(32),
          // Duration and Lock button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 11.667,
                    height: 11.667,
                    child: _SafeSvgAsset('assets/icons/clock.svg'),
                  ),
                  const Gap(4),
                  Text(
                    duration,
                    style: GoogleFonts.inter(
                      color: const Color(0xFFA9ABB3),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              // Lock button
              GestureDetector(
                onTap: () {
                  // TODO: Handle unlock
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(69, 72, 79, 0.3),
                    ),
                    borderRadius: BorderRadius.circular(9999),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 16,
                      height: 21,
                      child: _SafeSvgAsset('assets/icons/lock.svg'),
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
