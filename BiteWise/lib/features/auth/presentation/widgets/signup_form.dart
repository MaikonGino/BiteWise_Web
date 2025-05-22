import 'package:bitewise/core/theme/app_theme.dart';
import 'package:bitewise/shared/widgets/custom_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 600;
        // Adicionando isVerySmallScreen para consistência, embora possa não ser usado da mesma forma que no login para empilhar botões de ação primários
        // bool isVerySmallScreen = constraints.maxWidth < 400;
        return _buildSignupContainer(context, isSmallScreen);
      },
    );
  }

  Widget _buildSignupContainer(BuildContext context, bool isSmallScreen) {
    final loginUrl = '/login';
    double containerWidth = isSmallScreen ? double.infinity : 1000;
    double formHorizontalPadding = isSmallScreen ? 16.0 : 40.0;
    double internalFormHorizontalPadding = isSmallScreen ? 24.0 : 170.0;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: formHorizontalPadding,
      ),
      width: double.infinity,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/shared/BACKGROUND-TOPO.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        width: containerWidth,
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        decoration: BoxDecoration(
          boxShadow: const [BoxShadow(blurRadius: 3, color: Colors.black26)],
          borderRadius: BorderRadius.circular(10),
          color: AppTheme.branco,
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: internalFormHorizontalPadding,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: isSmallScreen ? 10 : 20),
                Center(
                  child: Image(
                    image: const AssetImage('images/shared/LOGO.png'),
                    height: isSmallScreen ? 100 : 150,
                    width: isSmallScreen ? 100 : 150,
                    gaplessPlayback: true,
                  ),
                ),
                SizedBox(height: isSmallScreen ? 20 : 30),
                Align(
                  alignment:
                      isSmallScreen ? Alignment.center : Alignment.centerLeft,
                  child: Text(
                    'Cadastro',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 28 : 35,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.preto,
                    ),
                  ),
                ),
                SizedBox(height: isSmallScreen ? 20 : 25),
                _SignupField(
                  label: 'Nome',
                  hint: 'Insira o seu nome completo',
                  obscure: false,
                  isSmallScreen: isSmallScreen,
                ),
                _SignupField(
                  label: 'E-mail',
                  hint: 'Insira seu e-mail - ele será seu usuário para o login',
                  obscure: false,
                  isSmallScreen: isSmallScreen,
                ),
                _SignupField(
                  label: 'Senha',
                  hint: 'Insira sua senha - ela será usada para o login',
                  obscure: true,
                  isSmallScreen: isSmallScreen,
                ),
                _SignupField(
                  label: 'Repita sua Senha',
                  hint: 'Insira sua a senha que você acabou de criar',
                  obscure: true,
                  isSmallScreen: isSmallScreen,
                ),
                SizedBox(height: isSmallScreen ? 25 : 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Já tem uma conta?',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.preto,
                      ),
                    ),
                    const SizedBox(width: 5),
                    CustomLink(
                      text: 'Clique aqui',
                      url: loginUrl,
                      onTap: () => Navigator.pushNamed(context, loginUrl),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color:
                            AppTheme
                                .verdeMarProfundo, // Mantendo a cor específica do link
                      ),
                      hasUnderline: false,
                    ),
                  ],
                ),
                SizedBox(height: isSmallScreen ? 20 : 30),
                _buildCreateAccountButton(
                  context,
                  isSmallScreen,
                ), // Botão CRIAR CONTA atualizado

                SizedBox(height: isSmallScreen ? 30 : 40),
                Divider(color: AppTheme.preto.withAlpha(64), thickness: 1),
                SizedBox(height: isSmallScreen ? 30 : 40),
                _buildGoogleLoginButton(
                  context,
                  isSmallScreen,
                ), // Botão Google atualizado
                SizedBox(height: isSmallScreen ? 20 : 0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Botão "CRIAR CONTA" com o novo estilo
  Widget _buildCreateAccountButton(BuildContext context, bool isSmallScreen) {
    return _buildActionButton(
      context: context,
      text: 'CRIAR CONTA',
      onPressed: () {
        // TODO: Implementar lógica de cadastro
        // Navigator.pushNamed(context, '/home_cadastrado');
      },
      isPrimary: true, // Botão primário
      isSmallScreen: isSmallScreen,
    );
  }

  // Widget genérico para os botões de ação (reutilizado/adaptado do login_form.dart)
  Widget _buildActionButton({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
    required bool isPrimary,
    required bool isSmallScreen,
    // bool isRowLayout = false, // Não é estritamente necessário aqui como no login para diferenciar padding
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? AppTheme.laranjaPaprika : AppTheme.branco,
        foregroundColor: isPrimary ? AppTheme.branco : AppTheme.preto,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side:
            isPrimary
                ? null
                : const BorderSide(
                  color: AppTheme.cinzaNuvem,
                ), // Borda para botões secundários
        padding: EdgeInsets.symmetric(
          // Ocupa a largura total devido ao CrossAxisAlignment.stretch na Column pai
          // Então o padding horizontal é menos crítico para definir a largura.
          // Ajustamos o padding vertical para a altura do botão.
          vertical: isSmallScreen ? 14 : 16,
        ),
        textStyle: TextStyle(
          fontSize: isSmallScreen ? 16 : 18,
          fontWeight: isPrimary ? FontWeight.w800 : FontWeight.w600,
        ),
        minimumSize: const Size(
          double.infinity,
          0,
        ), // Garante que o botão ocupe a largura disponível
      ),
      child: Text(text),
    );
  }

  // Botão de login com Google, estilizado como no login_form.dart
  Widget _buildGoogleLoginButton(BuildContext context, bool isSmallScreen) {
    return ElevatedButton(
      onPressed: () {
        // TODO: Implementar lógica de login com Google
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.branco,
        foregroundColor: AppTheme.preto,
        minimumSize: Size(double.infinity, isSmallScreen ? 55 : 70),
        padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 10 : 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: BorderSide(
          color: AppTheme.preto.withAlpha(128), // alpha de 0.50
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: isSmallScreen ? 55 : 70,
            padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 12 : 20),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: AppTheme.preto.withAlpha(128),
                  width: 1.0,
                ),
              ),
            ),
            child: SvgPicture.asset(
              'images/auth/LOGO-GOOGLE.svg',
              height: isSmallScreen ? 24 : 30,
              width: isSmallScreen ? 24 : 30,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 8 : 16),
              child: Text(
                'Ou cadastre-se com o Google', // Texto ajustado para o contexto de cadastro
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isSmallScreen ? 15 : 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SignupField extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscure;
  final bool isSmallScreen;

  const _SignupField({
    required this.label,
    required this.hint,
    this.obscure = false,
    required this.isSmallScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: AppTheme.preto,
              fontSize: isSmallScreen ? 14 : 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            // Removido o Container extra que envolvia o TextField
            obscureText: obscure,
            cursorColor: AppTheme.vermelhoTomate,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppTheme.cinzaNuvem),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppTheme.cinzaNuvem),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppTheme.vermelhoTomate),
              ),
              filled: true,
              fillColor: AppTheme.branco, // Fill color deve estar aqui
              labelText: hint,
              labelStyle: const TextStyle(
                color: AppTheme.cinzaNuvem,
                fontWeight: FontWeight.w300,
                fontSize: 15, // Consistente com o login
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              isDense: true, // Consistente com o login
              // A sombra agora seria aplicada diretamente ao TextField se desejado,
              // mas o estilo do login_form não tinha sombra no TextField em si,
              // apenas no container do formulário.
              // Se precisar de sombra no campo, pode envolver com um Material ou Container customizado.
            ),
            style: const TextStyle(fontSize: 16), // Consistente com o login
          ),
        ],
      ),
    );
  }
}
