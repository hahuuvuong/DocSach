package ebook.controller;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ebook.DAO.LichSuDocDAO;
import ebook.entity.ChuongSach;
import ebook.entity.DocGia;
import ebook.entity.LichSuDoc;
import ebook.entity.Sach;

@Transactional
@Controller
public class LichSuDocController {

	@Autowired
	SessionFactory factory;
	
	@Autowired
	LichSuDocDAO lichSuDocDAO;
	
	@RequestMapping(value = "addlichsudoc" ,method = RequestMethod.GET)
	@ResponseBody
	public String addLichSuDoc(@RequestParam int IdSach,@RequestParam int IdDocGia,@RequestParam String IdChuong,@RequestParam float ViTri) {
		
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		LichSuDoc lichSuDoc = new LichSuDoc((Sach)session.get(Sach.class, IdSach),(DocGia)session.get(DocGia.class, IdDocGia),(ChuongSach)session.get(ChuongSach.class, IdSach),ViTri, new Date());
		int idLichSuDoc = lichSuDocDAO.checkBookmarkExist(IdSach, IdDocGia);
		if(idLichSuDoc!=-1)
			lichSuDoc.setIdLichSuDoc(idLichSuDoc);
		String res = "success";
		try {
			lichSuDoc.setThoiGian(new Date());
			session.saveOrUpdate(lichSuDoc);
			t.commit();
		}
		catch(Exception e) {
			res = e.getMessage();
			t.rollback();
		}
		finally {
			session.close();
		}
		return res;
	}
}
