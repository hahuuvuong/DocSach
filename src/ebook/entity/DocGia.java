package ebook.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.JoinColumn;

@Entity
@Table(name = "DocGia")
public class DocGia {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int IdDocGia;
	
	private String TenDocGia;
	private String Email;
	private String MatKhau;
	private String TenDangNhap;
	@ManyToMany(fetch = FetchType.EAGER,cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.DETACH})
	@JoinTable(
			name = "SachYeuThich",
			joinColumns = { @JoinColumn(referencedColumnName = "IdDocGia")},
			inverseJoinColumns = {@JoinColumn (referencedColumnName = "IdSach")}
			)
	Set<Sach> truyens = new HashSet<>(0);
	public DocGia() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DocGia(int idDocGia, String tenDocGia, String email, String matKhau, String tenDangNhap, Set<Sach> truyens) {
		super();
		IdDocGia = idDocGia;
		TenDocGia = tenDocGia;
		Email = email;
		MatKhau = matKhau;
		TenDangNhap = tenDangNhap;
		this.truyens = truyens;
	}
	public int getIdDocGia() {
		return IdDocGia;
	}
	public void setIdDocGiah(int idDocGia) {
		IdDocGia = idDocGia;
	}
	public String getTenDocGia() {
		return TenDocGia;
	}
	public void setTenDocGia(String tenDocGia) {
		TenDocGia = tenDocGia;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getMatKhau() {
		return MatKhau;
	}
	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}
	public String getTenDangNhap() {
		return TenDangNhap;
	}
	public void setTenDangNhap(String tenDangNhap) {
		TenDangNhap = tenDangNhap;
	}
	public Set<Sach> getTruyens() {
		return truyens;
	}
	public void setTruyens(Set<Sach> truyens) {
		this.truyens = truyens;
	}
	
}
