package ebook.DAO;

import java.util.List;

import ebook.entity.DocGia;
import ebook.entity.Sach;

public interface DocGiaDAOimp {
	public boolean checkUsername(String username,String password);
	public String returnNickname(String username);
	public DocGia returnRole(String username);
	public int saveFavBook(DocGia acc, Sach truyen);
	public List<Sach> returnFavBook(String username);
	public void deleteFavBook(String username, int id);
	public List<DocGia> returnListUser();
}
