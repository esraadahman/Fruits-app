import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/Core/utils/widgets/ResponsiveLayout.dart';
import 'package:fruits_app/views/Favorite/UI/widgets/FavoriteCard.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  List<int> favorites = List.generate(10, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Infowidget(builder: (context, deviceInfo) {
      double width = deviceInfo.localWidth;
      double height = deviceInfo.localHeight;

      return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBarWidget(
            width: width,
            centerTitle: true,
            title: "Favorite",
          ),
          body: ResponsiveLayout(
            portrait: Column(
              children: [
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return FavoriteCard(
                            height: height * 1.1,
                            width: width,
                            onTap: () {
                              setState(() {
                                favorites.removeAt(index);
                              });
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            size.height(height * .02),
                        itemCount: favorites.length))
              ],
            ),
            landscape: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02, vertical: height * .02),
              child: GridView.builder(
                itemCount: favorites.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: height * 0.02,
                  crossAxisSpacing: width * 0.02,
                  childAspectRatio: (width / height) * 1,
                ),
                itemBuilder: (context, index) {
                  return FavoriteCard(
                    onTap: () {
                      setState(() {
                        favorites.removeAt(index);
                      });
                    },
                    height: height * 1.8,
                    width: width * .34,
                  );
                },
              ),
            ),
          ));
    });
  }
}
