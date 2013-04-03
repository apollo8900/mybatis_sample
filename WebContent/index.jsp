<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.apollo89.mybatis_sample.ItemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
ItemDao dao = new ItemDao();
ArrayList<HashMap<String, String>> list = null;  

String keyword = request.getParameter("keyword");

if(keyword == null || "".equals(keyword)){
	list = dao.getItemAll();
} else {
	HashMap<String,String> map = new HashMap<String,String>();
	map.put("keyword",keyword);
	list = dao.getItems2(map); 
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mybatis_sample</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
function search() {
	$(location).attr('href','index.jsp?keyword='+$("#keyword").val());
}
</script>
</head>
<body>
<div>
<input type="text" id="keyword" name="keyword" value="">
<input type="button" id="search" name="search" value="search" onclick="search()" >
</div>
<div>
   <table border="1">
      <colgroup>
        <col width="20%">
        <col width="40%">
        <col width="20%">
        <col width="20%">
      </colgroup>
      
      <thead>
        <tr> 
           <th>itemid</th><th>productid</th><th>listprice</th><th>attr1</th>
        </tr>
      </thead>
      
      <tbody>
         <!-- jstl을 이용하여 list에 담겨있는 Map의 value값을 호출  -->
         <c:forEach var="list" items="<%=list%>">
            <tr>
              <td><a href="item.jsp?itemid=${list.itemid}">${list.itemid}</td>
              <td>${list.productid}</td>
              <td>${list.listprice}</td>
              <td>${list.attr1}</td>
            </tr>
		    
		 </c:forEach>
      </tbody>
   </table>
 </div>

</body>
</html>