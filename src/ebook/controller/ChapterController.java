package ebook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ebook.DAO.ChuongSachDAO;
import ebook.DAO.TheLoaiDAO;
import ebook.DAO.SachDAO;
import ebook.entity.ChuongSach;

@Transactional
@Controller
public class ChapterController {
	@Autowired
	TheLoaiDAO theloaidao;
	@Autowired
	ChuongSachDAO chapterdao;
	@Autowired
	SachDAO truyendao;
	@RequestMapping(value = "chapter/{idTruyen}/{idChapter}", method = RequestMethod.GET)
	public String contentChapter(@PathVariable("idTruyen") int idTruyen,@PathVariable("idChapter")int idChapter, ModelMap model) {
		
		List<ChuongSach> list = chapterdao.returnChuongSachSach(idTruyen);
		chapterdao.tangLuotDoc(idChapter);
		model.addAttribute("chapter",list);
		model.addAttribute("categories", theloaidao.returnTheLoai());
		model.addAttribute("content", chapterdao.returnContentChuongSach(idChapter));
		model.addAttribute("truyen",truyendao.returnSach(idTruyen));
		
		return "single-chapter";
	}
}
