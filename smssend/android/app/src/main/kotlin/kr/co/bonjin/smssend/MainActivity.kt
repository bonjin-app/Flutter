package kr.co.bonjin.smssend

import android.telephony.SmsManager;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugins.GeneratedPluginRegistrant;

class MainActivity: FlutterActivity() {

    private val callResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        val channel = MethodChannel(flutterEngine.dartExecutor, "sendSms")
        channel.setMethodCallHandler(handler)
    }

    private val handler = MethodCallHandler { methodCall: MethodCall, result: MethodChannel.Result ->
        if (methodCall.method == "send") {
            val num: String = methodCall.argument("phone")!!
            val msg: String = methodCall.argument("msg")!!
            sendSMS(num, msg, result)

        } else {
            result.notImplemented()
        }
    }

    private fun sendSMS(phoneNo: String, msg: String, result: MethodChannel.Result) {
        try {
            val smsManager = SmsManager.getDefault()
            smsManager.sendTextMessage(phoneNo, null, msg, null, null)
            result.success("SMS Sent")
        } catch (ex: Exception) {
            ex.printStackTrace()
            result.error("Err", "Sms Not Sent", "")
        }

    }
}
