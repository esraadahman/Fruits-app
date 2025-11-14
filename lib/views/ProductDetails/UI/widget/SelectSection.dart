import 'package:fruits_app/Core/commonImports/commonImports.dart';

class SelectSection extends StatefulWidget {
  const SelectSection({
    super.key,
    required this.options,
    required this.width,
    required this.title,
    required this.height,
  });

  final List<Map<String, String>> options;
  final double width;
  final String title;
  final double height;

  @override
  State<SelectSection> createState() => _SelectSectionState();
}

class _SelectSectionState extends State<SelectSection> {
  bool expanded = false;
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 Header Row (collapsed / toggle)
        GestureDetector(
          onTap: () => setState(() => expanded = !expanded),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Select ${widget.title}",
                style: TextStyle(
                  fontSize: widget.width * 0.04,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: Colors.grey.shade700,
                size: widget.width * .07,
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
        ),

        if (expanded)
          Column(
            children: widget.options.map((option) {
              final value = option['label']!;
              final price = option['price']!;
              return RadioListTile<String>(
                value: value,
                groupValue: selectedValue,
                activeColor: AppColors.CustomColor,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "$value - $price",
                  style: TextStyle(
                    fontSize: widget.width * 0.035,
                    color: Colors.grey.shade800,
                  ),
                ),
                onChanged: (val) {
                  setState(() => selectedValue = val);
                },
              );
            }).toList(),
          ),
      ],
    );
  }
}
