package kopo11.dto;

public class Pagination {

	private int c; // 현재페이지
	private int s; // start페이지
	private int e; // end페이지
	private int p; // 하나앞페이지
	private int pp; // 맨앞페이지
	private int n; // 하나뒤페이지
	private int nn; // 맨 뒤페이지
	

	public int getC() {
		return c;
	}

	public void setC(int c) {
		this.c = c;
	}

	public int getS() {
		return s;
	}

	public void setS(int s) {
		this.s = s;
	}

	public int getE() {
		return e;
	}

	public void setE(int e) {
		this.e = e;
	}

	public int getP() {
		return p;
	}

	public void setP(int p) {
		this.p = p;
	}

	public int getPp() {
		return pp;
	}

	public void setPp(int pp) {
		this.pp = pp;
	}

	public int getN() {
		return n;
	}

	public void setN(int n) {
		this.n = n;
	}

	public int getNn() {
		return nn;
	}

	public void setNn(int nn) {
		this.nn = nn;
	}

}
