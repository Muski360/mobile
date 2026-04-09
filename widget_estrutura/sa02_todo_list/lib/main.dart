import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do List',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F7FB),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4F46E5),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xFF4F46E5),
          foregroundColor: Colors.white,
        ),
      ),
      home: const TodoListView(),
    );
  }
}

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  final TextEditingController _tarefasController = TextEditingController();

  final List<Map<String, dynamic>> _tarefas = [];

  @override
  void dispose() {
    _tarefasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildCabecalho(),
              const SizedBox(height: 20),
              _buildCampoTarefa(),
              const SizedBox(height: 14),
              _buildBotaoAdicionar(),
              const SizedBox(height: 20),
              Expanded(
                child: _tarefas.isEmpty
                    ? _buildListaVazia()
                    : ListView.separated(
                        itemCount: _tarefas.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          return _buildItemTarefa(index);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCabecalho() {
    final int concluidas =
        _tarefas.where((tarefa) => tarefa["concluida"] == true).length;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF4F46E5),
            Color(0xFF7C3AED),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Minhas tarefas",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Total: ${_tarefas.length} | Concluídas: $concluidas",
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCampoTarefa() {
    return TextField(
      controller: _tarefasController,
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => _adicionarTarefa(),
      maxLength: 60,
      decoration: InputDecoration(
        hintText: "Digite uma tarefa...",
        labelText: "Nova tarefa",
        prefixIcon: const Icon(Icons.edit_note_rounded),
        filled: true,
        fillColor: Colors.white,
        counterText: "",
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: Color(0xFF4F46E5),
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget _buildBotaoAdicionar() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: _adicionarTarefa,
        icon: const Icon(Icons.add_task_rounded),
        label: const Text(
          "Adicionar tarefa",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4F46E5),
          foregroundColor: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  Widget _buildListaVazia() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.inbox_rounded,
              size: 70,
              color: Color(0xFF9CA3AF),
            ),
            SizedBox(height: 12),
            Text(
              "Nenhuma tarefa cadastrada",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF374151),
              ),
            ),
            SizedBox(height: 6),
            Text(
              "Adicione uma nova tarefa para começar.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemTarefa(int index) {
    final tarefa = _tarefas[index];
    final bool concluida = tarefa["concluida"] ?? false;
    final String titulo = tarefa["titulo"] ?? "Tarefa sem título";

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: concluida ? const Color(0xFFE8F5E9) : Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        leading: Checkbox(
          value: concluida,
          activeColor: const Color(0xFF22C55E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          onChanged: (bool? valor) {
            if (valor == null) return;

            setState(() {
              _tarefas[index]["concluida"] = valor;
            });

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  valor
                      ? "Tarefa marcada como concluída."
                      : "Tarefa desmarcada.",
                ),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        ),
        title: Text(
          titulo,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: concluida ? Colors.grey[700] : const Color(0xFF111827),
            decoration: concluida ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: IconButton(
          tooltip: "Excluir tarefa",
          onPressed: () => _removerTarefa(index),
          icon: const Icon(
            Icons.delete_rounded,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }

  void _adicionarTarefa() {
    final String texto = _tarefasController.text.trim();

    if (texto.isEmpty) {
      Fluttertoast.showToast(
        msg: "Digite uma tarefa antes de adicionar.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.orange.shade100,
        textColor: Colors.black,
        fontSize: 16,
      );
      return;
    }

    if (texto.length < 3) {
      Fluttertoast.showToast(
        msg: "A tarefa deve ter pelo menos 3 caracteres.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.orange.shade100,
        textColor: Colors.black,
        fontSize: 16,
      );
      return;
    }

    final bool tarefaJaExiste = _tarefas.any(
      (tarefa) => tarefa["titulo"].toString().toLowerCase() == texto.toLowerCase(),
    );

    if (tarefaJaExiste) {
      Fluttertoast.showToast(
        msg: "Essa tarefa já foi adicionada.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.orange.shade100,
        textColor: Colors.black,
        fontSize: 16,
      );
      return;
    }

    setState(() {
      _tarefas.add({
        "titulo": texto,
        "concluida": false,
      });
      _tarefasController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Tarefa adicionada com sucesso!"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _removerTarefa(int index) {
    if (index < 0 || index >= _tarefas.length) {
      Fluttertoast.showToast(
        msg: "Erro ao remover a tarefa.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return;
    }

    if (_tarefas[index]["concluida"] == true) {
      final String tituloRemovido = _tarefas[index]["titulo"];

      setState(() {
        _tarefas.removeAt(index);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Tarefa \"$tituloRemovido\" removida."),
          duration: const Duration(seconds: 1),
        ),
      );
    } else {
      Fluttertoast.showToast(
        msg: "Conclua a tarefa antes de deletar.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red.shade100,
        textColor: Colors.black,
        fontSize: 16,
      );
    }
  }
}