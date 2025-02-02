package ebook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ebook.DAO.DocGiaDAO;

@Controller
@RequestMapping("API/")
public class ApiController {
	@Autowired
	DocGiaDAO accountdao;
	
	@RequestMapping(value = "KiemTraDangNhap", method = RequestMethod.GET)
	@ResponseBody
	public String index(@RequestParam String username) {
		
		return accountdao.returnNickname(username);
	}
}
