package baseProd

import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
import java.util.Date;

class Document {
	
	String docRef
	String docType
	String status
	//Date dateCreated
	
	//CommonsMultipartFile file
	byte[] file

	static belongsTo = Product
	static hasMany = [relatedProducts:Product]
	
    static constraints = {
		file nullable:true
    }
}
