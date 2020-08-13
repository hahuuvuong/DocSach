package ebook.entity;

import java.util.Collection;
import java.util.Set;
import java.util.HashSet;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "Sach")
public class Sach {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int IdSach;
	@ManyToOne
	@JoinColumn(name = "IdTheLoai")
	private TheLoai idTheLoai;
	@ManyToOne
	@JoinColumn(name = "IdNXB")
	private NhaXuatBan NXB;
	@NotBlank(message = "Không được để trống tên truyện!")
	private String TenSach;
	@NotBlank(message = "Không được để trống tóm tắt!")
	private String GioiThieu;
	@NotBlank(message = "Không được để trống link hình ảnh!")
	private String HinhAnh;
	@OneToMany(mappedBy = "IdChuong",fetch = FetchType.EAGER)
	private Collection <ChuongSach> chapters;
	
	@ManyToMany(mappedBy = "truyens", fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
	private Set<DocGia> accounts = new HashSet<>(0);

	@ManyToMany(mappedBy = "sachs", fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
	private Set<TacGia> tacgias = new HashSet<>(0);
	
	
	public Sach() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Sach(int idSach, TheLoai idTheLoai, String tenSach, String gioiThieu, String hinhAnh,
			Collection<ChuongSach> chapters, Set<DocGia> accounts) {
		super();
		IdSach = idSach;
		this.idTheLoai = idTheLoai;
		TenSach = tenSach;
		GioiThieu = gioiThieu;
		HinhAnh = hinhAnh;
		this.chapters = chapters;
		this.accounts = accounts;
	}

	public Set<TacGia> getTacgias() {
		return tacgias;
	}

	public void setTacgias(Set<TacGia> tacgias) {
		this.tacgias = tacgias;
	}

	public NhaXuatBan getNXB() {
		return NXB;
	}

	public void setNXB(NhaXuatBan nXB) {
		NXB = nXB;
	}

	public int getIdSach() {
		return IdSach;
	}

	public void setIdSach(int idSach) {
		IdSach = idSach;
	}

	public TheLoai getIdTheLoai() {
		return idTheLoai;
	}

	public void setIdTheLoai(TheLoai idTheLoai) {
		this.idTheLoai = idTheLoai;
	}

	public String getTenSach() {
		return TenSach;
	}

	public void setTenSach(String tenSach) {
		TenSach = tenSach;
	}

	public String getGioiThieu() {
		return GioiThieu;
	}

	public void setGioiThieu(String gioiThieu) {
		GioiThieu = gioiThieu;
	}

	public String getHinhAnh() {
		return HinhAnh;
	}

	public void setHinhAnh(String hinhAnh) {
		HinhAnh = hinhAnh;
	}

	public Collection<ChuongSach> getChapters() {
		return chapters;
	}

	public void setChapters(Collection<ChuongSach> chapters) {
		this.chapters = chapters;
	}

	public Set<DocGia> getAccounts() {
		return accounts;
	}

	public void setAccounts(Set<DocGia> accounts) {
		this.accounts = accounts;
	}
}
