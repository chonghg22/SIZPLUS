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
    public static String NotificationMessage(ModelMap model, String title, String msg, String scriptName){
    	HashMap<String, String> message = new HashMap<String, String>();
		message.put("title",title);
		message.put("msg",msg);
		message.put("scriptName",scriptName);
		model.addAttribute("message", message);
		return "comm/message/message";
  	}
    
    /**
     * Ajax 메세지 응답
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
	 * 지정된 이름의 파일 확장자를 검사함
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
			// 원 파일명이 없는 경우 처리
			// (첨부가 되지 않은 input file type)
			//--------------------------------------
			if ("".equals(orginFileName)) {
				continue;
			}
			////------------------------------------

			long _size = file.getSize();
			int index = orginFileName.lastIndexOf(".");
			if(fieldName.equals(file.getName())) {
				isRequired = true;
				if(index < 0){ return "확장자가 없는 파일은 첨부 할 수 없습니다." ; } //확장자 없는 파일 첨부 금지.

				String fileExt = orginFileName.substring(index + 1);

/*				Boolean isRealExt = getRealFileExtCheck(multipartToFile(file),fileExt);
				if(!isRealExt) return "확장자 변조가 확인되었습니다. 올바른 파일을 업로드 해주시기 바랍니다.";*/

				if(regEx("exe", fileExt.toLowerCase())  || fileExt.length() > 19 ) { //금지확장자에 해당하면
					return "업로드 할 수 없는 확장자 입니다.";
				}
				if(_size > size) {
					return String.format("첨부파일 용량이 초과 했습니다.\\n  용량제한 : %s, 첨부파일 용량 : %s  ", fileSize(size), fileSize(_size));
				}
				if("".equals(fileExt)) {
					return "확장자가 없는 파일은 첨부 할 수 없습니다.";
				}
				if(!regEx(allowExt,fileExt.toLowerCase())) {
					return String.format("첨부 가능한 파일 형식이 아닙니다.\\n가능한 파일 형식 : %s", allowExt.replace("|", ","));
				}
				if(imageOnly && // 이미지만 받도록 설정된 경우
						!regEx("(image.jpg|image.jpeg|image.gif|image.png|image.bmp|image.x-png|image.pjpeg)",file.getContentType().toLowerCase())) {
					return "이미지 파일만 첨부가 가능합니다.";
				}
			}
		}
		if("required".equals(required ) && isRequired == false) {
			return "파일을 첨부 해 주세요.";
		}
		return "";
	}
	
	/**
	 * 정규식 검사 메소드(문자열이 지정된 패턴과 일치하는지 여부 검사)
	 * @param ptn 패턴
	 * @param str 검사할 문자열
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
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

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
			JSONObject tmp = (JSONObject) (jArray.get(i));//인덱스 번호로 접근해서 가져온다.
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