package sizplus.common.common;
 
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
 
public class CommonUtil {
	
	public static HashMap<String, Object> convertMap(HttpServletRequest request) {
		 
	    HashMap<String, Object> hmap = new HashMap<String, Object>();
	    String key;
	 
	    Enumeration<?> tt = request.getParameterNames();
	 
	    while (tt.hasMoreElements()) {
	        key = (String) tt.nextElement();
	        if (request.getParameterValues(key).length > 1) {
	            hmap.put(key, request.getParameterValues(key));
	        } else {
	            hmap.put(key, request.getParameter(key));
	        }
	 
	    }
	 
	    return hmap;
	}

	
	/**
     * sha256 암호화
     * @param text
     * @return
     * @throws IOException
     */
    public static String hexSha256(String text) throws IOException, NoSuchAlgorithmException {
    	String MD5 = "";
	    try {
	        MessageDigest md = MessageDigest.getInstance("MD5");
	        md.update(text.getBytes());
	        byte byteData[] = md.digest();
	        StringBuffer sb = new StringBuffer();
	        for (int i = 0; i < byteData.length; i++) {
	            sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
	        }
	        MD5 = sb.toString();
	 
	    } catch (NoSuchAlgorithmException e) {
	        e.printStackTrace();
	        MD5 = null;
	    }
	    return MD5;
  	}
    
    /**
     * 스크립트 에러 메세지 호출
     * @param text
     * @return
     * @throws IOException
     */
    public static String NotificationMessage(ModelMap model, String title, String msg, String scriptName) throws IOException, NoSuchAlgorithmException {
    	HashMap<String, String> message = new HashMap<String, String>();
    	message.put("title",title);
		message.put("msg",msg);
		message.put("script",scriptName);
		message.put("type","alert");
		model.addAttribute("message", message);
		return "comm/message/message";
  	}
}