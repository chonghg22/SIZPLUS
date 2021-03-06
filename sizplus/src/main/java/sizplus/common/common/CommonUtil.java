package sizplus.common.common;
 
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

 
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
     * sha256 μνΈν
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
     * μ€ν¬λ¦½νΈ μλ¬ λ©μΈμ§ νΈμΆ
     * @param text
     * @return
     * @throws IOException
     */
    public static String NotificationMessage(ModelMap model, String title, String msg, String scriptName){
    	HashMap<String, String> message = new HashMap<String, String>();
		message.put("title",title);
		message.put("msg",msg);
		message.put("scriptName",scriptName);
		model.addAttribute("message", message);
		return "comm/message/message";
  	}
    
    /**
     * Ajax λ©μΈμ§ μλ΅
     * @param text
     * @return
     * @throws IOException
     */ 
    public static void printAjax(String json, HttpServletResponse response) throws IOException {
	    response.setCharacterEncoding("UTF-8");
	    response.setHeader("Cache-Control", "no-cache");
		response.getWriter().println(json);
		response.getWriter().flush();
	    response.getWriter().close();
    }
    
	
	/**
	 * μ§μ λ μ΄λ¦μ νμΌ νμ₯μλ₯Ό κ²μ¬ν¨
	 * @param files
	 * @param fieldName <input type='file' name=fieldName
	 * @return
	 * @throws IOException
	 */
	public static String fileUploadBeforeCheck(Map<String, MultipartFile> files, long size,  String fieldName, String allowExt, boolean imageOnly, String required) throws IOException {
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		MultipartFile file;
		boolean isRequired = false;
		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();

			file = entry.getValue();
			String orginFileName = file.getOriginalFilename();

			//--------------------------------------
			// μ νμΌλͺμ΄ μλ κ²½μ° μ²λ¦¬
			// (μ²¨λΆκ° λμ§ μμ input file type)
			//--------------------------------------
			if ("".equals(orginFileName)) {
				continue;
			}
			////------------------------------------

			long _size = file.getSize();
			int index = orginFileName.lastIndexOf(".");
			if(fieldName.equals(file.getName())) {
				isRequired = true;
				if(index < 0){ return "νμ₯μκ° μλ νμΌμ μ²¨λΆ ν  μ μμ΅λλ€." ; } //νμ₯μ μλ νμΌ μ²¨λΆ κΈμ§.

				String fileExt = orginFileName.substring(index + 1);

/*				Boolean isRealExt = getRealFileExtCheck(multipartToFile(file),fileExt);
				if(!isRealExt) return "νμ₯μ λ³μ‘°κ° νμΈλμμ΅λλ€. μ¬λ°λ₯Έ νμΌμ μλ‘λ ν΄μ£ΌμκΈ° λ°λλλ€.";*/

				if(regEx("exe", fileExt.toLowerCase())  || fileExt.length() > 19 ) { //κΈμ§νμ₯μμ ν΄λΉνλ©΄
					return "μλ‘λ ν  μ μλ νμ₯μ μλλ€.";
				}
				if(_size > size) {
					return String.format("μ²¨λΆνμΌ μ©λμ΄ μ΄κ³Ό νμ΅λλ€.\\n  μ©λμ ν : %s, μ²¨λΆνμΌ μ©λ : %s  ", fileSize(size), fileSize(_size));
				}
				if("".equals(fileExt)) {
					return "νμ₯μκ° μλ νμΌμ μ²¨λΆ ν  μ μμ΅λλ€.";
				}
				if(!regEx(allowExt,fileExt.toLowerCase())) {
					return String.format("μ²¨λΆ κ°λ₯ν νμΌ νμμ΄ μλλλ€.\\nκ°λ₯ν νμΌ νμ : %s", allowExt.replace("|", ","));
				}
				if(imageOnly && // μ΄λ―Έμ§λ§ λ°λλ‘ μ€μ λ κ²½μ°
						!regEx("(image.jpg|image.jpeg|image.gif|image.png|image.bmp|image.x-png|image.pjpeg)",file.getContentType().toLowerCase())) {
					return "μ΄λ―Έμ§ νμΌλ§ μ²¨λΆκ° κ°λ₯ν©λλ€.";
				}
			}
		}
		if("required".equals(required ) && isRequired == false) {
			return "νμΌμ μ²¨λΆ ν΄ μ£ΌμΈμ.";
		}
		return "";
	}
	
	/**
	 * μ κ·μ κ²μ¬ λ©μλ(λ¬Έμμ΄μ΄ μ§μ λ ν¨ν΄κ³Ό μΌμΉνλμ§ μ¬λΆ κ²μ¬)
	 * @param ptn ν¨ν΄
	 * @param str κ²μ¬ν  λ¬Έμμ΄
	 * @return true | false
	 */
	public static boolean regEx(String ptn, String str) {
	    java.util.regex.Pattern p = java.util.regex.Pattern.compile(ptn,java.util.regex.Pattern.CASE_INSENSITIVE | java.util.regex.Pattern.MULTILINE );
	    java.util.regex.Matcher m = p.matcher(str);
	    return m.find();
	}
	
	public static String fileSize(long fileSize ) {
		String strResult = "";
		if(fileSize> 1024000000){
			fileSize = fileSize / 1024000000;
			strResult = fileSize + " GB";
		}else if(fileSize > 1024000){
			fileSize = fileSize / 1024000;
			strResult = fileSize + " MB";
		}else if(fileSize > 1024){
			fileSize = fileSize / 1024;
			strResult = fileSize + " KB";
		}else{
			strResult = fileSize + " B";
		}
		return strResult;
	}
	
	public static String requestupload2(MultipartHttpServletRequest mtfRequest) {
        List<MultipartFile> fileList = mtfRequest.getFiles("file");
        String src = mtfRequest.getParameter("src");
        System.out.println("src value : " + src);
        HashMap<String, String> message = new HashMap<String, String>();
        String path = "C:\\image\\";

        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // μλ³Έ νμΌ λͺ
            long fileSize = mf.getSize(); // νμΌ μ¬μ΄μ¦

            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);

            String safeFile = path + System.currentTimeMillis() + originFileName;
            try {
                mf.transferTo(new File(safeFile));
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        return "redirect:/";
    }
	
	public static void filDown(HttpServletRequest request,
			HttpServletResponse response, String filePath, String realFilNm,
			String viewFileNm) throws IOException {
		 
		File file = new File( filePath + realFilNm);
		System.out.println("root = " + filePath + realFilNm);
		if (file.exists() && file.isFile()) {
			response.setContentType("application/octet-stream; charset=utf-8");
			response.setContentLength((int) file.length());
			String browser = getBrowser(request);
			String disposition = getDisposition(viewFileNm, browser);
			response.setHeader("Content-Disposition", disposition);
			response.setHeader("Content-Transfer-Encoding", "binary");
			OutputStream out = response.getOutputStream();
			FileInputStream fis = null;
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
			if (fis != null)
				fis.close();
			out.flush();
			out.close();
		}
	}

	private static String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		if (header.indexOf("MSIE") > -1 || header.indexOf("Trident") > -1)
			return "MSIE";
		else if (header.indexOf("Chrome") > -1)
			return "Chrome";
		else if (header.indexOf("Opera") > -1)
			return "Opera";
		return "Firefox";
	}

	private static String getDisposition(String filename, String browser)
			throws UnsupportedEncodingException {
		String dispositionPrefix = "attachment;filename=";
		String encodedFilename = null;
		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll(
					"\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\""
					+ new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename = "\""
					+ new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		}
		return dispositionPrefix + encodedFilename;
	}
	
	public static List<Map<String, Object>> youtubeSearch(String search) throws Exception {
		String apiurl = "https://www.googleapis.com/youtube/v3/search";
		apiurl += "?key=AIzaSyB5c5auzKfEsQiFdt92yNUB0HVnSyTmYEw";
		apiurl += "&part=snippet&type=video&maxResults=5&videoEmbeddable=true";
		apiurl += "&q="+URLEncoder.encode(search,"UTF-8");
		
		URL url = new URL(apiurl);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
		String inputLine;
		StringBuffer response = new StringBuffer();
		while((inputLine = br.readLine()) != null) {
			response.append(inputLine);
		}
		br.close();
		List<Map<String, Object>> listMapInsert = new ArrayList<Map<String, Object>>();
		JSONParser jsonPares = new JSONParser();
		JSONObject obj = (JSONObject)jsonPares.parse(response.toString());
		JSONArray jArray = (JSONArray) obj.get("items");
		for(int i=0;i<jArray.size();i++){
			Map<String, Object> map = new  HashMap<String, Object>();
			JSONObject tmp = (JSONObject) (jArray.get(i));//μΈλ±μ€ λ²νΈλ‘ μ κ·Όν΄μ κ°μ Έμ¨λ€.
			JSONObject snippet = (JSONObject)tmp.get("snippet");
			JSONObject thumbnailsObj = (JSONObject)jsonPares.parse(snippet.get("thumbnails").toString());
			JSONObject defaultObj = (JSONObject)jsonPares.parse(thumbnailsObj.get("medium").toString());
			JSONObject idObj = (JSONObject)tmp.get("id");
			map.put("title", snippet.get("title").toString());
			map.put("tumbUrl", defaultObj.get("url").toString());
			map.put("id",idObj.get("videoId").toString());
			listMapInsert.add(map);
		}
		return listMapInsert;
	}
		
}