import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets.dart';
import 'tracking_screen.dart';

class VehicleSelectionScreen extends StatefulWidget {
  const VehicleSelectionScreen({super.key});

  @override
  State<VehicleSelectionScreen> createState() => _VehicleSelectionScreenState();
}

class _VehicleSelectionScreenState extends State<VehicleSelectionScreen> {
  int _selectedVehicle = 0;
  bool _packingHelp = false;
  bool _loadingHelp = false;
  bool _laborHelp = false;
  String _goodsCategory = 'Household goods';

  static const _vehicles = [
    _Vehicle(
      name: 'Tata Ace',
      subtitle: 'Chota Hathi · 8 mins away',
      size: '7 ft × 4 ft × 5 ft',
      capacity: 'Up to 750 kg',
      price: 210,
      icon: Icons.local_shipping_rounded,
      badge: 'MOST POPULAR',
    ),
    _Vehicle(
      name: 'Piaggio Ape',
      subtitle: 'Three-wheeler · 12 mins away',
      size: '6 ft × 4 ft × 4 ft',
      capacity: 'Up to 500 kg',
      price: 160,
      icon: Icons.fire_truck_outlined,
    ),
    _Vehicle(
      name: 'Pickup 8ft',
      subtitle: 'Large pickup · 18 mins away',
      size: '8 ft × 5 ft × 5 ft',
      capacity: 'Up to 1,250 kg',
      price: 340,
      icon: Icons.airport_shuttle_rounded,
    ),
  ];

  int get _total {
    var total = _vehicles[_selectedVehicle].price;
    if (_packingHelp) total += 120;
    if (_loadingHelp) total += 80;
    if (_laborHelp) total += 150;
    return total;
  }

  int get _originalFare =>
      _vehicles[_selectedVehicle].price +
      (_vehicles[_selectedVehicle].price * .2).round();

  int get _fareSaving => _originalFare - _vehicles[_selectedVehicle].price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Back to home',
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: const Text('Select vehicle'),
        actions: [
          IconButton(
            tooltip: 'Help',
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Our team is here to help with your booking.'),
              ),
            ),
            icon: const Icon(Icons.help_outline_rounded),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 4, 20, 160),
        children: [
          const _RouteCard(),
          const SizedBox(height: 22),
          const SectionHeading('Recommended fleet', trailing: _FastestChip()),
          const SizedBox(height: 14),
          for (var i = 0; i < _vehicles.length; i++) ...[
            _VehicleCard(
              vehicle: _vehicles[i],
              selected: _selectedVehicle == i,
              onTap: () => setState(() => _selectedVehicle = i),
            ),
            const SizedBox(height: 12),
          ],
          const SizedBox(height: 8),
          const SectionHeading('Add a little extra help'),
          const SizedBox(height: 12),
          _AddOnTile(
            icon: Icons.inventory_2_outlined,
            title: 'Packing assistance',
            subtitle: 'A helper brings basic packing materials',
            price: 120,
            selected: _packingHelp,
            onChanged: (value) => setState(() => _packingHelp = value),
          ),
          const SizedBox(height: 9),
          _AddOnTile(
            icon: Icons.groups_2_outlined,
            title: 'Loading & unloading',
            subtitle: 'One local helper at your pickup',
            price: 80,
            selected: _loadingHelp,
            onChanged: (value) => setState(() => _loadingHelp = value),
          ),
          const SizedBox(height: 20),
          const SectionHeading('Category of goods'),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              for (final category in const [
                'Household goods',
                'Electronics',
                'Agro & mango pulp',
                'Textiles / granite',
              ])
                ChoiceChip(
                  label: Text(category),
                  selected: _goodsCategory == category,
                  onSelected: (_) => setState(() => _goodsCategory = category),
                  selectedColor: softPurple,
                  labelStyle: TextStyle(
                    color: _goodsCategory == category ? brandPurple : mutedInk,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                  side: BorderSide(
                    color: _goodsCategory == category
                        ? brandPurple
                        : const Color(0xFFEAE8F2),
                  ),
                  showCheckmark: false,
                ),
            ],
          ),
          const SizedBox(height: 12),
          _AddOnTile(
            icon: Icons.person_add_alt_1_rounded,
            title: 'Need helper / labour?',
            subtitle: 'Loading and unloading support',
            price: 150,
            selected: _laborHelp,
            onChanged: (value) => setState(() => _laborHelp = value),
          ),
          const SizedBox(height: 10),
          _CouponCard(savings: _fareSaving),
          const SizedBox(height: 10),
          const _PaymentCard(),
          const SizedBox(height: 14),
          const _BookingTrustRow(),
        ],
      ),
      bottomSheet: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Color(0xFFEAE8F2))),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.scaleDown,
                      child: Row(
                        children: [
                          const Text(
                            'ESTIMATED TOTAL',
                            style: TextStyle(
                              color: mutedInk,
                              fontSize: 9,
                              fontWeight: FontWeight.w800,
                              letterSpacing: .5,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '₹$_originalFare',
                            style: const TextStyle(
                              color: mutedInk,
                              fontSize: 9,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '₹$_total',
                      style: const TextStyle(
                        color: ink,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Saved ₹$_fareSaving',
                      style: const TextStyle(
                        color: successGreen,
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: PrimaryButton(
                  label: 'Continue',
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const TrackingScreen(),
                    ),
                  ),
                  icon: Icons.arrow_forward_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CouponCard extends StatelessWidget {
  const _CouponCard({required this.savings});

  final int savings;

  @override
  Widget build(BuildContext context) => SurfaceCard(
    padding: const EdgeInsets.all(13),
    child: Row(
      children: [
        const Icon(Icons.sell_rounded, color: successGreen, size: 22),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    'CHITTOOR20',
                    style: TextStyle(
                      color: successGreen,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(width: 6),
                  Text(
                    'APPLIED',
                    style: TextStyle(
                      color: Colors.white,
                      backgroundColor: successGreen,
                      fontSize: 8,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Text(
                '₹$savings discount included in base fare',
                style: const TextStyle(color: mutedInk, fontSize: 9),
              ),
            ],
          ),
        ),
        const Text(
          'Remove',
          style: TextStyle(
            color: mutedInk,
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}

class _PaymentCard extends StatelessWidget {
  const _PaymentCard();

  @override
  Widget build(BuildContext context) => const SurfaceCard(
    padding: EdgeInsets.all(13),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'PAYMENT METHOD',
                style: TextStyle(
                  color: mutedInk,
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  letterSpacing: .6,
                ),
              ),
            ),
            Text(
              'Change',
              style: TextStyle(
                color: brandPurple,
                fontSize: 10,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            CircleAvatar(
              radius: 19,
              backgroundColor: softPurple,
              child: Icon(
                Icons.account_balance_wallet_rounded,
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
                    'PackMovers Wallet',
                    style: TextStyle(
                      color: ink,
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'Sufficient balance · ₹240',
                    style: TextStyle(color: mutedInk, fontSize: 9),
                  ),
                ],
              ),
            ),
            Icon(Icons.check_circle_rounded, color: successGreen, size: 19),
          ],
        ),
      ],
    ),
  );
}

class _BookingTrustRow extends StatelessWidget {
  const _BookingTrustRow();

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
    decoration: BoxDecoration(
      color: softPurple,
      borderRadius: BorderRadius.circular(15),
    ),
    child: const Row(
      children: [
        _BookingTrustItem(
          icon: Icons.verified_user_outlined,
          label: 'Transit cover',
        ),
        _BookingTrustItem(
          icon: Icons.support_agent_rounded,
          label: '24/7 support',
        ),
        _BookingTrustItem(icon: Icons.timer_outlined, label: '45m loading'),
      ],
    ),
  );
}

class _BookingTrustItem extends StatelessWidget {
  const _BookingTrustItem({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) => Expanded(
    child: Column(
      children: [
        Icon(icon, color: brandPurple, size: 19),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: ink,
            fontSize: 8,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}

class _RouteCard extends StatelessWidget {
  const _RouteCard();

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      child: Column(
        children: [
          const _AddressRow(
            icon: Icons.radio_button_checked_rounded,
            iconColor: successGreen,
            eyebrow: 'PICKUP',
            title: 'Chittoor Bazaar Main Rd',
            detail: 'Chittoor, Andhra Pradesh · 517001',
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, top: 4, bottom: 4),
            child: SizedBox(
              height: 17,
              child: VerticalDivider(width: 1, color: Color(0xFFC7C3D2)),
            ),
          ),
          const _AddressRow(
            icon: Icons.location_on_rounded,
            iconColor: brandPurple,
            eyebrow: 'DROP OFF',
            title: 'Tirupati Rd / NH 69',
            detail: 'Kattamanchi Bypass Junction · 517002',
          ),
          const Divider(height: 24, color: Color(0xFFEAE8F2)),
          const Row(
            children: [
              Icon(Icons.route_rounded, color: brandPurple, size: 18),
              SizedBox(width: 7),
              Text(
                '8.4 km',
                style: TextStyle(
                  color: ink,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 6),
              Text('·', style: TextStyle(color: mutedInk)),
              SizedBox(width: 6),
              Text(
                'About 22 mins',
                style: TextStyle(color: mutedInk, fontSize: 12),
              ),
              Spacer(),
              Icon(
                Icons.edit_location_alt_outlined,
                color: brandPurple,
                size: 18,
              ),
              SizedBox(width: 4),
              Text(
                'Edit',
                style: TextStyle(
                  color: brandPurple,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AddressRow extends StatelessWidget {
  const _AddressRow({
    required this.icon,
    required this.iconColor,
    required this.eyebrow,
    required this.title,
    required this.detail,
  });

  final IconData icon;
  final Color iconColor;
  final String eyebrow;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Icon(icon, size: 19, color: iconColor),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                eyebrow,
                style: const TextStyle(
                  color: mutedInk,
                  fontSize: 9,
                  letterSpacing: .9,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                title,
                style: const TextStyle(
                  color: ink,
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                detail,
                style: const TextStyle(color: mutedInk, fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FastestChip extends StatelessWidget {
  const _FastestChip();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFE5F5EE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        'Fastest arrival',
        style: TextStyle(
          color: successGreen,
          fontSize: 9,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _VehicleCard extends StatelessWidget {
  const _VehicleCard({
    required this.vehicle,
    required this.selected,
    required this.onTap,
  });

  final _Vehicle vehicle;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected ? brandPurple : const Color(0xFFEAE8F2),
            width: selected ? 2 : 1,
          ),
          boxShadow: selected
              ? const [
                  BoxShadow(
                    color: Color(0x164C33EB),
                    blurRadius: 16,
                    offset: Offset(0, 5),
                  ),
                ]
              : null,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: softPurple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(vehicle.icon, color: brandPurple, size: 30),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              vehicle.name,
                              style: const TextStyle(
                                color: ink,
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          if (vehicle.badge != null) ...[
                            const SizedBox(width: 6),
                            const Icon(
                              Icons.star_rounded,
                              color: Color(0xFFF2A735),
                              size: 14,
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        vehicle.subtitle,
                        style: const TextStyle(color: mutedInk, fontSize: 10),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        vehicle.size,
                        style: const TextStyle(color: mutedInk, fontSize: 10),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '₹${vehicle.price}',
                      style: const TextStyle(
                        color: brandPurple,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Text(
                      'estimated',
                      style: TextStyle(color: mutedInk, fontSize: 9),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(height: 1, color: Color(0xFFEAE8F2)),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.scale_outlined, size: 16, color: brandPurple),
                const SizedBox(width: 5),
                Text(
                  vehicle.capacity,
                  style: const TextStyle(
                    color: mutedInk,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Icon(
                  selected
                      ? Icons.radio_button_checked_rounded
                      : Icons.radio_button_off_rounded,
                  size: 19,
                  color: selected ? brandPurple : mutedInk,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AddOnTile extends StatelessWidget {
  const _AddOnTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.selected,
    required this.onChanged,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final int price;
  final bool selected;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      child: Row(
        children: [
          Icon(icon, color: brandPurple, size: 21),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: ink,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: mutedInk, fontSize: 9),
                ),
              ],
            ),
          ),
          Text(
            '+₹$price',
            style: const TextStyle(
              color: brandPurple,
              fontSize: 11,
              fontWeight: FontWeight.w800,
            ),
          ),
          Checkbox(
            value: selected,
            onChanged: (value) => onChanged(value ?? false),
            activeColor: brandPurple,
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }
}

class _Vehicle {
  const _Vehicle({
    required this.name,
    required this.subtitle,
    required this.size,
    required this.capacity,
    required this.price,
    required this.icon,
    this.badge,
  });

  final String name;
  final String subtitle;
  final String size;
  final String capacity;
  final int price;
  final IconData icon;
  final String? badge;
}
