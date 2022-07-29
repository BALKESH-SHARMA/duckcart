import 'package:currency_picker/currency_picker.dart';
import 'package:duckcart_app/model/celeb_model.dart';
import 'package:duckcart_app/providers/celebs_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonationScreen extends StatefulWidget {
  final String id;
  const DonationScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  final TextEditingController _amount = TextEditingController(text: '0');
  final TextEditingController _name = TextEditingController();
  final TextEditingController _message = TextEditingController();
  late Currency curr = Currency(
      code: 'USD',
      name: 'UnitedStateDollar',
      symbol: '\$',
      flag: 'flag',
      number: 1,
      decimalDigits: 0,
      namePlural: '',
      symbolOnLeft: false,
      decimalSeparator: '',
      thousandsSeparator: '',
      spaceBetweenAmountAndSymbol: false);

  @override
  void initState() {
    super.initState();
    _amount.text = '0';
  }

  @override
  void dispose() {
    super.dispose();
    _amount.dispose();
    _message.dispose();
    _name.dispose();
  }

  final style = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  currency() {
    showCurrencyPicker(
        context: context,
        onSelect: (currency) {
          curr = currency;
        });
  }

//textfield decoration
  InputDecoration textfield(String hint, bool isAmount) {
    return InputDecoration(
        contentPadding: isAmount ? const EdgeInsets.all(13) : null,
        prefix: isAmount
            ? SizedBox(
                width: 107,
                height: 34,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      curr.symbol.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: currency,
                      child: Column(
                        children: const [
                          SizedBox(
                              width: 12,
                              height: 9,
                              child: Icon(
                                Icons.arrow_drop_up,
                                size: 25,
                              )),
                          SizedBox(
                              width: 12,
                              height: 9,
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 25,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ))
            : null,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color.fromARGB(124, 158, 158, 158),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color.fromARGB(124, 158, 158, 158),
          ),
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Color.fromARGB(241, 158, 158, 158)));
  }

//build function
  @override
  Widget build(BuildContext context) {
    bool showFab = MediaQuery.of(context).viewInsets.bottom != 0;
    CelebProvider providerData = Provider.of<CelebProvider>(context);
    Celebs data = providerData.findByID(widget.id);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          // leading:
          automaticallyImplyLeading: false,

          leading: TextButton(
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          titleSpacing: 0,
          title: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 6, bottom: 6, left: 0, right: 6),
                child: CircleAvatar(
                    maxRadius: 20,
                    backgroundImage: NetworkImage(data.imageUrl)),
              ),
              Text(
                data.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.verified,
                color: Colors.blue,
                size: 15,
              )
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 1,
        ),

        body: Container(
          padding: const EdgeInsets.all(25),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  'Send your love to ${data.name} to',
                  style: style,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  ' Become a real Fan',
                  style: style,
                ),
              ),

              // text fields
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: _amount,
                  decoration: textfield('2000', true),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: _name,
                  decoration: textfield('Your name (optional)', false),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: _message,
                  decoration:
                      textfield('Say something nice. (optional)', false),
                  maxLines: 6,
                ),
              ),
            ],
          ),
        ),

        //button
        floatingActionButton: Visibility(
          visible: !showFab,
          child: FloatingActionButton.extended(
            extendedPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
            label: Text('Support ${curr.symbol}${_amount.text}'),
            onPressed: () {
              providerData.addLogs(
                  widget.id, _amount.text, _name.text, _message.text, curr);
              Navigator.of(context).pop();
            },
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
