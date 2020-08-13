package ebook.DAO;

import java.util.List;

import ebook.entity.TheLoai;

public interface TheLoaiDAOimp {
	public List<TheLoai> returnTheLoai();
	public int amountOfTruyen(int idTheLoai);
	public TheLoai returnChiTietTheLoai(int idTheLoai);
}
