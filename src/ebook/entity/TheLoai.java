package ebook.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "TheLoai")
public class TheLoai {
	@Id
	private int IdTheLoai;
	
	private String TenTheLoai;

	public TheLoai() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TheLoai(int idTheLoai, String tenTheLoai) {
		super();
		IdTheLoai = idTheLoai;
		TenTheLoai = tenTheLoai;
	}

	public int getIdTheLoai() {
		return IdTheLoai;
	}

	public void setIdTheLoai(int idTheLoai) {
		IdTheLoai = idTheLoai;
	}

	public String getTenTheLoai() {
		return TenTheLoai;
	}

	public void setTenTheLoai(String tenTheLoai) {
		TenTheLoai = tenTheLoai;
	}

}
