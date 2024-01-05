package com.shopping.shop.service;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Service;

@Service
public class KakaoAPI {
	
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			
		} catch(IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
