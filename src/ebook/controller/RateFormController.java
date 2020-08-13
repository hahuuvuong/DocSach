package ebook.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ebook.DAO.TheLoaiDAO;
import ebook.DAO.DocGiaDAO;
import ebook.entity.DocGia;
import ebook.entity.DanhGiaSach;
import ebook.entity.Sach;
@Transactional
@Controller
public class RateFormController {
	@Autowired
	TheLoaiDAO theloaidao;
	
	@Autowired
	DocGiaDAO docGiaDao;
	@Autowired
	SessionFactory factory;
	@RequestMapping(value = "rateform", method = RequestMethod.GET)
	public String getRateFrom(ModelMap model) {
		model.addAttribute("categories", theloaidao.returnTheLoai());
		
		return "RateFormSuccess";
	}
	
	@RequestMapping(value = "rateform/{idSach}", method = RequestMethod.POST)
	public String postRateForm(ModelMap model,@RequestParam("rating") String rateScore,@ModelAttribute("RateAssessment") DanhGiaSach rateAssessment,@PathVariable("idSach") int idTruyen,HttpSession sessionHttp) {
		Session session = factory.openSession();
		String userName = (String)sessionHttp.getAttribute("username");
		rateAssessment.setSoDiem(Integer.parseInt(rateScore));
		Sach truyen = (Sach)session.get(Sach.class,idTruyen);
		rateAssessment.setIdSach(truyen);
		DocGia user = docGiaDao.returnRole(userName);
		rateAssessment.setIdDocGia(user);
		rateAssessment.setThoiGian(new Date());
		Transaction t = session.beginTransaction();
		try {
			session.saveOrUpdate(rateAssessment);
			t.commit();
		}
		catch(Exception e) {
			System.out.print(e.getMessage());
			t.rollback();
		}
		finally {
			session.close();
		}
		
		return "rateForm";
	}

}
