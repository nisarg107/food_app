import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mvapp/auth/authgate.dart';
import 'package:mvapp/auth/authservice.dart';
import 'package:mvapp/firebase_options.dart';
import 'package:mvapp/models/foodprovider.dart';
import 'package:mvapp/models/imagestate.dart';
import 'package:mvapp/models/mealnotifier.dart';
import 'package:mvapp/services/pagenotifier.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env");
  Stripe.publishableKey = dotenv.env["STRIPE_PUBLISH_KEY"]!;
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();
   runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context) => PageNotifier())),
      ChangeNotifierProvider(create: (context)=>AuthService()),
      ChangeNotifierProvider(create: (context)=>MealNotifier()),
      ChangeNotifierProvider(create: (context) => ImageProviders()),
      ChangeNotifierProvider(create: (context)=> CartProvider()),
    ],  
    child: MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375,825),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AuthGate(),
        );
      },
    );
  }
}