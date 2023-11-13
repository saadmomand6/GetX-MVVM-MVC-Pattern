
import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US' : {
      'email_hint' : 'Enter Email',
      'Internet Exception' : 'we are unable to show result',
      'General Exception' : 'There are General Exception',
      'Welcome' : 'Welcome, We are glade to have you here',
      'Login Screen' : 'Login Screen',
      'Login' : 'Login',
    },
    'ur_PK' : {
     'email_hint' : 'ای میل درج کریں۔',
     'Internet Exception': 'ہم نتیجہ دکھانے سے قاصر ہیں۔',
     'General Exception' : 'عمومی استثناء موجود ہیں۔',
     'Welcome' : 'خوش آمدید، ہمیں آپ کو یہاں پا کر خوشی ہوئی ہے۔',
     'Login Screen' : 'لاگ ان اسکرین',
     'Login' : 'لاگ ان',
    }

  };


}