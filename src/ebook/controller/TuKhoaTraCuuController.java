package ebook.controller;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ebook.entity.TuKhoaTraCuu;

@Controller
public class TuKhoaTraCuuController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping(value = "insertTuKhoa", method = RequestMethod.POST)
	@ResponseBody
	public String index(@RequestParam String keyword) {
		System.out.println("keyword" + keyword);
		TuKhoaTraCuu tuKhoaTraCuu = new TuKhoaTraCuu(keyword,new Date());
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String res ;
		try {
			session.saveOrUpdate(tuKhoaTraCuu);
			t.commit();
			res = "success";
		}
		catch(Exception e) {
			t.rollback();
			System.out.println("insert tu khoa" + e.getMessage());
			res = e.getMessage();
		}
		finally {
			session.close();
		}
		return res;
	}
}
