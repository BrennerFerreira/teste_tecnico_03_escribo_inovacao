import 'package:flutter/material.dart';

/// [ErrorTextWidget] is used every time there is an error while fetching data
/// from the API.
class ErrorTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Erro ao recuperar os dados do servidor. "
        "Por favor, tente novamente.",
      ),
    );
  }
}
