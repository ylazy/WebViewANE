package {
import com.tuarua.FreSharp;
import com.tuarua.WebView;
import com.tuarua.webview.Settings;

import flash.desktop.NativeApplication;

import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Rectangle;
import flash.net.URLRequest;
import flash.utils.setTimeout;

[SWF(width="1024", height="768", frameRate="60", backgroundColor="#F1F1F1")]
public class WebViewExampleAS3 extends Sprite {
    private var freSharpANE:FreSharp = new FreSharp(); // must create before all others
    private var webView:WebView;
    private var hasActivated:Boolean;

    public function WebViewExampleAS3() {
        this.addEventListener(Event.ACTIVATE, onActivated);
    }

    protected function onActivated(event:Event):void {
        if (hasActivated) return;
        setTimeout(init, 0); // this is handle the HARMAN splash screen
        hasActivated = true;
    }

    protected function init():void {
        NativeApplication.nativeApplication.addEventListener(Event.EXITING, onExiting);
        var viewport:Rectangle = new Rectangle(0, 0, 1024, 768);
        var settings:Settings = new Settings();
        webView = WebView.shared();
        webView.init(stage, viewport, new URLRequest("https://html5test.com"), settings, 1, 0xFFF1F1F1);
        webView.visible = true;
    }
    private function onExiting(event:Event):void {
        WebView.dispose();
        FreSwift.dispose();
        FreSharp.dispose();
    }
}
}
