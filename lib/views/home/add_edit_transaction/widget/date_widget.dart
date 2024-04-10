import 'package:flutter/material.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_helper.dart';

class DateWidget extends StatelessWidget {
  final DateTime date;
  final Function nextAction;
  final Function previousAction;
  const DateWidget({
    super.key,
    required this.date,
    required this.nextAction,
    required this.previousAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 16,
      ),
      child: Row(
        children: [
          /// Date
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              AppHelper.checkDateShow(
                AppHelper.convertDateTimeMMddYYYY(date),
              ),
              textAlign: TextAlign.left,
            ),
          ),

          /// Calendar
          Container(
            margin: const EdgeInsets.only(left: 8.0),
            width: 20.0,
            height: 20.0,
            alignment: Alignment.centerLeft,
            child: Image.asset(
              AppImages.icCalendar,
              width: 20.0,
              height: 20.0,
              fit: BoxFit.cover,
            ),
          ),

          /// Spacing
          const Expanded(child: SizedBox()),

          /// Previous

          Container(
            width: 20.0,
            height: 20.0,
            alignment: Alignment.centerLeft,
            child: TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                previousAction();
              },
              child: Image.asset(
                AppImages.icPrevious,
                width: 20.0,
                height: 20.0,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(left: 8.0),
            width: 20.0,
            height: 20.0,
            alignment: Alignment.centerLeft,
            child: TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                nextAction();
              },
              child: Image.asset(
                AppImages.icNext,
                width: 20.0,
                height: 20.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
