
import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{

  @override

  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'About' : 'Getx State Managment with MVVM ',
      'email_hint': 'Email',
      'internet_exception' : 'We are unable to show results, \n Please check your connection',
      'general_exception' : 'We are unable to process your request.\n Please try again',
      'welcome_back' : 'Welcome\nBack' ,
      'login' :'Login' ,
      'password_hint' :'Password' ,
      'enter_password' :'Please enter your password here!' ,
      'enter_email' :'Please enter your email here!' ,
    },
    'ur_PK': {
      'email_hint': 'تم کیسے ہو'
    }
  };
}