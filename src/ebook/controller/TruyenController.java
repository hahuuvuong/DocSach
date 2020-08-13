package ebook.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
import ebook.DAO.DanhGiaSachDAO;
import ebook.DAO.LichSuDocDAO;
import ebook.entity.DanhGiaSach;
import ebook.entity.ChuongSach;
import ebook.entity.TheLoai;
import ebook.entity.Sach;

@Transactional
@Controller
public class TruyenController {
	@Autowired
	TheLoaiDAO theloaidao;
	@Autowired
	ChuongSachDAO chapterdao;
	@Autowired
	SachDAO truyendao;
	@Autowired
	DanhGiaSachDAO assessmentdao;
	@Autowired
	LichSuDocDAO lichSuDocDAO;
	@Autowired
	SessionFactory factory;
	@RequestMapping(value = "truyen/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable("id") int id,ModelMap model,HttpSession sessionHttp) {
		Session session = factory.openSession();
		
		List<DanhGiaSach> listAssess = assessmentdao.getListAssessmentOfTruyen(id);
		List<ChuongSach> list = chapterdao.returnChuongSachSach(id);
		Sach idTruyen = (Sach)session.get(Sach.class, id);
		
		TheLoai idTheLoai = idTruyen.getIdTheLoai();
		
		model.addAttribute("rateForm", new DanhGiaSach());
		model.addAttribute("chapter",list);
		model.addAttribute("listSize",list.size());
		model.addAttribute("listAssess",listAssess);
		model.addAttribute("listAssessSize",listAssess.size());
		model.addAttribute("categories", theloaidao.returnTheLoai());
		model.addAttribute("truyen",truyendao.returnSach(id));
		model.addAttribute("relatedBook", truyendao.SachTheoTheLoai(idTheLoai.getIdTheLoai()));
		if(!sessionHttp.isNew()) {
			int IdDocGia = (int) sessionHttp.getAttribute("idDocGia");
			int idLichSuDoc = lichSuDocDAO.checkBookmarkExist(idTruyen.getIdSach(), IdDocGia);
		}
		return "single-book";
	}
}
