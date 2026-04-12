import 'package:flutter/material.dart';
import 'package:pizzaria/providers/cardapio_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_app_bar.dart';

class NovoItemPage extends StatelessWidget {
  NovoItemPage({super.key});

  final nomeCtrl = TextEditingController();
  final precoCtrl = TextEditingController();
  final descCtrl = TextEditingController();

  InputDecoration campoDecoracao({
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: const TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.w500,
      ),
      floatingLabelStyle: const TextStyle(
        color: Colors.redAccent,
        fontWeight: FontWeight.w600,
      ),
      prefixIcon: Icon(icon, color: Colors.redAccent),
      filled: true,
      fillColor: Colors.grey.shade50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: 1.5,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 18,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: const CustomAppBar(titulo: "Novo Item"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.restaurant_menu,
                size: 60,
                color: Colors.redAccent,
              ),
              const SizedBox(height: 12),
              const Text(
                "Cadastrar novo item",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: nomeCtrl,
                decoration: campoDecoracao(
                  label: "Nome",
                  icon: Icons.local_pizza,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: precoCtrl,
                keyboardType: TextInputType.number,
                decoration: campoDecoracao(
                  label: "Preço",
                  icon: Icons.attach_money,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: descCtrl,
                maxLines: 3,
                decoration: campoDecoracao(
                  label: "Descrição",
                  icon: Icons.description,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  final provider =
                      Provider.of<CardapioProvider>(context, listen: false);

                  final ok = await provider.adicionar(
                    nome: nomeCtrl.text,
                    precoTexto: precoCtrl.text,
                    descricao: descCtrl.text,
                  );

                  if (!context.mounted) return;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(provider.mensagem)),
                  );

                  if (ok) {
                    provider.limparMensagem();
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  "Salvar",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}