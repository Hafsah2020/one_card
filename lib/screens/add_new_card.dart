import 'package:flutter/material.dart';
import '../constants_and_components.dart';

class NewCard extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Padding fields(String title, String textFieldHint,
            TextEditingController controller,
            [bool? hideText]) =>
            // function to return fields textfields
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: size(context).height * 0.20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                SizedBox(height: (size(context).height * 0.20) / 5),
                TextField(
                  obscureText:
                      hideText ?? false, //is hiddenText null? then false
                  controller: controller,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: color)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: color_grey)),
                    hintText: textFieldHint,
                  ),
                )
              ],
            ),
          ),
        );
    return Scaffold(
      appBar: appBar(
        true,
        context,
        'Add new card',
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text('Save this card'), Toggle()]),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size(context).height * 0.05,
            horizontal: size(context).width * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              fields('Name', 'Alice Brown', nameController),
              fields(
                  'Card Number', '**** **** **** 1357', numberController, true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                      child: fields('Expiry Date', '09/21', dateController)),
                  Flexible(child: fields('CVV', '***', cvvController, true)),
                ],
              ),
              SizedBox(
                height: size(context).height * 0.01,
              ),
              button(context, 'Add Card'),
            ],
          ),
        ),
      ),
    );
  }
}
