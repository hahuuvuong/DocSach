package ebook.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TuKhoaTraCuu")
public class TuKhoaTraCuu {
	@Id
	@GeneratedValue
	private int Id;
	private String NoiDung;
	private Date ThoiGianTraCuu;
	
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getNoiDung() {
		return NoiDung;
	}
	public void setNoiDung(String noiDung) {
		NoiDung = noiDung;
	}
	public Date getThoiGianTraCuu() {
		return ThoiGianTraCuu;
	}
	public void setThoiGianTraCuu(Date thoiGianTraCuu) {
		ThoiGianTraCuu = thoiGianTraCuu;
	}
	public TuKhoaTraCuu() {
		super();
	}
	public TuKhoaTraCuu(String noiDung, Date thoiGianTraCuu) {
		super();
		NoiDung = noiDung;
		ThoiGianTraCuu = thoiGianTraCuu;
	}
	
}
