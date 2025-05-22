import 'package:bitewise/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Define se a tela é considerada pequena (ex: mobile)
        bool isSmallScreen = constraints.maxWidth < 600;
        // Define se a tela é muito estreita, para empilhar os botões de ação
        bool isVerySmallScreen =
            constraints.maxWidth < 400; // Breakpoint para empilhar botões

        return _buildLoginContainer(context, isSmallScreen, isVerySmallScreen);
      },
    );
  }

  Widget _buildLoginContainer(
    BuildContext context,
    bool isSmallScreen,
    bool isVerySmallScreen,
  ) {
    double containerWidth = isSmallScreen ? double.infinity : 1000;
    // Adiciona um padding horizontal responsivo ao container principal do formulário
    double formHorizontalPadding =
        isSmallScreen ? 16.0 : 40.0; // Reduzido um pouco para telas pequenas
    // Padding interno do formulário
    double internalFormHorizontalPadding =
        isSmallScreen ? 24.0 : 170.0; // Ajustado

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
              children: [
                Image.asset(
                  'images/shared/LOGO.png',
                  height: isSmallScreen ? 100 : 150,
                  width: isSmallScreen ? 100 : 150,
                ),
                const SizedBox(height: 20),
                Align(
                  alignment:
                      isSmallScreen ? Alignment.center : Alignment.centerLeft,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 28 : 35,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.preto,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                _buildLoginField(
                  'E-mail',
                  false,
                  context,
                  'Insira seu e-mail cadastrado',
                  isSmallScreen,
                ),
                const SizedBox(height: 20),
                _buildLoginField(
                  'Senha',
                  true,
                  context,
                  'Insira sua senha cadastrada',
                  isSmallScreen,
                ),
                const SizedBox(height: 30),
                _buildActionButtons(context, isSmallScreen, isVerySmallScreen),
                const SizedBox(height: 40),
                Divider(
                  color: AppTheme.preto.withAlpha(64), // alpha de 0.25
                  thickness: 1,
                ),
                const SizedBox(height: 40),
                _buildGoogleLoginButton(context, isSmallScreen),
                SizedBox(
                  height: isSmallScreen ? 20 : 0,
                ), // Espaço extra no final
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    bool isSmallScreen,
    bool isVerySmallScreen,
  ) {
    if (isVerySmallScreen) {
      // Em telas muito pequenas, os botões ficam em coluna
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Faz os botões ocuparem a largura
        children: [
          _buildRegisterSectionColumn(context, isSmallScreen),
          const SizedBox(height: 20),
          _buildLoginActionColumn(context, isSmallScreen),
        ],
      );
    } else {
      // Em telas maiores, os botões ficam em linha
      return Row(
        crossAxisAlignment:
            CrossAxisAlignment.end, // Alinha pela base dos botões
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: _buildRegisterSectionRow(context, isSmallScreen)),
          const SizedBox(width: 20),
          Flexible(child: _buildLoginActionRow(context, isSmallScreen)),
        ],
      );
    }
  }

  // Seção de "Não possui cadastro?" e botão "CADASTRE-SE" para layout em COLUNA
  Widget _buildRegisterSectionColumn(BuildContext context, bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Não possui cadastro?',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4), // Pequeno espaço entre texto e botão
        _buildActionButton(
          context: context,
          text: 'CADASTRE-SE',
          onPressed: () => Navigator.pushNamed(context, '/register'),
          isPrimary: false,
          isSmallScreen: isSmallScreen,
        ),
      ],
    );
  }

  // Botão "ENTRAR" para layout em COLUNA
  Widget _buildLoginActionColumn(BuildContext context, bool isSmallScreen) {
    return _buildActionButton(
      context: context,
      text: 'ENTRAR',
      onPressed: () {
        // TODO: Implementar lógica de login
        // Navigator.pushNamed(context, '/home');
      },
      isPrimary: true,
      isSmallScreen: isSmallScreen,
    );
  }

  // Seção de "Não possui cadastro?" e botão "CADASTRE-SE" para layout em LINHA
  Widget _buildRegisterSectionRow(BuildContext context, bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Não possui cadastro?',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 2),
        _buildActionButton(
          context: context,
          text: 'CADASTRE-SE',
          onPressed: () => Navigator.pushNamed(context, '/register'),
          isPrimary: false,
          isSmallScreen: isSmallScreen,
          isRowLayout:
              true, // Indica que está em um layout de linha para possível ajuste de padding/tamanho
        ),
      ],
    );
  }

  // Botão "ENTRAR" para layout em LINHA
  Widget _buildLoginActionRow(BuildContext context, bool isSmallScreen) {
    return _buildActionButton(
      context: context,
      text: 'ENTRAR',
      onPressed: () {
        // TODO: Implementar lógica de login
        // Navigator.pushNamed(context, '/home');
      },
      isPrimary: true,
      isSmallScreen: isSmallScreen,
      isRowLayout: true, // Indica que está em um layout de linha
    );
  }

  // Widget genérico para os botões de ação (ENTRAR, CADASTRE-SE)
  Widget _buildActionButton({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
    required bool isPrimary,
    required bool isSmallScreen,
    bool isRowLayout =
        false, // Usado para ajustar padding se necessário em layout de linha
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? AppTheme.laranjaPaprika : AppTheme.branco,
        foregroundColor:
            isPrimary ? AppTheme.branco : AppTheme.preto, // Cor do texto
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: isPrimary ? null : const BorderSide(color: AppTheme.cinzaNuvem),
        padding: EdgeInsets.symmetric(
          horizontal:
              isSmallScreen && !isRowLayout
                  ? 15
                  : (isSmallScreen && isRowLayout ? 20 : 30),
          vertical: isSmallScreen ? 14 : 16,
        ),
        textStyle: TextStyle(
          fontSize: isSmallScreen ? 16 : 18, // Ajuste de fonte
          fontWeight: isPrimary ? FontWeight.w800 : FontWeight.w600,
        ),
      ),
      child: Text(text),
    );
  }

  Widget _buildGoogleLoginButton(BuildContext context, bool isSmallScreen) {
    return ElevatedButton(
      onPressed: () {
        // TODO: Implementar lógica de login com Google
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.branco,
        foregroundColor: AppTheme.preto,
        minimumSize: Size(
          double.infinity,
          isSmallScreen ? 55 : 70,
        ), // Ocupa toda a largura disponível
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 10 : 0,
        ), // Ajuste de padding horizontal
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: BorderSide(
          color: AppTheme.preto.withAlpha(128), // alpha de 0.50
        ),
        elevation: 0, // Para um visual mais flat, similar ao de cadastro
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: isSmallScreen ? 55 : 70, // Mesma altura do botão
            padding: EdgeInsets.symmetric(
              horizontal: isSmallScreen ? 12 : 20,
            ), // Padding para o logo
            // A borda lateral só faz sentido se o conteúdo não preencher o botão,
            // ou se quisermos um separador visual explícito.
            // Como o botão do Google geralmente tem o logo à esquerda e texto à direita,
            // podemos manter essa estrutura.
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: AppTheme.preto.withAlpha(128), // alpha de 0.50
                  width: 1.0,
                ),
              ),
            ),
            child: SvgPicture.asset(
              'images/auth/LOGO-GOOGLE.svg',
              height: isSmallScreen ? 24 : 30, // Tamanho do logo ajustado
              width: isSmallScreen ? 24 : 30,
            ),
          ),
          Expanded(
            // Faz o texto ocupar o espaço restante
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 8 : 16),
              child: Text(
                'Ou entre com o Google',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isSmallScreen ? 15 : 18, // Fonte ajustada
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginField(
    String fieldName,
    bool isHidden,
    BuildContext context,
    String labelText,
    bool isSmallScreen,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: TextStyle(
            color: AppTheme.preto,
            fontSize: isSmallScreen ? 14 : 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
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
              borderSide: const BorderSide(color: AppTheme.cinzaNuvem),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppTheme.vermelhoTomate),
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: AppTheme.branco,
            labelText: labelText,
            labelStyle: const TextStyle(
              color: AppTheme.cinzaNuvem,
              fontWeight: FontWeight.w300,
              fontSize: 15,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            isDense: true, // Reduz um pouco a altura padrão do campo
          ),
          obscureText: isHidden,
          cursorColor: AppTheme.vermelhoTomate,
          style: const TextStyle(
            fontSize: 16,
          ), // Tamanho da fonte do texto digitado
        ),
      ],
    );
  }
}
