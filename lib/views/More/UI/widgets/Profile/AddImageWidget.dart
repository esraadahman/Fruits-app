import 'package:fruits_app/Core/commonImports/commonImports.dart';

class AddImageWidget extends StatelessWidget {
  const AddImageWidget({
    super.key,
    required this.width,
    required this.image,
    required this.onTap,
  });

  final double width;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width * 0.24,
          height: width * 0.24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.grayColor,
              width: 2,
            ),
            image: image.isNotEmpty
                ? DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: onTap,
            child: Icon(
              Icons.add_a_photo_outlined,
              color: AppColors.grayColor,
              size: width * 0.07,
            ),
          ),
        ),
      ],
    );
  }
}
