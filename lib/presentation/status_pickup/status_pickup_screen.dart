import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/status_pickup/konfimasi/konfimasi_screen.dart';
import 'package:ewise/presentation/status_pickup/pickup/pickup_screen.dart';
import 'package:ewise/presentation/status_pickup/selesai/selesai_screen.dart';
import 'package:flutter/material.dart';

class StatusPickupScreen extends StatefulWidget {
  const StatusPickupScreen({Key? key}) : super(key: key);

  @override
  _StatusPickupScreenState createState() => _StatusPickupScreenState();
}

class _StatusPickupScreenState extends State<StatusPickupScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0; // Set the default selected index
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              'Status Pemesanan',
              style: Styles.blackTextStyle.copyWith(
                fontSize: 25,
                fontWeight: AppFontWeight.semiBold,
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilterButton(
                      label: 'Konfirmasi',
                      isSelected: _selectedIndex == 0,
                      onPressed: () {
                        _onFilterButtonPressed(0);
                      },
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    FilterButton(
                      label: 'Pickup',
                      isSelected: _selectedIndex == 1,
                      onPressed: () {
                        _onFilterButtonPressed(1);
                      },
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    FilterButton(
                      label: 'Selesai',
                      isSelected: _selectedIndex == 2,
                      onPressed: () {
                        _onFilterButtonPressed(2);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: const [
                  KonfirmasiScreen(),
                  PickupScreen(),
                  SelesaiScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onFilterButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const FilterButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 111,
        height: 36,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(50),
          color: isSelected ? AppColors.p50 : AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.p50 : AppColors.white,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.white : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
