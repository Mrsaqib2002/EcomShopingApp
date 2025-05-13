// import 'package:flutter/material.dart';
//
// /// A reusable custom button widget with functionality, validation, and decoration.
// class CustomButton extends StatelessWidget {
//   /// Text to display on the button.
//   final String text;
//
//   /// Callback function when the button is pressed.
//   final VoidCallback? onPressed;
//
//   /// Whether the button is enabled or disabled.
//   final bool isEnabled;
//
//   /// Optional validator function that returns true if the button should be enabled.
//   final bool Function()? validator;
//
//   /// Background color of the button.
//   final Color backgroundColor;
//
//   /// Text color of the button.
//   final Color textColor;
//
//   /// Border color of the button.
//   final Color borderColor;
//
//   /// Border radius of the button.
//   final double borderRadius;
//
//   /// Padding inside the button.
//   final EdgeInsets padding;
//
//   /// Font size of the button text.
//   final double fontSize;
//
//   /// Font weight of the button text.
//   final FontWeight fontWeight;
//
//   /// Optional icon to display before the text.
//   final IconData? icon;
//
//   /// Elevation (shadow) of the button.
//   final double elevation;
//
//   const CustomButton({
//     Key? key,
//     required this.text,
//     this.onPressed,
//     this.isEnabled = true,
//     this.validator,
//     this.backgroundColor = Colors.blue,
//     this.textColor = Colors.white,
//     this.borderColor = Colors.blue,
//     this.borderRadius = 12.0,
//     this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//     this.fontSize = 16.0,
//     this.fontWeight = FontWeight.bold,
//     this.icon,
//     this.elevation = 4.0,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Determine if button should be enabled based on isEnabled and validator
//     final bool isButtonEnabled = isEnabled && (validator == null || validator!());
//
//     return Material(
//       elevation: isButtonEnabled ? elevation : 0,
//       borderRadius: BorderRadius.circular(borderRadius),
//       shadowColor: Colors.grey.withOpacity(0.3),
//       child: InkWell(
//         onTap: isButtonEnabled ? onPressed : null,
//         borderRadius: BorderRadius.circular(borderRadius),
//         child: Container(
//           padding: padding,
//           decoration: BoxDecoration(
//             color: isButtonEnabled ? backgroundColor : Colors.grey[300],
//             border: Border.all(
//               color: isButtonEnabled ? borderColor : Colors.grey[400]!,
//               width: 1,
//             ),
//             borderRadius: BorderRadius.circular(borderRadius),
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               if (icon != null) ...[
//                 Icon(
//                   icon,
//                   color: isButtonEnabled ? textColor : Colors.grey[600],
//                   size: fontSize + 4,
//                 ),
//                 SizedBox(width: 8),
//               ],
//               Center(
//                 child: Text(
//                   text,
//                   style: TextStyle(
//                     color: isButtonEnabled ? textColor : Colors.black,
//                     fontSize: fontSize,
//                     fontWeight: fontWeight,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

/// A reusable custom button widget with functionality, validation, and decoration.
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final bool Function()? validator;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double borderRadius;
  final EdgeInsets padding;
  final double fontSize;
  final FontWeight fontWeight;
  final IconData? icon;
  final double elevation;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.isEnabled = true,
    this.validator,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.borderColor = Colors.blue,
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.bold,
    this.icon,
    this.elevation = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isButtonEnabled = isEnabled && (validator == null || validator!());

    return Material(
      elevation: isButtonEnabled ? elevation : 0,
      borderRadius: BorderRadius.circular(borderRadius),
      shadowColor: Colors.grey.withOpacity(0.3),
      child: InkWell(
        onTap: isButtonEnabled ? onPressed : null,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: isButtonEnabled ? backgroundColor : Colors.grey[300],
            border: Border.all(
              color: isButtonEnabled ? borderColor : Colors.grey[400]!,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: isButtonEnabled ? textColor : Colors.grey[600],
                  size: fontSize + 4,
                ),
                SizedBox(width: 8),
              ],
              Text(
                text,
                style: TextStyle(
                  color: isButtonEnabled ? textColor : Colors.grey[600],
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}