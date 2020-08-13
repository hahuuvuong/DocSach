package ebook.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ebook.DAO.DocGiaDAO;
import ebook.DAO.TheLoaiDAO;
import ebook.DAO.SachDAO;
import ebook.entity.Sach;

@Transactional
@Controller
public class HomeController {
	@Autowired
	SachDAO Sachdao;
	@Autowired
	TheLoaiDAO theloaidao;
	@Autowired
	DocGiaDAO accountdao;
	@RequestMapping("/home")
	public String index(ModelMap model,HttpSession session) 
	{	
		List<Sach> list = new ArrayList<Sach>();
		list.add(Sachdao.returnSach(94));
		list.add(Sachdao.returnSach(25));
		list.add(Sachdao.returnSach(364));
		list.add(Sachdao.returnSach(334));
		list.add(Sachdao.returnSach(4));
		list.add(Sachdao.returnSach(35));
		list.add(Sachdao.returnSach(77));
		
		model.addAttribute("tieuthuyet", Sachdao.SachTheoTheLoai(23));
		model.addAttribute("kinhte", Sachdao.SachTheoTheLoai(2));
		model.addAttribute("tamly", Sachdao.SachTheoTheLoai(14));
		model.addAttribute("giatuong", Sachdao.SachTheoTheLoai(24));
		model.addAttribute("trinhtham", Sachdao.SachTheoTheLoai(12));
		
		
		model.addAttribute("truyenHot",list );
		model.addAttribute("truyenRandom",Sachdao.randomSach(8) );
		
		
		model.addAttribute("categories", theloaidao.returnTheLoai() );
		try {
			String check = (String) session.getAttribute("username");
			check.isEmpty();
			model.addAttribute("listFavBook",accountdao.returnFavBook(check));
		}
		catch(Exception e) {
			
		}
	return "index";
	}

}
