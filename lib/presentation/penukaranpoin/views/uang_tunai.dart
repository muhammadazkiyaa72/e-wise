import 'package:flutter/material.dart';
import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/wisepoin/components/poin_card.dart';

class UangTunaiPage extends StatefulWidget {
  static List listUang = [
    'Rp 5.000',
    'Rp 10.000',
    'Rp 15.000',
    'Rp 30.000',
    'Rp 40.000',
    'Rp 50.000',
  ];

  const UangTunaiPage({super.key});

  @override
  State<UangTunaiPage> createState() => _UangTunaiPageState();
}

class _UangTunaiPageState extends State<UangTunaiPage> {
  int tappedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // card poin
              const PoinCard(),

              const SizedBox(
                height: 30,
              ),

              // uang tunai
              Text(
                'Uang Tunai',
                style: Styles.blackTextStyle
                    .copyWith(fontSize: 16, fontWeight: AppFontWeight.semiBold),
              ),

              const SizedBox(
                height: 25,
              ),

              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 96 / 40),
                itemCount: UangTunaiPage.listUang.length,
                itemBuilder: (context, index) {
                  bool isTapped = index == tappedIndex;
                  Color borderColor =
                      isTapped ? AppColors.p90 : const Color(0xFF79747E);
                  Color nominalColor =
                      isTapped ? AppColors.p90 : AppColors.black;

                  return GestureDetector(
                      onTap: () {
                        print('${UangTunaiPage.listUang[index]}');
                        setState(() {
                          tappedIndex = index;
                          if (tappedIndex != index) {
                            borderColor = AppColors.p90;
                            if (tappedIndex != -1) {
                              tappedIndex = -1;
                            }
                          }
                        });
                      },
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: borderColor)),
                        child: Center(
                          child: Text(UangTunaiPage.listUang[index],
                              style: TextStyle(
                                fontSize: 12,
                                color: nominalColor,
                              )),
                        ),
                      ));
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 60.0),
            child: ElevatedButton(
                onPressed: () {
                  print('Tarik Saldo');
                },
                style: ButtonStyle(
                    elevation: MaterialStatePropertyAll(5),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor:
                        const MaterialStatePropertyAll(AppColors.p40),
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 8))),
                child: Center(
                  child: Text(
                    'Tarik Saldo',
                    style: Styles.whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: AppFontWeight.medium),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
