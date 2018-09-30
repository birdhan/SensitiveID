$(function(){
	/*
	 * 1.得到所有错误信息，循环遍历，调用一个方法，确定是否显示这个Label(错误信息)
	 */
	$(".error").each(function(){
		showError($(this));
	});
	
	
	/*
	 * 2.换提交按钮图片
	 */
	$("#submit").hover(
		function(){
			$("#submit").attr("src","/books/images/regist2.jpg");
		},
		function(){
			$("#submit").attr("src","/books/images/regist1.jpg");
		}
		);
	
	/*
	 * 3.输入框得到焦点隐藏错误信息Lable
	 */
	$(".input").focus(function(){
		var labelId=$(this).attr("id")+"Error";//获取当前对象的ID+Error,得到对应错误提示标签的ID
		$("#"+labelId).text("");//把label内容置空
		showError($("#"+labelId));//调用方法，判断是否显示该label
	});
	
	/*
	 * 4.输入框失去焦点进行校验
	 */
	$(".input").blur(function(){
			var id = $(this).attr("id");//获取当前输入框的id
			var funName = "validate" + id.substring(0,1).toUpperCase() + id.substring(1) + "()";//得到对应的校验函数名
			eval(funName);//执行函数调用
		
		//validateLoginname();
		//validateLoginpass();
		//validateReloginpass();
		//validateEmail();
		//validateVerifyCode();
		
	});
});

/*
 * 判断当前元素是否存在文本内容，存在，显示，否则，不显示
 */
function showError(ele){
	var text=ele.text();//获取元素的文本内容
	if(!text){//如果没有内容
		ele.css("display","none");//不显示
	}else{
		ele.css("display","");//显示
	}
}
/*
 * 更换验证码图片
 */
function yzm(){
	/*
	 *1.获取Img元素
	 *2.修改它的src属性值
	 *3.使用Date类得到一个唯一参数值
	 */
	$("#vCode").attr("src","/books/VerifyCodeServlet?a="+new Date().getTime());
	  
}
/*
   $.ajax({
      url:servlet地址,
      data:参数,
      type:提交方式（post/get），
      dataType:json，
      aync:是否异步，
      cache:是否缓存,
      success:function()服务器执行成功后要调用的方法
     
   });
 */

/*
 * 登录名校验方法
 */
function validateLoginname() {
	var id = "loginname";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("用户名不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. 长度校验
	 */
	if(value.length < 3 || value.length > 20) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("用户名长度必须在3 ~ 20之间！");
		showError($("#" + id + "Error"));
		false;
	}
	/*
	 * 3.  ajax是否已注册校验
	 */
	$.ajax({
	      url:"/books/UserServlet",
	      data:{method:"ajaxValidateLoginname",loginname:value},
	      type:"post",
	      dataType:"json",
	      async:false,
	      cache:false,
	      success:function(result){ //服务器执行成功后要调用的方法
	    	  if(!result){
	    		  $("#" + id + "Error").text("用户名已被占用！");
	    			showError($("#" + id + "Error")); 
	    		  return false;
	    	  }
	      }
	   });
	
	return true;
}

/*
 * 登录密码校验方法
 */
function validateLoginpass() {
	var id = "loginpass";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("密码不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. 长度校验
	 */
	if(value.length < 3 || value.length > 20) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("密码长度必须在3 ~ 20之间！");
		showError($("#" + id + "Error"));
		false;
	}
	return true;	
}

/*
 * 确认密码校验方法
 */
function validateReloginpass() {
	var id = "reloginpass";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("确认密码不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. 两次输入是否一致校验
	 */
	if(value != $("#loginpass").val()) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("两次输入不一致！");
		showError($("#" + id + "Error"));
		false;
	}
	return true;	
}

/*
 * Email校验方法
 */
function validateEmail() {
	var id = "email";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("Email不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. Email格式校验
	 */
	if(!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(value)) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("错误的Email格式！");
		showError($("#" + id + "Error"));
		false;
	}
	/*
	 * 3. ajax邮箱是否已使用校验
	 */
$.ajax({
	      url:"/books/UserServlet",
	      data:{method:"ajaxValidateEmail",email:value},
	      type:"post",
	      dataType:"json",
	      async:false,
	      cache:false,
	      success:function(result){ //服务器执行成功后要调用的方法
	    	  if(!result){
	    		  $("#" + id + "Error").text("邮箱已被占用！");
	    			showError($("#" + id + "Error")); 
	    		  return false;
	    	  }
	      }
	   });
	return true;		
}

/*
 * 验证码校验方法
 */
function validateVerifyCode() {
	var id = "verifyCode";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("验证码不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. 长度校验
	 */
	if(value.length != 4) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("错误的验证码！");
		showError($("#" + id + "Error"));
		false;
	}
	/*
	 * 3. 是否正确
	 */
	$.ajax({
	      url:"/books/UserServlet",
	      data:{method:"ajaxValidateCode",verifyCode:value},
	      type:"post",
	      dataType:"json",
	      async:false,
	      cache:false,
	      success:function(result){ //服务器执行成功后要调用的方法
	    	  if(!result){
	    		  $("#" + id + "Error").text("验证码不正确！");
	    			showError($("#" + id + "Error")); 
	    		  return false;
	    	  }
	      }
	   });
	
	
	return true;		
}




