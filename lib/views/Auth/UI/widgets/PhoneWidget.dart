import 'package:fruits_app/Core/commonImports/commonImports.dart';

class Phonewidget extends StatelessWidget {
  final Function(String)? onChanged;
  final String labelText_top;
  final double width;
  final Orientation orientation;
  const Phonewidget(
      {super.key,
      this.onChanged,
      required this.labelText_top,
      required this.width,
      this.orientation = Orientation.portrait});

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
        IntlPhoneField(
          decoration: InputDecoration(
            labelText: 'Phone Number',
            labelStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
            ),
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
          initialCountryCode: 'EG',
          onChanged: (phone) {
            if (onChanged != null) {
              onChanged!(phone.completeNumber);
            }
          },
          onCountryChanged: (country) {
            print('Country changed to: ${country.name}');
          },
        ),
      ],
    );
  }
}
