package baseProd

import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import baseProd.Document;
import baseProd.Product;

class DocumentController {

    def index() {
	}
	
	def showAddForm(){
		def Product p = Product.get(params.productID)
		render(view:"addForm", model:[product: p])
	}
	
	//TODO: store path instead of file into the database
	//TODO: On error, display message to user
	def addToDatabase (String docRef, String docType, String status){
		def Product p = Product.get(params.productID)
		
		if (!request instanceof MultipartHttpServletRequest) {
			println "wrong request"
			redirect (action:"showAddForm", model:[product:p])
			return
		}
		
		MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request
		def CommonsMultipartFile file = (CommonsMultipartFile) mpr.getFile("file")
		def Document entry = null
		if (file.empty){
			println "empty file"
			entry = new Document(docRef:docRef, docType:docType, status:status, file:null)
		}
		else{
			def byte[] byteFile = file.bytes
			entry = new Document(docRef:docRef, docType:docType, status:status, file:byteFile)
		}
		
		//entry.save(flush:true) // Pas nécessaire, sauver le produit suffit
		attachDoc(entry, p)
		redirect (controller:"Product" ,action:"showRelatedDoc", params: [productID: params.productID])
	}

	def attachDoc (Document doc, Product product) {
		product.addToDocuments(doc)
		product.save(flush:true)
	}
	
	//TODO: not finished
	def download() {
		def Product product = Product.get(params.productID)
		def Document doc = Document.get(params.docID)
		CommonsMultipartFile file = new CommonsMultipartFile('downloadedFile')
		FileOutputStream fos = new FileOutputStream(file)
		fos.write(doc.file)
		file.transferTo('/home/guillaume/Bureau/Test/downloadedFile.pdf')
//		def CommonsMultipartFile file = (CommonsMultipartFile)doc.file
//		file.transferTo('/home/guillaume/Bureau/Test/downloadedFile')
		redirect (controller:"Product" ,action:"showRelatedDoc", params: [productID: params.productID])
	}
	
	def showDocDetails () {
		def Document chosenDoc = Document.get(params.docID)
		def Product product = Product.get(params.productID)
		render (view:"docDetails", model: [product:product, doc: chosenDoc])
	}
	
	def showModifForm() {
		def Document doc = Document.get(params.docID)
		def Product product = Product.get(params.productID)
		render (view:"modifForm", model:[product:product, doc: doc])
	}
	
	def modif() {
		def Document doc = Document.get(params.docID)
		doc.docRef=params.docRef
		doc.docType=params.docType
		doc.status = params.status
		doc.save()
		redirect (controller:"Product" ,action:"showRelatedDoc", params: [productID: params.productID])
	}
	
	def delete() {
		def doc = Document.get(params.docID)
		def Product product = Product.get(params.productID)
		doc.removeFromRelatedProducts(product)
		doc.delete() // TODO: A supprimer lorsque les documents pourront vraiment être liés à plusieurs produits
		redirect(controller:"Product" ,action:"showRelatedDoc", params: [productID: params.productID])
	}
}
