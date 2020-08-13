package ebook.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ebook.DAO.DocGiaDAO;
import ebook.entity.DocGia;

@Transactional
@Controller
public class DashboardController {
	@Autowired
	DocGiaDAO accountdao;
	@RequestMapping("/dashboard")
	public String Dashboard(ModelMap model,HttpSession session) {
		String url = "dashboard";
		try {
			
			String check = (String) session.getAttribute("username");
			check.isEmpty();
			DocGia x = accountdao.returnRole(check);
		}
		catch(Exception e) {
			url = "403page";
		}
		return url;
	}
}
