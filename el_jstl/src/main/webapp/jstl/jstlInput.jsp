<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		border : 1px solid black;
		border-collapse : collapse;
	}
</style>
</head>
<body>
<form action="jstlResult.jsp" method="post">
	<table border="1">
		<tr>
			<td width="80" align="center">이름</td>
			<td>
				<input type="text" name ="name" id="name" placeholder="이름 입력"/>
			</td>
		</tr>
		
		<tr>
			<td width="80" align="center">나이</td>
			<td>
				<input type="text" name ="age" id="age" placeholder="나이 입력"/>
			</td>
		</tr>
		
		<tr>
			<td align="center">색깔</td>
			<td>
				<select name="color">
					<optgroup label="색깔">
						<option value="red">red</option>
						<option value="green">green</option>
						<option value="blue">blue</option>
						<option value="magenta">magenta</option>
						<option value="cyan">cyan</option>
					</optgroup>
				</select>
			</td>
		</tr>
		
		<tr>
			<td align="center">취미</td>
			<td>
				<fieldset>
				<input type="checkbox" name="hobby" id="hobby0" value="독서" style="margin-top:12px;"/>
				<label for="hobby0">독서</label>
				<input type="checkbox" name="hobby" id="hobby1" value="영화"/>
				<label for="hobby1">영화</label>
				<input type="checkbox" name="hobby" id="hobby2" value="음악"/>
				<label for="hobby2">음악</label>
				<input type="checkbox" name="hobby" id="hobby3" value="게임"/>
				<label for="hobby3">게임</label>
				<input type="checkbox" name="hobby" id="hobby4" value="쇼핑"/>
				<label for="hobby4">쇼핑</label>
				</fieldset>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="SEND"/>
				<input type="reset" value="CANCEL"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>