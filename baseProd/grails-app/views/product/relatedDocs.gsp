<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="layout" content="main">
<title>Related Docs</title>
</head>
<header>
</header>
<body>
	<p>
		Produit --> Reference: ${product.productRef } --- Status: ${product.status }<br/>
		Voici les documents liés au produit:
	</p>
	<p>
		ReferenceDoc --- TypeDoc --- StatusDoc <!--TODO: Mettre ca dans un joli tableau... -->
		<g:each in="${product.documents}" var="doc">
			<li>${doc.docRef } --- ${doc.docType } --- ${doc.status }  
			<g:link controller="Document" action="showDocDetails" params="[productID:"${product.id}", docID: "${doc.id}"]">Voir</g:link>
			<g:link controller="Document" action="showModifForm" params="[productID:"${product.id }", docID: "${doc.id}"]">Modifier</g:link>
			<g:link controller="Document" action="delete" params="[productID:"${product.id}", docID: "${doc.id}"]">Supprimer</g:link>
		</g:each>
	</p>
	<p>
		<g:link controller="Document" action="showAddForm" params="[productID: "${product.id}"]">Ajouter un nouveau document</g:link>
	</p>
</body>
</html>