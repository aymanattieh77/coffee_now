import 'package:coffee_now/core/components/widgets/custom_text_field.dart';
import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/resources/strings.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const CustomTextField(
                hint: "email@example.com",
                label: AppStrings.email,
                inputType: TextInputType.emailAddress,
              ),
              const CustomTextField(
                hint: "+620 656565",
                label: "Phone",
                inputType: TextInputType.phone,
              ),
              const CustomTextField(
                hint: "**********",
                label: "Password",
                inputType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 20),
              CustomElevatedButton(
                text: "Submit",
                onPressed: () {
                  _validate();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _validate() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("TRue Vaild");
    } else {
      print("False");
    }
  }
}
