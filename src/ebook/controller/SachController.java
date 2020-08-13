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
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ebook.DAO.DocGiaDAO;
import ebook.DAO.TheLoaiDAO;
import ebook.DAO.SachDAO;
import ebook.entity.DocGia;
import ebook.entity.TheLoai;
import ebook.entity.Sach;

@Transactional
@Controller
public class SachController {
	@Autowired
	SachDAO truyendao;
	@Autowired
	TheLoaiDAO theloaidao;
	@Autowired
	DocGiaDAO accountdao;
	@Autowired
	SessionFactory factory;
	@RequestMapping(value = "addtruyen" , method = RequestMethod.POST)
	public String Addtruyen(ModelMap model,@Validated @ModelAttribute("truyen")Sach truyen, BindingResult errors,HttpServletRequest request) {
		String url = "redirect:/inserttruyen/1.htm";
		if(truyen.getTenSach().trim().length() == 0) {
			url = "pages/addTruyen";
			errors.rejectValue("tenTruyen","truyen","Vui lòng nhập Tên truyện !");
		}
		if(truyen.getHinhAnh().trim().length() == 0) {
			url = "pages/addTruyen";
			errors.rejectValue("image","truyen","Vui lòng nhập link image !");
		}
		if(request.getParameter("idtTheLoai").trim().length() == 0) {
			url = "pages/addTruyen";
			errors.rejectValue("idTheLoai","truyen","Vui lòng nhập thể loại !");
		}
		if(truyen.getGioiThieu().trim().length() == 0) {
			url = "pages/addTruyen";
			errors.rejectValue("tomTat","truyen","Vui lòng nhập tóm tắt !");
		}
		int idTheLoai = 1;
		String id = request.getParameter("idtTheLoai");
		if(id.equals("")) {
			
		}
		else {
		idTheLoai = Integer.parseInt(id);
		}
		truyen.setIdTheLoai(theloaidao.returnChiTietTheLoai(idTheLoai));
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.saveOrUpdate(truyen);
			t.commit();
		}
		catch(Exception e) {
			url = "pages/addTruyen";
			t.rollback();
		}
		finally {
			session.close();
		}
		return url;
	}
	@RequestMapping(value = "addtruyen" , method = RequestMethod.GET)
	public String Addtruyen(ModelMap model,HttpSession session) {
		String url = "pages/addTruyen";
		try {
			
			String check = (String) session.getAttribute("username");
			check.isEmpty();
			DocGia x = accountdao.returnRole(check);
		}
		catch(Exception e) {
			url = "403page";
		}
		
		Sach truyen = new Sach();
		model.addAttribute("truyen",truyen);
		model.addAttribute("categories", theloaidao.returnTheLoai());
		return url;
	}
	@RequestMapping(value = "updateTruyen/{idTruyen}", method = RequestMethod.GET)
	public String updateTruyen(ModelMap model, @PathVariable("idTruyen")int idTruyen) {
		Session session = factory.getCurrentSession();
		Sach truyen = (Sach)session.get(Sach.class,idTruyen);
		TheLoai idTheLoai = truyen.getIdTheLoai();
		model.addAttribute("categories", theloaidao.returnTheLoai());
		model.addAttribute("truyen", truyen);
		model.addAttribute("idTheLoai", idTheLoai);
		return "pages/addTruyen";
	}
	@RequestMapping(value = "deleteTruyen/{idTruyen}")
	public String deleteTruyen(ModelMap model,@PathVariable("idTruyen")int idTruyen) {
		Session session = factory.openSession();
		Sach truyen = (Sach)session.get(Sach.class,idTruyen);
		Transaction t = session.beginTransaction();
		try {
			session.delete(truyen);
			t.commit();
		}
		catch(Exception e) {
			t.rollback();
		}
		finally {
			session.close();
		}
		return "redirect:/inserttruyen/1.htm";
	}
	@RequestMapping("inserttruyen/{numPage}")
	public String Inserttruyen(ModelMap model,@PathVariable("numPage") int numPage) {
		
		model.addAttribute("num",truyendao.amountOfSachs());
		model.addAttribute("numPage",numPage);
		model.addAttribute("truyens",truyendao.allSach(numPage));
		
		return "pages/insertTruyen";
	}
}
