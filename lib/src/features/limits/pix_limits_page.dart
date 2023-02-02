import 'package:flutter/material.dart';
import '../../shared/colors/app_colors.dart';
import '../../shared/tools/currency_input_formatter.dart';
import '../../widgets/limits/date_time_field_widget.dart';

class PixLimitsPage extends StatefulWidget {
  const PixLimitsPage({super.key});

  @override
  State<PixLimitsPage> createState() => _PixLimitsPageState();
}

class _PixLimitsPageState extends State<PixLimitsPage> {
  late TextEditingController diurnoController;
  late FocusNode diurnoFocus;

  late TextEditingController noturnoController;
  late FocusNode noturnoFocus;

  late TextEditingController firstTimeFieldController;
  late FocusNode firstTimeFieldFocus;

  late TextEditingController secondTimeFieldController;
  late FocusNode secondTimeFieldFocus;

  final loading = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    diurnoController = TextEditingController(text: '1,000.00');
    noturnoController = TextEditingController(text: '300.00');

    firstTimeFieldController = TextEditingController(text: '18:00');
    secondTimeFieldController = TextEditingController(text: '06:00');

    diurnoFocus = FocusNode();
    noturnoFocus = FocusNode();
    firstTimeFieldFocus = FocusNode();
    secondTimeFieldFocus = FocusNode();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: AppColors.blacky),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                child: SafeArea(
                  top: false,
                  bottom: false,
                  child: CustomScrollView(
                    shrinkWrap: true,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 24.0),
                              child: sessionTitle(
                                title: 'Limites das transações Pix',
                                titleSize: 27.0,
                              ),
                            ),
                            const Text(
                              'Vocês pode ajustar os limites de transação Pix\ndurante o dia e no período noturno.',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                                color: AppColors.grey,
                              ),
                            ),
                            textInput(
                              title: 'Limites do período diurno',
                              subtitle: 'Limite máximo de transação diurna',
                              controller: diurnoController,
                              focusNode: diurnoFocus,
                            ),
                            textInput(
                              title: 'Limites do período noturno',
                              subtitle: 'Limite máximo de transação noturna',
                              controller: noturnoController,
                              focusNode: noturnoFocus,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 16.0),
                              child: DateTimeFieldsWidget(),
                            ),
                          ],
                        ),
                      ),
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: button(),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );

  Widget sessionTitle({
    required String title,
    required double titleSize,
  }) =>
      Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          bottom: 8.0,
        ),
        child: Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: titleSize,
            fontWeight: FontWeight.bold,
            color: AppColors.blacky,
          ),
        ),
      );

  Widget textInput({
    required String title,
    required String subtitle,
    required FocusNode focusNode,
    required TextEditingController controller,
  }) =>
      Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sessionTitle(
              title: title,
              titleSize: 22.0,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 3.0),
            TextField(
              controller: controller,
              focusNode: focusNode,
              inputFormatters: [CurrencyInputFormatter(context: context)],
              cursorColor: AppColors.blacky,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                color: AppColors.blacky,
                fontSize: 15.0,
              ),
              decoration: InputDecoration(
                prefixText: 'R\$ ',
                prefixStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: AppColors.blacky,
                  fontSize: 15.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: AppColors.blacky,
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
      );

  Widget button() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 36.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  loading.value = !loading.value;
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pop(context);
                  });
                },
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all<Color>(
                    Colors.transparent,
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    AppColors.darkPinky,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(53),
                    ),
                  ),
                ),
                child: AnimatedBuilder(
                  animation: loading,
                  builder: (context, _) => loading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.whity,
                          ),
                        )
                      : const Text(
                          'SALVAR',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      );

  @override
  void dispose() {
    diurnoController.dispose();
    noturnoController.dispose();
    diurnoFocus.dispose();
    noturnoFocus.dispose();

    super.dispose();
  }
}
