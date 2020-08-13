package ebook.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ebook.DAO.DocGiaDAO;
import ebook.DAO.ChuongSachDAO;
import ebook.DAO.SachDAO;
import ebook.entity.DocGia;
import ebook.entity.ChuongSach;
import ebook.entity.Sach;

@Transactional
@Controller
public class ChuongSachController {
	@Autowired
	ChuongSachDAO chuongSachDAO;
	@Autowired
	SachDAO sachDAO;
	@Autowired
	DocGiaDAO docGiaDao;
	@Autowired
	SessionFactory factory;
	@RequestMapping("insertchapter/{numPage}")
	public String Insertchapter(ModelMap model,@PathVariable("numPage") int numPage,HttpSession session) {
		String url = "pages/insertChapter";
		try {
			
			String check = (String) session.getAttribute("username");
			check.isEmpty();
			DocGia x = docGiaDao.returnRole(check);
			
		}
		catch(Exception e) {
			url = "403page";
		}
		
		model.addAttribute("num",chuongSachDAO.amountOfChuongSach());
		model.addAttribute("numPage",numPage);
		model.addAttribute("chapters",chuongSachDAO.allChuongSach(numPage));
		
		
		return url;
	}
	@RequestMapping(value = "addchapter" , method = RequestMethod.GET)
	public String Addtruyen(ModelMap model,HttpSession session) {
		String url = "pages/addChapter";
		try {
			
			String check = (String) session.getAttribute("username");
			check.isEmpty();
			DocGia x = docGiaDao.returnRole(check);
		}
		catch(Exception e) {
			url = "403page";
		}
		ChuongSach chapter = new ChuongSach();
		model.addAttribute("chapter",chapter);
		model.addAttribute("idTruyens", sachDAO.returnAllSach());
		return url;
	}
	@RequestMapping(value = "addchapter" , method = RequestMethod.POST)
	public String Addtruyen(ModelMap model,@ModelAttribute("chapter")ChuongSach chapter, BindingResult errors,HttpServletRequest request) {
		Session session = factory.openSession();
		
		int id = Integer.parseInt(request.getParameter("idtTruyen"));
		String url = "redirect:/insertchapter/1.htm";
		chapter.setIdSach((Sach)session.get(Sach.class,id));
		System.out.println(chapter.getIdSach());
		
		if(chapter.getIdSach() == null) {
			url = "pages/addChapter";
			errors.rejectValue("idSach","chapter","Vui lòng nhập ID truyện !");
		}
		if(chapter.getTenChuong().trim().length() == 0) {
			url = "pages/addChapter";
			errors.rejectValue("TenChapter","chapter","Vui lòng nhập tên chapter !");
		}
		if(chapter.getNoiDung().trim().length() == 0) {
			url = "pages/addChapter";
			errors.rejectValue("NoiDung","chapter","Vui lòng nhập nội dung!");
		}

		Transaction t = session.beginTransaction();
		try {
			session.saveOrUpdate(chapter);
			t.commit();
		}
		catch(Exception e) {
			url = "pages/addChapter";
			t.rollback();
		}
		finally {
			session.close();
		}
		return url;
	}
	@RequestMapping(value = "updateChapter/{idChapter}", method = RequestMethod.GET)
	public String updateTruyen(ModelMap model, @PathVariable("idChapter")int idChapter) {
		Session session = factory.getCurrentSession();
		ChuongSach chapter = (ChuongSach)session.get(ChuongSach.class,idChapter);
		Sach idTruyen = chapter.getIdSach();
		model.addAttribute("idTruyens", sachDAO.returnAllSach());
		model.addAttribute("chapter", chapter);
		model.addAttribute("idSach", idTruyen);
		return "pages/addChapter";
	}
	@RequestMapping(value = "deleteChapter/{idChapter}")
	public String deleteTruyen(ModelMap model,@PathVariable("idChapter")int idChapter) {
		Session session = factory.openSession();
		ChuongSach chapter = (ChuongSach)session.get(ChuongSach.class,idChapter);
		Transaction t = session.beginTransaction();
		try {
			session.delete(chapter);
			t.commit();
		}
		catch(Exception e) {
			t.rollback();
		}
		finally {
			session.close();
		}
		return "redirect:/insertchapter/1.htm";
	}
}
