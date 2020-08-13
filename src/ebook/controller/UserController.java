package ebook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ebook.DAO.DocGiaDAO;

@Transactional
@Controller
public class UserController {
	@Autowired
	DocGiaDAO accountdao;
	@RequestMapping("user")
	public String index(ModelMap model) {
		model.addAttribute("users",accountdao.returnListUser());
		return "pages/theloai";
	}
}
