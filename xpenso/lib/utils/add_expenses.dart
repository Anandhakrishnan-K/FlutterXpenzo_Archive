import 'package:flutter/material.dart';
import 'package:xpenso/constans.dart';

TextEditingController amountController = TextEditingController();
TextEditingController notesController = TextEditingController();

class AddCredit extends StatefulWidget {
  final Function()? onPressed;
  final String submitButtonName;
  const AddCredit(
      {super.key, required this.onPressed, required this.submitButtonName});

  @override
  State<AddCredit> createState() => _AddCreditState();
}

class _AddCreditState extends State<AddCredit> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: listHeight * 1.075,
      child: Column(
        children: [
          SizedBox(
            height: h20 + h20,
          ),
          const MyText(content: 'Enter Amount *'),
          SizedBox(
            height: h20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: h05,
              ),
              SizedBox(
                width: h100,
                child: MyButton(
                  content: '- 100',
                  onPressed: () {
                    if (amountController.text.isNotEmpty) {
                      int tmp = int.parse(amountController.text);
                      if (tmp > 100) {
                        tmp -= 100;
                        setState(() {
                          amountController.text = tmp.toString();
                        });
                      } else {
                        setState(() {
                          amountController.clear();
                        });
                      }
                    }
                  },
                  rad: h50,
                  borderColor: transparent,
                  fillColor: transparent,
                ),
              ),
              SizedBox(
                height: h50 + h10,
                width: deviceWidth / 2.5,
                child: TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(h05),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(h10)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          amountController.clear();
                        },
                        icon: const Icon(Icons.clear_rounded)),
                  ),
                ),
              ),
              SizedBox(
                width: h100,
                child: MyButton(
                  content: '+ 100',
                  onPressed: () {
                    amountController.text.isEmpty
                        ? amountController.text = '0'
                        : amountController.text;
                    int tmp = int.parse(amountController.text);
                    tmp += 100;
                    setState(() {
                      amountController.text = tmp.toString();
                    });
                  },
                  rad: h50,
                  borderColor: transparent,
                  fillColor: transparent,
                ),
              ),
              SizedBox(
                width: h05,
              ),
            ],
          ),
          SizedBox(
            height: h50,
          ),
          const MyText(content: 'Choose Category *'),
          SizedBox(
            height: h20,
          ),
          SizedBox(
              height: h75,
              width: deviceWidth,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: h10),
                    child: MyButton(
                        width: h75,
                        content: (index + 1).toString(),
                        onPressed: () {
                          debugPrint('Chosed Categore  ${index + 1}');
                        }),
                  );
                },
              )),
          SizedBox(
            height: h50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: h10,
              ),
              SizedBox(
                width: deviceWidth * 0.65,
                child: TextFormField(
                  controller: notesController,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(h20),
                    hintText: 'Enter Notes (Optional)',
                    suffixIcon: IconButton(
                        onPressed: () {
                          notesController.clear();
                        },
                        icon: const Icon(Icons.clear_rounded)),
                  ),
                ),
              ),
              SizedBox(
                width: h10,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.attachment_outlined,
                    size: deviceWidth * 0.1,
                  )),
              SizedBox(
                width: h10,
              ),
            ],
          ),
          SizedBox(
            height: h50,
          ),
          MyButton(
              width: deviceWidth * 0.75,
              content: widget.submitButtonName,
              onPressed: widget.onPressed)
        ],
      ),
    );
  }
}
