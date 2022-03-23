import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../../T20Predictions/page/utills/color.dart';
import 'circle_avtar.dart';

class CustomScoreCard extends StatelessWidget {


  final String? imageLogo1;
  final String? imageLogo2;

  const CustomScoreCard({Key? key, this.imageLogo1, this.imageLogo2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 15.h,
      decoration: BoxDecoration(color: AppColor.greyBackGround, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          SizedBox(
            width: 2.w,
          ),
          CircleLogo(
            width: 12.w,
            height: 12.h,
            image: imageLogo1,
          ),
          SizedBox(
            width: 2.5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'MI',
                style: TextStyle(color: AppColor.grey, fontWeight: FontWeight.bold, fontSize: 12.sp),
              ),
              SizedBox(
                height: 0.8.h,
              ),
              Row(
                children: [
                  Text(
                    '135-7',
                    style: TextStyle(color: AppColor.grey, fontWeight: FontWeight.bold, fontSize: 12.sp),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  const Text(
                    '(15.4)',
                    style: TextStyle(color: AppColor.grey),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            width: 5.w,
          ),
          Container(
            height: 3.h,
            width: 3.h,
            child: SvgPicture.asset('assets/icons/white_flash.svg'),
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'CSK',
                style: TextStyle(color: AppColor.white, fontWeight: FontWeight.bold, fontSize: 12.sp),
              ),
              SizedBox(
                height: 0.8.h,
              ),
              Row(
                children: [
                  const Text(
                    '(15.4)',
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    '135-7',
                    style: TextStyle(color: AppColor.white, fontWeight: FontWeight.bold, fontSize: 12.sp),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            width: 2.5.w,
          ),
          CircleLogo(
            width: 12.w,
            height: 12.h,
            image: imageLogo2,
          ),
          SizedBox(
            width: 2.w,
          ),
        ],
      ),
    );
  }
}
