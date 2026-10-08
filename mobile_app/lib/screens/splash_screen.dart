import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets.dart';
import 'home_screen.dart';
import 'vehicle_selection_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void _open(BuildContext context, Widget screen) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (_) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF8F7FF), Colors.white, Color(0xFFF0EEFF)],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight - 42),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.circle, color: successGreen, size: 9),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Fleet active in Chittoor & interstate',
                            style: TextStyle(color: mutedInk, fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          'EN  ·  తె',
                          style: TextStyle(color: brandPurple, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Container(
                      width: 144,
                      height: 144,
                      decoration: BoxDecoration(
                        color: brandPurple,
                        borderRadius: BorderRadius.circular(38),
                        boxShadow: const [
                          BoxShadow(color: Color(0x334C33EB), blurRadius: 30, offset: Offset(0, 14)),
                        ],
                      ),
                      child: const Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(Icons.local_shipping_rounded, size: 76, color: Colors.white),
                          Positioned(
                            right: 12,
                            bottom: 12,
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.verified_rounded, size: 20, color: brandPurple),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PackMovers',
                          style: TextStyle(fontSize: 32, height: 1.1, letterSpacing: -.8, fontWeight: FontWeight.w900, color: brandPurple),
                        ),
                        SizedBox(width: 8),
                        Text('🚚', style: TextStyle(fontSize: 26)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Your belongings. Our responsibility.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: brandPurple, fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Reliable mini trucks, careful packing, and easy local moves — all from one app.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: mutedInk, fontSize: 14, height: 1.55),
                    ),
                    const SizedBox(height: 24),
                    const Row(
                      children: [
                        _TrustMetric(icon: Icons.shield_rounded, title: 'Insured', subtitle: 'cargo'),
                        SizedBox(width: 10),
                        _TrustMetric(icon: Icons.location_on_rounded, title: 'GPS', subtitle: 'tracking'),
                        SizedBox(width: 10),
                        _TrustMetric(icon: Icons.bolt_rounded, title: '15 min', subtitle: 'dispatch'),
                      ],
                    ),
                    const SizedBox(height: 18),
                    const SurfaceCard(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                      child: Row(
                        children: [
                          Icon(Icons.check_circle_rounded, color: successGreen, size: 19),
                          SizedBox(width: 9),
                          Expanded(
                            child: Text(
                              'Trusted local crews. Clear pricing. No surprises.',
                              style: TextStyle(color: ink, fontSize: 12, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    PrimaryButton(
                      label: 'Book a Move',
                      onPressed: () => _open(context, const HomeScreen()),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: OutlinedButton.icon(
                        onPressed: () => _open(context, const VehicleSelectionScreen()),
                        icon: const Icon(Icons.calculate_outlined),
                        label: const Text('Get an Instant Cost'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: brandPurple,
                          side: const BorderSide(color: Color(0xFFCBC5FF)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          textStyle: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TrustMetric extends StatelessWidget {
  const _TrustMetric({required this.icon, required this.title, required this.subtitle});

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 6),
        decoration: BoxDecoration(
          color: softPurple,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: brandPurple, size: 22),
            const SizedBox(height: 6),
            Text(title, style: const TextStyle(color: ink, fontSize: 13, fontWeight: FontWeight.w800)),
            Text(subtitle, style: const TextStyle(color: mutedInk, fontSize: 10)),
          ],
        ),
      ),
    );
  }
}
