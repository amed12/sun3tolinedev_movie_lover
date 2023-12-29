part of 'shared.dart';

Future<XFile?> getImage() async {
  var image = await ImagePicker().pickImage(source: ImageSource.gallery);
  return image;
}

Future<String> uploadImage(File image) async {
  String fileName = basename(image.path);

  var ref = FirebaseStorage.instance.ref().child(fileName);
  var task = ref.putFile(image);
  var snapshot = await task;

  return await snapshot.ref.getDownloadURL();
}

Widget generateDashedDivider(double width) {
    int n = width ~/ 5;
    return Row(
      children: List.generate(
          n,
          (index) => (index % 2 == 0)
              ? Container(
                  height: 2,
                  width: width / n,
                  color: Color(0xFFE4E4E4),
                )
              : SizedBox(
                  width: width / n,
                )),
    );
  }