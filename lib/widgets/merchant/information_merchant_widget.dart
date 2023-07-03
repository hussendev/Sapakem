import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sapakem/cubit/home/merchant/merchant_cubit.dart';
import 'package:sapakem/cubit/home/merchant/merchant_states.dart';
import 'package:sapakem/prefs/shared_pref_controller.dart';
import 'package:sapakem/util/context_extenssion.dart';
import 'package:sapakem/util/sized_box_extension.dart';
import 'package:share_plus/share_plus.dart';

import '../../model/home/merchant.dart';
import '../app_button_widget.dart';
import '../app_text.dart';

class InformationMerchantWidget extends StatelessWidget {
  InformationMerchantWidget({super.key, required this.merchant});

  Merchant merchant;

  @override
  Widget build(BuildContext context) {
    // Logger().i( merchant.merchantName!);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  merchant.storeName!,
                  style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                10.pw(),
                SizedBox(
                  height: 20.16.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 10.h,
                        width: 10.w,
                        decoration: BoxDecoration(color: merchant.isOpen! ? const Color(0xff69DF57) : Colors.red, shape: BoxShape.circle),
                      ),
                      10.pw(),
                      InkWell(
                        onTap: () async {
                          shareMerchant(context);
                        },
                        child: Container(
                          decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                          height: 25.h,
                          width: 25.w,
                          child: const Icon(
                            Icons.share,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      10.pw(),
                      BlocBuilder<MerchantCubit, MerchantStates>(
                        builder: (context, state) {
                          return InkWell(
                            onTap: () {
                              context.read<MerchantCubit>().addMerchantToFavorites(merchant, SharedPrefController().getUserId().toString());
                            },
                            child: Icon(
                              MerchantCubit.get(context).isMerchantFavorite(merchant, SharedPrefController().getUserId().toString()) ? Icons.favorite : Icons.favorite_border,
                              size: 25,
                              color: MerchantCubit.get(context).isMerchantFavorite(merchant, SharedPrefController().getUserId().toString()) ? Colors.red : Colors.black,
                            ),
                          );
                        },
                        buildWhen: (previous, current) => current is FavoriteMerchantState || current is InitialFavoriteMerchantState,
                      ),
                    ],
                  ),
                )
              ],
            ),
            AppText(
              text: this.merchant.address!.substring(0, 15),
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 21.91.h,
              // width: 237.w,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: Colors.blue,
                        size: 20,
                      ),
                      4.4.pw(),
                      AppText(
                        text: context.localizations.click_for_more_information,
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  22.pw(),
                  if (merchant.businesHour!.length > 0)
                    const Icon(
                      Icons.watch_later_outlined,
                      color: Colors.blue,
                      size: 20,
                    ),
                  AppText(
                    text: merchant.businesHour!.length != 0 ? "${getHour(merchant.businesHour![(DateTime.now().day + 1) % 7].from!)} - ${getHour(merchant.businesHour![(DateTime.now().day + 1) % 7].to!)}" : '',
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            AppText(
              text: "خلال 30 دقيقة (الحد الأقصى لتجهيز الطلب)",
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            8.ph(),
            BlocBuilder<MerchantCubit, MerchantStates>(
              bloc: MerchantCubit.get(context)..getStatusForMerchant(context, merchant.id.toString()),
              builder: (context, state) {
                if (state is InitialMerchantState) {
                  return AppButton(
                    height: 30.h,
                    width: 107.w,
                    onPressed: () {
                      performSendRequestForMerchant(context);
                    },
                    text: 'Request to be freinds',
                  );
                } else if (state is LoadingMerchantState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SendRequestForMerchantState && state.merchantFreindStatus == MerchantFreindStatus.pending) {
                  return AppButton(
                    height: 30.h,
                    width: 107.w,
                    onPressed: () {
                      performSendRequestForMerchant(context);
                    },
                    text: 'cancel request',
                  );
                } else if (state is SendRequestForMerchantState && state.merchantFreindStatus == MerchantFreindStatus.notFreind) {
                  return AppButton(
                    height: 30.h,
                    width: 107.w,
                    onPressed: () {
                      performSendRequestForMerchant(context);
                    },
                    text: 'Request to be freinds',
                  );
                } else if (state is SendRequestForMerchantState && state.merchantFreindStatus == MerchantFreindStatus.freind) {
                  return AppButton(
                    height: 30.h,
                    width: 107.w,
                    onPressed: () {
                      performSendRequestForMerchant(context);
                    },
                    text: 'freinds',
                  );
                } else {
                  state as ErrorMerchantState;
                  return Text(state.error);
                }
              },
              buildWhen: (previous, current) => current is SendRequestForMerchantState || current is InitialMerchantState,
            )
          ]),
        ),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 111.h,
              width: 70.w,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: AppText(textAlign: TextAlign.center, text: context.localizations.estimated_time_of_arrival_of_your_order, fontSize: 12.sp, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 70.h,
              width: 70.w,
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Center(
                child: AppText(textAlign: TextAlign.center, text: ' ₪ 30.0', fontSize: 18.sp, color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void shareMerchant(BuildContext context) async {
    Logger().i((merchant.businesHour![(DateTime.now().day + 1) % 7].from!));
    context.showIndicator();
    String urlImage = merchant.merchantLogo!;
    final url = Uri.parse(urlImage);
    final response = await http.get(url);
    final bytes = response.bodyBytes;

    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/image.jpg';
    File(path).writeAsBytesSync(bytes);
    Share.shareFiles(
      [path],
      text: 'Product Name: ${merchant.merchantName!}\n'
          'Address: ${merchant.address}\n'
          'Mobile: ${merchant.mobile}\n'
          'Is Open: ${merchant.isOpen}\n'
          'Today Open From: ${getHour(merchant.businesHour![(DateTime.now().day + 1) % 7].from!)}, To: ${getHour(merchant.businesHour![(DateTime.now().day + 1) % 7].to!)}',
    );

    Navigator.pop(context);
  }

  performSendRequestForMerchant(BuildContext context) async {
    context.read<MerchantCubit>().sendRequestForMerchant(context, merchant.id.toString());
  }

  getHour(String hour) {
    if (hour.isNotEmpty) {
      List<String> newHour = hour.split(':');
      int hourAsInt = int.parse(newHour[0]);
      int hourAs12 = hourAsInt % 12 == 0 ? 12 : hourAsInt % 12;

      bool isPm = hourAsInt >= 12;

      return '$hourAs12:${newHour[1]}${isPm ? ' PM' : ' AM'}';
    } else {
      return '';
    }
  }
}
