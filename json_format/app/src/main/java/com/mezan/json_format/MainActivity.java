package com.mezan.json_format;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class MainActivity extends AppCompatActivity {

    List<String> rawUrlList;
    List<String> smallUrlList;
    List<String> thumbUrlList;
    List<String> fullUrlList;
    List<String> sizeList;
    List<Integer> likesList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        rawUrlList = new ArrayList<>();
        smallUrlList = new ArrayList<>();
        thumbUrlList = new ArrayList<>();
        fullUrlList = new ArrayList<>();
        sizeList = new ArrayList<>();
        likesList = new ArrayList<>();

        JSONFunction();

      //  Log.d("RawUrl", rawUrlList.toString()+ rawUrlList.size());
    }

    void JSONFunction(){
        try {

                JSONArray jsonArray = new JSONArray(Utility(0));
          //  Log.d("RawUrl", String.valueOf(jsonArray.length()));
            JSONObject jsonObject = jsonArray.getJSONObject(1);
            Log.d("RawUrl", jsonObject.toString());
            JSONObject imgUrlObject = jsonObject.getJSONObject("urls");
            String smallUrl = imgUrlObject.getString("small");
            String thumbUrl = imgUrlObject.getString("thumb");
            String rawUrl = imgUrlObject.getString("raw");
            String fullUrl = imgUrlObject.getString("full");
            Log.d("RawUrl", smallUrl);
                /*for(int j = 0; j <= 2990; j++){

                    JSONObject jsonObject1 = jsonObject.getJSONObject(String.valueOf(j));
                        JSONObject imgUrlObject = jsonObject1.getJSONObject("urls");
                        String smallUrl = imgUrlObject.getString("small");
                        String thumbUrl = imgUrlObject.getString("thumb");
                        String rawUrl = imgUrlObject.getString("raw");
                        String fullUrl = imgUrlObject.getString("full");
                        String imgSize = "Size : "+jsonObject1.getString("width")+" X "+jsonObject1.getString("height");
                        int likes = jsonObject1.getInt("likes");

                        rawUrlList.add(rawUrl);
                        smallUrlList.add(smallUrl);
                        thumbUrlList.add(thumbUrl);
                        fullUrlList.add(fullUrl);
                        sizeList.add(imgSize);
                        likesList.add(likes);


                    }
                    Log.d("RawUrl", rawUrlList.toString()+ rawUrlList.size());

*/


        } catch (JSONException e) {
            e.printStackTrace();
            Toast.makeText(MainActivity.this, "JSON Read Failed!",Toast.LENGTH_LONG).show();
        }
    }

    String Utility(int i){
        String jsonStr;
        String jsonFileName = null;
        /*for(int i=1; i<301; i++){
            jsonFileName = "unsplash_json (" + i + ").json";
        }*/
        jsonFileName = "full_json_unsplash1to300.json";

        try {
            InputStream inputStream = MainActivity.this.getAssets().open(jsonFileName);
            int size = inputStream.available();
            byte[] buffer = new byte[size];
            inputStream.read(buffer);
            inputStream.close();
            jsonStr = new String(buffer, StandardCharsets.UTF_8);

        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
        return jsonStr;
    }
}