import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class WeeklyInfoPage extends StatefulWidget {
  const WeeklyInfoPage({Key? key}) : super(key: key);

  @override
  State<WeeklyInfoPage> createState() => _WeeklyInfoPageState();
}

class _WeeklyInfoPageState extends State<WeeklyInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0D),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _WeeklyHeader(),
            // Main Content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Summary Section
                      _SummarySection(),
                      const Gap(32),
                      // Bar Chart Section
                      _BarChartSection(),
                      const Gap(32),
                      // Detailed Breakdown Section
                      _DetailedBreakdownSection(),
                      const Gap(96),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeeklyHeader extends StatelessWidget {
  const _WeeklyHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0E0E0D),
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: Back button + Title
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const _SafeSvgAsset(
                  'assets/icons/profile_back.svg',
                  width: 16,
                  height: 16,
                ),
              ),
              const Gap(16),
              Text(
                'Thông tin tài khoản',
                style: GoogleFonts.spaceGrotesk(
                  color: const Color(0xFFE5E2E0),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  height: 28 / 20,
                ),
              ),
            ],
          ),
          // Right: GuideTar Branding
          Row(
            children: [
              const _SafeSvgAsset(
                'assets/icons/profile_logo_note.svg',
                width: 12,
                height: 18,
              ),
              const Gap(8),
              Text(
                'GuideTar',
                style: GoogleFonts.plusJakartaSans(
                  color: const Color(0xFFF4F4F5),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  height: 28 / 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummarySection extends StatelessWidget {
  const _SummarySection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Large card - This Week
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF20201E),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFFB786).withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Label
              Text(
                'TUẦN NÀY',
                style: GoogleFonts.manrope(
                  color: const Color(0xFFDEC1AF),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.6,
                ),
              ),
              const Gap(4),
              // Time + Icon
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '3h 9m',
                    style: GoogleFonts.spaceGrotesk(
                      color: const Color(0xFFE5E2E0),
                      fontSize: 56,
                      fontWeight: FontWeight.w700,
                      height: 56 / 56,
                    ),
                  ),
                  const Gap(8),
                  const SizedBox(
                    width: 64,
                    height: 39,
                    child: _SafeSvgAsset(
                      'assets/icons/trending_up.svg',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Gap(16),
        // Two small cards
        Row(
          children: [
            // Left card - Daily Average
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1A),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Trung bình mỗi ngày',
                      style: GoogleFonts.manrope(
                        color: const Color(0xFFDEC1AF),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(4),
                    Text(
                      '27m',
                      style: GoogleFonts.spaceGrotesk(
                        color: const Color(0xFFF57C00),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(16),
            // Right card - Best Day
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1A),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Ngày tốt nhất',
                      style: GoogleFonts.manrope(
                        color: const Color(0xFFDEC1AF),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(4),
                    Text(
                      'Chủ nhật',
                      style: GoogleFonts.spaceGrotesk(
                        color: const Color(0xFFF57C00),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '1h05m',
                      style: GoogleFonts.spaceGrotesk(
                        color: const Color(0xFFF57C00),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
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

class _BarChartSection extends StatelessWidget {
  const _BarChartSection();

  static const List<Map<String, dynamic>> weeklyData = [
    {'day': 'T5', 'height': 0.35, 'isToday': false},
    {'day': 'T6', 'height': 0.26, 'isToday': false},
    {'day': 'T7', 'height': 0.48, 'isToday': false},
    {'day': 'CN', 'height': 0.42, 'isToday': false},
    {'day': 'T2', 'height': 0.30, 'isToday': false},
    {'day': 'T3', 'height': 0.05, 'isToday': false},
    {'day': 'T4', 'height': 0.0, 'isToday': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF20201E),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Hàng tuần',
            style: GoogleFonts.spaceGrotesk(
              color: const Color(0xFFE5E2E0),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(32),
          // Chart
          SizedBox(
            height: 220,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Y-axis labels
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '1h30',
                      style: GoogleFonts.manrope(
                        color: Colors.white.withValues(alpha: 0.5),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '1h',
                      style: GoogleFonts.manrope(
                        color: Colors.white.withValues(alpha: 0.5),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '30',
                      style: GoogleFonts.manrope(
                        color: Colors.white.withValues(alpha: 0.5),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '0',
                      style: GoogleFonts.manrope(
                        color: Colors.white.withValues(alpha: 0.5),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Gap(16),
                // Chart bars
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      weeklyData.length,
                      (index) => _ChartBar(
                        day: weeklyData[index]['day'],
                        heightFraction: weeklyData[index]['height'],
                        isToday: weeklyData[index]['isToday'],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartBar extends StatelessWidget {
  final String day;
  final double heightFraction;
  final bool isToday;

  const _ChartBar({
    required this.day,
    required this.heightFraction,
    required this.isToday,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Bar
        Container(
          width: 32,
          height: 144 * heightFraction,
          decoration: BoxDecoration(
            color: isToday
                ? const Color(0xFFF97F08)
                : const Color(0xFFF57C00).withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const Gap(11),
        // Label
        Text(
          day,
          style: GoogleFonts.manrope(
            color: isToday
                ? const Color(0xFFF97F08)
                : const Color(0xFFDEC1AF),
            fontSize: 10.4,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class _DetailedBreakdownSection extends StatelessWidget {
  const _DetailedBreakdownSection();

  static const List<Map<String, dynamic>> dailyData = [
    {
      'date': 'Thứ Tư, 22 tháng 10',
      'duration': '10 phút',
      'isHighlighted': true,
    },
    {
      'date': 'Thứ Ba, 21 tháng 10',
      'duration': '11 phút',
      'isHighlighted': false,
    },
    {
      'date': 'Thứ Hai, 20 tháng 10',
      'duration': '33 phút',
      'isHighlighted': false,
    },
    {
      'date': 'Chủ Nhật, 19 tháng 10',
      'duration': '1 tiếng 5 phút',
      'isHighlighted': false,
    },
    {
      'date': 'Thứ Bảy, 18 tháng 10',
      'duration': '17 phút',
      'isHighlighted': false,
    },
    {
      'date': 'Thứ Sáu, 17 tháng 10',
      'duration': '40 phút',
      'isHighlighted': false,
    },
    {
      'date': 'Thứ Năm, 16 tháng 10',
      'duration': '13 phút',
      'isHighlighted': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          'Chi tiết từng ngày',
          style: GoogleFonts.spaceGrotesk(
            color: const Color(0xFFE5E2E0),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Gap(16),
        // List items
        Column(
          children: List.generate(
            dailyData.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _DailyListItem(
                date: dailyData[index]['date'],
                duration: dailyData[index]['duration'],
                isHighlighted: dailyData[index]['isHighlighted'],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DailyListItem extends StatelessWidget {
  final String date;
  final String duration;
  final bool isHighlighted;

  const _DailyListItem({
    required this.date,
    required this.duration,
    required this.isHighlighted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A29),
        borderRadius: BorderRadius.circular(12),
        border: isHighlighted
            ? const Border(
                left: BorderSide(
                  color: Color(0xFFF97F08),
                  width: 4,
                ),
              )
            : null,
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Date
          Text(
            date,
            style: GoogleFonts.manrope(
              color: const Color(0xFFE5E2E0),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          // Duration + Arrow
          Row(
            children: [
              Text(
                duration,
                style: GoogleFonts.spaceGrotesk(
                  color: const Color(0xFFE5E2E0),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Gap(16),
              const SizedBox(
                width: 7.4,
                height: 12,
                child: _SafeSvgAsset(
                  'assets/icons/chevron_right.svg',
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
  final double? width;
  final double? height;

  const _SafeSvgAsset(
    this.assetPath, {
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    if (width != null && height != null) {
      return SizedBox(
        width: width,
        height: height,
        child: SvgPicture.asset(
          assetPath,
          fit: BoxFit.contain,
          placeholderBuilder: (BuildContext context) {
            return const Icon(
              Icons.image_not_supported,
              color: Colors.grey,
            );
          },
        ),
      );
    }
    return SvgPicture.asset(
      assetPath,
      placeholderBuilder: (BuildContext context) {
        return const Icon(
          Icons.image_not_supported,
          color: Colors.grey,
        );
      },
    );
  }
}
