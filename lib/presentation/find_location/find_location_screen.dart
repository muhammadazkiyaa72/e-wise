import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/find_location/find_location_controller.dart';
import 'package:ewise/presentation/widgets/list_ebank.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindLocationScreen extends StatefulWidget {
  const FindLocationScreen({Key? key}) : super(key: key);

  @override
  State<FindLocationScreen> createState() => _FindLocationScreenState();
}

class _FindLocationScreenState extends State<FindLocationScreen> {
  final FindLocationController controller = Get.put(FindLocationController());
  bool showBankList = false;
  bool showSearchBar = false;
  TextEditingController searchController = TextEditingController();
  List<String> dataList = [
    'Bank Sampah Bersinar',
    'Bank Sampah Bersama',
    'Bank Sampah Berjuang',
  ];
  List<String> filteredList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/find_ebank.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (showSearchBar == false)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Get.back();
                        showSearchBar = false;
                      });
                    },
                    child: Container(
                      width: 47,
                      height: 47,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.arrow_back_outlined,
                        size: 24,
                      ),
                    ),
                  ),
                if (showSearchBar == false)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showSearchBar = true;
                      });
                    },
                    child: Container(
                      width: 47,
                      height: 47,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.search,
                        size: 24,
                      ),
                    ),
                  ),
              ],
            ),
            if (showSearchBar)
              Container(
                height: 50,
                margin: const EdgeInsets.only(top: 16, bottom: 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(2),
                    prefixIcon: const Icon(Icons.arrow_back_outlined),
                    hintText: 'Search',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showSearchBar = false;
                          searchController.clear();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  onChanged: (query) {
                    filterData(query);
                  },
                ),
              ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: showSearchBar ? filteredList.length : 0,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListTile(
                      title: Text(filteredList[index]),
                      subtitle: const Text(
                          'Jl. Terusan Bojongsoang No.174, Baleendah, Kec. Baleendah, Kabupaten Bandung, Jawa Barat 40375'),
                      // Tambahkan logika onTap untuk item yang dipilih
                    ),
                  );
                },
              ),
            ),
            if (showBankList == false)
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showBankList = !showBankList;
                    });
                  },
                  child: Container(
                    width: 154,
                    height: 50,
                    margin: const EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                      border: Border.all(
                        width: 1,
                        color: AppColors.black.withOpacity(0.2),
                      ),
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Lihat daftar',
                        style: Styles.blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: AppFontWeight.medium,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            if (showBankList)
              const Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Center(child: ListBank()),
              ),
          ],
        ),
      ),
    );
  }

  void filterData(String query) {
    setState(() {
      filteredList = dataList
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}
