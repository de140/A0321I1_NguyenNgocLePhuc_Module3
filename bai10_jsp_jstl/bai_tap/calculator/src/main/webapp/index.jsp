<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/6/2021
  Time: 6:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>$Title$</title>
  <%--    Font popins--%>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="style.css">
</head>
<body>
<h1>Simple Calculator</h1>
<form method="post" action="/calculate">
  <div>
    <span>First operand: </span> <input type="text" name="firstNumber">
  </div>
  <div>
    <span>Operator: </span>
    <select name="operator" id="">
      <option value="operator" selected>Operator</option>
      <option value="+">+</option>
      <option value="-">-</option>
      <option value="*">*</option>
      <option value="/">/</option>
    </select>
  </div>
  <div>
    <span>Second operand: </span> <input type="text" name="secondNumber">
  </div>
  <div>
    <input type="submit" id="submit" value="Calculate">
  </div>
</form>
</body>
</html>