import 'package:flutter/material.dart';
import 'package:halisaha_app/screens/helper_secreens/events_screens/widgets/find_rival_screen_widgets/is_replaceable_checkbox.dart';
import 'package:halisaha_app/screens/helper_secreens/events_screens/widgets/find_rival_screen_widgets/number_of_people_dropdown.dart';

class CreatePosting extends StatefulWidget {
  const CreatePosting({Key? key}) : super(key: key);

  @override
  State<CreatePosting> createState() => _CreatePostingState();
}

class _CreatePostingState extends State<CreatePosting> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              const Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Maç İlanı Oluştur",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Başlık"),
                          hintText: "İlanınız için bir başlık giriniz",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 4,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                label: Text("Tarih"),
                                hintText: "İlanınız için bir başlık giriniz",
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.calendar_today),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLines: 3,
                        decoration: const InputDecoration(
                          label: Text("Açıklama"),
                          hintText: "Rakipleriniz için bir mesajınız var mı?",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          NumberOfPeopleDropdown(),
                          Row(
                            children: <Widget>[
                              _getCheckBoxTitle(),
                              IsReplaceableCheckBox()
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blueAccent),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text("OLUŞTUR"),
                            Icon(Icons.add_circle_outline_rounded)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _getCheckBoxTitle() {
    return Text("Zaman esnetilebilir mi?");
  }
}
