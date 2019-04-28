package org.subtitle.utils;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.apache.xmlrpc.XmlRpcException;
import org.apache.xmlrpc.client.XmlRpcClient;
import org.apache.xmlrpc.client.XmlRpcClientConfigImpl;

public class OpenSubtitles {

	private XmlRpcClient client = null;
	private String token = null;

	private static String userAgent = "yousub";
	private static String osUser;
	private static String osPasswd;
	private static String osLang;

	public OpenSubtitles(String user, String passwd, String lang) {
		osUser = user;
		osPasswd = passwd;
		osLang = lang;

		try {
			XmlRpcClientConfigImpl config = new XmlRpcClientConfigImpl();
			config.setServerURL(new URL("http://api.opensubtitles.org/xml-rpc"));
			client = new XmlRpcClient();
			client.setConfig(config);
			login();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private boolean login() {
		if (token != null) {
			try {
				Object[] params = new Object[] { token };
				Map ret = (Map) client.execute("NoOperation", params);
				String status = (String) ret.get("status");
				if (!status.equals("200 OK")) {
					token = null;
					login();
				}
			} catch (XmlRpcException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		}

		try {
			Object[] params = new Object[] { osUser, osPasswd, osLang, userAgent };
			HashMap<?, ?> status = (HashMap<?, ?>) client.execute("LogIn", params);
			String st = (String) status.get("status");
			if (st.equals("200 OK")) {
				token = (String) status.get("token");
				return true;
			}
		} catch (XmlRpcException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

		return false;
	}

	private void logout() {
		try {
			Object[] params = new Object[] { token };
			client.execute("LogOut", params);
		} catch (XmlRpcException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void parseSearchResult(Map searchResult) {
		Object data = searchResult.get("data");
		if (data instanceof Object[]) {
			for (Object element : (Object[]) data) {
				Map entry = (Map) element;
				for (Object key : entry.keySet())
					System.out.println("key >> " + key + " value >> " + entry.get(key));

			}
		}
	}

	public void search(long imdbid) {
		if (!login()) {
			System.out.println("Could not log in!");
		}

		try {
			Map<String, Map<String, String>> searchInfo = new HashMap<String, Map<String, String>>();
			Map<String, String> movieInfo = new HashMap<String, String>();
			movieInfo.put("imdbid", Long.toString(imdbid));
			movieInfo.put("sublanguageid", "eng");
			searchInfo.put("1", movieInfo);
			Object[] params = new Object[] { token, searchInfo };
			Map searchResult = (Map) client.execute("SearchSubtitles", params);
			// parseSearchResult(searchResult);
		} catch (XmlRpcException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		logout();

	}

	public void search(String movieHash, long byteSize) {
		if (!login()) {
			System.out.println("Could not log in!");
		}

		try {
			Map<String, Map<String, String>> searchInfo = new HashMap<String, Map<String, String>>();
			Map<String, String> movieInfo = new HashMap<String, String>();
			movieInfo.put("moviehash", movieHash);
			movieInfo.put("moviebytesize", Long.toString(byteSize));
			movieInfo.put("sublanguageid", "eng");
			searchInfo.put("1", movieInfo);
			Object[] params = new Object[] { token, searchInfo };
			Map searchResult = (Map) client.execute("SearchSubtitles", params);
			parseSearchResult(searchResult);
		} catch (XmlRpcException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		logout();
	}

	public Map<?, ?> search(String movie) {
		try {
			Map<String, Map<String, String>> searchInfo = new HashMap<String, Map<String, String>>();
			Map<String, String> movieInfo = new HashMap<String, String>();
			movieInfo.put("query", movie);
			searchInfo.put("1", movieInfo);
			Object[] params = new Object[] { token, searchInfo };
			Map<?, ?> searchResult = (Map<?, ?>) client.execute("SearchSubtitles", params);
			// parseSearchResult(searchResult);
			return searchResult;
		} catch (XmlRpcException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	public byte[] download(String subId) {
		/*try {
			Map<String, String> movieInfo = new HashMap<String, String>();
			movieInfo.put("IDSubtitleFile", subId);			
			Object[] params = new Object[] { token, movieInfo };
			Map downResult = (Map) client.execute("DownloadSubtitles", params);
			Object data = downResult.get("data");
			if(data != null && data instanceof Object[]) {
				Object[] dataArr = (Object[]) data;
				for(Object obj : dataArr) {
					if(obj instanceof Map) {
						String dataStr = (String) ((Map)obj).get("data");
						return Base64.getDecoder().decode(dataStr);
					}
				}
			}
			
		} catch (XmlRpcException e) {
			e.printStackTrace();
		}*/
		return null;
	}
		
}