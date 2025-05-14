import 'package:bitewise/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildLoginContainer(context);
  }

  Widget _buildLoginContainer(BuildContext context) {
    return Container(
      height: 900,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/shared/BACKGROUND-TOPO.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        width: 1000,
        height: 800,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 3)],
          borderRadius: BorderRadius.circular(10),
          color: AppTheme.branco,
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 170),
              child: Column(
                spacing: 10,
                children: [
                  Image.asset(
                    'images/shared/LOGO.png',
                    height: 150,
                    width: 150,
                  ),
                  Column(
                    spacing: 50,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.preto,
                        ),
                      ),
                      _buildLoginField(
                        'E-mail',
                        false,
                        context,
                        'Insira seu e-mail cadastrado',
                      ),
                      _buildLoginField(
                        'Senha',
                        true,
                        context,
                        'Insira sua senha cadastrada',
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 170,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Text(
                              'Não possui cadastro?',
                              style: TextStyle(
                                fontSize: 12,

                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: _buildLoginButton(
                              context,
                              '/register',
                              'CADASTRE-SE',
                              TextStyle(
                                color: AppTheme.preto,

                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                              ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.branco,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                side: BorderSide(color: AppTheme.cinzaNuvem),
                                fixedSize: Size(240, 50),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: _buildLoginButton(
                          context,
                          '/login',
                          'ENTRAR',
                          TextStyle(
                            color: AppTheme.branco,

                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                          ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.laranjaPaprika,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            fixedSize: Size(240, 50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                  BorderSide(
                    width: 1,
                    color: AppTheme.preto.withValues(alpha: 0.25),
                  ),
                ),
              ),
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.branco,
                  fixedSize: Size(700, 70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: BorderSide(
                    color: AppTheme.preto.withValues(alpha: 0.50),
                  ),
                ),
                child: Row(
                  spacing: 70,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 70,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: AppTheme.preto.withValues(alpha: 0.50),
                          ),
                        ),
                      ),
                      child: SvgPicture.asset(
                        'images/auth/LOGO-GOOGLE.svg',
                        height: 60,
                        width: 60,
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      child: Text(
                        'Ou entre com o Google',
                        style: TextStyle(
                          color: AppTheme.preto,

                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginField(
    String fieldName,
    bool isHidden,
    BuildContext context,
    String labelText,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: TextStyle(
            color: AppTheme.preto,

            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.3),
                blurRadius: 0,
                spreadRadius: 1,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppTheme.cinzaNuvem),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.cinzaNuvem),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.vermelhoTomate),
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: AppTheme.branco,
              labelText: labelText,
              labelStyle: TextStyle(
                color: AppTheme.cinzaNuvem,

                fontWeight: FontWeight.w300,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            obscureText: isHidden,
            cursorColor: AppTheme.vermelhoTomate,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton(
    BuildContext context,
    String url,
    String buttonText,
    TextStyle? textStyle,
    ButtonStyle? buttonStyle,
  ) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, url),
      style: buttonStyle,
      child: Text(buttonText, style: textStyle),
    );
  }
}
