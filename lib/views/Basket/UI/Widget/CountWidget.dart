import 'package:fruits_app/Core/commonImports/commonImports.dart';

class CountWidget extends StatefulWidget {
  const CountWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  State<CountWidget> createState() => _CountWidgetState();
}

class _CountWidgetState extends State<CountWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: widget.height * .02),
      padding: EdgeInsets.symmetric(
        horizontal: widget.width * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade400, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (count > 0) count--;
              });
            },
            child: Icon(Icons.remove,
                size: widget.width * 0.05, color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.width * 0.01),
            child: Text(
              count.toString(),
              style: TextStyle(
                fontSize: widget.width * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                count++;
              });
            },
            child:
                Icon(Icons.add, size: widget.width * 0.04, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
