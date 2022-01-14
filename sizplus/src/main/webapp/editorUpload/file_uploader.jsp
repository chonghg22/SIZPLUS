<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%@page import="java.util.Calendar"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.UUID"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
String dateString = "";
 
	String fileInfo = "";
	String fileName = request.getHeader("file-name");
	
	System.err.println("fileName "+fileName);
	
	String fileName_suffix = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
	System.err.println("fileName_suffix "+fileName_suffix);
	
	String[] suffixArr = { "jpg", "png", "bmp", "gif" };
	
	int cnt = 0;
	for(int i=0; i < suffixArr.length; i++){
		if(fileName_suffix.equals(suffixArr[i])){
			cnt++;
		}
	}
	if(cnt ==0){
		System.out.println("NOTALLOW_" + fileName);
	} else{
		String defaultPath = "C:/Users/jjh/git/SIZPLUS/sizplus/src/main/webapp/";
		Calendar cal = Calendar.getInstance();
		 
		dateString = String.format("%04d%02d%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
		System.out.println("dateString::" + dateString); 
		File f = new File(dateString);
	     if (!f.mkdirs()){
	     System.err.println("디렉토리 생성 실패");
	  	}
		String filePath = defaultPath + "editorImage" + "/" + dateString + "/";
		File file = new File(filePath);
		
		System.out.println("filePath::" + filePath);
		
		if(!file.exists()){
			file.mkdirs();
		}
		String autoFileName = UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
		String rFileName = filePath + autoFileName;
		 	System.err.println("rFileName ->" +rFileName );
		InputStream is = request.getInputStream();
			System.err.println("is  ->" + is);
		OutputStream os = new FileOutputStream(rFileName);
			System.err.println("os ->" + os);
		int num;
		byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
		while ((num = is.read(b, 0, b.length)) != -1){
			os.write(b, 0, num);
		}
		if(is !=null){
			is.close();
			System.err.println("if 조건 내부");
		}
		os.flush();
		os.close();
		
		fileInfo += "&bNewLine=true"; 
		fileInfo += "&sFileName=" + fileName;
		fileInfo += "&sFileURL=/editorImage/"+dateString +"/" + autoFileName;
		System.out.println("fileInfo::" + fileInfo);
		
	}
	
	
%>
<%=fileInfo%>