import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 8, 14, 10),
              child: Row(
                children: [
                  _CircleAction(
                    icon: Icons.arrow_back_rounded,
                    onPressed: () => Navigator.of(context).maybePop(),
                    tooltip: 'Back',
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: const Color(0xFFEAE8F2)),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.circle, color: successGreen, size: 9),
                        SizedBox(width: 7),
                        Text(
                          '#PTR-8492',
                          style: TextStyle(
                            color: brandPurple,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '· Demo',
                          style: TextStyle(color: mutedInk, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  _CircleAction(
                    icon: Icons.share_outlined,
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Trip sharing is not connected in this demo.',
                        ),
                      ),
                    ),
                    tooltip: 'Share trip',
                  ),
                  const SizedBox(width: 6),
                  _CircleAction(
                    icon: Icons.emergency_rounded,
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Emergency assistance is not connected in this demo.',
                        ),
                      ),
                    ),
                    tooltip: 'Emergency assistance',
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const _MockMap(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Your driver is on the way',
                                    style: TextStyle(
                                      color: ink,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Arriving at pickup in about 8 minutes',
                                    style: TextStyle(
                                      color: mutedInk,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 7,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE5F5EE),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'IN TRANSIT',
                                style: TextStyle(
                                  color: successGreen,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        const _TripStatusCard(),
                        const SizedBox(height: 16),
                        const SurfaceCard(
                          padding: EdgeInsets.all(14),
                          child: Row(
                            children: [
                              Icon(
                                Icons.key_rounded,
                                color: brandPurple,
                                size: 21,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Pickup verification code',
                                      style: TextStyle(
                                        color: mutedInk,
                                        fontSize: 10,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      '4921',
                                      style: TextStyle(
                                        color: ink,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'DEMO ONLY',
                                style: TextStyle(
                                  color: mutedInk,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: .5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                        SurfaceCard(
                          padding: const EdgeInsets.all(14),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: softPurple,
                                child: const Icon(
                                  Icons.person_rounded,
                                  color: brandPurple,
                                  size: 29,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ramesh Kumar',
                                      style: TextStyle(
                                        color: ink,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      'Tata Ace · AP 03 AB 8492',
                                      style: TextStyle(
                                        color: mutedInk,
                                        fontSize: 10,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star_rounded,
                                          color: Color(0xFFEAA52F),
                                          size: 13,
                                        ),
                                        SizedBox(width: 3),
                                        Expanded(
                                          child: Text(
                                            '4.9  ·  Verified driver',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: mutedInk,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                tooltip: 'Call driver',
                                onPressed: () =>
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Calling is not connected in this demo.',
                                        ),
                                      ),
                                    ),
                                icon: const Icon(
                                  Icons.call_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                style: IconButton.styleFrom(
                                  backgroundColor: brandPurple,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 19),
                        const SectionHeading('Trip details'),
                        const SizedBox(height: 10),
                        const SurfaceCard(
                          child: Column(
                            children: [
                              _TripAddress(
                                icon: Icons.radio_button_checked_rounded,
                                color: successGreen,
                                label: 'PICKUP',
                                address: 'Chittoor Bazaar Main Rd',
                                detail: 'Shop 14 · Near Clock Tower Circle',
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: SizedBox(
                                  height: 18,
                                  child: VerticalDivider(
                                    width: 1,
                                    color: Color(0xFFC7C3D2),
                                  ),
                                ),
                              ),
                              _TripAddress(
                                icon: Icons.location_on_rounded,
                                color: brandPurple,
                                label: 'DROP OFF',
                                address: 'Tirupati Rd / NH 69',
                                detail:
                                    'Mittoor Industrial Warehouse · Sector 3',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        const SurfaceCard(
                          padding: EdgeInsets.all(13),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 19,
                                backgroundColor: softPurple,
                                child: Icon(
                                  Icons.inventory_2_outlined,
                                  color: brandPurple,
                                  size: 19,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tata Ace · 1 helper added',
                                      style: TextStyle(
                                        color: ink,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      'Commercial cargo · Standard pack',
                                      style: TextStyle(
                                        color: mutedInk,
                                        fontSize: 9,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '₹210',
                                    style: TextStyle(
                                      color: brandPurple,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    'Wallet paid',
                                    style: TextStyle(
                                      color: mutedInk,
                                      fontSize: 8,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 11),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () =>
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Order cancellation is not connected in this demo.',
                                        ),
                                      ),
                                    ),
                                icon: const Icon(
                                  Icons.cancel_outlined,
                                  size: 16,
                                ),
                                label: const Text('Cancel order'),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: mutedInk,
                                  side: const BorderSide(
                                    color: Color(0xFFE0DDE8),
                                  ),
                                  textStyle: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 9),
                            Expanded(
                              child: FilledButton.icon(
                                onPressed: () =>
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Support chat is not connected in this demo.',
                                        ),
                                      ),
                                    ),
                                icon: const Icon(
                                  Icons.support_agent_rounded,
                                  size: 16,
                                ),
                                label: const Text('Need help'),
                                style: FilledButton.styleFrom(
                                  backgroundColor: brandPurple,
                                  textStyle: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Demo tracking only: driver location and trip status are sample data, not live GPS.',
                          style: TextStyle(
                            color: mutedInk,
                            fontSize: 10,
                            height: 1.4,
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
    );
  }
}

class _TripStatusCard extends StatelessWidget {
  const _TripStatusCard();

  @override
  Widget build(BuildContext context) => const SurfaceCard(
    padding: EdgeInsets.all(14),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Trip status',
                style: TextStyle(
                  color: ink,
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Text(
              'Driver reaching Bazaar',
              style: TextStyle(
                color: brandPurple,
                fontSize: 9,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        SizedBox(height: 13),
        Row(
          children: [
            _StatusStep(label: 'Assigned', complete: true),
            _StatusConnector(complete: true),
            _StatusStep(label: 'At pickup', active: true),
            _StatusConnector(),
            _StatusStep(label: 'In transit'),
            _StatusConnector(),
            _StatusStep(label: 'Delivered'),
          ],
        ),
      ],
    ),
  );
}

class _StatusStep extends StatelessWidget {
  const _StatusStep({
    required this.label,
    this.complete = false,
    this.active = false,
  });

  final String label;
  final bool complete;
  final bool active;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: complete ? brandPurple : Colors.white,
          border: Border.all(
            color: active ? brandPurple : const Color(0xFFD9D6E2),
            width: active ? 2 : 1,
          ),
        ),
        child: Icon(
          complete
              ? Icons.check_rounded
              : (active ? Icons.circle : Icons.circle_outlined),
          size: complete ? 16 : 10,
          color: complete || active ? brandPurple : mutedInk,
        ),
      ),
      const SizedBox(height: 5),
      Text(
        label,
        style: TextStyle(
          color: complete || active ? brandPurple : mutedInk,
          fontSize: 8,
          fontWeight: active ? FontWeight.w800 : FontWeight.w600,
        ),
      ),
    ],
  );
}

class _StatusConnector extends StatelessWidget {
  const _StatusConnector({this.complete = false});

  final bool complete;

  @override
  Widget build(BuildContext context) => Expanded(
    child: Container(
      height: 2,
      margin: const EdgeInsets.only(bottom: 18, left: 2, right: 2),
      color: complete ? brandPurple : const Color(0xFFD9D6E2),
    ),
  );
}

class _MockMap extends StatelessWidget {
  const _MockMap();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ClipRect(
        child: Stack(
          fit: StackFit.expand,
          children: [
            const ColoredBox(color: Color(0xFFF0EFEA)),
            CustomPaint(painter: _MapPainter()),
            const Positioned(
              left: 17,
              top: 18,
              child: _MapLabel(text: 'CHITTOOR BAZAAR'),
            ),
            const Positioned(
              right: 17,
              bottom: 22,
              child: _MapLabel(text: 'TIRUPATI RD / NH 69'),
            ),
            Positioned(
              left: MediaQuery.sizeOf(context).width * .16,
              top: 58,
              child: const _MapMarker(
                icon: Icons.storefront_rounded,
                label: 'Pickup',
              ),
            ),
            Positioned(
              left: MediaQuery.sizeOf(context).width * .49,
              top: 123,
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: brandPurple,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: const [
                    BoxShadow(color: Color(0x44382A8B), blurRadius: 10),
                  ],
                ),
                child: const Icon(
                  Icons.local_shipping_rounded,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
            Positioned(
              right: MediaQuery.sizeOf(context).width * .12,
              bottom: 46,
              child: const _MapMarker(
                icon: Icons.location_on_rounded,
                label: 'Drop off',
              ),
            ),
            Positioned(
              top: 14,
              right: 14,
              child: _CircleAction(
                icon: Icons.my_location_rounded,
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Map location is illustrative in this demo.'),
                  ),
                ),
                tooltip: 'Center map',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final blockPaint = Paint()..color = const Color(0xFFE5E3DD);
    final roadPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round;
    final routeHalo = Paint()
      ..color = brandPurple.withValues(alpha: .18)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    final routePaint = Paint()
      ..color = brandPurple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    for (final rect in [
      Rect.fromLTWH(
        size.width * .04,
        size.height * .34,
        size.width * .19,
        size.height * .19,
      ),
      Rect.fromLTWH(
        size.width * .28,
        size.height * .29,
        size.width * .21,
        size.height * .21,
      ),
      Rect.fromLTWH(
        size.width * .72,
        size.height * .2,
        size.width * .24,
        size.height * .22,
      ),
      Rect.fromLTWH(
        size.width * .67,
        size.height * .64,
        size.width * .25,
        size.height * .2,
      ),
      Rect.fromLTWH(
        size.width * .07,
        size.height * .68,
        size.width * .22,
        size.height * .2,
      ),
    ]) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(9)),
        blockPaint,
      );
    }

    canvas.drawLine(
      Offset(0, size.height * .46),
      Offset(size.width, size.height * .53),
      roadPaint,
    );
    canvas.drawLine(
      Offset(size.width * .35, 0),
      Offset(size.width * .31, size.height),
      roadPaint,
    );
    canvas.drawLine(
      Offset(size.width * .8, 0),
      Offset(size.width * .73, size.height),
      roadPaint,
    );
    canvas.drawLine(
      Offset(0, size.height * .79),
      Offset(size.width, size.height * .7),
      roadPaint,
    );

    final route = Path()
      ..moveTo(size.width * .16, size.height * .29)
      ..cubicTo(
        size.width * .38,
        size.height * .29,
        size.width * .4,
        size.height * .54,
        size.width * .58,
        size.height * .57,
      )
      ..cubicTo(
        size.width * .73,
        size.height * .6,
        size.width * .76,
        size.height * .82,
        size.width * .88,
        size.height * .8,
      );
    canvas.drawPath(route, routeHalo);
    canvas.drawPath(route, routePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _MapLabel extends StatelessWidget {
  const _MapLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: .9),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      text,
      style: const TextStyle(
        color: mutedInk,
        fontSize: 8,
        fontWeight: FontWeight.w900,
        letterSpacing: .4,
      ),
    ),
  );
}

class _MapMarker extends StatelessWidget {
  const _MapMarker({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: brandPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 9,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      const SizedBox(height: 3),
      Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: brandPurple,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Icon(icon, color: Colors.white, size: 17),
      ),
    ],
  );
}

class _CircleAction extends StatelessWidget {
  const _CircleAction({
    required this.icon,
    required this.onPressed,
    required this.tooltip,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.white,
    shape: const CircleBorder(),
    child: IconButton(
      tooltip: tooltip,
      onPressed: onPressed,
      icon: Icon(icon, size: 19, color: brandPurple),
      constraints: const BoxConstraints.tightFor(width: 42, height: 42),
      padding: EdgeInsets.zero,
    ),
  );
}

class _TripAddress extends StatelessWidget {
  const _TripAddress({
    required this.icon,
    required this.color,
    required this.label,
    required this.address,
    required this.detail,
  });

  final IconData icon;
  final Color color;
  final String label;
  final String address;
  final String detail;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Icon(icon, color: color, size: 19),
      const SizedBox(width: 10),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: mutedInk,
                fontSize: 9,
                fontWeight: FontWeight.w800,
                letterSpacing: .7,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              address,
              style: const TextStyle(
                color: ink,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 2),
            Text(detail, style: const TextStyle(color: mutedInk, fontSize: 9)),
          ],
        ),
      ),
    ],
  );
}
