import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'onboarding_screen.dart'; // Memanggil halaman tujuan

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  bool _isNavigating = false;

  @override
  void initState() {
    super.initState();
    
    // 1. Inisialisasi video dari folder assets
    _controller = VideoPlayerController.asset('assets/videos/splash_video.mp4')
      ..initialize().then((_) {
        // Setelah video siap, jalankan videonya
        setState(() {});
        _controller.play();
      });

    // 2. Pantau durasi video
    _controller.addListener(() {
      // Jika video sudah menyentuh detik terakhir dan belum pindah halaman
      if (_controller.value.isInitialized &&
          !_isNavigating &&
          _controller.value.position >= _controller.value.duration) {
        _isNavigating = true; // Kunci agar tidak pindah layar berkali-kali
        
        // 3. Pindah ke halaman Onboarding (menggunakan pushReplacement agar tidak bisa di-back)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    // Bersihkan memori saat video selesai
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Warna kuning latar belakang disesuaikan dengan warna background video
      backgroundColor: const Color(0xFFF1B000), 
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const SizedBox(), // Tampilkan layar kosong sekejap sambil memuat video
      ),
    );
  }
}