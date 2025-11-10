import 'package:fruits_app/Core/commonImports/commonImports.dart';

class PonitsWidget extends StatelessWidget {
  const PonitsWidget({
    super.key,
    required this.images,
    required this.width,
    required this.height,
    required this.currentIndex,
  });

  final List images;
  final double width;
  final double height;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        images.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: width * 0.025,
          height: height * 0.012,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.5),
            color: currentIndex == index
                ? const Color(0xFF003602)
                : Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
