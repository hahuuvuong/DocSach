package ebook.controller;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ebook.DAO.DocGiaDAO;
import ebook.DAO.TheLoaiDAO;
import ebook.DAO.SachDAO;
import ebook.entity.DocGia;
import ebook.entity.Sach;

@Transactional
@Controller
public class favBookController {
	@Autowired
	DocGiaDAO accountdao;
	@Autowired
	SachDAO truyendao;
	@Autowired
	TheLoaiDAO theloaidao;
	@Autowired
	SessionFactory factory;
	@RequestMapping("favbook/{idTruyen}")
	public String index(@PathVariable("idTruyen") int idTruyen,HttpSession session,ModelMap model) {
		String url = "redirect:/favbook.htm";
		try {
			String check = (String) session.getAttribute("username");
			check.isEmpty();
			DocGia acc = accountdao.returnRole(check);
			Sach truyen = truyendao.returnSach(idTruyen);
			
			acc.getTruyens().add(truyen);
			truyen.getAccounts().add(acc);
			
			accountdao.saveFavBook(acc, truyen);
			
			model.addAttribute("listFavBook",accountdao.returnFavBook(check));
			
			model.addAttribute("categories", theloaidao.returnTheLoai() );
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("message","You need to log in!");
			url = "login";
		}
		return url;
	}
	@RequestMapping("favbook")
	public String index1(HttpSession session,ModelMap model) {
		String check = (String) session.getAttribute("username");
		
		
		model.addAttribute("listFavBook",accountdao.returnFavBook(check));
		
		model.addAttribute("categories", theloaidao.returnTheLoai() );
		return "favbook";
	}
	@RequestMapping("favbook/delete/{idTruyen}")
	public String delete(@PathVariable("idTruyen") int idTruyen,HttpSession session,ModelMap model) {
		String check = (String) session.getAttribute("username");
		accountdao.deleteFavBook(check, idTruyen);

		return "redirect:/favbook.htm";
	}
}
