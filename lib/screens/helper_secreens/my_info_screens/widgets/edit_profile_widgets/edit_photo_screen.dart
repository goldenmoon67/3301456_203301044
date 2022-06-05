import 'package:flutter/material.dart';
import 'package:halisaha_app/helper/firebase_services/firestore_user_service.dart';
import 'package:halisaha_app/helper/hive_services/hive_service.dart';
import 'package:halisaha_app/model/users.dart';

class EditPhoto extends StatefulWidget {
  const EditPhoto({Key? key}) : super(key: key);

  @override
  State<EditPhoto> createState() => _EditPhotoState();
}

class _EditPhotoState extends State<EditPhoto> {
  final snackbarMessage = SnackBar(
    content: const Text('Başarı ile düzenlendi!'),
    backgroundColor: Colors.green.shade400,
  );
  @override
  Widget build(BuildContext context) {
    MyUser _currentUser = HiveService.readCurrentUser();
    return Center(
      child: StatefulBuilder(
          builder: ((context, setState) => Dialog(
                backgroundColor: Colors.transparent,
                child: SizedBox(
                  height: 600,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                              flex: 5,
                              child: Text(
                                "Profil Resmi Düzenle",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                          Flexible(
                              flex: 1,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    setState(
                                      () {},
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.blue,
                                  )))
                        ],
                      ),
                      Image(
                        height: 350,
                        image: NetworkImage(_currentUser.imageUrl),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  _showMyDialog(context, 'Resmi Kaldır',
                                      'Bu resmi kaldırmak istediğinizden emin misiniz?');
                                },
                                child: Column(
                                  children: const [
                                    Icon(Icons.delete),
                                    Text("Kaldır")
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  _showMyDialog(context, 'Resmi Değiştir',
                                      'Hangi yöntem ile değiştirmek istersiniz?');
                                },
                                child: Column(
                                  children: const [
                                    Icon(Icons.change_circle),
                                    Text("Değiştir")
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ))),
    );
  }

  Future<void> _showMyDialog(
      BuildContext context, String title, String text) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: Text(title)),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(text),
                ],
              ),
            ),
            actions: <Widget>[
              title == "Resmi Kaldır"
                  ? _getRemove(context)
                  : _getChange(context),
            ],
          ),
        );
      },
    );
  }

  _getChange(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {
                CrudServices.kameraGaleriImageUpload(type: false);
                _onLoading();
              },
              child: Column(
                children: const [
                  Icon(
                    Icons.camera_enhance,
                    size: 50,
                  ),
                  Text("Fotoğraf Çek")
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {
                CrudServices.kameraGaleriImageUpload(type: true);
                _onLoading();
              },
              child: Column(
                children: const [
                  Icon(
                    Icons.photo,
                    size: 50,
                  ),
                  Text("Galeriden Seç")
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onLoading() {
    Future.delayed(const Duration(milliseconds: 5000), () {
      //ScaffoldMessenger.of(context).showSnackBar(snackbarMessage);
      Navigator.pop(context);
      setState(() {});
      Navigator.pop(context);
      setState(() {});
    });
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Container(
          color: Colors.transparent,
          child: const Center(child: CircularProgressIndicator()),
        );
      },
    );
    Future.delayed(const Duration(milliseconds: 2000), () {
      //ScaffoldMessenger.of(context).showSnackBar(snackbarMessage);
      setState(() {});
      Navigator.pop(context);
    });
  }

  _getRemove(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          child: const Text('Evet'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('İptal'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
