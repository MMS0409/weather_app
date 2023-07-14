import 'package:default_project/utils/colors.dart';
import 'package:default_project/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../data/models/main/weather_main.dart';
import '../../data/models/universal_data.dart';
import '../../data/network/api_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_FEE3BC,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.C_F39876, AppColors.C_FEE3BC],
            ),
          ),
        ),
        toolbarHeight: 0,
      ),
      body: FutureBuilder<UniversalData>(
        future: ApiProvider.getMainWeatherDataByQuery(query: "Tashkent"),
        builder: (BuildContext context, AsyncSnapshot<UniversalData> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.error.isEmpty) {
              WeatherMainModel weatherMainModel =
                  snapshot.data!.data as WeatherMainModel;
              return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.C_F39876, AppColors.C_FEE3BC],
                  ),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: ZoomTapAnimation(
                        onTap: () {},
                        child: SvgPicture.asset(AppImages.search,
                            width: 24.w, height: 24.h),
                      ),
                      trailing: ZoomTapAnimation(
                        onTap: () {},
                        child: SvgPicture.asset(AppImages.menu,
                            width: 24.w, height: 24.h),
                      ),
                    ),
                    SizedBox(height: 21.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.h),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppImages.location,
                                // color: AppColors.C_FEE3BC,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                weatherMainModel.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.sp,
                                    fontFamily: "Poppins",
                                    color: AppColors.C_313341),
                              ),
                            ],
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            children: [
                              Text(
                                weatherMainModel.dateTime.toString(),
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.C_9A938C),
                              ),
                            ],
                          ),
                          SizedBox(height: 13.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                  "https://openweathermap.org/img/wn/${weatherMainModel.weatherModel[0].icon}@2x.png",
                                  width: 83.w,
                                  height: 80.h),
                              RichText(
                                text: TextSpan(
                                  text:
                                      "${(weatherMainModel.mainInMain.temp - 273.15).toInt()}\n",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 43.sp,
                                      color: AppColors.C_303345),
                                  children: [
                                    TextSpan(
                                      text:
                                          (weatherMainModel.weatherModel[0].main),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.sp,
                                          color: AppColors.C_303345),
                                    ),
                                  ],
                                ),
                              ),
                              SvgPicture.asset(AppImages.gradus,
                                  width: 40.w, height: 40.h),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Container(
                              width: 300.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                gradient: const LinearGradient(
                                  colors: [Colors.white, Colors.white54],
                                ),
                              ),
                              child: ListTile(
                                leading: Image.asset(AppImages.umbrella),
                                title: const Text(
                                  "RainFall",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      fontFamily: "Poppins",
                                      color: AppColors.C_303345),
                                ),
                                trailing: Text("${weatherMainModel.windInMain.speed.toInt().toString()} sm",
                                  style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.C_303345),
                                ),
                              )),
                          SizedBox(height: 20.h),
                          Container(
                              width: 300.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                gradient: const LinearGradient(
                                  colors: [Colors.white, Colors.white54],
                                ),
                              ),
                              child: ListTile(
                                leading: Image.asset(AppImages.umbrella),
                                title: const Text(
                                  "RainFall",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      fontFamily: "Poppins",
                                      color: AppColors.C_303345),
                                ),
                                trailing: Text("${weatherMainModel.windInMain.gust.toString()} sm",
                                  style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.C_303345),
                                ),
                              )),
                          SizedBox(height: 20.h),
                          Container(
                              width: 300.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                gradient: const LinearGradient(
                                  colors: [Colors.white, Colors.white54],
                                ),
                              ),
                              child: ListTile(
                                leading: Image.asset(AppImages.umbrella),
                                title: const Text(
                                  "RainFall",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      fontFamily: "Poppins",
                                      color: AppColors.C_303345),
                                ),
                                trailing: Text("${weatherMainModel.windInMain.speed.toInt().toString()} sm",
                                  style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.C_303345),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          }
          return Center(
            child: Text(snapshot.error.toString()),
          );
        },
      ),
    );
  }
}
