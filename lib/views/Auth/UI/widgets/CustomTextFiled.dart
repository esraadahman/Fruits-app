import 'package:fruits_app/Core/commonImports/commonImports.dart';

class Customtextfiled extends StatelessWidget {
  Customtextfiled({
    super.key,
    required this.hintText,
    required this.labelText,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.initialValue,
    required this.labelText_top,
    required this.width,
    this.maxLines = 1,
    this.maxLength,
    this.orientation = Orientation.portrait,
  });

  final String hintText;
  final String labelText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final String? initialValue;
  final String labelText_top;
  final double width;
  final int maxLines;
  final int? maxLength;
  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "  $labelText_top",
            style: TextStyle(
              fontSize: orientation == Orientation.portrait
                  ? width * 0.04
                  : width * 0.025,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
        ),
        size.height(5),
        SizedBox(
          width: width,
          child: TextFormField(
            obscureText: obscureText,
            keyboardType: keyboardType,
            maxLines: maxLines,
            maxLength: maxLength,
            decoration: InputDecoration(
              hintText: hintText,
              labelText: labelText,
              labelStyle: TextStyle(color: Colors.black),
              alignLabelWithHint: true,
              prefixIcon: Icon(prefixIcon),
              suffixIcon: suffixIcon,
              // border styles
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
                borderRadius: BorderRadius.circular(30),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade300, width: 1.5),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade400, width: 1.5),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onChanged: onChanged,
            validator: validator,
            initialValue: initialValue,
          ),
        )
      ],
    );
  }
}
