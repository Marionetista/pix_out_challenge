import 'package:flutter/material.dart';
import '../../shared/colors/app_colors.dart';
import '../../widgets/home/balance_widget.dart';
import '../../widgets/home/appbar_widget.dart';
import '../../widgets/home/main_card_widget.dart';
import '../../widgets/home/options_card_widget.dart';
import '../../widgets/home/sub_card_widget.dart';
import '../limits/pix_limits_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: SafeArea(
                top: false,
                bottom: false,
                child: CustomScrollView(
                  shrinkWrap: true,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        color: Colors.white,
                        child: Stack(
                          children: [
                            const AppBarWidget(),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                appBarTitle(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 23.0,
                                    left: 16.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      BalanceWidget(title: 'Saldo na conta'),
                                      BalanceWidget(
                                        title: 'Saldo nas caixinhas',
                                      ),
                                      SizedBox(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sessionTitle(title: 'Pagar'),
                            const MainCardWidget(
                              title: 'USAR CHAVE PIX',
                              subTitle:
                                  'CPF/CNPJ, e-mail, telefone e outra chave',
                              titleColor: AppColors.darkPinky,
                              iconColor: AppColors.darkPinky,
                              icon: Icons.key,
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              children: const [
                                Expanded(
                                  child: SubCardWidget(
                                    title: 'Ler\nQR CODE',
                                    icon: Icons.qr_code,
                                    iconColor: AppColors.darkPinky,
                                  ),
                                ),
                                Expanded(
                                  child: SubCardWidget(
                                    title: 'Pix Copia\ne Cola',
                                    icon: Icons.copy,
                                    iconColor: AppColors.darkPinky,
                                  ),
                                ),
                                Expanded(
                                  child: SubCardWidget(
                                    title: 'Pagar\nBoleto',
                                    icon: Icons.attach_money,
                                    iconColor: AppColors.darkPinky,
                                  ),
                                ),
                              ],
                            ),
                            sessionTitle(title: 'Receber'),
                            const MainCardWidget(
                              title: 'Gerar QR Code Permanente',
                              subTitle: 'QR Code que sempre está disponível',
                              titleColor: AppColors.bluey,
                              iconColor: AppColors.bluey,
                              icon: Icons.qr_code,
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Expanded(
                                  child: SubCardWidget(
                                    title: 'Gerar QR CODE de\n uso único',
                                    icon: Icons.qr_code,
                                    iconColor: AppColors.bluey,
                                  ),
                                ),
                                Expanded(
                                  child: SubCardWidget(
                                    title: 'Receber com\nChave Pix',
                                    icon: Icons.key,
                                    iconColor: AppColors.bluey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15.0),
                            OptionsCardWidget(
                              title: 'Transferências Agendadas',
                              onTap: () {},
                            ),
                            OptionsCardWidget(
                              title: 'Registrar ou trazer chaves',
                              onTap: () {},
                            ),
                            OptionsCardWidget(
                              title: 'Configurar Limites Pix',
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const PixLimitsPage(),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 15.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget appBarTitle() => Row(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: 31.3,
                bottom: 15.0,
                left: 16.0,
              ),
              child: Text(
                'Saldo Disponível',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 23.0,
                ),
              ),
            ),
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(
                  top: 31.3,
                  bottom: 15.0,
                  right: 24.3,
                ),
                child: Icon(
                  color: Colors.white,
                  Icons.remove_red_eye_outlined,
                ),
              ),
            ],
          ),
        ],
      );

  Widget sessionTitle({required String title}) => Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          bottom: 8.0,
        ),
        child: Text(
          title,
          textAlign: TextAlign.end,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: AppColors.blacky,
          ),
        ),
      );
}
