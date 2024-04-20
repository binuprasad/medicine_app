import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class BasicDetails extends StatelessWidget {
  BasicDetails({Key? key}) : super(key: key);
  final shopnameController = TextEditingController();
  final ownernamController = TextEditingController();
  final contactController = TextEditingController();
  final addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.06,
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
                  const Center(
                    child: Text(
                      "Unlock potential with your pharmacy details.\nLet's taller success for your business",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  const Text(
                    'Basic Details',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CustomTextField(
                    hintText: 'Shop Name',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Shop name cannot be empty';
                      }
                      return null;
                    },
                    controller: shopnameController,
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  CustomTextField(
                    hintText: 'Owner Name',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Owner cannot be empty';
                      }
                      return null;
                    },
                    controller: ownernamController,
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  CustomTextField(
                    hintText: 'Contact Number',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'contact number cannot be empty';
                      } else if (value.length != 10) {
                        return 'Invalid contact number';
                      }
                      return null;
                    },
                    controller: contactController,
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  CustomTextField(
                    hintText: 'Shop Address',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Address cannot be empty';
                      }
                      return '';
                    },
                    controller: addressController,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Text(
                    'Owner Id-Proof',
                    style: TextStyle(fontWeight: FontWeight.w500),
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
                        width: width*0.03,
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
                    'Shop Images',
                    style: TextStyle(fontWeight: FontWeight.w500),
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
                        width: width*0.03,
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
                     height: height * 0.05,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Form is valid!')),
                          );
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BasicDetails()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please fix the errors!')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize:
                            Size(width , height*0.07),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        'Next',
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
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String hintText;
  final Color borderColor;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool? readOnly;
  final double? contentPadding;
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.borderColor = Colors.grey,
    required this.validator,
    this.suffixIcon,
    required this.controller,
    this.readOnly,
    this.contentPadding,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: ' ${widget.hintText}',
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.black),
            ),
             focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey), 
            ),
            errorStyle: const TextStyle(color: Colors.red),
            suffixIcon: widget.suffixIcon,
            contentPadding: EdgeInsets.symmetric(
                vertical: widget.contentPadding ??
                    MediaQuery.of(context).size.height * 0.02),
          ),
          validator: widget.validator != null
              ? (value) => widget.validator!(value)
              : null,
          readOnly: widget.readOnly ?? false,
        ));
  }
}
