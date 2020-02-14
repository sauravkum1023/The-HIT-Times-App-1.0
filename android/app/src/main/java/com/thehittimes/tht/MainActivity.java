package com.thehittimes.tht;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

import java.io.Serializable;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "hit.times.com/mailer";
  String subject = "null";
  String message ;
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
      @Override
      public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {

        if (methodCall.method.equals("getMessage")) {

          final String raw_mail = methodCall.argument("mail");

          String[] list_mail = raw_mail.split("\\s*~\\s*");

          String name = list_mail[0];
          String email = list_mail[1];
          String roll = list_mail[2];
          String story = list_mail[3];

          message = "Hey,\n I am "+name+" want to report a story.\n\n----STORY----\n"+story+"\n\n" +
                  "Thank You \nName: "+name+"\nRoll No.: "+roll+"\nEmail: "+email;

          Intent intent = new Intent(Intent.ACTION_SENDTO, Uri.fromParts(
                  "mailto","thehittimes@gmail.com", null));
          intent.putExtra(Intent.EXTRA_SUBJECT, "App:ContactUs");
          intent.putExtra(Intent.EXTRA_TEXT, (Serializable) message);
          try {
            startActivity(Intent.createChooser(intent, "Choose an Email client :"));

          } catch (android.content.ActivityNotFoundException ex) {

          }
        }

      }
    });
  }

}
