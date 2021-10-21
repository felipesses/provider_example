class ExampleModel {
  String title;

  ExampleModel({this.title = 'Olá'});

  changeTitle() {
    title = 'Olá, provider!';
    print(title);
  }
}
