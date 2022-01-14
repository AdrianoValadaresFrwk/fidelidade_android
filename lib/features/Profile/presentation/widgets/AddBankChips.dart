import 'package:fidelidade_android/features/Profile/presentation/widgets/BankAdd.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';

class AddBankChips extends StatefulWidget {
  const AddBankChips({Key? key}) : super(key: key);

  @override
  _AddBankChipsState createState() => _AddBankChipsState();
}

class _AddBankChipsState extends State<AddBankChips> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _submit() {}

  void _openBankAddModal(context) {
    final Size _size = MediaQuery.of(context).size;
    showModalBottomSheet(
        isScrollControlled: true,
        constraints: BoxConstraints(
            maxWidth: _size.width * 0.9, minHeight: _size.height * 0.95),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        context: context,
        builder: (BuildContext bc) {
          return BankAdd(formKey: _formKey, onSubmit: _submit);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(
          width: 142.0,
          height: 46.0,
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: kPrimaryColor,
              style: BorderStyle.solid,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Novo Banco',
                  style: TextStyle(fontSize: 12, color: kPrimaryColor),
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.add,
                    color: kPrimaryColor,
                  ),
                  onTap: () {
                    _openBankAddModal(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
    /* Chip(
      label: TextButton(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(color: kPrimaryColor)),
          padding:
              MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
        ),
        onPressed: () {
          _openBankAddModal(context);
        },
        child: const Text('Novo Banco'),
      ),
      deleteIcon: const Icon(Icons.add),
      deleteIconColor: kPrimaryColor,
      backgroundColor: kPrimaryLightColor,
      labelStyle: const TextStyle(color: kPrimaryLightColor),
      side: const BorderSide(width: 1.5, color: kPrimaryColor),
      onDeleted: () {},
    ); */
  }
}
