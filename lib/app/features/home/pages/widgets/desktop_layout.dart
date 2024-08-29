import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/constance/app_strings.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'HUMMING\nBIRD.',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  Row(
                    children: [
                      _customTextButton(label: 'Episodes'),
                      SizedBox(width: 1.h),
                      _customTextButton(label: 'About'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.homeTitle,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.sp,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          AppString.homeContent,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5.w),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(20.w, 8.h),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("Join course", style: TextStyle(fontSize: 14.sp)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customTextButton({required String label}) {
    return TextButton(
        style: TextButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: () {},
        child: Text(
          label,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300),
        ));
  }
}
