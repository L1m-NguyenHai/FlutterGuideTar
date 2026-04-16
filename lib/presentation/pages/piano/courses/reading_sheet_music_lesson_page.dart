import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:guidetar/presentation/widgets/home_bottom_navbar.dart';

class ReadingSheetMusicLessonPage extends StatefulWidget {
  const ReadingSheetMusicLessonPage({Key? key}) : super(key: key);

  @override
  State<ReadingSheetMusicLessonPage> createState() =>
      _ReadingSheetMusicLessonPageState();
}

class _ReadingSheetMusicLessonPageState extends State<ReadingSheetMusicLessonPage> {
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
                      const Gap(48),
                      // Section: Bài tập cơ bản
                      _SectionHeader(
                        title: 'Bài tập cơ bản',
                        description:
                            'Luyện tập hàng ngày để nâng cao khả năng nhận diện hình ảnh.',
                        onViewAll: () {
                          // TODO: Handle view all
                        },
                      ),
                      const Gap(24),
                      // Exercise Cards Grid
                      _ExerciseCardsGrid(),
                      const Gap(48),
                      // Featured Quote Section
                      const _FeaturedQuoteSection(),
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
            'Đọc bản nhạc',
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
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/reading_sheet_background.png',
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
          // Accent gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFFF9F4A).withValues(alpha: 0.15),
                  const Color(0xFFFD8B00).withValues(alpha: 0.05),
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
                  // Title
                  SizedBox(
                    width: 576,
                    child: Text(
                      'Làm chủ\nKhuôn nhạc lớn',
                      style: GoogleFonts.plusJakartaSans(
                        color: const Color(0xFFECEDF6),
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        height: 45 / 36,
                      ),
                    ),
                  ),
                  const Gap(16),
                  // Description
                  SizedBox(
                    width: 576,
                    child: Text(
                      'Học cách giải mã các kết cấu đa âm phức tạp và kết nối liền mạch khoảng cách giữa việc đọc bằng tay trái và tay phải.',
                      style: GoogleFonts.inter(
                        color: const Color(0xFFA9ABB3),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        height: 29.25 / 18,
                      ),
                    ),
                  ),
                  const Gap(24),
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
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFF9F4A).withValues(alpha: 0.2),
                            blurRadius: 15,
                            offset: const Offset(0, 10),
                          ),
                        ],
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
                  const Gap(24),
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
              const Gap(8),
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
        // Card 1: Sight Reading
        _ExerciseCard(
          icon: 'assets/icons/sight_reading.svg',
          title: 'Những kiến thức cơ bản về đọc nhạc',
          description:
              'Nắm vững nghệ thuật quan sát trước và nhận diện các mô hình trước...',
          duration: '12m',
          isCompleted: true,
          hasButton: true,
          buttonIcon: 'assets/icons/chevron_right.svg',
        ),
        const Gap(24),
        // Card 2: Dynamics (Larger card with progress)
        _ExerciseCardLarge(
          icon: 'assets/icons/sound.svg',
          title: 'Giải thích động lực học',
          description:
              'Vượt ra ngoài các nốt nhạc: chuyển đổi ppp thành fff thành lực ấn ngón tay biểu cảm.',
          duration: '18m',
          progress: 30,
          hasPlayButton: true,
        ),
        const Gap(24),
        // Card 3: Ledger Lines
        _ExerciseCard(
          icon: 'assets/icons/ledger_lines.svg',
          title: 'Nắm vững dòng sổ cái',
          description: 'Mở rộng âm vực của bạn vượt ra ngoài khuông nhạc.',
          duration: '15m',
          isLocked: true,
        ),
      ],
    );
  }
}

class _ExerciseCard extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final String duration;
  final bool isCompleted;
  final bool isLocked;
  final bool hasButton;
  final String? buttonIcon;

  const _ExerciseCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.duration,
    this.isCompleted = false,
    this.isLocked = false,
    this.hasButton = false,
    this.buttonIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161A21),
        borderRadius: BorderRadius.circular(16),
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
              color: const Color(0xFF22262F),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: SizedBox(
                width: 22,
                height: 19.5,
                child: _SafeSvgAsset(icon),
              ),
            ),
          ),
          const Gap(17.1),
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
          const Gap(6.9),
          // Description
          Text(
            description,
            style: GoogleFonts.inter(
              color: const Color(0xFFA9ABB3),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 22.75 / 14,
            ),
          ),
          const Gap(24),
          // Duration and Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Duration
                  Row(
                    children: [
                      const Icon(Icons.timer, size: 11.667, color: Color(0xFFA9ABB3)),
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
                  if (isCompleted) ...[
                    const Gap(12),
                    // Completed indicator
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xFF7FE6DB),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const Gap(4),
                        Text(
                          'Đã hoàn thành',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF7FE6DB),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
              // Button
              if (hasButton && buttonIcon != null)
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF454857).withValues(alpha: 0.3),
                    ),
                    borderRadius: BorderRadius.circular(9999),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 7.4,
                      height: 12,
                      child: _SafeSvgAsset(buttonIcon!),
                    ),
                  ),
                )
              else if (isLocked)
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF454857).withValues(alpha: 0.3),
                    ),
                    borderRadius: BorderRadius.circular(9999),
                  ),
                  child: const Center(
                    child: Icon(Icons.lock, size: 16, color: Color(0xFFA9ABB3)),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ExerciseCardLarge extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final String duration;
  final int progress;
  final bool hasPlayButton;

  const _ExerciseCardLarge({
    required this.icon,
    required this.title,
    required this.description,
    required this.duration,
    required this.progress,
    this.hasPlayButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161A21),
        borderRadius: BorderRadius.circular(16),
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
              color: const Color(0xFF22262F),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: SizedBox(
                width: 18,
                height: 17.5,
                child: _SafeSvgAsset(icon),
              ),
            ),
          ),
          const Gap(17.1),
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
          const Gap(6.9),
          // Description
          Text(
            description,
            style: GoogleFonts.inter(
              color: const Color(0xFFA9ABB3),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 22.75 / 14,
            ),
          ),
          const Gap(24),
          // Duration and Progress
          Column(
            children: [
              Row(
                children: [
                  // Duration
                  Row(
                    children: [
                      const Icon(Icons.timer, size: 11.667, color: Color(0xFFA9ABB3)),
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
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(9999),
                            child: LinearProgressIndicator(
                              value: progress / 100,
                              minHeight: 4,
                              backgroundColor: const Color(0xFF22262F),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFFFF9F4A),
                              ),
                            ),
                          ),
                        ),
                        const Gap(4),
                        Text(
                          '$progress%',
                          style: GoogleFonts.inter(
                            color: const Color(0xFFA9ABB3),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (hasPlayButton) ...[
                const Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
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
                  ],
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _FeaturedQuoteSection extends StatelessWidget {
  const _FeaturedQuoteSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF10131A),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Instructor image
          Container(
            width: 128,
            height: 128,
            decoration: BoxDecoration(
              color: const Color(0xFF22262F),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFFF9F4A).withValues(alpha: 0.2),
                width: 2,
              ),
          ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/avatar_julian_thorne.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(40),
          // Label
          Text(
            'MẸO HAY',
            style: GoogleFonts.inter(
              color: const Color(0xFFFF9F4A),
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.7,
            ),
          ),
          const Gap(8),
          // Quote
          SizedBox(
            width: double.infinity,
            child: Text(
              '"Đọc nhạc không phải là nhìn vào các ký hiệu mà là nghe được âm thanh trước khi ngón tay bạn di chuyển."',
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                color: const Color(0xFFECEDF6),
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                height: 32 / 24,
              ),
            ),
          ),
          const Gap(8),
          // Instructor name
          Text(
            '— Maestro Julian Thorne, Giảng viên cao cấp',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: const Color(0xFFA9ABB3),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 24 / 16,
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
