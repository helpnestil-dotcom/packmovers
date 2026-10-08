import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets.dart';
import 'tracking_screen.dart';
import 'vehicle_selection_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _book(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => const VehicleSelectionScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 18,
        title: const Row(
          children: [
            BrandMark(size: 40, iconSize: 23),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chittoor, AP',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: ink,
                    ),
                  ),
                  Text(
                    'Bazaar Main · 517001',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11,
                      color: mutedInk,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: FilledButton.tonalIcon(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Wallet balance: ₹240')),
              ),
              icon: const Icon(Icons.account_balance_wallet_rounded, size: 16),
              label: const Text('₹240'),
              style: FilledButton.styleFrom(
                foregroundColor: brandPurple,
                backgroundColor: softPurple,
                visualDensity: VisualDensity.compact,
                textStyle: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          IconButton(
            tooltip: 'Notifications',
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('You are all caught up.')),
            ),
            icon: const Icon(Icons.notifications_none_rounded, color: ink),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
          children: [
            SurfaceCard(
              padding: const EdgeInsets.all(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () => _book(context),
                child: const Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: softPurple,
                      child: Icon(Icons.search_rounded, color: brandPurple),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Where do you need to deliver?',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 13,
                              color: ink,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'House shifting, cargo & parcels',
                            style: TextStyle(color: mutedInk, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: mutedInk,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 17),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: brandPurple,
                borderRadius: BorderRadius.circular(22),
                gradient: const LinearGradient(
                  colors: [Color(0xFF4C33EB), Color(0xFF3821C9)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    right: -7,
                    bottom: -12,
                    child: Icon(
                      Icons.local_shipping_rounded,
                      color: Color(0x33FFFFFF),
                      size: 112,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0x26FFFFFF),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          '⚡  15-MIN DOORSTEP DISPATCH',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.w900,
                            letterSpacing: .4,
                          ),
                        ),
                      ),
                      const SizedBox(height: 13),
                      const Text(
                        'Mini trucks from ₹49',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          height: 1.2,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        'Get up to 20% off local moves in Chittoor today.',
                        style: TextStyle(
                          color: Color(0xFFEAE7FF),
                          fontSize: 12,
                          height: 1.45,
                        ),
                      ),
                      const SizedBox(height: 15),
                      FilledButton(
                        onPressed: () => _book(context),
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: brandPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Book a vehicle',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 23),
            const SectionHeading('Move anything, anywhere'),
            const SizedBox(height: 12),
            Row(
              children: [
                _ServiceTile(
                  icon: Icons.local_shipping_outlined,
                  title: 'Mini trucks',
                  onTap: () => _book(context),
                ),
                const SizedBox(width: 10),
                _ServiceTile(
                  icon: Icons.chair_alt_outlined,
                  title: 'House shifting',
                  onTap: () => _book(context),
                ),
                const SizedBox(width: 10),
                _ServiceTile(
                  icon: Icons.inventory_2_outlined,
                  title: 'Cargo',
                  onTap: () => _book(context),
                ),
              ],
            ),
            const SizedBox(height: 23),
            const SectionHeading('Your active booking'),
            const SizedBox(height: 12),
            SurfaceCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Tata Ace · PTR-8492',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: ink,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE5F5EE),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'On the way',
                          style: TextStyle(
                            color: successGreen,
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const _RoutePoint(
                    icon: Icons.radio_button_checked_rounded,
                    label: 'Chittoor Bazaar Main Rd',
                    color: successGreen,
                  ),
                  const _RouteConnector(),
                  const _RoutePoint(
                    icon: Icons.location_on_rounded,
                    label: 'Tirupati Rd · NH 69',
                    color: brandPurple,
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: softPurple,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.circle, color: successGreen, size: 9),
                            SizedBox(width: 7),
                            Text(
                              'Trip progress',
                              style: TextStyle(
                                color: ink,
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'ETA: 12 mins',
                              style: TextStyle(
                                color: brandPurple,
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            value: .72,
                            minHeight: 7,
                            backgroundColor: Color(0xFFDCD8F8),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              brandPurple,
                            ),
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Assigned',
                                  style: TextStyle(
                                    color: mutedInk,
                                    fontSize: 9,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'At pickup',
                                  style: TextStyle(
                                    color: mutedInk,
                                    fontSize: 9,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'On the way',
                                  style: TextStyle(
                                    color: brandPurple,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Delivered',
                                  style: TextStyle(
                                    color: mutedInk,
                                    fontSize: 9,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () =>
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Driver calling is not connected in this demo.',
                                  ),
                                ),
                              ),
                          icon: const Icon(Icons.call_rounded, size: 17),
                          label: const Text('Call driver'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: brandPurple,
                            side: const BorderSide(color: Color(0xFFD8D3FF)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 9),
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) => const TrackingScreen(),
                            ),
                          ),
                          icon: const Icon(Icons.near_me_rounded, size: 17),
                          label: const Text('Track live'),
                          style: FilledButton.styleFrom(
                            backgroundColor: brandPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            const SectionHeading('Why PackMovers?'),
            const SizedBox(height: 12),
            const Row(
              children: [
                Expanded(
                  child: _BenefitCard(
                    icon: Icons.payments_outlined,
                    title: 'Fair prices',
                    detail: 'Upfront estimates',
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _BenefitCard(
                    icon: Icons.verified_user_outlined,
                    title: 'Trusted crew',
                    detail: 'Vetted drivers',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 23),
            const SectionHeading('Core logistics services'),
            const SizedBox(height: 4),
            const Text(
              'Mini trucks, fast couriers & full home shifting',
              style: TextStyle(color: mutedInk, fontSize: 11),
            ),
            const SizedBox(height: 12),
            _WideServiceCard(onTap: () => _book(context)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _CompactServiceCard(
                    icon: Icons.two_wheeler_rounded,
                    title: '2 Wheelers & Courier',
                    detail: 'Parcels, medicine & food',
                    price: 'From ₹45',
                    onTap: () => _book(context),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _CompactServiceCard(
                    icon: Icons.inventory_2_outlined,
                    title: 'Packers & Movers',
                    detail: 'Home shifting & packing',
                    price: 'From ₹1,499',
                    onTap: () => _book(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _CompactServiceCard(
                    icon: Icons.flight_takeoff_rounded,
                    title: 'All India Intercity',
                    detail: 'Chennai, Bengaluru & Hyd',
                    price: 'From ₹80 / kg',
                    onTap: () => _book(context),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _CompactServiceCard(
                    icon: Icons.warehouse_outlined,
                    title: 'Enterprise Freight',
                    detail: 'Bulk business deliveries',
                    price: 'Custom GST rates',
                    onTap: () => _book(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 23),
            const SectionHeading('Vehicle fleet capacity guide'),
            const SizedBox(height: 4),
            const Text(
              'Standard load limits and transparent rates',
              style: TextStyle(color: mutedInk, fontSize: 11),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 156,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _CapacityCard(
                    icon: Icons.electric_rickshaw_rounded,
                    vehicle: 'Piaggio Ape',
                    capacity: '500 kg',
                    price: '₹160',
                    detail: 'Boxes & cartons',
                  ),
                  SizedBox(width: 10),
                  _CapacityCard(
                    icon: Icons.local_shipping_rounded,
                    vehicle: 'Tata Ace',
                    capacity: '750 kg',
                    price: '₹210',
                    detail: 'Room & appliances',
                    highlighted: true,
                  ),
                  SizedBox(width: 10),
                  _CapacityCard(
                    icon: Icons.airport_shuttle_rounded,
                    vehicle: 'Pickup 8ft',
                    capacity: '1,200 kg',
                    price: '₹380',
                    detail: 'Heavy & bulky cargo',
                  ),
                  SizedBox(width: 10),
                  _CapacityCard(
                    icon: Icons.rv_hookup_rounded,
                    vehicle: 'Tata 407',
                    capacity: '2,500 kg',
                    price: '₹690',
                    detail: 'Industrial freight',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 23),
            SurfaceCard(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: [
                  const Text(
                    'THE PACKMOVERS PROMISE IN CHITTOOR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ink,
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      letterSpacing: .5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      _PromiseItem(
                        icon: Icons.bolt_rounded,
                        title: '15-min dispatch',
                        detail: 'Always nearby',
                      ),
                      _PromiseItem(
                        icon: Icons.receipt_long_rounded,
                        title: 'Clear rates',
                        detail: 'No hidden fees',
                      ),
                      _PromiseItem(
                        icon: Icons.verified_user_rounded,
                        title: 'Insured',
                        detail: 'Transit cover',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (index) {
          if (index == 1) _book(context);
          if (index > 1) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '${_homeTabLabels[index]} will be available soon.',
                ),
              ),
            );
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Orders',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Wallet',
          ),
          NavigationDestination(
            icon: Icon(Icons.support_agent_outlined),
            label: 'Support',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

const _homeTabLabels = ['Home', 'Orders', 'Wallet', 'Support', 'Account'];

class _WideServiceCard extends StatelessWidget {
  const _WideServiceCard({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(18),
    child: const SurfaceCard(
      padding: EdgeInsets.all(14),
      child: Row(
        children: [
          BrandMark(size: 46, iconSize: 26),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trucks & Mini Trucks',
                  style: TextStyle(
                    color: ink,
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Tata Ace, Ape & Pickup 8ft for cargo',
                  style: TextStyle(color: mutedInk, fontSize: 10),
                ),
                SizedBox(height: 4),
                Text(
                  'From ₹210  ·  Up to 2.5 tons',
                  style: TextStyle(
                    color: brandPurple,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right_rounded, color: mutedInk),
        ],
      ),
    ),
  );
}

class _CompactServiceCard extends StatelessWidget {
  const _CompactServiceCard({
    required this.icon,
    required this.title,
    required this.detail,
    required this.price,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String detail;
  final String price;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(17),
    child: Container(
      height: 134,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xFFEAE8F2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: brandPurple, size: 23),
          const Spacer(),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: ink,
              fontSize: 11,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            detail,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: mutedInk, fontSize: 9),
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: const TextStyle(
              color: brandPurple,
              fontSize: 10,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    ),
  );
}

class _CapacityCard extends StatelessWidget {
  const _CapacityCard({
    required this.icon,
    required this.vehicle,
    required this.capacity,
    required this.price,
    required this.detail,
    this.highlighted = false,
  });

  final IconData icon;
  final String vehicle;
  final String capacity;
  final String price;
  final String detail;
  final bool highlighted;

  @override
  Widget build(BuildContext context) => Container(
    width: 152,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: highlighted ? softPurple : Colors.white,
      borderRadius: BorderRadius.circular(17),
      border: Border.all(
        color: highlighted ? const Color(0xFFCFC8FF) : const Color(0xFFEAE8F2),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: brandPurple, size: 22),
            const Spacer(),
            Text(
              capacity,
              style: const TextStyle(
                color: brandPurple,
                fontSize: 9,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          vehicle,
          style: const TextStyle(
            color: ink,
            fontSize: 12,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          detail,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: mutedInk, fontSize: 9),
        ),
        const SizedBox(height: 6),
        Text(
          price,
          style: const TextStyle(
            color: brandPurple,
            fontSize: 12,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    ),
  );
}

class _PromiseItem extends StatelessWidget {
  const _PromiseItem({
    required this.icon,
    required this.title,
    required this.detail,
  });

  final IconData icon;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) => Expanded(
    child: Column(
      children: [
        Icon(icon, color: brandPurple, size: 21),
        const SizedBox(height: 5),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: ink,
            fontSize: 9,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          detail,
          textAlign: TextAlign.center,
          style: const TextStyle(color: mutedInk, fontSize: 8),
        ),
      ],
    ),
  );
}

class _ServiceTile extends StatelessWidget {
  const _ServiceTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          height: 102,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFEAE8F2)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: brandPurple, size: 27),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 10,
                  color: ink,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoutePoint extends StatelessWidget {
  const _RoutePoint({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: ink,
            ),
          ),
        ),
      ],
    );
  }
}

class _RouteConnector extends StatelessWidget {
  const _RouteConnector();

  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.only(left: 8),
    child: SizedBox(
      height: 13,
      child: VerticalDivider(width: 1, color: Color(0xFFC7C3D2)),
    ),
  );
}

class _BenefitCard extends StatelessWidget {
  const _BenefitCard({
    required this.icon,
    required this.title,
    required this.detail,
  });

  final IconData icon;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      padding: const EdgeInsets.all(13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: brandPurple),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: ink,
              fontWeight: FontWeight.w800,
              fontSize: 12,
            ),
          ),
          Text(detail, style: const TextStyle(color: mutedInk, fontSize: 10)),
        ],
      ),
    );
  }
}
