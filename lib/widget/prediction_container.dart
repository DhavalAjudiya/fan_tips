import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class PredictionContainer extends StatelessWidget {
  final ImageProvider? backgroundImage;
  String headerText;
  final String youtubeText;
  final String predictionCount;
  final String averageCount;
  final String winsCount;

  PredictionContainer({
    Key? key,
    this.backgroundImage,
    this.headerText = '',
    required this.youtubeText,
    required this.predictionCount,
    required this.averageCount,
    required this.winsCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 20.h,
        decoration: BoxDecoration(
          color: const Color(0XFF1B1B1B),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 8,
            top: 15,
            bottom: 8,
            left: 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: backgroundImage,
                    radius: 22,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                headerText,
                                style: const TextStyle(
                                    fontFamily: 'circular',
                                    color: Colors.white),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset("assets/image/youtube.svg"),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Text(
                                    youtubeText,
                                    style: const TextStyle(
                                      fontFamily: 'circular',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 8,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 52.w,
                          ),
                          IconButton(
                            splashColor: Colors.transparent,
                            icon: const Icon(Icons.favorite, color: Colors.red),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 3.5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        predictionCount,
                        style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        "Prediction",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'circular',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 0.2.w,
                    color: const Color(0XFF4E4E4E),
                  ),
                  Column(
                    children: [
                      Text(
                        averageCount,
                        style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        "Average Score",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'circular',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 0.2.w,
                    color: const Color(0XFF4E4E4E),
                  ),
                  Column(
                    children: [
                      Text(
                        winsCount,
                        style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Text(
                        "Wins",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'circular',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
