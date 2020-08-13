package ebook.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ebook.DAO.DocGiaDAO;
import ebook.entity.DocGia;

@Controller
@RequestMapping(value = "account")
public class LoginController {
	@Autowired
	DocGiaDAO accountdao;
	@Autowired
	SessionFactory factory;
	@RequestMapping(method = RequestMethod.GET)
	public String index() {
		return "login";
	}
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@RequestParam("username") String username,@RequestParam("password") String password,HttpSession session,ModelMap modelMap) {
		
		if(accountdao.checkUsername(username,password)) {
			session.setAttribute("nickname", accountdao.returnNickname(username));
			session.setAttribute("username", accountdao.returnRole(username).getTenDangNhap());
			session.setAttribute("idDocGia", accountdao.returnRole(username).getIdDocGia());
	//		session.setAttribute("role",accountdao.returnRole(username).isRole());
			return "redirect:/home.htm";
		} else {
			modelMap.put("error", "Incorrect Username or Password");
			return "login";
		}
	}
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("username");
		session.removeAttribute("nickname");
		session.removeAttribute("idDocGia");
		return "redirect:/home.htm";
	}
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register(ModelMap model) {
		
		model.addAttribute("account",new DocGia());
		return "register";
	}
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(ModelMap model, @ModelAttribute("account")DocGia account,HttpServletRequest request)
	{
		String repass = request.getParameter("repass");
		if(repass.equals(account.getMatKhau())) {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.save(account);
				t.commit();
			}
			catch(Exception e) {
				model.put("error", e.getMessage());
				t.rollback();
			}
			finally {
			session.close();
			}
		}
			else {
				model.put("error","Repass incorrect");
				return "register";
			}
		return "redirect:/home.htm";
	}
	
	@RequestMapping(value = "changepass", method = RequestMethod.GET)
	public String changepass(ModelMap model) {
		
		return "changepass";
	}
	@RequestMapping(value = "changepass", method = RequestMethod.POST)
	public String changepass(ModelMap model,HttpServletRequest request,HttpSession sessions)
	{
		String pass = request.getParameter("pass");
		String repass = request.getParameter("repass");
		String newpass = request.getParameter("newpass");
		
		String nickname = (String) sessions.getAttribute("username");
		DocGia acc = accountdao.returnAccount(nickname);
		if(acc.getMatKhau().equals(pass))
		{
		if(repass.equals(newpass)) {
			acc.setMatKhau(newpass);
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.update(acc);
				t.commit();
			}
			catch(Exception e) {
				model.put("error", e.getMessage());
				t.rollback();
			}
			finally {
			session.close();
			}
		}
			else {
				model.put("error","Repass incorrect");
				return "changepass";
			}
		}
		else
		{
			model.put("error","Password incorrect");
			return "changepass";
		}
		return "redirect:/home.htm";
	}
	@RequestMapping(value ="403")
	public String pageAccessDenied() {
		return "403page";
	}
}
