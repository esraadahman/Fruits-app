import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/views/Home/UI/widgets/categoriesWidget.dart';

class CategoriesProduct extends StatelessWidget {
  const CategoriesProduct({
    super.key,
    required this.height,
    required this.width,
    required this.categories,
    required this.onCategoryTap,
  });

  final double height;
  final double width;

  // for images and text
  final List<Map<String, String>> categories;

  /// Function to handle tap by index
  final Function(int index) onCategoryTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(categories.length, (index) {
          return GestureDetector(
              onTap: () => onCategoryTap(index),
              child: Column(
                children: [
                  categoriesWidget(
                    height: height,
                    width: width,
                    imagepath: categories[index]['image']!,
                  ),
                  size.height(height * .02),
                  Text(
                    categories[index]["name"]!,
                    style: TextStyle(
                      fontSize: width * .03,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ));
        }).toList(),
      ),
    );
  }
}
