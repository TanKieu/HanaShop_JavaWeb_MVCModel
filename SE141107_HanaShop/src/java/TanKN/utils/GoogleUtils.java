/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TanKN.utils;

import TanKN.HanaAccount.GooglePojo;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author winnh
 */
public class GoogleUtils {
    public static String getToken(final String code) throws IOException, ClientProtocolException {
        String respone= Request.Post("https://accounts.google.com/o/oauth2/token")
                .bodyForm(Form.form()
                .add("client_id","494755591833-lmid94hos03ajf933s2apoditsal4hv3.apps.googleusercontent.com" )
                .add("client_secret", "tAYvawGXPIeM33stlu3_AZ50")
                        .add("redirect_uri", "http://localhost:8084/SE141107_HanaShop/LoginGoogleServlet")
                        .add("code", code)
                        .add("grant_type","authorization_code")
                        .build()).execute().returnContent().asString();
    
        JsonObject jobj= new Gson().fromJson(respone, JsonObject.class);
        String accessToken =jobj.get("access_token").toString().replaceAll("\"","");
        return accessToken;
    }
    public static GooglePojo getUserInfor(final  String accessToken) throws IOException, ClientProtocolException{
        String link="https://www.googleapis.com/oauth2/v1/userinfo?access_token="+accessToken;
        String respone=Request.Get(link).execute().returnContent().asString();
        GooglePojo goglePojo= new Gson().fromJson(respone, GooglePojo.class);
        return goglePojo;
    }
}
