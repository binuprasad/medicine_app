import 'package:flutter/material.dart';
import 'package:medicineapp/view/basic_details.dart';

final _formKey = GlobalKey<FormState>();

class MainDetails extends StatefulWidget {
  const MainDetails({Key? key}) : super(key: key);

  @override
  State<MainDetails> createState() => _MainDetailsState();
}

class _MainDetailsState extends State<MainDetails> {
  final registerController = TextEditingController();
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final dateController = TextEditingController();
  final locationController = TextEditingController();

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      final formattedDate =
          '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      setState(() {
        selectedDate = picked;
        dateController.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/BASIC DETAILS.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.04,
                    ),
                    const Text.rich(
                      TextSpan(
                          text: 'Your Pharmacy,',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                          children: [
                            TextSpan(
                              text: 'Your Details',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ]),
                    ),
                     SizedBox(
                      height: height * 0.06,
                    ),
                    const Text(
                      'Main Details',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                     SizedBox(
                      height: height * 0.015,
                    ),
                    CustomTextField(
                      controller: registerController,
                      hintText: 'Shop RegisterNumber',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Shop RegisterNumber cannot be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: fromController,
                            hintText: 'Operating Hour From',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Field cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                         SizedBox(
                         height: height * 0.015,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: toController,
                            hintText: 'Operating Hour To',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Field cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    CustomTextField(
                      readOnly: true,
                      controller: dateController,
                      hintText: 'Lisence Expiry Date',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field cannot be empty';
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        onPressed: () => _selectDate(context),
                        icon: const Icon(Icons.calendar_today),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    CustomTextField(
                      controller: locationController,
                      hintText: 'Location',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Address cannot be empty';
                        }
                        return null;
                      },
                      suffixIcon: TextButton.icon(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                insetPadding: EdgeInsets.zero,
                                content: SizedBox(
                                  width:
                                    width * 0.8,
                                  height:
                                   height * 0.5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            width: width *
                                                0.4,
                                            height: height *
                                                0.2,
                                            child: Image.asset(
                                                'assets/location_img.png')),
                                        const Text(
                                          "Location",
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          "Your location services are switched off.Please enable location,to help us serve better.",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(),
                                        ),
                                        const Spacer(),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  BasicDetails(),
                                            ));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            minimumSize:
                                                Size(width, height * 0.07),
                                            backgroundColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          child: const Text(
                                            'Enable Location',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.location_on,
                          color: Colors.black,
                        ),
                        label: const Text(
                          'Select On Map',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    const Text(
                      'Lisence Photo',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    Row(
                      children: [
                        FloatingActionButton(
                          elevation: 0,
                          onPressed: () {},
                          backgroundColor: Colors.grey.withOpacity(0.4),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        FloatingActionButton(
                          elevation: 0,
                          onPressed: () {},
                          backgroundColor: Colors.grey.withOpacity(0.4),
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    const Text(
                      'Additional Images',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          size: 18,
                        ),
                        Text(
                          ' Insurance proof,health certificate,drug board',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                     SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        FloatingActionButton(
                          elevation: 0,
                          onPressed: () {},
                          backgroundColor: Colors.grey.withOpacity(0.4),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        FloatingActionButton(
                          elevation: 0,
                          onPressed: () {},
                          backgroundColor: Colors.grey.withOpacity(0.4),
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        FloatingActionButton(
                          elevation: 0,
                          onPressed: () {},
                          backgroundColor: Colors.grey.withOpacity(0.4),
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    ),
                     SizedBox(
                      height: height*0.02,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Form is valid!')),
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  contentPadding: EdgeInsets.zero,
                                  insetPadding: EdgeInsets.zero,
                                  content: SizedBox(
                                    width:
                                        width * 0.8,
                                    height: height *
                                        0.5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: 
                                                      width *
                                                  0.4,
                                              height: height *
                                                  0.2,
                                              child:
                                                  Image.asset('assets/ok.png')),
                                          const Text(
                                            "Congrats",
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Text(
                                            "Your have successfully completed",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          const Spacer(),
                                          const Text(
                                            "NB:After verification you can able to add product",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 11),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    BasicDetails(),
                                              ));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: Size(
                                                  width *
                                                      0.8,
                                                  height * 0.06,),
                                              backgroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                            child: const Text(
                                              'Done',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please fill the fields!')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: Size(width, height * 0.07),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
