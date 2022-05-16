import 'package:flutter/material.dart';
import 'package:gabriela_app/components/gabrielaCard.dart';

import '../components/gabrielaText.dart';
import '../model/user_model.dart';

class ListUserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListUserPage();
  }
}

class _ListUserPage extends State<ListUserPage> {
  TextEditingController userNameEditingController = TextEditingController();
  TextEditingController userEmailEditingController = TextEditingController();
  FocusNode userNameFocus = FocusNode();
  FocusNode userEmailFocous = FocusNode();

  List<User> userList = [];

  addNewUser({required String nomeUser, required String emailUser}) {
    setState(() {
      userList.insert(0, User(nome: nomeUser, email: emailUser));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuários"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GabrielaTextForm(
              label: 'Nome',
              focusNode: userNameFocus,
              userInputController: userNameEditingController,
              onEditingComplete: () {
                userEmailFocous.nextFocus();
              },
            ),
            const SizedBox(
              height: 15,
            ),
            GabrielaTextForm(
              label: 'Email',
              userInputController: userEmailEditingController,
              focusNode: userEmailFocous,
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: userList.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 15,
              ),
              itemBuilder: (context, index) {
                var userItems = userList[index];
                return MouseRegion(
                  cursor: SystemMouseCursors.cell,
                  child: GestureDetector(
                    onTap: () {
                      print(userItems.nome);
                      print(userItems.email);
                    },
                    child: GabrielaCard(
                      leftText: userItems.nome,
                      rightText: userItems.email,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewUser(
              nomeUser: userNameEditingController.text,
              emailUser: userEmailEditingController.text);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
