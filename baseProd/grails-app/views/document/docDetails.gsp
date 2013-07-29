<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="layout" content="main">
<title>Product Details</title>
</head>
<header>
</header>
<body>
	<p>
		<g:include view="/shared_templates/docAttributes.gsp" model="[doc:doc]"/>
	</p>
	<p>
		<g:link controller="Product" action="showRelatedDoc" params="[productID: "${product.id}"]">Retour</g:link>
		<g:link controller="Document" action="showModifForm" params="[productID:"${product.id }", docID: "${doc.id}"]">Modifier</g:link>
		<g:link controller="Document" action="download" params="[productID:"${product.id }", docID: "${doc.id}"]">Télécharger</g:link>
		<g:link controller="Document" action="delete" params="[productID:"${product.id}", docID: "${doc.id}"]">Supprimer</g:link>
	</p>
</body>
</html>