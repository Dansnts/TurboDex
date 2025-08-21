import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';

class PhoneSignInView extends StatefulWidget {
  const PhoneSignInView({super.key});

  @override
  State<PhoneSignInView> createState() => _PhoneSignInViewState();
}

class _PhoneSignInViewState extends State<PhoneSignInView> {
  final _formKey = GlobalKey<FormState>();
  final _phoneCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Connexion')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                CircleAvatar(
                  radius: 38,
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  child: const Icon(Icons.sms_outlined, size: 36, color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Text('Bienvenue sur TurboDex',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24)),
                const SizedBox(height: 6),
                const Text("Entrez votre numéro de téléphone pour commencer",
                    textAlign: TextAlign.center),
                const SizedBox(height: 18),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Numéro de téléphone",
                      style: Theme.of(context).textTheme.labelLarge),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _phoneCtrl,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: '+33 1 23 45 67 89',
                  ),
                  validator: (v) {
                    final s = v?.trim() ?? '';
                    if (s.isEmpty) return 'Champ requis';
                    if (!RegExp(r'^\+?[0-9 ]{8,18}$').hasMatch(s)) {
                      return 'Format invalide';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                FilledButton.icon(
                  icon: const Icon(Icons.arrow_forward),
                  label: Text(auth.loading ? 'Envoi…' : 'Recevoir le code SMS'),
                  onPressed: auth.loading
                      ? null
                      : () async {
                    if (!_formKey.currentState!.validate()) return;
                    await context.read<AuthController>().requestSms(_phoneCtrl.text.trim());
                    if (mounted) {
                      Navigator.pushNamed(context, '/verify');
                    }
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  "En continuant, vous acceptez nos conditions d'utilisation",
                  textAlign: TextAlign.center,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
