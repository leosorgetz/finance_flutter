import 'package:finance_app/src/shared/state/state.dart';
import 'package:mobx/mobx.dart';

import 'models/month_value.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final Observable<StateType> state = Observable<StateType>(InitialState());
  final _list = <MonthValue>[
    MonthValue(
      month: 'DEZ',
      period: DateTime(2024, 12),
      availableValue: 2100.0,
      usedValue: 1600.0,
      limitValue: 2700.0,
      releases: ['Salário', 'Aluguel', 'Supermercado'],
    ),
    MonthValue(
      month: 'JAN',
      period: DateTime(2025, 1),
      availableValue: 1000.0,
      usedValue: 500.0,
      limitValue: 1500.0,
      releases: ['Salário', 'Aluguel', 'Supermercado'],
    ),
    MonthValue(
      month: 'FEV',
      period: DateTime(2025, 2),
      availableValue: 1200.0,
      usedValue: 600.0,
      limitValue: 1800.0,
      releases: ['Salário', 'Aluguel', 'Supermercado'],
    ),
    MonthValue(
      month: 'MAR',
      period: DateTime(2025, 3),
      availableValue: 1100.0,
      usedValue: 700.0,
      limitValue: 1600.0,
      releases: ['Salário', 'Aluguel', 'Supermercado'],
    ),
    MonthValue(
      month: 'ABR',
      period: DateTime(2025, 4),
      availableValue: 1300.0,
      usedValue: 800.0,
      limitValue: 1900.0,
      releases: ['Salário', 'Aluguel', 'Supermercado'],
    ),
    MonthValue(
      month: 'MAI',
      period: DateTime(2025, 5),
      availableValue: 1400.0,
      usedValue: 900.0,
      limitValue: 2000.0,
      releases: ['Salário', 'Aluguel', 'Supermercado'],
    ),
    MonthValue(
      month: 'JUN',
      period: DateTime(2025, 6),
      availableValue: 1500.0,
      usedValue: 1000.0,
      limitValue: 2100.0,
      releases: ['Salário', 'Aluguel', 'Supermercado'],
    ),
    MonthValue(
      month: 'JUL',
      period: DateTime(2025, 7),
      availableValue: 1600.0,
      usedValue: 1100.0,
      limitValue: 2200.0,
      releases: ['Salário', 'Aluguel', 'Supermercado'],
    ),
    MonthValue(
      month: 'AGO',
      period: DateTime(2025, 8),
      availableValue: 1700.0,
      usedValue: 1200.0,
      limitValue: 2300.0,
      releases: ['Salário', 'Aluguel', 'Supermercado'],
    ),
    MonthValue(
      month: 'SET',
      period: DateTime(2025, 9),
      availableValue: 1800.0,
      usedValue: 1300.0,
      limitValue: 2400.0,
      releases: ['Salário', 'Aluguel', 'Supermercado'],
    ),
    MonthValue(
      month: 'OUT',
      period: DateTime(2025, 10),
      availableValue: 1900.0,
      usedValue: 1400.0,
      limitValue: 2500.0,
      releases: ['Salário', 'Aluguel', 'Supermercado'],
    ),
    MonthValue(
      month: 'NOV',
      period: DateTime(2025, 11),
      availableValue: 2000.0,
      usedValue: 1500.0,
      limitValue: 2600.0,
      releases: ['Salário', 'Aluguel', 'Supermercado'],
    ),
    MonthValue(
      month: 'DEZ',
      period: DateTime(2025, 12),
      availableValue: 2100.0,
      usedValue: 1600.0,
      limitValue: 2700.0,
      releases: ['Salário', 'Aluguel', 'Supermercado'],
    ),
    MonthValue(
      month: 'JAN',
      period: DateTime(2025, 1),
      availableValue: 1000.0,
      usedValue: 500.0,
      limitValue: 1500.0,
      releases: ['Salário', 'Aluguel', 'Supermercado'],
    ),
  ];

  @action
  Future<void> getMonthValues() async {
    state.value = LoadingState();
    await Future.delayed(const Duration(seconds: 1));
    final result = _list.map((MonthValue monthValue) {
      if (monthValue.period.year != DateTime.now().year) {
        monthValue.month = '${monthValue.month}/${monthValue.period.year.toString().substring(2, 4)}';
      }
      return monthValue;
    }).toList();
    state.value = SuccessState<List<MonthValue>>(result);
  }
}
