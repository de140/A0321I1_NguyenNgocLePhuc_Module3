<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;700&display=swap" rel="stylesheet">
    <style>
        html {
            font-family: 'DM Sans', sans-serif;
        }
    </style>
</head>
<body>
<p>
    <a href="/customer">Back to list</a>
</p>
<form method="post" action="/customer">
    <input type="hidden" name="action" value="create">
    <div>ID:</div>
    <input type="text" name="id">
    <div>Name:</div>
    <input type="text" name="name">
    <div>Email:</div>
    <input type="email" name="email">
    <div>Address:</div>
    <input type="text" name="address">
    <button type="submit">Thêm</button>
</form>
</body>
</html>