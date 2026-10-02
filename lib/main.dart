import 'package:flutter/material.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Заметки',
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      home: const NotesPage(),
    );
  }
}

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // Контроллер хранит текст из поля ввода
  final TextEditingController _controller = TextEditingController();

  // Список всех заметок
  final List<String> _notes = [];

  // Номер заметки, которую сейчас редактируем (null = никакую)
  int? _editingIndex;

  // Нажали "Сохранить"
  void _saveNote() {
    final text = _controller.text.trim();
    if (text.isEmpty) return; // пустые заметки не сохраняем

    setState(() {
      if (_editingIndex == null) {
        _notes.add(text); // новая заметка
      } else {
        _notes[_editingIndex!] = text; // заменяем старый текст новым
        _editingIndex = null;
      }
      _controller.clear();
    });
  }

  // Нажали карандаш: кладём текст заметки обратно в поле
  void _startEdit(int index) {
    setState(() {
      _editingIndex = index;
      _controller.text = _notes[index];
    });
  }

  // Нажали корзину
  void _deleteNote(int index) {
    setState(() {
      _notes.removeAt(index);

      // Если удалили заметку, которую как раз редактировали, сбрасываем редактирование
      if (_editingIndex == index) {
        _editingIndex = null;
        _controller.clear();
      } else if (_editingIndex != null && _editingIndex! > index) {
        _editingIndex = _editingIndex! - 1;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Заметки')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Введите заметку',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _saveNote,
              child: Text(_editingIndex == null ? 'Сохранить' : 'Обновить'),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_notes[index]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _startEdit(index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _deleteNote(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}