package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.dto.OrderDTO;
import com.example.service.OrderService;

@Controller
public class MainController {

	@Autowired
	OrderService service;
	
	//시작 시 
	@RequestMapping("/")
	public String start(){
		return "main";
	}//method
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	@RequestMapping("/adminmain")
	public String adminindex() {
		return "ADMIN/index";
	}
	@RequestMapping("/tables")
	public String tables() {
		return "ADMIN/tables";
	}
	
	@RequestMapping("/admin/delivery")
	public String delivery() {
		return "ADMIN/delivery";
	}
	
	@PostMapping("/admin/OrderList")
	@ResponseBody
	public List<OrderDTO> adminOrderList() {
		List<OrderDTO> data = service.orderListAll();
		
		return data;
	}

	@PostMapping("/admin/DeliveryDone")
	@ResponseBody
	public String adminDeliveryDone(int order_no) {
		//주문테이블 배송정보 수정
		service.orderUpdate(order_no);
		String order_sta = service.selectSta(order_no);
		return order_sta;
	}
	
	@RequestMapping("/access-denied")
	public String adminAccess() {
		return "access-denied";
	}
	
//	@RequestMapping("/pList")
//	public String pList() {
//		return "pList";
//	}
	

	
	
}	
