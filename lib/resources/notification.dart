// import 'package:common_widgets/utils/colors.dart';
// import 'package:common_widgets/widgets/text_view.dart';
// import 'package:flutter/material.dart';
// import 'package:krysta/resources/enums.dart';
// import 'package:toastification/toastification.dart';

// enum SnackBarStatus { success, error, warning }

// void showSnackBar(String? message, BuildContext context, HttpStatusCode? status,
//     {Color? color}) {
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       backgroundColor: status?.name == HttpStatusCode.success.name
//           ? CColors.green
//           : status?.name == HttpStatusCode.error.name
//               ? CColors.red
//               : CColors.lightYellow,
//       content: TextView(
//           text: message ?? '',
//           textColor: color ?? CColors.white,
//           textAlign: TextAlign.center)));
// }

// void showToast(
//     {String? message,
//     Color? color,
//     HttpStatusCode? status = HttpStatusCode.success}) {
//   toastification.show(
//       description: Flexible(
//         child: TextView(
//             text: message ?? '',
//             textColor:  color ?? CColors.textGrey,
//             textAlign: TextAlign.center),
//       ),
//       style: ToastificationStyle.flatColored,
//       type: status == HttpStatusCode.success
//           ? ToastificationType.success
//           : status == HttpStatusCode.error
//               ? ToastificationType.error
//               : ToastificationType.warning,
//       alignment: Alignment.bottomCenter,
//       autoCloseDuration: const Duration(seconds: 5));
// }
