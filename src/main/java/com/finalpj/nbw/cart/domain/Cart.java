package com.finalpj.nbw.cart.domain;

import lombok.Data;

@Data
public class Cart {
	
	private int[] p_no;
	private String[] p_title;
	private String[] p_price;
	private String[] p_img;
	private String[] p_category;
	private int[] mcart_count;
	private String btn;
	private String mem_id;
}
