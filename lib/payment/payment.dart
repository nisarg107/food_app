import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mvapp/constants/formwidget.dart';
import 'package:mvapp/payment/paymodel.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}
class _PaymentPageState extends State<PaymentPage> {
  TextEditingController amountController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  final formkey1 = GlobalKey<FormState>();
  final formkey2 = GlobalKey<FormState>();
  final formkey3 = GlobalKey<FormState>();
  final formkey4 = GlobalKey<FormState>();
  final formkey5 = GlobalKey<FormState>();
  final formkey6 = GlobalKey<FormState>();

  List<String> currencyList = <String>[
    'USD',
    'INR',
    'EUR',
    'JPY',
    'GBP',
    'AED'
  ];

  String selectedCurrency = 'USD';

  bool hasDonated = false;

  Future<void> initPaymentSheet() async {
    try {
      // 1. create payment intent on the client side by calling stripe api
      final data = await createPaymentIntent(
          // convert string to double
          amount: (int.parse(amountController.text) * 100).toString(),
          currency: selectedCurrency,
          name: nameController.text,
          address: addressController.text,
          pin: pincodeController.text,
          city: cityController.text,
          state: stateController.text,
          country: countryController.text);

      // 2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Set to true for custom flow
          customFlow: false,
          // Main params
          merchantDisplayName: 'Test Merchant',
          paymentIntentClientSecret: data['client_secret'],
          // Customer keys
          customerEphemeralKeySecret: data['ephemeralKey'],
          customerId: data['id'],

          style: ThemeMode.dark,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjHzYUqhkmidrXAPILvg2QYzARDoCKToR7gA&s"),
              height: 300,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableTextField(
                        title: "Amount",
                        hint: "Any amount",
                        controller: amountController,
                        formkey: formkey,
                        isNumber: true,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      DropdownMenu<String>(
                        inputDecorationTheme: InputDecorationTheme(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                        initialSelection: currencyList.first,
                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            selectedCurrency = value!;
                          });
                        },
                        dropdownMenuEntries: currencyList
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  ReusableTextField(
                      title: "Name",
                      hint: "Ex: Roy",
                      controller: nameController,
                      formkey: formkey1),
                  SizedBox(
                    height: 10,
                  ),
                  ReusableTextField(
                    formkey: formkey2,
                    title: "Address Line",
                    hint: "Ex. 123 Main St",
                    controller: addressController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableTextField(
                        formkey: formkey3,
                        title: "City",
                        hint: "Ex. New Delhi",
                        controller: cityController,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ReusableTextField(
                        formkey: formkey4,
                        title: "State (Short code)",
                        hint: "Ex. DL for Delhi",
                        controller: stateController,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableTextField(
                        formkey: formkey5,
                        title: "Country (Short Code)",
                        hint: "Ex. IN for India",
                        controller: countryController,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ReusableTextField(
                        formkey: formkey6,
                        title: "Pincode",
                        hint: "Ex. 123456",
                        controller: pincodeController,
                        isNumber: true,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent.shade400),
                        onPressed: () async {
                          if (formkey.currentState!.validate() &&
                              formkey1.currentState!.validate() &&
                              formkey2.currentState!.validate() &&
                              formkey3.currentState!.validate() &&
                              formkey4.currentState!.validate() &&
                              formkey5.currentState!.validate() &&
                              formkey6.currentState!.validate()) {
                            await initPaymentSheet();

                            try {
                              await Stripe.instance.presentPaymentSheet();

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  "Payment Done",
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.green,
                              ));

                              setState(() {
                                hasDonated = true;
                              });
                              nameController.clear();
                              addressController.clear();
                              cityController.clear();
                              stateController.clear();
                              countryController.clear();
                              pincodeController.clear();
                            } catch (e) {
                              print("payment sheet failed");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                  "Payment Failed",
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.redAccent,
                              ));
                            }
                          }
                        },
                        child: Text(
                          "Proceed to Pay",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}