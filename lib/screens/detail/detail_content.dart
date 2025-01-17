import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_listing_app_ui/constants.dart';
import 'package:job_listing_app_ui/model/job.dart';
import 'package:job_listing_app_ui/widgets/detail_item.dart';

class DetailContent extends StatelessWidget {
  const DetailContent({
    Key key,
    @required this.data,
  }) : super(key: key);

  final Job data;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: kSpacingUnit * 4,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kSpacingUnit * 5),
            topRight: Radius.circular(kSpacingUnit * 5),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: kSpacingUnit * 5),
              Center(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      data.imgUrl,
                      height: 50.sp,
                      width: 50.sp,
                    ),
                    SizedBox(height: kSpacingUnit * 2),
                    Text(
                      data.companyName,
                      style: kTitleTextStyle,
                    ),
                    SizedBox(height: kSpacingUnit),
                    Text(
                      data.location,
                      style: kCaptionTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(height: kSpacingUnit * 5),
              Text(
                'Tanggung jawab',
                style: kSubTitleTextStyle,
              ),
              SizedBox(height: kSpacingUnit * 2),
              if (data.responsibilities != null && data.responsibilities.length > 0)
                ...data.responsibilities
                    .map((responsibility) => DetailItem(data: responsibility))
                    .toList(),
              SizedBox(height: kSpacingUnit),
              Text(
                'Kualifikasi',
                style: kSubTitleTextStyle,
              ),
              SizedBox(height: kSpacingUnit * 2),
              if (data.qualifications != null && data.qualifications.length > 0)
                ...data.qualifications
                    .map((qualification) => DetailItem(data: qualification))
                    .toList(),
              SizedBox(height: kSpacingUnit * 15),
            ],
          ),
        ),
      ),
    );
  }
}
