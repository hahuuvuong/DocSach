package ebook.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "NhaXuatBan")
public class NhaXuatBan {
	@Id 
	@GeneratedValue
	@Column(name = "IdNXB")
	private String IdNXB;
	@Column(name = "TenNXB")
	private String TenNXB;
	@Column(name = "DiaChi")
	private String DiaChi;
	@Column(name = "Email")
	private String Email;
	@Column(name = "ThongTin")
	private String ThongTin;
	public String getIdNXB() {
		return IdNXB;
	}
	public void setIdNXB(String idNXB) {
		IdNXB = idNXB;
	}
	public String getTenNXB() {
		return TenNXB;
	}
	public void setTenNXB(String tenNXB) {
		TenNXB = tenNXB;
	}
	public String getDiaChi() {
		return DiaChi;
	}
	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getThongTin() {
		return ThongTin;
	}
	public void setThongTin(String thongTin) {
		ThongTin = thongTin;
	}
	
}
