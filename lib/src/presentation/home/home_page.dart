import 'dart:developer';

import 'package:core/core.dart';
import 'package:ds/ds.dart';
import 'package:finance_app/src/presentation/home/widgets/card_value_widget.dart';
import 'package:finance_app/src/presentation/home/widgets/transactions_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../models/month_value.dart';
import '../../shared/state/state.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final homeController = sl<HomeController>();
  final double pageDefaultPaddingSize = 16;

  @override
  void initState() {
    super.initState();
    homeController.getMonthValues();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(pageDefaultPaddingSize),
                child: Row(
                  spacing: 12,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: colors.black, borderRadius: BorderRadius.circular(40.0)),
                      padding: EdgeInsets.all(1.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://img.freepik.com/fotos-gratis/retrato-de-homem-branco-isolado_53876-40306.jpg?semt=ais_hybrid&w=740',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [AppText.titleSm('OLÁ, USUARIO!'), AppText.textSm('Vamos organizar suas finanças?')],
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        log('Sair..');
                      },
                      icon: Icon(Icons.logout_outlined),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Observer(
                  builder: (context) {
                    if (homeController.state.value is LoadingState || homeController.state.value is InitialState) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: colors.primary,
                        ),
                      );
                    }
                    final tabsState = homeController.state.value as SuccessState<List<MonthValue>>;
                    final tabs = tabsState.result;
                    return Container(
                      color: colors.background,
                      child: AppTabBar(
                        tabs: tabs.map((MonthValue monthValues) {
                          return AppTabData(
                            index: tabs.indexOf(monthValues),
                            title: monthValues.month,
                            content: Container(
                              padding: EdgeInsets.all(pageDefaultPaddingSize),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CardValueWidget(
                                      period: monthValues.period,
                                      availableValue: monthValues.availableValue,
                                      usedValue: monthValues.usedValue,
                                      limitValue: monthValues.limitValue,
                                      onPressedSettings: () {
                                        log('Settings pressed for ${monthValues.month}');
                                      },
                                    ),
                                    AppSpacer.medium(),
                                    TransactionsCardWidget(
                                      transactions: monthValues.transactions,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
