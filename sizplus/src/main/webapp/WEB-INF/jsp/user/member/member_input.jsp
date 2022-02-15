<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>

<style>

/*    * { */
/*        margin:0; padding: 0; */
/*    } */
    
/*    body { */
/*       background-color: #F5F6F7; */
/*    } */
   
/*     div {  */
/*        margin-top: 60px;margin-left: 38%; */
/*     } */
    
/*     ul,li {  */
/*        list-style: none; */
/*     } */
            
/*     li { */
/*     margin-bottom: 20px; text-align: left; */
/*     } */
           
/*     .box { */
/*     width: 450px; height: 50px; border: 1px solid #666; padding: 10px; */
/*     } */
            
/*     .pbox { */
/*     width: 120px; height: 50px; border: 1px solid #666; padding: 10px; */
/*     } */
            
/*     .necessary { */
/*     font-size: small; color:red; */
/*     } */
            
/*     button { */
/*     background:#00C850; color:white; width: 450px; border: 1px solid #666; height:50px; font-size: x-large; */
/*     } */
 
</style>
        

</head>

<body>
<%@ include file="/WEB-INF/jsp/userLayout/top.jsp" %>
<form method="POST" name="listForm">
<div>
      <ul>
           <li>
           <span >아이디 </span>
           <br>
           <input type="text" name="member_id" id="member_id" value="" placeholder = "아이디를 입력하세요" class = 'box'/>
           <br>
           <span class = 'necessary' >필수 정보입니다.</span>
           </li>
           
            <li>
            <span >패스워드 </span>
            <br>
            <input type = "password" name="member_pw" id="member_pw" placeholder = "패스워드를 입력하세요" class = 'box'/>
            <br>
            <span class = 'necessary' >필수 정보입니다.</span>
            </li>
            
            <li>
            <span >패스워드 확인 </span>
            <br>
            <input type = "password" name="member_pwc" id="member_pwc" placeholder = "다시 패스워드를 입력하세요" class = 'box'/>
            <br>
            <span class = 'necessary' >필수 정보입니다.</span>
            </li>
            
            
            <li>
           <span >닉네임 </span>
           <br>
           <input type = "text" name="member_nickname" id="member_nickname" placeholder = "사용하실 닉네임을 입력하세요" class = 'box'/>
           <br>
           <span class = 'necessary' >필수 정보입니다.</span>
           </li>
            
            
            
            <li>
            <span >생년월일</span>
            <br>
            <input type = "date" name="member_birth" id="member_birth" placeholder = "생년월일을 입력하세요." class = 'box'/>
            <br>
            <span class = 'necessary' >태어난 년도 4자리를 정확하게 입력하세요.</span>
            </li>
            
            <li>
            <span >연락처</span>
            <br>
            <input type = "text" name="member_phone_num" id="member_phone_one" class = 'pbox' maxlength="3" /> - <input type = "text" id="member_phone_two" class = 'pbox' maxlength="4" /> - <input type = "text" id="member_phone_three" class = 'pbox' maxlength="4" />
            <br>
            <span class = 'necessary' >필수 정보입니다.</span>
            </li>
            
            <li>
            <span >성별</span>
            <br>  남자<input type="radio" name="member_gender" value="M"/>  여자<input type="radio" name="member_gender" value="F"/>
            </li>
            
            <li><span >가입경로</span>
            <br>
            <input type="radio" name="member_way" value="1"/>인터넷
            <input type="radio" name="member_way" value="2"/>어플
            <input type="radio" name="member_way" value="3"/>광고
            <input type="radio" name="member_way" value="4"/>지인
            <input type="radio" name="member_way" value="5"/>유튜브
            </li>
			<button type="button" onclick="fn_check();"> 가입하기</button>
            
            
        </ul>
        
      
</div>
</form>
<%@ include file="/WEB-INF/jsp/userLayout/bottom.jsp" %>
<script>
function fn_check(){
	if($("#member_id").val() == ""){
		alert("아이디를 입력해주세요.");
		return false;
	}
	
	if($("#member_pw").val() == ""){
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	
	if($("#member_pwc").val() == ""){
		alert("비밀번호 확인을 입력해주세요.");
		return false;
	}
	
	if($("#member_nickname").val() == ""){
		alert("닉네임을 입력해주세요.");
		return false;
	}
	
	if($("#member_birth").val() == ""){
		alert("생년월일을 입력해주세요.");
		return false;
	}
	
	if($("#member_phone_one").val() == ""){
		alert("연락처을 입력해주세요.");
		return false;
	}
	
	if($("#member_phone_two").val() == ""){
		alert("연락처을 입력해주세요.");
		return false;
	}
	
	if($("#member_phone_three").val() == ""){
		alert("연락처을 입력해주세요.");
		return false;
	}
	
	if($("#member_pw").val() != $("#member_pwc").val()){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	
	
	if($("#member_phone_one").val() != "" || $("#member_phone_two").val() != "" || $("#member_phone_three").val() != ""){
		var member_phone_num = $("#member_phone_one").val() +"-"+ $("#member_phone_two").val() +"-"+ $("#member_phone_three").val();
		$("#member_phone_one").val(member_phone_num);
	}
	
	var frm = document.listForm;
	frm.action = "/member/member_input_proc.do";
	frm.submit();
}

</script>
</body>
</html>