import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';

class HandleSetupView extends StatefulWidget {
  const HandleSetupView({super.key});

  @override
  State<HandleSetupView> createState() => _HandleSetupViewState();
}

class _HandleSetupViewState extends State<HandleSetupView> {
  final _formKey = GlobalKey<FormState>();
  final _handleCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Identifiant')),
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
                  child: const Icon(Icons.person_outline, size: 36, color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Text('Choisissez votre identifiant',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24)),
                const SizedBox(height: 6),
                const Text('3–20 caractères, lettres, chiffres et _',
                    textAlign: TextAlign.center),
                const SizedBox(height: 18),
                TextFormField(
                  controller: _handleCtrl,
                  decoration: const InputDecoration(hintText: 'ex: car_spotter42'),
                  validator: (v) {
                    final s = v?.trim() ?? '';
                    if (s.length < 3 || s.length > 20) {
                      return 'Longueur invalide';
                    }
                    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(s)) {
                      return 'Caractères autorisés: lettres, chiffres, _';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                FilledButton.icon(
                  icon: const Icon(Icons.check_circle_outline),
                  label: const Text('Vérifier la disponibilité'),
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;
                    await context.read<AuthController>().saveHandle(_handleCtrl.text.trim());
                    if (mounted) Navigator.pushNamed(context, '/display');
                  },
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class DisplayNameSetupView extends StatefulWidget {
  const DisplayNameSetupView({super.key});

  @override
  State<DisplayNameSetupView> createState() => _DisplayNameSetupViewState();
}

class _DisplayNameSetupViewState extends State<DisplayNameSetupView> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final handle = context.watch<AuthController>().handle ?? '—';
    return Scaffold(
      appBar: AppBar(title: const Text("Nom d'affichage")),
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
                  child: const Icon(Icons.badge_outlined, size: 36, color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Text("Votre nom d'affichage",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24)),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text('@$handle'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _nameCtrl,
                  decoration: const InputDecoration(hintText: 'ex: Alex Chen'),
                  validator: (v) {
                    final s = v?.trim() ?? '';
                    if (s.length < 2 || s.length > 50) return '2–50 caractères';
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                FilledButton.icon(
                  icon: const Icon(Icons.done_all_outlined),
                  label: const Text('Créer mon compte'),
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;
                    await context.read<AuthController>().saveDisplayName(_nameCtrl.text.trim());
                    if (!mounted) return;
                    Navigator.of(context).pushNamedAndRemoveUntil('/', (r) => false);
                  },
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
