import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';

class OtpVerifyView extends StatefulWidget {
  const OtpVerifyView({super.key});

  @override
  State<OtpVerifyView> createState() => _OtpVerifyViewState();
}

class _OtpVerifyViewState extends State<OtpVerifyView> {
  final _codeCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Vérification')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              CircleAvatar(
                radius: 38,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: const Icon(Icons.chat_bubble_outline, size: 36, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text('Vérification',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24)),
              const SizedBox(height: 6),
              const Text('Entrez le code à 6 chiffres envoyé par SMS',
                  textAlign: TextAlign.center),
              const SizedBox(height: 18),
              TextField(
                controller: _codeCtrl,
                textAlign: TextAlign.center,
                maxLength: 6,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: '123456',
                ),
              ),
              const SizedBox(height: 8),
              Text('Code de démo : ${auth.demoCode ?? '—'}',
                  style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(height: 18),
              FilledButton.icon(
                icon: const Icon(Icons.verified_outlined),
                label: Text(auth.loading ? 'Vérification…' : 'Vérifier'),
                onPressed: auth.loading
                    ? null
                    : () async {
                  final ok = await context
                      .read<AuthController>()
                      .verifyCode(_codeCtrl.text.trim());
                  if (!mounted) return;
                  if (ok) {
                    Navigator.pushNamed(context, '/handle');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Code invalide')),
                    );
                  }
                },
              ),
              const SizedBox(height: 10),
              TextButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Modifier le numéro'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
