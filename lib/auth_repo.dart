
class AuthRepository{

Future<void>login() async{

print("attemtping login");
await Future.delayed(Duration(seconds: 3));
print('logged in');


}

}