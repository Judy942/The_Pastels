import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../../../core/constants/color_constant.dart';
import '../../../core/constants/icon_constant.dart';
import '../../../core/constants/image_constant.dart';
import '../../../features/cultivation_menu/screens/cultivation_screen.dart';
import '../../../features/detection/screens/test/qr_generate.dart';
import '../../../features/waste_processing/waste_processing_screen.dart';

class HomeNavigationScreen extends StatefulWidget {
  const HomeNavigationScreen({super.key});

  @override
  State<HomeNavigationScreen> createState() => _HomeNavigationScreenState();
}

class _HomeNavigationScreenState extends State<HomeNavigationScreen> {
  // final _information = informasi;
  final mapMenu = {
    IconConstant.cultivationMenu: "search",
    IconConstant.quizMenu: "quizz",
    IconConstant.recipesMenu: "history",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Image.asset(ImageConstant.splashLogo),
                ),
                Positioned(
                  bottom: 10,
                  right: 20,
                  left: 20,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: ColorConstant.primaryColor.withOpacity(0.2),
                            blurRadius: 16,
                            offset: const Offset(1, 1),
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            ImageConstant.logoApp,
                            height: 80,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Waste Classification",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "The classification of waste",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    mapMenu.length,
                    (index) => GestureDetector(
                          onTap: () {
                            if (mapMenu.values.elementAt(index) == "search") {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const QRGenerate()));
                            } else if (mapMenu.values.elementAt(index) ==
                                "quizz") {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const CultivationScreen()));
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const PengolahanScreen()));
                            }
                          },
                          child: SizedBox(
                            width: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorConstant.primaryColor
                                              .withOpacity(0.1),
                                          blurRadius: 10,
                                          offset: const Offset(0, 3),
                                        ),
                                      ]),
                                  child: Image(
                                      width: 32,
                                      height: 32,
                                      image:
                                          Svg(mapMenu.keys.elementAt(index))),
                                ),
                                Text(
                                  mapMenu.values.elementAt(index),
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 10,
              color: Colors.grey.withOpacity(0.1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              child:
                  // Text(
                  //   "Wellcome to Waste Classification",
                  //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  // ),
                  Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    "Wellcome to",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Waste Classification",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
