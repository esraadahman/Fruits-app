import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/Core/utils/widgets/ResponsiveLayout.dart';
import 'package:fruits_app/views/More/UI/widgets/Profile/AddImageWidget.dart';
import 'package:fruits_app/views/More/UI/widgets/TextLineWidget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String image = "";
    return Infowidget(builder: (context, deviceInfo) {
      double width = deviceInfo.localWidth;
      double height = deviceInfo.localHeight;
      return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBarWidget(
          width: width,
          centerTitle: true,
          title: "",
          leading: IconButton(
              onPressed: () {
                context.goBack();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: ResponsiveLayout(
          portrait: PortraitProfile(width: width, image: image, height: height),
          landscape: Column(
            children: [
              size.height(height * .02),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AddImageWidget(
                            width: width * .5,
                            image: image,
                            onTap: () {},
                          ),
                          TextLineWidget(
                            width: width * .5,
                            text: "Welcome, Esraa",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.02),
                          child: Column(
                            children: [
                              Customtextfiled(
                                hintText: "FullName",
                                orientation: deviceInfo.orientation,
                                labelText: "First and Last Name",
                                prefixIcon: null,
                                keyboardType: TextInputType.name,
                                labelText_top: "Full Name",
                                width: width,
                                onChanged: (value) {},
                                validator: (value) {
                                  return value!.isEmpty
                                      ? "Please enter your name"
                                      : value.trim().length < 5
                                          ? "Name must be at least 5 characters"
                                          : !RegExp(r"^[a-zA-Z\s]+$")
                                                  .hasMatch(value.trim())
                                              ? "Name can only contain letters and spaces"
                                              : null;
                                },
                              ),
                              size.height(height * 0.02),
                              Phonewidget(
                                labelText_top: "Phone Number",
                                width: width,
                                orientation: deviceInfo.orientation,
                                onChanged: (value) {},
                              ),
                              Customtextfiled(
                                hintText: "Password",
                                orientation: deviceInfo.orientation,
                                labelText: "Password",
                                prefixIcon: null,
                                obscureText: true,
                                labelText_top: "Password",
                                width: width,
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter your password";
                                  } else if (value.length < 6) {
                                    return "Password must be at least 6 characters";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              size.height(height * 0.07),
                              Customauthbutton(
                                textColor: AppColors.whiteColor,
                                buttonText: "Update",
                                buttonColor: AppColors.button_Color,
                                height: height,
                                width: width * .6,
                                onTap: () {},
                              ),
                              size.height(height * 0.05),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class PortraitProfile extends StatelessWidget {
  const PortraitProfile({
    super.key,
    required this.width,
    required this.image,
    required this.height,
    this.orientation = Orientation.portrait,
  });

  final double width;
  final String image;
  final double height;
  final Orientation orientation;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          children: [
            Column(
              children: [
                AddImageWidget(
                  width: width,
                  image: image,
                  onTap: () {},
                ),
                TextLineWidget(
                  width: width,
                  text: "Welcome, Esraa",
                ),
              ],
            ),
            size.height(height * 0.03),
            Customtextfiled(
              hintText: "FullName",
              orientation: orientation,
              labelText: "First and Last Name",
              prefixIcon: null,
              keyboardType: TextInputType.name,
              labelText_top: "Full Name",
              width: width,
              onChanged: (value) {},
              validator: (value) {
                return value!.isEmpty
                    ? "Please enter your name"
                    : value.trim().length < 5
                        ? "Name must be at least 5 characters"
                        : !RegExp(r"^[a-zA-Z\s]+$").hasMatch(value.trim())
                            ? "Name can only contain letters and spaces"
                            : null;
              },
            ),
            size.height(height * 0.02),
            Phonewidget(
              labelText_top: "Phone Number",
              width: width,
              orientation: orientation,
              onChanged: (value) {},
            ),
            Customtextfiled(
              hintText: "Password",
              orientation: orientation,
              labelText: "Password",
              prefixIcon: null,
              obscureText: true,
              labelText_top: "Password",
              width: width,
              onChanged: (value) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your password";
                } else if (value.length < 6) {
                  return "Password must be at least 6 characters";
                } else {
                  return null;
                }
              },
            ),
            size.height(height * 0.07),
            Customauthbutton(
              textColor: AppColors.whiteColor,
              buttonText: "Update",
              buttonColor: AppColors.button_Color,
              height: height,
              width: width,
              onTap: () {},
            ),
            size.height(height * 0.05),
          ],
        ),
      ),
    );
  }
}
