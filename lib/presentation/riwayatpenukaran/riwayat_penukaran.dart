import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/riwayatpenukaran/components/all_riwayat_screen.dart';
import 'package:ewise/presentation/riwayatpenukaran/components/in_riwayat_penukaran_screen.dart';
import 'package:ewise/presentation/riwayatpenukaran/components/out_riwayat_screen.dart';
import 'package:flutter/material.dart';

class RiwayatPenukaranScreen extends StatefulWidget {
  const RiwayatPenukaranScreen({Key? key}) : super(key: key);

  @override
  _RiwayatPenukaranScreenState createState() => _RiwayatPenukaranScreenState();
}

class _RiwayatPenukaranScreenState extends State<RiwayatPenukaranScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0; // Set the default selected index
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Riwayat',
          style: Styles.blackTextStyle.copyWith(
            fontSize: 25,
            fontWeight: AppFontWeight.semiBold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 24,
          left: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilterButton(
                      label: 'Semua',
                      isSelected: _selectedIndex == 0,
                      onPressed: () {
                        _onFilterButtonPressed(0);
                      },
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    FilterButton(
                      label: 'Poin Masuk',
                      isSelected: _selectedIndex == 1,
                      onPressed: () {
                        _onFilterButtonPressed(1);
                      },
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    FilterButton(
                      label: 'Ditukarkan',
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
                  AllRiwayatScreen(),
                  InRiwayatScreen(),
                  OutRiwayatScreen(),
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
