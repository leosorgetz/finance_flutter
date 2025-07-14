import 'package:ds/ds.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = AppColors.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  margin: EdgeInsets.only(bottom: 8 * 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(image: AssetImage('assets/login/box_bg.png'), fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.titleSm('Boas vindas!'.toUpperCase()),
                    AppText.textSm(
                      'Pronto para organizar suas finanças? Acesse agora',
                      customTextStyle: TextStyle(color: colors.neutral50),
                    ),
                    AppSpacer.def(),
                    Form(
                      child: Column(
                        children: <Widget>[
                          AppInput(
                            label: 'E-mail',
                            hintText: 'Digite seu e-mail',
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                          AppSpacer.medium(),
                          AppInput(
                            label: 'Senha',
                            hintText: 'Digite sua senha',
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                          ),
                          AppSpacer.small(),
                          Divider(color: AppColors.of(context).neutral30),
                          AppSpacer.small(),
                          AppButton.primary(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                            },
                            text: 'Entrar',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
