import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:intl/intl.dart';

class DatePickerField extends StatefulWidget {
  const DatePickerField({super.key, required this.width});
  final double width;

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width * .83,
      child: TextField(
        controller: _dateController,
        readOnly: true,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: widget.width * .035,
            color: AppColors.button_Color),
        decoration: InputDecoration(
          labelText: 'Select Date',

          labelStyle: TextStyle(
              fontSize: widget.width * .03, color: AppColors.button_Color),
          suffixIcon: Icon(Icons.keyboard_arrow_down,
              size: widget.width * .06, color: AppColors.button_Color),
          border: const UnderlineInputBorder(), // Only bottom border
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.grayColor,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.button_Color,
            ),
          ),
        ),
        onTap: () => _selectDate(context),
      ),
    );
  }
}
