<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="layout" content="main">
<title>Add Doc Form</title>
</head>
<header>
</header>
<body>
	<g:uploadForm name="importExcel" action="importExcel" method="post" enctype="multipart/form-data">
		<label for="file">File :</label>  
		<input type="file" name="file" id="file"/>
		<br/> 

		<input type="submit" value="Import"/>
	</g:uploadForm>
	<g:link controller="Excel" action="test">Test</g:link>
</body>
</html>