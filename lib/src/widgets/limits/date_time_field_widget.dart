import 'package:datetime_picker_formfield_new/datetime_picker_formfield_new.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/colors/app_colors.dart';

class DateTimeFieldsWidget extends StatefulWidget {
  const DateTimeFieldsWidget({super.key});

  @override
  State<DateTimeFieldsWidget> createState() => _DateTimeFieldsWidgetState();
}

late TextEditingController firstFieldController;
late TextEditingController secondFieldController;

class _DateTimeFieldsWidgetState extends State<DateTimeFieldsWidget> {
  @override
  void initState() {
    super.initState();

    firstFieldController = TextEditingController(text: '18:00');
    secondFieldController = TextEditingController(text: '06:00');
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Horário Noturno',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 3.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: DateTimeField(
                      resetIcon: null,
                      keyboardType: TextInputType.number,
                      cursorColor: AppColors.blacky,
                      format: DateFormat('HH:mm'),
                      controller: firstFieldController,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColors.blacky,
                        fontSize: 15.0,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'De',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.5,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                      onShowPicker: (context, currentValue) async {
                        final time = await showTimePicker(
                          context: context,
                          cancelText: 'CANCELAR',
                          initialTime: TimeOfDay.fromDateTime(
                            currentValue ??
                                DateTime.parse(firstFieldController.text),
                          ),
                        );

                        return DateTimeField.convert(time);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: DateTimeField(
                      resetIcon: null,
                      keyboardType: TextInputType.number,
                      cursorColor: AppColors.blacky,
                      format: DateFormat('HH:mm'),
                      controller: secondFieldController,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColors.blacky,
                        fontSize: 15.0,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Até',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.5,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                      onShowPicker: (context, currentValue) async {
                        final time = await showTimePicker(
                          context: context,
                          cancelText: 'CANCELAR',
                          initialTime: TimeOfDay.fromDateTime(
                            currentValue ??
                                DateTime.parse(firstFieldController.text),
                          ),
                        );

                        return DateTimeField.convert(time);
                      },
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
          ],
        ),
      );
}
