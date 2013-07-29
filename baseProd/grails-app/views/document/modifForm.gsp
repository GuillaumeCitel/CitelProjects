<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="layout" content="main">
<title>Doc Modif</title>
</head>
<header>
</header>
<body>
<p>
	<g:form name="ModifDoc" action="modif" params="[productID:"${product.id}", docID: "${doc.id}"]">
	<p>
		<label for="docRef">Document Reference* :</label>
		<input type="text" name="docRef" id="docRef" value="${doc.docRef }"/>
		<br/>
		
		<label for="docType">Type* :</label>
		<input type="text" name="docType" id="docType" value="${doc.docType }"/>
		<br/>
	
		<label for="status">Status* :</label>
		<input type="text" name="status" id="status" value="${doc.status }"/>
		<br/>
	
		<g:link controller="Document" action="showDocDetails" params="[productID: "${product.id}", docID:"${doc.id }"]">Retour</g:link>
		<input type="submit" value="Enregistrer"/>
	</p>
	</g:form>
</p>
</body>
</html>