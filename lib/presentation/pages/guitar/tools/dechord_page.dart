import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:guidetar/presentation/pages/guitar/tools/mat_biec_page.dart';
import 'package:guidetar/presentation/widgets/home_bottom_navbar.dart';

class DeChordPage extends StatefulWidget {
  const DeChordPage({super.key});

  @override
  State<DeChordPage> createState() => _DeChordPageState();
}

class _DeChordPageState extends State<DeChordPage> {
  int _selectedNavIndex = 1;
  bool _isProcessing = false;
  String? _selectedFileName;
  Timer? _processingTimer;

  @override
  void dispose() {
    _processingTimer?.cancel();
    super.dispose();
  }

  void _onNavChanged(int index) {
    if (index == 0) {
      Navigator.of(context).popUntil((route) => route.isFirst);
      return;
    }

    setState(() {
      _selectedNavIndex = index;
    });
  }

  Future<void> _pickLocalSong() async {
    if (_isProcessing) {
      return;
    }

    _processingTimer?.cancel();

    final selectedSong = await showDialog<_FakeSongSelection>(
      context: context,
      barrierDismissible: true,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.55),
      builder: (context) => const _SongSelectionDialog(),
    );

    if (!mounted || selectedSong == null) {
      return;
    }

    setState(() {
      _selectedFileName = selectedSong.title;
      _isProcessing = true;
    });

    _processingTimer = Timer(const Duration(seconds: 3), () {
      if (!mounted) {
        return;
      }

      setState(() {
        _isProcessing = false;
      });

      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const MatBiecPage()),
      );
    });
  }

  void _resetProcessing() {
    setState(() {
      _isProcessing = false;
      _selectedFileName = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isProcessing) {
      return Scaffold(
        backgroundColor: const Color(0xFF0E0E0E),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 28),
            child: Center(
              child: _ProcessingSection(
                fileName: _selectedFileName,
                onReset: _resetProcessing,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 130),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).maybePop(),
                        child: const SizedBox(
                          width: 24,
                          height: 24,
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Phân Tích Hợp Âm AI',
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.75,
                      height: 36 / 30,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Biến bất kỳ bài hát nào thành sơ đồ hợp âm\nguitar trong giây lát.',
                    style: GoogleFonts.manrope(
                      color: const Color(0xFFADAAAA),
                      fontSize: 16,
                      height: 24 / 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 240),
                    child: _isProcessing
                        ? _ProcessingSection(
                            key: const ValueKey('processing'),
                            fileName: _selectedFileName,
                            onReset: _resetProcessing,
                          )
                        : Column(
                            key: const ValueKey('upload'),
                            children: [
                              _UploadCard(onPickLocalSong: _pickLocalSong),
                              const SizedBox(height: 16),
                              const _LinkImportCard(),
                              const SizedBox(height: 24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Bài hát đã xử lý gần đây',
                                    style: GoogleFonts.plusJakartaSans(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      height: 28 / 18,
                                    ),
                                  ),
                                  Text(
                                    'XEM TẤT CẢ',
                                    style: GoogleFonts.manrope(
                                      color: const Color(0xFFFF923E),
                                      fontSize: 12,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              const _RecentSongItem(
                                imageAsset: 'assets/images/dechord_recent_song_1.png',
                                title: 'Có Chàng Trai Viết Lên Cây',
                                subtitle: 'Phan Mạnh Quỳnh • 5:04',
                              ),
                              const SizedBox(height: 12),
                              const _RecentSongItem(
                                imageAsset: 'assets/images/dechord_recent_song_2.png',
                                title: 'Nước Ngoài',
                                subtitle: 'Phan Mạnh Quỳnh • 4:18',
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: const [
                                  Expanded(
                                    child: _FeatureCard(
                                      icon: Icons.verified,
                                      title: 'Chính xác 99%',
                                      description: 'Thuật toán AI tối ưu\nnhất hiện nay cho\nGuitar.',
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: _FeatureCard(
                                      icon: Icons.bolt,
                                      title: 'Xử lý thần tốc',
                                      description: 'Nhận kết quả chỉ\ntrong vài giây.',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Center(
                child: HomeBottomNavbar(
                  selectedIndex: _selectedNavIndex,
                  onChanged: _onNavChanged,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UploadCard extends StatelessWidget {
  const _UploadCard({required this.onPickLocalSong});

  final VoidCallback onPickLocalSong;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(32, 32, 31, 0.6),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: const Color.fromRGBO(255, 255, 255, 0.05)),
      ),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 146, 62, 0.1),
              borderRadius: BorderRadius.circular(999),
            ),
            child: const Icon(Icons.upload_file, color: Color(0xFFFF923E), size: 32),
          ),
          const SizedBox(height: 20),
          Text(
            'Tải lên tệp MP3',
            style: GoogleFonts.plusJakartaSans(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Hỗ trợ định dạng MP3, WAV hoặc M4A.\nKích thước tối đa 20MB.',
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              color: const Color(0xFFADAAAA),
              fontSize: 14,
              height: 20 / 14,
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: onPickLocalSong,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF923E), Color(0xFFF97F06)],
                ),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                'Duyệt Tệp Local',
                style: GoogleFonts.plusJakartaSans(
                  color: const Color(0xFF4D2300),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FakeSongSelection {
  const _FakeSongSelection({required this.title, required this.artist, required this.duration, required this.size});

  final String title;
  final String artist;
  final String duration;
  final String size;
}

class _SongSelectionDialog extends StatefulWidget {
  const _SongSelectionDialog();

  @override
  State<_SongSelectionDialog> createState() => _SongSelectionDialogState();
}

class _SongSelectionDialogState extends State<_SongSelectionDialog> {
  int _selectedIndex = 0;

  static const List<_FakeSongSelection> _songs = [
    _FakeSongSelection(
      title: 'Mắt Biếc - Dreamy\nTheme',
      artist: 'Phan Mạnh Quỳnh',
      duration: '06:31',
      size: '12.4 MB',
    ),
    _FakeSongSelection(
      title: 'Có chàng trai viết lên cây',
      artist: 'Phan Mạnh Quỳnh',
      duration: '03:52',
      size: '7.8 MB',
    ),
    _FakeSongSelection(
      title: 'Xin đừng lặng im',
      artist: 'Soobin',
      duration: '04:22',
      size: '8.1 MB',
    ),
    _FakeSongSelection(
      title: 'Dancing in the dảk',
      artist: 'Unknown',
      duration: '04:02',
      size: '9.3 MB',
    ),
    _FakeSongSelection(
      title: 'While My Guitar Gently Weeps',
      artist: 'The Beatles',
      duration: '04:45',
      size: '10.1 MB',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 430),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Material(
              color: Colors.transparent,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF20201F),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: const Color.fromRGBO(255, 255, 255, 0.05)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(245, 124, 0, 0.1),
                          blurRadius: 60,
                          offset: Offset(0, 40),
                          spreadRadius: -15,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 32),
                        Container(
                          width: 48,
                          height: 6,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(72, 72, 71, 0.3),
                            borderRadius: BorderRadius.circular(9999),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Chọn bài hát từ thiết bị',
                              style: GoogleFonts.plusJakartaSans(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.6,
                                height: 30 / 24,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          height: 420,
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Column(
                              children: [
                                for (int i = 0; i < _songs.length; i++) ...[
                                  _SelectableSongTile(
                                    song: _songs[i],
                                    index: i,
                                    selected: _selectedIndex == i,
                                    onTap: () {
                                      setState(() {
                                        _selectedIndex = i;
                                      });
                                    },
                                  ),
                                  if (i != _songs.length - 1) const SizedBox(height: 4),
                                ],
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 0, 32, 11),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: Container(
                                    height: 56,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF262626),
                                      borderRadius: BorderRadius.circular(9999),
                                    ),
                                    child: Text(
                                      'Hủy',
                                      style: GoogleFonts.manrope(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        height: 24 / 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop(_songs[_selectedIndex]);
                                  },
                                  child: Container(
                                    height: 56,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [Color(0xFFFF923E), Color(0xFFF97F06)],
                                      ),
                                      borderRadius: BorderRadius.circular(9999),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromRGBO(255, 146, 62, 0.2),
                                          blurRadius: 15,
                                          offset: Offset(0, 10),
                                          spreadRadius: -3,
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      'Chọn',
                                      style: GoogleFonts.manrope(
                                        color: const Color(0xFF3B1900),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        height: 24 / 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SelectableSongTile extends StatelessWidget {
  const _SelectableSongTile({required this.song, required this.index, required this.selected, required this.onTap});

  final _FakeSongSelection song;
  final int index;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? const Color.fromRGBO(255, 146, 62, 0.1) : Colors.transparent,
          border: selected ? Border.all(color: const Color.fromRGBO(255, 146, 62, 0.2)) : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: _buildLeadingThumbnail(),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title,
                    style: GoogleFonts.manrope(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      height: 20 / 14,
                    ),
                  ),
                  Text(
                    song.artist,
                    style: GoogleFonts.manrope(
                      color: const Color(0xFFADAAAA),
                      fontSize: 12,
                      height: 16 / 12,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  song.duration,
                  style: GoogleFonts.manrope(
                    color: const Color(0xFFADAAAA),
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                    height: 15 / 10,
                  ),
                ),
                Text(
                  song.size,
                  style: GoogleFonts.manrope(
                    color: const Color.fromRGBO(173, 170, 170, 0.6),
                    fontSize: 10,
                    height: 15 / 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeadingThumbnail() {
    if (index == 0) {
      return Image.asset(
        'assets/images/dechord_modal_selected_bg.png',
        width: 48,
        height: 48,
        fit: BoxFit.cover,
      );
    }

    if (index == 1) {
      return Image.asset(
        'assets/images/dechord_modal_regular_bg_1.png',
        width: 48,
        height: 48,
        fit: BoxFit.cover,
      );
    }

    if (index == 2) {
      return Image.asset(
        'assets/images/dechord_modal_regular_bg_2.png',
        width: 48,
        height: 48,
        fit: BoxFit.cover,
      );
    }

    return Container(
      width: 48,
      height: 48,
      color: const Color(0xFF262626),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        'assets/icons/dechord_modal_icon.svg',
        width: 16,
        height: 20,
      ),
    );
  }
}

class _LinkImportCard extends StatelessWidget {
  const _LinkImportCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF131313),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: const Color.fromRGBO(255, 255, 255, 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.link, color: Color(0xFFFF923E), size: 18),
              const SizedBox(width: 10),
              Text(
                'Nhập qua đường dẫn',
                style: GoogleFonts.plusJakartaSans(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF262626),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'Dán link YouTube hoặc Spotify tại đây...',
              style: GoogleFonts.manrope(
                color: const Color(0xFF767575),
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF262626),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                'Dán Link',
                style: GoogleFonts.plusJakartaSans(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Opacity(
            opacity: 0.4,
            child: Row(
              children: [
                Image.asset('assets/images/dechord_youtube_icon.png', width: 20, height: 20),
                const SizedBox(width: 6),
                Text(
                  'YOUTUBE',
                  style: GoogleFonts.manrope(color: Colors.white, fontSize: 10, letterSpacing: 1),
                ),
                const SizedBox(width: 16),
                Image.asset('assets/images/dechord_spotify_icon.png', width: 20, height: 20),
                const SizedBox(width: 6),
                Text(
                  'SPOTIFY',
                  style: GoogleFonts.manrope(color: Colors.white, fontSize: 10, letterSpacing: 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProcessingSection extends StatelessWidget {
  const _ProcessingSection({super.key, required this.fileName, required this.onReset});

  final String? fileName;
  final VoidCallback onReset;

  static const String _processingCover = 'assets/images/dechord_modal_selected_bg.png';
  static const String _loadingOverlay = 'assets/images/dechord_modal_loading_overlay.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF20201F),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Đang xử lý',
                style: GoogleFonts.plusJakartaSans(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 28 / 18,
                ),
              ),
              Text(
                '1 bài hát',
                style: GoogleFonts.manrope(
                  color: const Color(0xFFFF923E),
                  fontSize: 12,
                  letterSpacing: 1.2,
                  height: 16 / 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF262626),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          _processingCover,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          _loadingOverlay,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              fileName ?? 'Mắt Biếc - Dreamy\nTheme',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.plusJakartaSans(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                height: 24 / 16,
                              ),
                            ),
                          ),
                          Text(
                            '65%',
                            style: GoogleFonts.manrope(
                              color: const Color(0xFFFF923E),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(9999),
                        child: const SizedBox(
                          height: 8,
                          child: LinearProgressIndicator(
                            value: 0.65,
                            backgroundColor: Color(0xFF262626),
                            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF923E)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Trích xuất hợp âm và Tempo...',
                        style: GoogleFonts.manrope(
                          color: const Color(0xFF767575),
                          fontSize: 10,
                          letterSpacing: 0.5,
                          height: 15 / 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: onReset,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF262626),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  'Chọn file khác',
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentSongItem extends StatelessWidget {
  const _RecentSongItem({
    required this.imageAsset,
    required this.title,
    required this.subtitle,
  });

  final String imageAsset;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF131313),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(imageAsset, width: 64, height: 64, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.manrope(
                    color: const Color(0xFFADAAAA),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 146, 62, 0.1),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              'Completed',
              style: GoogleFonts.manrope(
                color: const Color(0xFFFF923E),
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({required this.icon, required this.title, required this.description});

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 156,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF131313),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFFF923E), size: 22),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              height: 20 / 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: GoogleFonts.manrope(
              color: const Color(0xFFADAAAA),
              fontSize: 12,
              height: 16 / 12,
            ),
          ),
        ],
      ),
    );
  }
}
