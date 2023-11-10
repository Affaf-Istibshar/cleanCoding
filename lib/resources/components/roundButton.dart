import 'package:flutter/material.dart';
import 'package:mvvm/resources/colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    this.buttonColor = AppColors.primaryButtonColor,
    this.textColor = AppColors.primaryTextColor,
    required this.title,
    required this.onPress,
    this.width = 190,
    this.height = 60,
    this.loading = false,
  }) : super(key: key);
  final bool loading;
  final double width, height;
  final VoidCallback onPress;
  final String title;
  final Color buttonColor, textColor;

  @override
  Widget build(BuildContext context) {
    return
     InkWell(
       onTap: onPress,
       child:  Container(
           height: height,
           width: width,
           decoration: BoxDecoration(
             color: buttonColor,
             borderRadius: BorderRadius.circular(50),
           ),
           child: loading
               ? const Center(child: CircularProgressIndicator())
               : Center(
             child: Text(
               title,
               style: Theme.of(context)
                   .textTheme
                   .titleMedium!
                   .copyWith(color: Colors.white),
             ),
           )),
     );
  }
}
