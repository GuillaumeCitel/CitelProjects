package baseProd

import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
//import org.grails.plugins.csv.*

class ExcelController {

    def index() { }
	
	def showForm() {
		render (view:"form")
	}
	
	def importExcel() {
		
		//TODO: Update if article is already present
		//TODO: On error display message to user
		
		if (!request instanceof MultipartHttpServletRequest) {
			println "wrong request"
			redirect (action:"showForm")
			return
		}
		
		MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request
		def CommonsMultipartFile file = (CommonsMultipartFile) mpr.getFile("file")
		if (file.empty){
			println "empty file"
			redirect (action:"showForm")
			return
		}
		
		def String originalFN = file.getOriginalFilename()
		if (originalFN.lastIndexOf(".") == -1){
			//DEBUG
			println "filename: "+originalFN
			println "lastindex: "+originalFN.lastIndexOf('.')
			//END DEBUG
			println "file has no extension"
			redirect (action:"showForm")
			return
		}
		
		def String extension = originalFN.substring(originalFN.lastIndexOf(".")+1)
		if (extension != 'csv'){
			//DEBUG
			println "filename: "+originalFN
			println "lastindex: "+originalFN.lastIndexOf('.')
			println "extension: "+extension
			// END DEBUG
			println "wrong extension"
			redirect (action:"showForm")
			return
		}
		
		//TODO: Checks field name
		//TODO: handle reading errors
		
		def settings = [separatorChar: ';', skipLines:1]
		file.inputStream.toCsvReader(settings).eachLine{
			tokens -> new Product(productRef: tokens[0], status: tokens[1]).save(flush:true)
		}
		redirect (controller:"Product", action:"showAll")
	}
	
	def test(){
		
		"hello,world,how,are,you".eachCsvLine {
			tokens -> println tokens[0]+'-'+tokens[1]
		}
		
		def settings = [separatorChar: '!']
		"hello,world!test".toCsvReader(settings).eachLine{
			tokens -> println tokens[0]+'-'+tokens[1]
		}
		redirect (action:"showForm")
	}
}
