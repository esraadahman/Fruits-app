import 'package:fruits_app/Core/commonImports/commonImports.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.width,
    required this.image,
  });

  final double width;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.24,
      height: width * 0.24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.grayColor.withOpacity(.5),
          width: 2,
        ),
        image: image.isNotEmpty
            ? DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: image.isEmpty
          ? Icon(
              Icons.person_2_outlined,
              size: width * 0.12,
              color: AppColors.grayColor.withOpacity(.5),
            )
          : null,
    );
  }
}
