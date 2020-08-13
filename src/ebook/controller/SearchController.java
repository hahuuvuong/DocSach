package ebook.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ebook.DAO.TheLoaiDAO;
import ebook.DAO.TuKhoaTraCuuDAO;
import ebook.DAO.SachDAO;

@Transactional
@Controller
public class SearchController {
	@Autowired
	SachDAO truyendao;
	@Autowired
	TheLoaiDAO theloaidao;
	@Autowired
	TuKhoaTraCuuDAO tuKhoaTraCuuDAO;
	@RequestMapping(value ="/search", method = RequestMethod.POST)
	public String searchFunction(ModelMap model, HttpServletRequest request,@RequestParam("searchText") String searchText) throws UnsupportedEncodingException {
		tuKhoaTraCuuDAO.insertTuKhoaTraCuu(searchText);
		model.addAttribute("categories", theloaidao.returnTheLoai());
		model.addAttribute("truyens",truyendao.searchingSach(searchText));
		
		model.addAttribute("search", searchText);
		return "search";
	}
}
